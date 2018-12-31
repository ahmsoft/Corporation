
Partial Class PostView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIPost"))
        lblActive.Attributes("Class") = "current"
        Dim lblState As Label = Master.FindControl("StatusPage")
        lblState.Text = "نمایش مطلب"
        Dim db = New LinqDBClassesDataContext
        Page.MetaKeywords = ""
        If Page.RouteData.Values("Action").ToString() = "Default" Then

            Dim qry1 = From m In db.Messages
                       Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all") And m.Title.ToString() = Page.RouteData.Values("Title").ToString.Replace("-", " ")

            For Each q In qry1
                Dim lbl = New Label
                Dim lblbr = New Label
                lblbr.Text = "<br>"
                lbl.ToolTip = q.Title
                lbl.Text = "<article class='post'><div class='posttitle'><div class='owner'>" + q.Moment + " نوشته شده توسط <a href='/Biography'>Admin</a></div><h2><a href='" + Server.MapPath("PostView") + "/PostView/Default/" + q.Title.ToString().Replace(" ", "-") + "'>" + q.Title + "</a></h2><div class='clear'></div></div><div class=' row'><div class='postimg four columns'><img alt='' src='" + q.Pic + "'></div><div class='eight columns'><div class='entry-content'>" + q.MSG + "</div></div></div></article>"
                lbl.Text += " کلمات کلیدی: "
                lblState.Text = q.Title
                For Each i In q.Keyword.ToString.Split(";")
                    lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                    Page.MetaKeywords += i.ToString + ","
                Next
                lbl.Text += "<br/><br/><hr/>"
                PostViewPlaceHolder.Controls.Add(lbl)
                Page.Title = q.Title
                Page.MetaDescription = q.MSG + "<br/> این مطلب در " + q.Moment + " توسط شرکت طراحی سایت آریا سافت ثبت شده است. "
            Next

        ElseIf Page.RouteData.Values("Action").ToString() = "News" Then
            Dim qry1 = From m In db.News1s
                       Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all") And m.Title.ToString() = Page.RouteData.Values("Title").ToString.Replace("-", " ")
            For Each q In qry1
                Dim lbl = New Label
                Dim lblbr = New Label
                lblbr.Text = "<br>"
                lblState.Text = "اخبار - " + q.Title
                lbl.ToolTip = q.Title
                lbl.Text = "<article class='post'><div class='posttitle'><div class='owner'>" + q.Date + " نوشته شده توسط <a href='/Biography'>Admin</a></div><h2><a href='" + Server.MapPath("PostView") + "/PostView/News/" + q.Title.ToString().Replace(" ", "-") + "'>" + q.Title + "</a></h2><div class='clear'></div></div><div class=' row'><div class='postimg four columns'><img alt='' src='" + q.Pic + "'></div><div class='eight columns'><div class='entry-content'><p>" + q.MSG + "</p></div></div></div></article>"
                lbl.Text += " کلمات کلیدی: "
                For Each i In q.Keyword.ToString.Split(";")
                    lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                    Page.MetaKeywords += i.ToString + ","
                Next
                lbl.Text += "<br/><br/><hr/>"
                PostViewPlaceHolder.Controls.Add(lbl)
                Page.Title = q.Title
                Page.MetaDescription = q.MSG + "<br/> این خبر در " + q.Moment + " توسط شرکت طراحی سایت آریا سافت ثبت شده است "

            Next
        ElseIf Page.RouteData.Values("Action").ToString() = "Page" Then
            Dim qry1 = From m In db.Pages
                       Select m Where m.PageTitle.ToString() = Page.RouteData.Values("Title").ToString.Replace("-", " ")

            For Each q In qry1
                Dim lbl = New Label
                lblState.Text = q.PageTitle
                lbl.Text = q.Body
                lbl.Text += " کلمات کلیدی: "
                For Each i In q.Keyword.ToString.Split(";")
                    lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                    Page.MetaKeywords += i.ToString + ","
                Next
                lbl.Text += "<br/><br/><hr/>"
                PostViewPlaceHolder.Controls.Add(lbl)
                Page.Title = q.PageTitle
                Page.MetaDescription = q.Body + "<br/> آدرس صفحه در سایت  " + q.Address + " توسط شرکت طراحی سایت آریا سافت ثبت شده است "
            Next
        ElseIf Page.RouteData.Values("Action").ToString() = "FAQ" Then
            Dim qry1 = From m In db.FAQs
                       Select m Where m.IsShow = True And m.Question.ToString() = Page.RouteData.Values("Title").ToString.Replace("-", " ")

            For Each q In qry1
                Dim lbl = New Label
                lblState.Text = q.Question
                lbl.Text = "<article class='post'><div class='posttitle'><div class='owner'>" + q.Moment + " نوشته شده توسط <a href='/Biography'>Admin</a></div><h2><a href='" + Server.MapPath("PostView") + "/PostView/FAQ/" + q.Question.ToString().Replace(" ", "-") + "'>" + q.Question + "</a></h2><div class='clear'></div></div><div class=' row'><div class='twelve columns'><div class='entry-content'>" + q.Answer + "</div></div></div></article>"
                lbl.Text += " کلمات کلیدی: "
                For Each i In q.Keyword.ToString.Split(";")
                    lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                    Page.MetaKeywords += i.ToString + ","

                Next
                lbl.Text += "<br/><br/><hr/>"
                PostViewPlaceHolder.Controls.Add(lbl)
                Page.Title = q.Question
                Page.MetaDescription = q.Answer + "<br/> این پرسش در " + q.Moment + "توسط کارشناس شرکت طراحی سایت آریا سافت پاسخ داده شده است"

            Next
        End If
    End Sub
End Class
