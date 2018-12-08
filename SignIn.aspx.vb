
Partial Class SignIn
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim db = New LinqDBClassesDataContext
        '        If HttpContext.Current.User.Identity.IsAuthenticated And HttpContext.Current.User.IsInRole("Client") Then
        If HttpContext.Current.User.Identity.IsAuthenticated And (HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2) = " 0") Then

            ' HttpContext.Current.Profile.
            'Dim Client = From m In db.Clients
            '             Select m Where m.IDClient = HttpContext.Current.User.Identity.Name
            'For Each m In Client
            Response.Redirect("~/Client/ClientPanel.aspx")
            'Next
            'Dim User = From m In db.Users
            '           Select m Where m.Username = HttpContext.Current.User.Identity.Name
            'For Each m In User
            '    If m.Supervisor = 1 Then
            '        Response.Redirect("~/Admin/AdminPanel.aspx")
            '    End If

            'Next

        ElseIf HttpContext.Current.User.Identity.IsAuthenticated And (HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2) = " 1") Then
            Response.Redirect("~/Admin/AdminPanel.aspx")


        End If
        'MsgBox(HttpContext.Current.User.Identity.Name.ToString.Substring(HttpContext.Current.User.Identity.Name.ToString.Length - 2))
    End Sub
End Class
