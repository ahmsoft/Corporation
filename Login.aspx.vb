
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub btnArival_Click(sender As Object, e As EventArgs) Handles btnArival.Click
        Dim db = New LinqDBClassesDataContext
        Dim Users = From m In db.Users
                    Select m Where m.Username = txtUsername.Text And m.Password = txtPassword.Text
        For Each m In Users
            If m.Supervisor = 1 Then
                'System.Web.Security.Roles.CreateRole("Admin")
                System.Web.Security.FormsAuthentication.RedirectFromLoginPage(m.Username.ToString() + " 1", chk.Checked)
            End If
        Next
        Dim Client = From m In db.Clients
                     Select m Where m.Username = txtUsername.Text And m.Password = txtPassword.Text
        For Each m In Client
            'System.Web.Security.Roles.CreateRole("Client")
            System.Web.Security.FormsAuthentication.RedirectFromLoginPage(m.IDClient.ToString() + " 0", chk.Checked)
        Next

    End Sub
End Class
