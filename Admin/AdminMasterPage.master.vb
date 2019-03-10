Imports System.Collections.Generic
Partial Class Admin_AdminMasterPage
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'If HttpContext.Current.User.Identity.IsAuthenticated And (HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2) = " 1") Then
        '    'Response.Redirect("~/Client/ClientPanel.aspx")

        'Else
        '    FormsAuthentication.SignOut()
        '    Session.Abandon()
        '    FormsAuthentication.RedirectToLoginPage()
        'End If
        ''MsgBox(HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2))
    End Sub
End Class

