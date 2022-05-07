
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load 'Show or dont show the main page sign up button depending if logged in
        If Not Session("UserID") Is Nothing Then  'if user is logged in
            btnSignUp.Visible = False
            btnAboutUs.Attributes.Add("Style", "margin-left: -80px;")
        Else 'user is not logged in
            btnSignUp.Visible = True
            btnAboutUs.Attributes.Add("Style", "margin-left: 0px;")
        End If
    End Sub
End Class
