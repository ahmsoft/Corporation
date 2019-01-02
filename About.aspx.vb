
Partial Class About
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIAbout"))
        lblActive.Attributes("Class") = "current"
        Page.Title = "درباره سایت - شرکت نارم - NAREM.IR - About Site"
        Try
            Dim lblState As Label = Master.FindControl("StatusPage")
            lblState.Text = "درباره سایت"
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Abouts
                      Select m Order By
                                   m.AboutSite
            For Each q In qry
                Dim lbl = New Label
                Dim lblbr = New Label
                lblbr.Text = "<p/>"
                lbl.ToolTip = "درباره‌ی وب سایت"
                lbl.Text = "<article class='post'><div class='posttitle'><div class='owner'>03/10/1396 نوشته شده توسط <a href='/Biography'>Admin</a></div><h2> درباره سایت </h2><div class='clear'></div></div><div class=' row'><div class='postimg four columns'><img alt='' src='" + q.ManagerPic + "'></div><div class='eight columns'><div class='entry-content'><p>" + q.AboutSite + "</p></div></div></div></article>"
                lbl.Text += " کلمات کلیدی: "
                For Each i In q.SiteKeyword.ToString.Split(";")
                    lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                    Page.MetaKeywords += i.ToString + ","
                Next
                Page.MetaDescription = q.AboutSite
                lbl.Text += "<br/><br/><hr/>"
                PlaceHolderBiography.Controls.Add(lbl)
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