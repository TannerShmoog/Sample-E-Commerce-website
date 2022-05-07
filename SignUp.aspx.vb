Imports System.Security.Cryptography
Imports System.Data.SqlClient

Partial Class SignUp
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load 'redirect the user if already logged in
        Response.Cache.SetCacheability(HttpCacheability.NoCache) 'make sure the user cant navigate back to the login page by back button
        Response.Cache.SetNoStore()
        Response.Cache.SetExpires(DateTime.MinValue)
        If Not Session("UserID") Is Nothing Then  'if user is logged in send them to the home page
            Response.Redirect("Default.aspx", True)
        End If
    End Sub

    Protected Sub btnSignUpSpage_Click(sender As Object, e As EventArgs) Handles btnSignupSpage.Click 'Sign up button
        If Page.IsValid Then
            Try
                Dim strCmd As String = "SELECT Email FROM Users WHERE (Email = @Email)" 'check if the email is already registered
                Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
                Dim cmd As SqlCommand = New SqlCommand(strCmd, conn)
                Dim result As SqlDataReader
                cmd.Parameters.AddWithValue("Email", LCase(inEmail.Text))
                cmd.Connection.Open()
                result = cmd.ExecuteReader()

                Dim userexistflag As Integer = 0
                While result.Read() 'get selection result
                    userexistflag = 1
                End While

                result.Close()
                cmd.Connection.Close()
                conn.Close()

                If userexistflag = 1 Then 'the email is registered and exists in the db
                    lbltest.Text = "*Email is Already Registered"
                Else 'the email is not registered and we can make the account
                    strCmd = "INSERT INTO Users VALUES (@DisplayName, @Email, @Password, @FullName, @ExpMonth, @ExpYear, @CVV, @Balance, @CreditCard)"
                    cmd = New SqlCommand(strCmd, conn)
                    cmd.Connection.Open()
                    cmd.Parameters.AddWithValue("DisplayName", inDisplayName.Text)
                    cmd.Parameters.AddWithValue("Email", LCase(inEmail.Text))
                    cmd.Parameters.AddWithValue("Password", GetMD5Hash(inPassword.Text))
                    cmd.Parameters.AddWithValue("FullName", inName.Text)
                    cmd.Parameters.AddWithValue("CreditCard", Convert.ToInt64(inCC.Text))
                    cmd.Parameters.AddWithValue("ExpMonth", Convert.ToInt16(inExpiryMonth.SelectedValue))
                    cmd.Parameters.AddWithValue("ExpYear", Convert.ToInt16(inExpiryYear.SelectedValue))
                    cmd.Parameters.AddWithValue("CVV", Convert.ToInt16(inCVV.Text))
                    cmd.Parameters.AddWithValue("Balance", Decimal.Parse("0.00"))

                    cmd.ExecuteNonQuery() 'make the new account
                    cmd.Connection.Close()
                    conn.Close()

                    strCmd = "SELECT UserID FROM Users WHERE (Email = @Email)"
                    cmd = New SqlCommand(strCmd, conn)
                    cmd.Connection.Open()
                    cmd.Parameters.AddWithValue("Email", LCase(inEmail.Text))
                    result = cmd.ExecuteReader() 'log the user in with the newly created account

                    While result.Read()
                        Session("UserID") = Integer.Parse(result(0))
                    End While

                    result.Close()
                    cmd.Connection.Close()
                    conn.Close()

                    Dim redir As Integer = Session("LoginRedir")
                    If redir = 1 Then 'was redirected to login from the checkout page
                        Session("LoginRedir") = 0
                        Response.Redirect("CheckOut.aspx", True)
                    ElseIf redir = 2 Then 'was redirected to login from the sell page
                        Session("LoginRedir") = 0
                        Response.Redirect("Sell.aspx", True)
                    End If
                    Response.Redirect("Default.aspx", True) 'log in normally without a redirect
                End If
            Catch ex As Exception
                lbltest.Text = ex.Message
            End Try
        End If
    End Sub

    Protected Sub valExpiry_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles valExpiry.ServerValidate 'Credit card expiry date validator
        args.IsValid = True
        Dim expMonth As Integer = Integer.Parse(inExpiryMonth.SelectedValue)
        Dim expYear As Integer = Integer.Parse(inExpiryYear.SelectedValue)
        Dim curMonth As Integer = DateTime.Now.Month
        Dim curYear As Integer = DateTime.Now.Year

        If curYear > expYear Then 'expiry year has past
            args.IsValid = False
        ElseIf curYear = expYear And curMonth > expMonth Then 'expiry month has past in the current year
            args.IsValid = False
        End If
    End Sub

    Private Function IsValidCardType(ByVal CardNumber As String) As Boolean 'Credit card type validator
        Dim sCardNum As String = inCC.Text

        If ((sCardNum.Length = 13 Or sCardNum.Length = 16) And sCardNum.Chars(0) = "4") Then 'Visa
            Return True
        ElseIf (sCardNum.Length = 16 And sCardNum.Chars(0) = "5") Then 'MasterCard
            If sCardNum.Chars(1) >= "1" And sCardNum.Chars(1) <= "5" Then
                Return True
            End If
        ElseIf (sCardNum.Length = 15 And sCardNum.Chars(0) = "3") Then 'American Express
            If sCardNum.Chars(1) = "4" Or sCardNum.Chars(1) <= "7" Then
                Return True
            End If
        Else
            Return False
        End If
    End Function

    Private Function ValidateCreditCard(ByVal CardNumber As String) As Boolean 'Credit card number validator
        Dim iDigitSum As Integer
        Dim sDigits As String = ""
        Dim i As Integer
        If Not IsNumeric(CardNumber) Then
            Return False
        End If
        'Check if the card number matches the card type (Visa, MasterCard, AmericanExpress)
        If (IsValidCardType(CardNumber)) Then
            '**Luhn Test**
            'Remove spaces and reverse string
            CardNumber = StrReverse(CardNumber.Replace(" ", Nothing))
            'Double the digits in even-numbered positions
            For i = 0 To CardNumber.Length - 1
                If (i + 1) Mod 2 = 0 Then
                    sDigits &= CType(CardNumber.Substring(i, 1), Integer) * 2
                Else
                    sDigits &= CardNumber.Substring(i, 1)
                End If
            Next
            'Add the digits
            For i = 0 To sDigits.Length - 1
                iDigitSum += CType(sDigits.Substring(i, 1), Integer)
            Next
            'Check if the sum is divisible by 10
            If iDigitSum Mod 10 = 0 Then
                Return True
            Else
                Return False
            End If
        End If
    End Function

    Protected Sub valCC_ServerValidate(source As Object, args As ServerValidateEventArgs) Handles valCC.ServerValidate 'Credit card custom validator
        args.IsValid = ValidateCreditCard(args.Value)
    End Sub

    Shared Function GetMD5Hash(ByVal input As String) As String 'compute the md5 hash of a string as a string
        Dim md5 As MD5 = md5.Create()
        Dim data As Byte() = md5.ComputeHash(Encoding.UTF8.GetBytes(input))
        Dim sBuilder As New StringBuilder()
        Dim i As Integer

        For i = 0 To data.Length - 1
            sBuilder.Append(data(i).ToString("x2"))
        Next i

        Return sBuilder.ToString()
    End Function
End Class
