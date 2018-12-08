Imports System.Collections.Generic
Partial Class Client_ClientMasterPage
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If HttpContext.Current.User.Identity.IsAuthenticated And (HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2) = " 0") Then
            'Response.Redirect("~/Client/ClientPanel.aspx")
            Dim stridclient As String
            stridclient = Trim(HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2))
            Session("IDCli") = stridclient
        Else
            FormsAuthentication.SignOut()
            Session.Abandon()
            FormsAuthentication.RedirectToLoginPage()
        End If
        'MsgBox(HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2))
    End Sub
End Class

