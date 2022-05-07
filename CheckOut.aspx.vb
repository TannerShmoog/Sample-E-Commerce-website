Imports System.Data.SqlClient

Partial Class Checkout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load 'Show the right elements depending if the user is logged in
        If Not Session("ListingID") Is Nothing Then 'if a listing has been selected on the buy page
            imgbuypage.Src = Session("ListingImg")
            imgbuypagecur.Src = Session("ListingImgCur")
            txtbuypage.InnerText = Session("ListingGame")
            txtbuypagecur.InnerText = Session("ListingGameCur")
        Else 'otherwise, redirect back to the buy page
            Response.Redirect("Buy.aspx", True)
        End If

        Try
            Dim strSelCmd As String = "SELECT Stock, Price, UserID FROM Listings WHERE (ListingID = @ListingID)" 'get info about the selected listing
            Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
            Dim cmd As SqlCommand = New SqlCommand(strSelCmd, conn)
            Dim result As SqlDataReader
            Dim listprice As Decimal = -1
            Dim liststock As Int64 = -1
            Dim listuser As String = ""

            cmd.Parameters.AddWithValue("ListingID", Integer.Parse(Session("ListingID")))
            cmd.Connection.Open()
            result = cmd.ExecuteReader()

            While result.Read() 'get the result of the select statement
                liststock = result(0)
                listprice = result(1)
                listuser = result(2)
            End While

            cmd.Connection.Close()
            result.Close()
            conn.Close()

            Session("ListingStock") = liststock
            Session("ListingPrice") = listprice
            Session("ListingUserID") = listuser

            sellerinfo.InnerText = "Seller: " + Session("ListingName") 'display info
            stockinfo.InnerText = "Stock: " + String.Format("{0:N0}", Session("ListingStock"))
            priceinfo.InnerText = "Price per Unit: " + String.Format("{0:c7}", Session("ListingPrice"))

            If Not String.IsNullOrEmpty(inQuantity.Text) Then 'once the user inputs a quantity, calculate the final price and display it
                Dim quantity As Int64 = Int64.Parse(inQuantity.Text)
                Dim totalprice As Decimal = quantity * listprice

                If listprice > 0 And liststock > 0 Then
                    If quantity <= liststock And totalprice >= 0.01 Then
                        totalprice = Decimal.Round(totalprice, 2)
                    End If
                Else
                    lbltotal.Text = "Sorry: the listing no longer exists or no longer<br/>has any stock, try another seller"
                End If
            End If
        Catch ex As Exception
            lbltotal.Text = ex.Message
        End Try
    End Sub

    Protected Sub quantity_OnTextChanged(sender As Object, e As EventArgs)
        lbltotal.Text = ""

        If Not String.IsNullOrEmpty(inQuantity.Text) Then 'once the user inputs a quantity, calculate the final price and display it
            Try
                Dim quantity As Int64 = Int64.Parse(inQuantity.Text)
                Dim listprice As Decimal = Session("ListingPrice")
                Dim liststock As Int64 = Session("ListingStock")
                Dim totalprice As Decimal = quantity * listprice

                totalprice = Decimal.Round(totalprice, 2)
                If listprice > 0 And liststock > 0 Then
                    If quantity > liststock Then
                        lbltotal.Text = "Invalid: Quantity is greater than stock!"
                    ElseIf totalprice < 0.01 Then
                        lbltotal.Text = "Invalid: Must purchase at least $0.01,<br/>try a higher quantity!"
                    Else
                        lbltotal.Text = "Total: " + String.Format("{0:c2}", totalprice)
                    End If
                Else
                    lbltotal.Text = "Sorry: the listing no longer exists or no longer<br/>has any stock, try another seller"
                End If
            Catch ex As Exception
                lbltotal.Text = ex.Message
            End Try
        End If
    End Sub

    Protected Sub btnBuyConfirm_Click(sender As Object, e As EventArgs) Handles btnBuyConfirm.Click 'confirm purchase button
        If Page.IsValid Then
            If Session("UserID") Is Nothing Then 'redirect the user to login if they are not logged in
                Session("LoginRedir") = 1
                Response.Redirect("Login.aspx", True)
            Else
                Try
                    'sql statement to try subtracting the desired quantity from stock of the listing IF it is still available, otherwise returns an error code -2
                    Dim strCmd As String = "IF (((SELECT Stock FROM Listings WHERE ListingID = @ListingID) > @Quantity))  UPDATE Listings SET Stock = Stock - @Quantity2 WHERE ListingID = @ListingID2 ELSE SELECT -2"
                    Dim conn As SqlConnection = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("PlayerVaultConnectionString").ConnectionString)
                    Dim cmd As SqlCommand = New SqlCommand(strCmd, conn)
                    Dim result As SqlDataReader
                    Dim quantity As Int64 = Int64.Parse(inQuantity.Text)

                    If Not Session("ListingStock") Is Nothing And Not Session("ListingPrice") Is Nothing Then 'if a listing has been selected
                        Dim listprice As Decimal = Session("ListingPrice")
                        Dim liststock As Int64 = Session("ListingStock")
                        Dim totalprice As Decimal = quantity * listprice

                        If quantity <= liststock And totalprice >= 0.01 Then
                            totalprice = Decimal.Round(totalprice, 2)
                            'subtract from the listing's stock IF there is enough
                            cmd.Parameters.AddWithValue("ListingID", Session("ListingID"))
                            cmd.Parameters.AddWithValue("Quantity", quantity)
                            cmd.Parameters.AddWithValue("ListingID2", Session("ListingID"))
                            cmd.Parameters.AddWithValue("Quantity2", quantity)
                            cmd.Connection.Open()
                            result = cmd.ExecuteReader()

                            Dim successflag As Integer = -1
                            While result.Read()
                                successflag = result(0)
                            End While

                            cmd.Connection.Close()
                            result.Close()
                            conn.Close()

                            If successflag = -1 Then 'successful, continue to update balance for both users
                                'SELLER balance update
                                strCmd = "UPDATE Users SET Balance = Balance + @TotalPrice WHERE UserID = @ListUser"
                                cmd = New SqlCommand(strCmd, conn)
                                cmd.Parameters.AddWithValue("TotalPrice", totalprice)
                                cmd.Parameters.AddWithValue("ListUser", Session("ListingUserID"))
                                cmd.Connection.Open()
                                cmd.ExecuteNonQuery()

                                cmd.Connection.Close()
                                conn.Close()

                                'BUYER balance update, subtracts the price from balance, or sets balance to 0 and it is implied a credit card charge will cover the rest
                                strCmd = "IF (((SELECT Balance FROM Users WHERE UserID = @UserID) > @TotalPrice))  UPDATE Users SET Balance = Balance - @TotalPrice2 WHERE UserID = @UserID2 ELSE UPDATE Users SET Balance = 0 WHERE UserID = @UserID3"
                                cmd = New SqlCommand(strCmd, conn)
                                cmd.Parameters.AddWithValue("TotalPrice", totalprice)
                                cmd.Parameters.AddWithValue("TotalPrice2", totalprice)
                                cmd.Parameters.AddWithValue("UserID", Session("UserID"))
                                cmd.Parameters.AddWithValue("UserID2", Session("UserID"))
                                cmd.Parameters.AddWithValue("UserID3", Session("UserID"))
                                cmd.Connection.Open()
                                cmd.ExecuteNonQuery()

                                cmd.Connection.Close()
                                conn.Close()

                                Response.Redirect("Default.aspx", True)
                            Else 'listing no longer has enough stock, inform user
                                lbltotal.Text = "Sorry: the listing no longer exists or no longer<br/>has enough stock, try another seller"
                            End If
                        End If
                    End If
                Catch ex As Exception
                    lbltotal.Text = ex.Message
                End Try
            End If
        End If
    End Sub
End Class
