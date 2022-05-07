Imports System.Security.Cryptography
Imports System.Data.SqlClient

Partial Class LogIn
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load 'redirect the user if already logged in
        Response.Cache.SetCacheability(HttpCacheability.NoCache) 'make sure the user cant navigate back to the login page by back button
        Response.Cache.SetNoStore()
        Response.Cache.SetExpires(DateTime.MinValue)
        If Not Session("UserID") Is Nothing Then  'if user is logged in
            Response.Redirect("Default.aspx", True)
        End If
    End Sub

    Protected Sub btnLoginLpage_Click(sender As Object, e As EventArgs) Handles btnLoginLpage.Click 'login button
        If Page.IsValid Then
            Try
                Dim strSelCmd As String = "SELECT UserID, Email, Password FROM Users WHERE (Email = @Email)" 'get the user's info for authentication
                Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
                Dim cmd As SqlCommand = New SqlCommand(strSelCmd, conn)
                Dim result As SqlDataReader
                Dim UserPass As String = ""
                Dim UserEmail As String = ""
                Dim UserID As Integer

                cmd.Parameters.AddWithValue("Email", LCase(loginEmail.Text))
                cmd.Connection.Open()
                result = cmd.ExecuteReader()

                Dim userexistflag As Integer = 0
                While result.Read() 'get selection result
                    UserID = result(0)
                    UserEmail = result(1).Trim()
                    UserPass = result(2).Trim()
                    userexistflag = 1
                End While

                cmd.Connection.Close()
                result.Close()
                conn.Close()

                If userexistflag = 1 Then 'the email is registered and exists in the db
                    If String.Compare(GetMD5Hash(loginPassword.Text), UserPass) = 0 Then 'password is correct
                        Session("UserID") = Integer.Parse(UserID)

                        Dim redir As Integer = Session("LoginRedir")
                        If redir = 1 Then 'was redirected to login from the checkout page
                            Session("LoginRedir") = 0
                            Response.Redirect("CheckOut.aspx", True)
                        ElseIf redir = 2 Then 'was redirected to login from the sell page
                            Session("LoginRedir") = 0
                            Response.Redirect("Sell.aspx", True)
                        End If
                        Response.Redirect("Default.aspx", True) ' log in normally

                    Else 'password is incorrect
                        lbltest.Text = "*Incorrect Password."
                    End If
                Else 'the email is not registered
                    lbltest.Text = "*Email is not registered."
                End If
            Catch ex As Exception
                lbltest.Text = ex.Message
            End Try
        End If
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
