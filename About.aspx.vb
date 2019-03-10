
Partial Class About
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIAbout"))
        lblActive.Attributes("Class") = "current"
        Page.Title = "درباره شرکت و سایت نارم | NAREM.IR"
        Try
            Dim lblState As Label = Master.FindControl("StatusPage")
            lblState.Text = "درباره شرکت و سایت نارم"
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Abouts
                      Select m Order By
                                   m.AboutSite
            For Each q In qry
                Dim lbl = New Label
                Dim lblbr = New Label
                lblbr.Text = "<p/>"
                lbl.ToolTip = "درباره‌ی وب سایت و شرکت نارم"
                lbl.Text = "<article class='post'><div class='posttitle'><div class='owner'>03/10/1396 نوشته شده توسط <a href='/Biography'>Admin</a></div><h2> درباره وب سایت و شرکت </h2><div class='clear'></div></div><div class=' row'><div class='postimg four columns'><img alt='' src='" + q.ManagerPic + "'></div><div class='eight columns'><div class='entry-content'><p>" + q.AboutSite + "</p></div></div></div>"
                lbl.Text += "<br/><br/><section id='comment'><h3>اعضای هیات مدیره</h3><ol class='commentlist'><li><div class='comment-body'><div class='avatar-img'><img src='/Lamonte/images/AvatarAHM.png' alt='امیرحسین مروجی' class='avatar' /></div><cite class='fn'><a href='#'>امیرحسین مروجی، رئیس هیات مدیره</a> </cite><div class='commenttext'><p>دانشجوی دکترای حسابداری، عضو هیات علمی دانشگاه</p></div></div><li><div class='com-line'></div><div class='comment-body'><div class='avatar-img'><img src='/Lamonte/images/Avatar.png' alt='فرزانه مروجی' class='avatar' /></div><cite class='fn'><a>فرزانه مروجی، نایب رئیس هیات مدیره</a></cite><div class='commenttext'><p>کارشناس ارشد هوش مصنوعی</p></div></div></li><li><div class='comment-body'><div class='avatar-img'><img src='/Lamonte/images/AvatarAHMSoft.png' alt='امیرحسن مروجی' class='avatar' /></div><cite class='fn'><a href='/Biography'>امیرحسن مروجی، مدیرعامل</a></cite><div class='commenttext'><p>کارشناس ارشد مهندسی نرم افزار</p></div></div></li></ol></section></article>"
                lbl.Text += " کلمات کلیدی: "
                For Each i In q.SiteKeyword.ToString.Split(";")
                    lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 3px; display:inline-block; padding:2px 6px 2px 6px;margin:2px 3px 2px 3px;'>" + i.ToString + "</span>"
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