
Partial Class Biography
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.Title = "درباره‌ی مهندس امیرحسن مروجی"
        Try
            Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIAbout"))
            lblActive.Attributes("Class") = "current"
            Dim lblState As Label = Master.FindControl("StatusPage")
            lblState.Text = "شرکت طراحی سایت آریا سافت - AriyaSoft.com - درباره‌ی مهندس امیرحسن مروجی - AHMSoft"
            Dim db = New LinqDBClassesDataContext
            Page.MetaKeywords = ""
            Dim qry = From m In db.Abouts
                      Select m Order By
                                   m.Biography
            For Each q In qry
                Dim lbl = New Label
                Dim lblbr = New Label
                For Each i In q.SiteKeyword.ToString.Split(";")
                    Page.MetaKeywords += i.ToString + ","
                Next
                Page.MetaDescription = q.Biography
                lblbr.Text = "<p/>"
                lbl.ToolTip = "بیوگرافی مهندس امیرحسن مروجی"
                lbl.Text = "<article class='post'><div class='posttitle'><div class='owner'> </div><h2> بیوگرافی مهندس امیرحسن مروجی </h2><div class='clear'></div></div><div class=' row'><div class='postimg four columns'><img alt='' src='" + q.BiographyPic + "'></div><div class='eight columns'><div class='entry-content'><p>" + q.Biography + "</p></div></div></div></article>"
                PlaceHolderBiography.Controls.Add(lbl)
                PlaceHolderBiography.Controls.Add(lblbr)
            Next
        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.ErrorMessage = ex.Message
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
            Response.Redirect("ErrorPage.aspx")
        End Try

    End Sub
End Class
