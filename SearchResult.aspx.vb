
Partial Class SearchResult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.Title = "نتایج جستجو - NAREM.IR - Search Result"
        Page.MetaDescription = "از طریق این قسمت شما قادر به جستجوی مطالب سایت و روئیت نتایج حاصل از جستجو هستید، جستجو بر اساس کلمات کلیدی موجود در پیام‌ها صورت میگیرد."
        Page.MetaKeywords = ""
        Dim lblState As Label = Master.FindControl("StatusPage")
        lblState.Text = " نتایج جستجو "
        Dim CounterResult As Int16 = 0
        Dim db = New LinqDBClassesDataContext
        Dim qry1 = From m In db.Messages
                   Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all") And (m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*")

        For Each q In qry1
            Dim lbl = New Label
            Dim lblbr = New Label
            Dim msg As String
            lblbr.Text = "<br>"
            lbl.ToolTip = q.Title
            If q.MSG.Length > 20 Then
                msg = Substr(q.MSG, 0, 20)
            Else
                msg = q.MSG
            End If
            lbl.Text = "<h3><a href='/PostView/Default/" + q.Title.ToString().Replace(" ", "-") + "'>" + q.Title + "</a></h3>"
            CounterResult += 1
            lbl.Text += " کلمات کلیدی: "
            For Each i In q.Keyword.ToString.Split(";")
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += i.ToString + ","
            Next
            lbl.Text += "<br/><br/><hr/>"
            PostsPlaceHolder.Controls.Add(lbl)
        Next
        Dim qry2 = From m In db.News1s
                   Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all") And (m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*")
        For Each q In qry2
            Dim lbl = New Label
            Dim lblbr = New Label
            Dim msg As String
            lblbr.Text = "<br>"
            lbl.ToolTip = q.Title
            If q.MSG.Length > 20 Then
                msg = Substr(q.MSG, 0, 20)
            Else
                msg = q.MSG
            End If
            lbl.Text = "<h3><a href='/PostView/News/" + q.Title.ToString().Replace(" ", "-") + "'>" + q.Title + "</a></h3>"
            CounterResult += 1
            lbl.Text += " کلمات کلیدی: "
            For Each i In q.Keyword.ToString.Split(";")
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += "," + i.ToString
            Next
            lbl.Text += "<br/><br/><hr/>"
            NewsPlaceHolder.Controls.Add(lbl)
        Next
        Dim qry3 = From m In db.Pages
                   Select m Where m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*"

        For Each q In qry3
            Dim lbl = New Label
            Dim lblbr = New Label
            lblbr.Text = "<br>"
            lbl.Text = "<h3><a href='/PostView/Page/" + q.PageTitle.ToString().Replace(" ", "-") + "'>" + q.PageTitle + "</a></h3>"
            CounterResult += 1
            lbl.Text += " کلمات کلیدی: "
            For Each i In q.Keyword.ToString.Split(";")
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += "," + i.ToString
            Next
            lbl.Text += "<br/><br/><hr/>"
            PagePlaceHolder.Controls.Add(lbl)
        Next
        Dim qry4 = From m In db.FAQs
                   Select m Where m.IsShow = True And m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*"

        For Each q In qry4
            Dim lbl = New Label
            Dim lblbr = New Label
            lblbr.Text = "<br>"
            lbl.Text = "<h3><a href='/PostView/FAQ/" + q.Question.ToString().Replace(" ", "-") + "'>" + q.Question + "</a></h3>"
            CounterResult += 1
            lbl.Text += " کلمات کلیدی: "
            For Each i In q.Keyword.ToString.Split(";")
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff; border-radius: 2px; margin:3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += "," + i.ToString
            Next
            lbl.Text += "<br/><br/><hr/>"
            PagePlaceHolder.Controls.Add(lbl)
        Next
        lblState.Text += CounterResult.ToString() + " مورد. "
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String
        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function
End Class
