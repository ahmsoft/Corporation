
Partial Class SearchResult
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.Title = "نتایج جستجو - NAREM.IR"
        Page.MetaDescription = "نتایج جستجوی مطالب وب سایت شرکت نارِم."
        Page.MetaKeywords = ""
        Dim lblState As Label = Master.FindControl("StatusPage")
        lblState.Text = " نتایج جستجو "
        Dim CounterResult As Int16 = 0
        Dim db = New LinqDBClassesDataContext
        Dim qry1 = From m In db.Messages
                   Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all") And ((m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*") Or (m.MSG Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*"))

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
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff;border-radius: 3px; display:inline-block; padding:2px 6px 2px 6px;margin:2px 3px 2px 3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += i.ToString + ","
            Next
            lbl.Text += "<br/><br/><hr/>"
            PostsPlaceHolder.Controls.Add(lbl)
        Next
        Dim qry2 = From m In db.News1s
                   Select m Where m.IsShow = True And (m.Access = "gust" Or m.Access = "all") And ((m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*") Or (m.MSG Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*"))
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
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff;border-radius: 3px; display:inline-block; padding:2px 6px 2px 6px;margin:2px 3px 2px 3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += "," + i.ToString
            Next
            lbl.Text += "<br/><br/><hr/>"
            NewsPlaceHolder.Controls.Add(lbl)
        Next
        Dim qry3 = From m In db.Pages
                   Select m Where (m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*") Or (m.Body Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*")

        For Each q In qry3
            Dim lbl = New Label
            Dim lblbr = New Label
            lblbr.Text = "<br>"
            lbl.Text = "<h3><a href='/PostView/Page/" + q.PageTitle.ToString().Replace(" ", "-") + "'>" + q.PageTitle + "</a></h3>"
            CounterResult += 1
            lbl.Text += " کلمات کلیدی: "
            For Each i In q.Keyword.ToString.Split(";")
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff;border-radius: 3px; display:inline-block; padding:2px 6px 2px 6px;margin:2px 3px 2px 3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += "," + i.ToString
            Next
            lbl.Text += "<br/><br/><hr/>"
            PagePlaceHolder.Controls.Add(lbl)
        Next
        Dim qry4 = From m In db.FAQs
                   Select m Where m.IsShow = True And (m.Keyword Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*") Or (m.Answer Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*") Or (m.Question Like "*" + Trim(Page.RouteData.Values("Title").ToString.Replace("~", " ")) + "*")

        For Each q In qry4
            Dim lbl = New Label
            Dim lblbr = New Label
            lblbr.Text = "<br>"
            lbl.Text = "<h3><a href='/PostView/FAQ/" + q.Question.ToString().Replace(" ", "-") + "'>" + q.Question + "</a></h3>"
            CounterResult += 1
            lbl.Text += " کلمات کلیدی: "
            For Each i In q.Keyword.ToString.Split(";")
                lbl.Text = lbl.Text + "<span style='background-color: #598800;border-color: #00f;color:#fff;border-radius: 3px; display:inline-block; padding:2px 6px 2px 6px;margin:2px 3px 2px 3px;'>" + i.ToString + "</span>"
                Page.MetaKeywords += "," + i.ToString
            Next
            lbl.Text += "<br/><br/><hr/>"
            PagePlaceHolder.Controls.Add(lbl)
        Next
        lblState.Text += CounterResult.ToString() + " مورد. "
        If CounterResult = 0 Then
            Dim lblNoItem As New Label
            lblNoItem.Text = "<center><span  Style='background-color:rgba(90,90,90,1);color:white;margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 4px 4px; padding: 15px 26px 15px 26px;'>موردی یافت نشد.</span></center>"
            PagePlaceHolder.Controls.Add(lblNoItem)
        End If
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String
        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function
End Class
