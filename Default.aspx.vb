
Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.Title = "مطالب سایت - شرکت نارم NAREM.IR - Posts"
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIPost"))
        lblActive.Attributes("Class") = "current"
        Dim lblState As Label = Master.FindControl("StatusPage")
        lblState.Text = "مطالب سایت - شرکت نارم NAREM.IR - Posts"
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Messages
                      Select m Order By
                                   m.Priority Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all")
            For Each q In qry
                For Each i In q.Keyword.ToString.Split(";")
                    Page.MetaKeywords += i.ToString + ","
                Next
            Next

        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            UserTable.ErrorMessage = ex.Message
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
            Response.Redirect(Server.MapPath("ErrorPage.aspx") + "/ErrorPage.aspx")
        End Try
        Dim mystring As String
        mystring = System.Web.HttpContext.Current.Request.Browser.Type
        If mystring.Contains("IE") Then
        End If

    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String

        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function

End Class
