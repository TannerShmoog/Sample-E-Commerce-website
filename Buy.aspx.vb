Imports System.Data
Imports System.Web.UI
Partial Class Buy
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load 'Show the right elements depending if the user is logged in
        Dim selectedGameID As Integer

        Try
            selectedGameID = sqlGameSelect.SelectedItem.Value
            For Each rowView As DataRowView In sqlDSGameSelect.Select(DataSourceSelectArguments.Empty)
                Dim row As DataRow = rowView.Row
                If String.Compare(row.Item(0).ToString(), selectedGameID.ToString()) = 0 Then 'find the selected row in the game select dropdown
                    'set image and text elements to the correct display
                    imgbuypage.Src = row.Item(2).ToString()
                    imgbuypagecur.Src = row.Item(4).ToString()
                    txtbuypage.InnerText = row.Item(1).ToString()
                    txtbuypagecur.InnerText = row.Item(3).ToString()
                    Session("ListingImg") = row.Item(2).ToString()
                    Session("ListingImgCur") = row.Item(4).ToString()
                    Session("ListingGame") = row.Item(1).ToString()
                    Session("ListingGameCur") = row.Item(3).ToString()
                End If
            Next
        Catch ex As Exception
        End Try
    End Sub

    Public Sub gridviewlistings_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) 'buy button on each row of gridview
        If (e.CommandName = "Buy") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = gridviewlistings.Rows(index)

            Session("ListingID") = Integer.Parse(row.Cells(0).Text) 'get and set the listing id and seller name before redirecting to checkout
            Session("ListingName") = row.Cells(1).Text
            Response.Redirect("CheckOut.aspx", True)
        End If
    End Sub
End Class
