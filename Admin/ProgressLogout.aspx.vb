
Partial Class Admin_ProgressLogout
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Session.Abandon()
        FormsAuthentication.SignOut()
        Response.Redirect("~/Home")
    End Sub
End Class
