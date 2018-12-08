
Partial Class Admin_AboutManagement
    Inherits System.Web.UI.Page

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
        Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIAbouts"))
        lblActive.Attributes("Class") = "active"
    End Sub
    Protected Sub btnUpdateAbout_Click(sender As Object, e As EventArgs) Handles btnUpdateAbout.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Abouts
                      Select m Where m.IDA = 1
            For Each q In qry
                q.AboutManager = txtAboutManager.Content
                q.AboutSite = txtSiteAbout.Content
                q.Biography = txtBiography.Content
                q.BiographyKeyword = txtBiographyKeyword.Text
                q.Contact = txtContact.Text
                q.BiographyPic = txtImageBiography.Text
                q.ManagerPic = txtImageManager.Text
                q.SiteKeyword = txtSiteKeyword.Text
                q.ManagerKeyword = txtManagerKeyword.Text
                q.Address = txtAddress.Content
                q.Mobile = txtMobile.Text
                q.BodyContact = txtBodyContact.Content
                q.Facebook = txtFacebook.Text
                q.Telegram = txtTelegram.Text
                q.Telephone = txtTelephon.Text
                q.Twitter = txtTwitter.Text
                q.Googleplus = txtGooglePlus.Text
                q.Instagram = txtInstagram.Text
                q.Linkedin = txtLinkedin.Text
                q.WorkingHours = txtWorkingHours.Content
            Next
            db.SubmitChanges()
        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.ErrorMessage = ex.Message
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
            Response.Redirect(Server.MapPath("ErrorPage.aspx") + "/ErrorPage.aspx")
        End Try
    End Sub

    Private Sub Admin_AboutManagement_Init(sender As Object, e As EventArgs) Handles Me.Init
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Abouts
                      Select m
                      Where m.IDA = 1
            For Each q In qry
                txtAboutManager.Content = q.AboutManager
                txtBiography.Content = q.Biography
                txtBiographyKeyword.Text = q.BiographyKeyword
                txtContact.Text = q.Contact
                txtImageBiography.Text = q.BiographyPic
                txtImageManager.Text = q.ManagerPic
                txtManagerKeyword.Text = q.ManagerKeyword
                txtSiteKeyword.Text = q.SiteKeyword
                txtSiteAbout.Content = q.AboutSite
                txtAddress.Content = q.Address
                txtMobile.Text = q.Mobile
                txtBodyContact.Content = q.BodyContact
                txtFacebook.Text = q.Facebook
                txtTelegram.Text = q.Telegram
                txtTelephon.Text = q.Telephone
                txtTwitter.Text = q.Twitter
                txtGooglePlus.Text = q.Googleplus
                txtInstagram.Text = q.Instagram
                txtLinkedin.Text = q.Linkedin
                txtWorkingHours.Content = q.WorkingHours
            Next
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String

        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function

End Class
