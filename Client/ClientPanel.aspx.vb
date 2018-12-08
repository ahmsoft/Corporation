
Partial Class ClientPanel
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Try
            Dim lblCommentNoReadCount As Label = Master.FindControl("lblCommentNoReadCount")
            Dim lblCommentNoReadCount1 As Label = Master.FindControl("lblCommentNoReadCount1")
            Dim lblClientImage As Label = Master.FindControl("lblClientImage")
            Dim lblClientImage1 As Label = Master.FindControl("lblClientImage1")
            Dim lblClientImage2 As Label = Master.FindControl("lblClientImage2")
            Dim lblClientNameFamily As Label = Master.FindControl("lblClientNameFamily")
            Dim lblClientNameFamily1 As Label = Master.FindControl("lblClientNameFamily1")
            Dim lblClientNameFamily2 As Label = Master.FindControl("lblClientNameFamily2")
            'Dim lblFAQCount As Label = Master.FindControl("lblFAQCount")
            'Dim lblWarningCount As Label = Master.FindControl("lblWarningCount")
            'Dim lblWarningCount1 As Label = Master.FindControl("lblWarningCount1")
            'Dim lblWarningCommentCount As Label = Master.FindControl("lblWarningCommentCount")
            Dim WarningCount As Integer = 0
            Dim lblComments As Label = Master.FindControl("lblComments")
            Dim CurrentIDO As Integer
            Dim stridclient As String
            stridclient = Trim(HttpContext.Current.User.Identity.Name.ToString.Substring(0, HttpContext.Current.User.Identity.Name.ToString.Length - 2))
            Session("IDCli") = stridclient
            Dim db = New LinqDBClassesDataContext
            Dim Client = From m In db.Clients
                         Select m Where m.IDClient = Convert.ToInt32(stridclient)
            For Each m In Client
                lblClientImage2.Text = "<img src='" + m.Photo + "' class='user-image' style='z-index: 5;height: 90px;width: 90px;border: 3px solid;border-color: transparent;border-color: rgba(255, 255, 255, 0.2);border-radius: 50%;' alt='User Image' />"
                lblClientImage1.Text = "<img src='" + m.Photo + "' class='user-image' style='z-index: 5;height: 30px;width: 30px; border-radius: 50%;' alt='User Image' />"
                lblClientImage.Text = "<img src='" + m.Photo + "' class='user-image' style='width: 100%;max-width: 45px;height: auto; border-radius: 50%;' alt='User Image' />"
                CurrentIDO = m.IDO
            Next
            Dim Order = From m In db.Orders
                        Select m Where m.IDO = CurrentIDO
            For Each m In Order
                lblClientNameFamily.Text = "<p>" + m.NameAndFamily + "</p>"
                lblClientNameFamily1.Text = "<span class='hidden-xs'>" + m.NameAndFamily + "</span>"
                lblClientNameFamily2.Text = "<p style='z-index: 5;color: #fff;color: rgba(255, 255, 255, 0.8);font-size: 17px;margin-top: 10px;margin: 0 0 10px;display: block;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;'>" + m.NameAndFamily + "<br /><small>نماینده " + m.SiteNameFA + "</small></p>"
            Next
            Dim p As Integer = 0
            Dim i As Integer = 0
            Dim commentRow = From m In db.Comments
                             Select m Where m.IDClient = Convert.ToInt32(stridclient) Order By m.IDC Descending
            'Where m.IDClient = IDClient 
            For Each m In commentRow
                Dim msg As String = m.MSG
                If msg.Length > 20 Then
                    msg = Substr(msg, 0, 19)
                End If
                If Trim(m.Seen) = "New" Then
                    lblComments.Text += "<li><a href='Inbox.aspx?ID=" + m.IDC.ToString + "' style='display:block;white-space:nowrap;border-bottom:1px solid #f4f4f4;'><div class='pull-right' style='display: block;'><span class='label label-success' style='margin-right:5px;margin-left:5px;'>" + m.Seen + "</span></div><h4 style='padding: 0;margin: 0 0 0 45px;color:#444444;font-size:12px;position:relative;margin-top:10px;' >" + m.NameAndFamily + "<small style='color:#999999;font-size:9px;position:absolute;top:0;left:0;'><i class='fa fa-clock-o'></i>" + m.Date + "<br /> " + m.Time + "</small></h4><p style='font-size: 10px;color: #888888;'><br />" + msg + "</p></a></li>"
                    i = i + 1
                    WarningCount += 1
                Else
                    lblComments.Text += "<li><a href='Inbox.aspx?ID=" + m.IDC.ToString + "' style='display:block;white-space:nowrap;border-bottom:1px solid #f4f4f4;'><div class='pull-right' style='display: block;'><span class='label label-warning' style='margin-right:5px;margin-left:5px;'>" + m.Seen + "</span></div><h4 style='padding: 0;margin: 0 0 0 45px;color:#444444;font-size:12px;position:relative;margin-top:10px;' >" + m.NameAndFamily + "<small style='color:#999999;font-size:9px;position:absolute;top:0;left:0;'><i class='fa fa-clock-o'></i>" + m.Date + "<br /> " + m.Time + "</small></h4><p style='font-size: 10px;color: #888888;' title='" + m.MSG + "'><br />" + msg + "</p></a></li>"

                End If
                p += 1
            Next
            lblCommentCount.Text = p
            lblCommentNoReadCount.Text = i
            lblCommentNoReadCount1.Text = i
            ''p = 0
            'i = 0
            'Dim Orders = From m In db.Orders
            '             Select m Where m.IDO = HttpContext.Current.User.Identity.Name

            'For Each m In Orders
            '    MsgBox(m.NameAndFamily)

            'Next
            ''lblOrderCount.Text = i
            'i = 0
            'Dim Tasks = From m In db.Tasks
            '            Select m Order By m.IDT

            'For Each m In Tasks
            '    i = i + 1
            'Next
            ''lblTaskCount.Text = i
            'Dim FAQCU As Integer = 0
            'Dim FAQ = From m In db.FAQs
            '          Select m Where m.Seen = "New" Order By m.IDF

            'For Each m In FAQ
            '    FAQCU += 1
            'Next
            'lblFAQCount.Text = FAQCU
            'lblWarningCount.Text = FAQCU + WarningCount
            'lblWarningCount1.Text = lblWarningCount.Text
            'lblWarningCommentCount.Text = lblCommentNoReadCount.Text
            'Dim visitorS = From m In db.Visitors
            '               Select m
            'For Each m In visitorS
            '    'lblAllVisit.Text = m.AllVisitor
            '    'lblVis.Text = m.Today
            '    'lblToday.Text = m.Today
            'Next
            ''Dim OnlineDetails = From m In db.UsersOnlineDetails
            ''                    Select m Order By m.IDOnline Descending
            ''i = 0
            ''For Each m In OnlineDetails
            ''    lstUserOnlineDetails.Text += "<tr><td style='direction:ltr;text-align:center;'><a href='#'>" + m.DateAndTime + " </a></td><td style='direction:ltr;text-align:center;'>" + m.Platform + "</td><td style='direction:ltr;text-align:center;'><span class='label label-success'>" + m.Browser + "</span></td><td style='direction:ltr;text-align:center;'><span class='label label-info'>" + m.MachinName + "</span></td><td style='direction:ltr;text-align:center;'><div class='sparkbar' data-color='#00a65a' data-height='20'>" + m.IPAddress + "</div></td><td style='direction:ltr;text-align:center;'><a href='" + m.Page + "'><span class='label label-success'>" + m.Page + "</span></a></td></tr>"
            ''    i += 1
            ''    If i > 8 Then Exit For
            ''Next

        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
        Dim lblActiveParent As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIPanel"))
        lblActiveParent.Attributes("Class") = "active"
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIClientPanel"))
        lblActive.Attributes("Class") = "active"
        'divProgressVisC.Attributes("Style") = "width:" + Application("visToday").ToString + "%;"
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String

        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function
End Class
