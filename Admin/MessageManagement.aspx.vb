﻿
Partial Class MessageManagement1
    Inherits System.Web.UI.Page
    Protected Sub btnUpdateMessage_Click(sender As Object, e As EventArgs) Handles btnUpdateMessage.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Messages
                      Select m Where m.IDM = Convert.ToInt32(MessageView.SelectedValue)
            For Each q In qry
                q.Title = txtSubject.Text
                q.MSG = txtEditor.Content
                q.Date = "12/09/1368"
                q.Time = "12:12:12 AM"
                q.Moment = tarikh.Value
                q.IsShow = CheckBoxIsShow.Checked
                q.Priority = txtPeriority.Text
                q.Access = "All"
                q.Keyword = txtKeyword.Text
                q.Pic = txtPicPost.Text
            Next
            db.SubmitChanges()
            MessageView.DataBind()

        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.ErrorMessage = ex.Message
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
            Response.Redirect("../ErrorPage.aspx")
        End Try
    End Sub
    Protected Sub btnSaveNewMessage_Click(sender As Object, e As EventArgs) Handles btnSaveNewMessage.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim q = New Message
            q.Title = txtSubject.Text
            q.MSG = txtEditor.Content
            q.Date = "12/09/1368"
            q.Time = "12:12:12 AM"
            q.Moment = tarikh.Value
            q.IsShow = CheckBoxIsShow.Checked
            q.Priority = txtPeriority.Text
            q.Access = "All"
            q.Keyword = txtKeyword.Text
            q.Pic = txtPicPost.Text
            db.Messages.InsertOnSubmit(q)
            db.SubmitChanges()
            MessageView.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Protected Sub MessageView_SelectedIndexChanged(sender As Object, e As EventArgs) Handles MessageView.SelectedIndexChanged
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Messages
                      Select m
                      Where m.IDM = Convert.ToInt32(MessageView.SelectedValue)
            For Each q In qry
                txtSubject.Text = q.Title
                txtEditor.Content = q.MSG
                lblOldMoment.Text = "این پیام در زمان " + q.Moment + " توسط شما ثبت شده "
                txtPicPost.Text = q.Pic
                CheckBoxIsShow.Checked = q.IsShow
                txtPeriority.Text = q.Priority
                txtKeyword.Text = q.Keyword
            Next
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Try
            Dim lblCommentNoReadCount As Label = Master.FindControl("lblCommentNoReadCount")
            Dim lblCommentNoReadCount1 As Label = Master.FindControl("lblCommentNoReadCount1")
            Dim lblAdminImage As Label = Master.FindControl("lblAdminImage")
            Dim lblAdminImage1 As Label = Master.FindControl("lblAdminImage1")
            Dim lblAdminImage2 As Label = Master.FindControl("lblAdminImage2")
            Dim lblAdminNameFamily As Label = Master.FindControl("lblAdminNameFamily")
            Dim lblAdminNameFamily1 As Label = Master.FindControl("lblAdminNameFamily1")
            Dim lblAdminNameFamily2 As Label = Master.FindControl("lblAdminNameFamily2")
            Dim lblFAQCount As Label = Master.FindControl("lblFAQCount")
            Dim lblWarningCount As Label = Master.FindControl("lblWarningCount")
            Dim lblWarningCount1 As Label = Master.FindControl("lblWarningCount1")
            Dim lblWarningCommentCount As Label = Master.FindControl("lblWarningCommentCount")
            Dim WarningCount As Integer = 0

            Dim lblComments As Label = Master.FindControl("lblComments")
            Dim db = New LinqDBClassesDataContext
            Dim User = From m In db.Users
                       Select m Order By m.IDU

            For Each m In User
                If m.Supervisor = "1" Then
                    lblAdminImage2.Text = "<img src='" + m.Photo + "' class='user-image' style='z-index: 5;height: 90px;width: 90px;border: 3px solid;border-color: transparent;border-color: rgba(255, 255, 255, 0.2);border-radius: 50%;' alt='User Image' />"
                    lblAdminImage1.Text = "<img src='" + m.Photo + "' class='user-image' style='z-index: 5;height: 30px;width: 30px; border-radius: 50%;' alt='User Image' />"
                    lblAdminImage.Text = "<img src='" + m.Photo + "' class='user-image' style='width: 100%;max-width: 45px;height: auto; border-radius: 50%;' alt='User Image' />"
                    lblAdminNameFamily.Text = "<p>" + m.Name + " " + m.Family + "</p>"
                    lblAdminNameFamily1.Text = "<span class='hidden-xs'>" + m.Name + " " + m.Family + "</span>"
                    lblAdminNameFamily2.Text = "<p style='z-index: 5;color: #fff;color: rgba(255, 255, 255, 0.8);font-size: 17px;margin-top: 10px;margin: 0 0 10px;display: block;-webkit-margin-before: 1em;-webkit-margin-after: 1em;-webkit-margin-start: 0px;-webkit-margin-end: 0px;'>" + m.Name + " " + m.Family + "<br /><small>مدیریت کل سایت</small></p>"
                End If
            Next
            Dim p As Integer = 0
            Dim i As Integer = 0
            Dim commentRow = From m In db.ContactUs
                             Select m Order By m.IDCU Descending

            For Each m In commentRow
                Dim msg As String = m.MSG
                If msg.Length > 20 Then
                    msg = Substr(msg, 0, 19)
                End If
                If Trim(m.Seen) = "New" Then
                    lblComments.Text += "<li><a href='Inbox.aspx?ID=" + m.IDCU.ToString + "' style='display:block;white-space:nowrap;border-bottom:1px solid #f4f4f4;'><div class='pull-right' style='display: block;'><span class='label label-success' style='margin-right:5px;margin-left:5px;'>" + m.Seen + "</span></div><h4 style='padding: 0;margin: 0 0 0 45px;color:#444444;font-size:12px;position:relative;margin-top:10px;' >" + m.NameAndFamily + "<small style='color:#999999;font-size:9px;position:absolute;top:0;left:0;'><i class='fa fa-clock-o'></i>" + m.Date + "<br /> " + m.Time + "</small></h4><p style='font-size: 10px;color: #888888;'><br />" + msg + "</p></a></li>"
                    i = i + 1
                    WarningCount += 1

                Else
                    lblComments.Text += "<li><a href='Inbox.aspx?ID=" + m.IDCU.ToString + "' style='display:block;white-space:nowrap;border-bottom:1px solid #f4f4f4;'><div class='pull-right' style='display: block;'><span class='label label-warning' style='margin-right:5px;margin-left:5px;'>" + m.Seen + "</span></div><h4 style='padding: 0;margin: 0 0 0 45px;color:#444444;font-size:12px;position:relative;margin-top:10px;' >" + m.NameAndFamily + "<small style='color:#999999;font-size:9px;position:absolute;top:0;left:0;'><i class='fa fa-clock-o'></i>" + m.Date + "<br /> " + m.Time + "</small></h4><p style='font-size: 10px;color: #888888;' title='" + m.MSG + "'><br />" + msg + "</p></a></li>"

                End If
                p += 1
            Next
            lblCommentNoReadCount.Text = i
            lblCommentNoReadCount1.Text = i
            Dim FAQCU As Integer = 0
            Dim FAQ = From m In db.FAQs
                      Select m Where m.Seen = "New" Order By m.IDF

            For Each m In FAQ
                FAQCU += 1
            Next
            lblFAQCount.Text = FAQCU
            lblWarningCount.Text = FAQCU + WarningCount
            lblWarningCount1.Text = lblWarningCount.Text
            lblWarningCommentCount.Text = lblCommentNoReadCount.Text
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
        Dim lblActiveParent As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIContentPages"))
        lblActiveParent.Attributes("Class") = "active"
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIMainPMs"))
        lblActive.Attributes("Class") = "active"
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String

        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function
End Class
