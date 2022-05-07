Imports System.Data.SqlClient
Imports System.Data

Partial Class Sell
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then 'only show the delete listings section if the user is logged in
            divdelete.Visible = False
        Else
            divdelete.Visible = True
        End If

        Dim data As DataView = sqlDSListSelect.Select(DataSourceSelectArguments.Empty)

        Try
            If data.Count > 0 Then 'only show the delete listings section if the user has at least 1 listing
                divdelete.Visible = True
            Else
                divdelete.Visible = False
            End If
        Catch ex As Exception
            divdelete.Visible = False
        End Try
    End Sub


    Protected Sub btnCreateList_Click(sender As Object, e As EventArgs) Handles btnCreateList.Click 'Create listing button
        If Page.IsValid Then
            If Session("UserID") Is Nothing Then 'If the user isnt logged in, redirect them first
                Session("LoginRedir") = 2
                Response.Redirect("Login.aspx", True)
            Else
                Try
                    Dim stock As Int64 = Int64.Parse(inStock.Text) 'this acts as validation since a string that cant be parsed will throw an exception
                    Dim price As Decimal = Decimal.Parse(inPrice.Text)

                    If stock > 0 And price >= 0.0000001 Then
                        lbltest.Text = ""
                        Dim strCmd As String = "INSERT INTO Listings VALUES (@UserID, @GameID, @Stock, @Price)" 'insert the new listing
                        Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
                        Dim cmd As SqlCommand = New SqlCommand(strCmd, conn)
                        Dim selectedGameID As Integer = sqlGameSelect.SelectedItem.Value

                        cmd.Parameters.AddWithValue("UserID", Session("UserID"))
                        cmd.Parameters.AddWithValue("GameID", selectedGameID)
                        cmd.Parameters.AddWithValue("Stock", stock)
                        cmd.Parameters.AddWithValue("Price", price)
                        cmd.Connection.Open()
                        cmd.ExecuteNonQuery()

                        cmd.Connection.Close()
                        conn.Close()
                        inPrice.Text = "" 'clear fields and refresh
                        inStock.Text = ""
                        Response.Redirect("Sell.aspx", True)
                    Else
                        lbltest.Text = "Invalid input, stock greater than 0, price must be at least 0.0000001 per unit."
                    End If
                Catch ex As Exception
                    lbltest.Text = "Invalid input, please enter stock as an integer and<br/>Price as a decimal with up to 7 digits beyond the decimal point."
                End Try
            End If
        End If
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click 'Delete listing button
        Try
            lbltest.Text = ""
            Dim strCmd As String = "DELETE FROM Listings WHERE ListingID = @ListingID" 'delete the selected listing
            Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
            Dim cmd As SqlCommand = New SqlCommand(strCmd, conn)
            Dim selectedGameID As Integer = sqlListSelect.SelectedItem.Value

            cmd.Parameters.AddWithValue("ListingID", sqlListSelect.SelectedItem.Value)
            cmd.Connection.Open()
            cmd.ExecuteNonQuery()

            cmd.Connection.Close()
            conn.Close()
            Response.Redirect("Sell.aspx", True)

        Catch ex As Exception
            lbltest.Text = "Error Deleting Listing, was it deleted already?<br/>If not, refresh and try again." 'for concurrency issues
        End Try
    End Sub
End Class
