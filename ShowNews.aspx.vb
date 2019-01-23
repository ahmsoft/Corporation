
Partial Class ShowNews
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Page.Title = "اخبار سایت | NAREM.IR"
        Try
            Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLINews"))
            lblActive.Attributes("Class") = "current space"
            Dim lblState As Label = Master.FindControl("StatusPage")
            lblState.Text = "اخبار سایت"
            Dim db = New LinqDBClassesDataContext
            Page.MetaKeywords = ""
            Dim qry = From m In db.News1s
                      Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all")
            For Each q In qry
                For Each i In q.Keyword.ToString.Split(";")
                    Page.MetaKeywords += i + ","
                Next
            Next
        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            UserTable.ErrorMessage = ex.Message
            Response.Write(ex.Message)
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
            Response.Redirect("ErrorPage.aspx")
        End Try
        Page.MetaDescription = "کلیه خبرها در رابطه با شرکت نارم در این قسمت قابل مشاهده است."
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String

        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function
End Class
