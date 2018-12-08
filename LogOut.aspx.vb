
Partial Class LogOut
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        FormsAuthentication.SignOut()
        Session.Abandon()
        FormsAuthentication.RedirectToLoginPage()
    End Sub
End Class
