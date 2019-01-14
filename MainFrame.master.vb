Imports System.Web.HttpBrowserCapabilities
Imports System.Net
Partial Class MainFrame
    Inherits System.Web.UI.MasterPage
    'Public Function GetMachinName() As String
    '    ' To find IP address of a machine behind LAN you can use this code
    '    Dim strHostName As String = Dns.GetHostName()
    '    Dim ipEntry As IPHostEntry = Dns.GetHostEntry(strHostName)
    '    GetMachinName = Convert.ToString(ipEntry.HostName)
    'End Function
    'Public Function GetUser_IP() As String
    '    Dim VisitorsIPAddr As String = String.Empty
    '    If (HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR") <> "") Then
    '        VisitorsIPAddr = HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR").ToString()
    '    ElseIf (HttpContext.Current.Request.UserHostAddress.Length <> 0) Then
    '        VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress
    '    End If
    '    GetUser_IP = VisitorsIPAddr

    'End Function

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            Dim db = New LinqDBClassesDataContext
            Dim block = From m In db.Blocks
                        Select m Order By m.Priority Ascending, m.IDB Ascending
            Dim link = From n In db.Links
                       Select n Order By n.Priority Ascending, n.IDL Ascending

            For Each b In block
                Dim lbl = New Label
                lbl.ToolTip = b.Name
                lbl.Text = "<ul><li class='widget-container'><h2 class='widget-title'>" + b.Name + "</h2><ul>"
                For Each l In link
                    If l.IDB = b.IDB Then
                        lbl.Text = lbl.Text + "<li><a href='" + l.Address + "' title='" + l.Alt + "' target='" + l.Target + "'>" + l.Name + "</a></li>"
                    End If
                Next
                lbl.Text = lbl.Text + "</ul></li></ul>"
                If b.Position = "Left" Then
                    PlaceHolderLeft.Controls.Add(lbl)

                End If
            Next

        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            UserTable.ErrorMessage = ex.Message
            db.FaultLogs.InsertOnSubmit(UserTable)
            Response.Write(ex.Message)
            db.SubmitChanges()
            Response.Redirect(Server.MapPath("ErrorPage.aspx") + "/ErrorPage.aspx")
        End Try
        Dim mystring As String
        mystring = System.Web.HttpContext.Current.Request.Browser.Type
        If mystring.Contains("IE") Then
        End If
        'Try
        '    Dim browser As HttpBrowserCapabilities = Request.Browser
        '    Dim db = New LinqDBClassesDataContext
        '    Dim q = New UsersOnlineDetail
        '    q.Browser = browser.Browser
        '    q.Platform = browser.Platform
        '    q.DateAndTime = Now.ToLocalTime
        '    'q.IPAddress = GetUser_IP()
        '    'q.MachinName = GetMachinName()
        '    q.Page = Request.CurrentExecutionFilePath
        '    db.UsersOnlineDetails.InsertOnSubmit(q)
        '    db.SubmitChanges()

        'Catch ex As Exception
        '    Response.Write(ex.Message)
        '    Dim db = New LinqDBClassesDataContext
        '    Dim UserTable As New FaultLog
        '    UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
        '    UserTable.ErrorMessage = ex.Message
        '    db.FaultLogs.InsertOnSubmit(UserTable)
        '    db.SubmitChanges()
        'End Try

    End Sub
    Protected Sub txtSearch_Search(sender As Object, e As Telerik.Web.UI.SearchBoxEventArgs) Handles txtSearch.Search
        Response.Redirect("/SearchResult/" + txtSearch.Text.Replace(" ", "~"))

    End Sub
End Class

