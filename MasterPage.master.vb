Imports System.Data.SqlClient

Partial Class MasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load 'Show the right elements depending if the user is logged in
        If Not Session("UserID") Is Nothing Then  'if user is logged in
            lblBalance.Visible = True
            lblEmail.Visible = True
            divsignup.Visible = False
            btnLogOut.Visible = True

            Try
                Dim strSelCmd As String = "SELECT DisplayName, Balance FROM Users WHERE (UserID = @ID)" 'get the user's updated balance and email
                Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
                Dim cmd As SqlCommand = New SqlCommand(strSelCmd, conn)
                Dim result As SqlDataReader
                Dim UserDisplayName As String = ""
                Dim UserBalance As Decimal = -1

                cmd.Parameters.AddWithValue("ID", Session("UserID"))
                cmd.Connection.Open()
                result = cmd.ExecuteReader()

                While result.Read() 'get selection result
                    UserDisplayName = result(0).Trim()
                    UserBalance = Decimal.Parse(result(1))
                End While

                If Not UserBalance = -1 Then 'display the balance and display name
                    lblEmail.Text = UserDisplayName
                    lblBalance.Text = String.Format("{0:n}", UserBalance)
                Else
                    lblEmail.Text = "Error retrieving User Data"
                End If

                cmd.Connection.Close()
                result.Close()
                conn.Close()
            Catch ex As Exception
                lblEmail.Text = ex.Message
            End Try
        Else 'user is not logged in, hide and show elements as needed
            lblBalance.Visible = False
            lblEmail.Visible = False
            divsignup.Visible = True
            btnLogOut.Visible = False
        End If
    End Sub

    Protected Sub btnLogOut_Click(sender As Object, e As EventArgs) Handles btnLogOut.Click 'log out button
        Session("UserID") = Nothing
        Session("LoginRedir") = 0
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True) 'redirect to current page
    End Sub
End Class
