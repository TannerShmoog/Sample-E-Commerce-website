Partial Class AboutUs
    Inherits System.Web.UI.Page

    'set visibility on the first page load
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            divaboutus.Visible = False
            divrefund.Visible = False
            divterms.Visible = False
            divprivacy.Visible = False
            btnRefund.Visible = True
            btnAboutUs.Visible = True
            btnTerms.Visible = True
            btnPrivacy.Visible = True
            imgaboutusmain.Visible = True
        End If
    End Sub

    'buttons to toggle collapsed content
    Protected Sub btnAboutUs_Click(sender As Object, e As EventArgs) Handles btnAboutUs.Click
        divaboutus.Visible = Not divaboutus.Visible
        If divaboutus.Visible Then
            btnRefund.Visible = False
            btnTerms.Visible = False
            btnPrivacy.Visible = False
            imgaboutusmain.Visible = False
            btnAboutUs.Text = "Back"
        Else
            btnRefund.Visible = True
            btnTerms.Visible = True
            btnPrivacy.Visible = True
            imgaboutusmain.Visible = True
            btnAboutUs.Text = "About Us"
        End If
    End Sub

    Protected Sub btnRefund_Click(sender As Object, e As EventArgs) Handles btnRefund.Click
        divrefund.Visible = Not divrefund.Visible
        If divrefund.Visible Then
            btnAboutUs.Visible = False
            btnTerms.Visible = False
            btnPrivacy.Visible = False
            imgaboutusmain.Visible = False
            btnRefund.Text = "Back"
        Else
            btnAboutUs.Visible = True
            btnTerms.Visible = True
            btnPrivacy.Visible = True
            imgaboutusmain.Visible = True
            btnRefund.Text = "Refund Policy"
        End If
    End Sub

    Protected Sub btnTerms_Click(sender As Object, e As EventArgs) Handles btnTerms.Click
        divterms.Visible = Not divterms.Visible
        If divterms.Visible Then
            btnRefund.Visible = False
            btnAboutUs.Visible = False
            btnPrivacy.Visible = False
            imgaboutusmain.Visible = False
            btnTerms.Text = "Back"
        Else
            btnRefund.Visible = True
            btnAboutUs.Visible = True
            btnPrivacy.Visible = True
            imgaboutusmain.Visible = True
            btnTerms.Text = "Terms of Use"
        End If
    End Sub

    Protected Sub btnPrivacy_Click(sender As Object, e As EventArgs) Handles btnPrivacy.Click
        divprivacy.Visible = Not divprivacy.Visible
        If divprivacy.Visible Then
            btnRefund.Visible = False
            btnTerms.Visible = False
            btnAboutUs.Visible = False
            imgaboutusmain.Visible = False
            btnPrivacy.Text = "Back"
        Else
            btnRefund.Visible = True
            btnTerms.Visible = True
            btnAboutUs.Visible = True
            imgaboutusmain.Visible = True
            btnPrivacy.Text = "Privacy Policy"
        End If
    End Sub
End Class
