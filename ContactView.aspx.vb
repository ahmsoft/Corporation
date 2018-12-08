
Partial Class ContactView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.Title = "پل ارتباطی - شرکت طراحی سایت آریا سافت - AriyaSoft.com - Contact"

        Try
            Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIContact"))
            lblActive.Attributes("Class") = "current"
            Dim lblState As Label = Master.FindControl("StatusPage")
            lblState.Text = "ارتباط با ما"
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Abouts
                      Select m
            For Each q In qry
                Dim lblAddress = New Label
                Dim lblMobile = New Label
                Dim lblTelephone = New Label
                Dim lblBodyContact = New Label
                Dim lblInstagram = New Label
                Dim lblTelegram = New Label
                Dim lblLinkedin = New Label
                Dim lblTwitter = New Label
                Dim lblFacebook = New Label
                Dim lblGooglepluse = New Label
                Dim lblWorkingHours = New Label
                Page.MetaDescription = "روش های ارتباط با شرکت طراحی سایت و توسعه نرم افزار مبتنی بر وب آریا سافت AriyaSoft.com همچنین برقراری ارتباط مستقیم با مهندس امیرحسن مروجی AHMSoft"
                Page.MetaKeywords = q.Address + " , " + q.Telephone + " , " + q.Contact + " , " + q.Mobile + " , " + q.Instagram + " , " + q.Linkedin + " , " + q.Telegram + " , ارسال پیام , شرکت طراحی سایت آریا سافت , ارتباط با ما"
                lblAddress.Text = q.Address & "تلفن: " & q.Telephone.ToString()
                lblBodyContact.Text = q.BodyContact
                lblWorkingHours.Text = q.WorkingHours
                AddressAndTellPlaceHolder.Controls.Add(lblAddress)
                BodyContactPlaceHolder.Controls.Add(lblBodyContact)
                WorkingHoursPlaceHolder.Controls.Add(lblWorkingHours)
                lblGooglepluse.Text = "<a href='" & q.Googleplus & "' target='_blank'><img src='/Lamonte/images/SocialApps/google-farsgraphic.png' style='width:50px;'></a> "
                lblTelegram.Text = "<a href='" & q.Telegram & "' target='_blank'><img src='/Lamonte/images/SocialApps/telegram-farsgraphic.png' style='width:50px;'></a> "
                lblLinkedin.Text = "<a href='" & q.Linkedin & "' target='_blank'><img src='/Lamonte/images/SocialApps/linkedin-farsgraphic.png' style='width:50px;'></a> "
                lblInstagram.Text = "<a href='" & q.Instagram & "' target='_blank'><img src='/Lamonte/images/SocialApps/instagram-farsgraphic.png' style='width:50px;'></a> "
                lblFacebook.Text = "<a href='" & q.Facebook & "' target='_blank'><img src='/Lamonte/images/SocialApps/facebook-farsgraphic.png' style='width:50px;'></a> "
                lblTwitter.Text = "<a href='" & q.Twitter & "' target='_blank'><img src='/Lamonte/images/SocialApps/farsgraphic-Twitter.png' style='width:50px;'></a></a> "
                If q.Twitter <> "Null" Then
                    SocialNetworkPlaceHolder.Controls.Add(lblTwitter)
                End If
                If q.Facebook <> "Null" Then
                    SocialNetworkPlaceHolder.Controls.Add(lblFacebook)
                End If
                If q.Googleplus <> "Null" Then
                    SocialNetworkPlaceHolder.Controls.Add(lblGooglepluse)
                End If
                If q.Telegram <> "Null" Then
                    SocialNetworkPlaceHolder.Controls.Add(lblTelegram)
                End If
                If q.Instagram <> "Null" Then
                    SocialNetworkPlaceHolder.Controls.Add(lblInstagram)
                End If
                If q.Linkedin <> "Null" Then
                    SocialNetworkPlaceHolder.Controls.Add(lblLinkedin)
                End If

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
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If RadCaptcha1.IsValid = True Then
            Try
                Dim db = New LinqDBClassesDataContext
                Dim qry = From m In db.ContactUs
                          Select m Where m.MSG = Trim(txtMessage.Text)
                For Each m In qry
                    If m.MSG = txtMessage.Text Then
                        lblSubmitStatus.Text = "این پیام قبلا ارسال شده."
                        Exit Try
                    End If
                Next
                Dim q = New ContactUs
                q.MSG = "<p style='text-align: justify'>" + txtMessage.Text + "</p>"
                q.Date = "12/09/1368"
                q.Time = "12:12:12 AM"
                q.NameAndFamily = txtNameFamili.Text
                q.Email = txtEmail.Text
                q.WebSite = txtWebsite.Text
                q.Seen = "New"
                db.ContactUs.InsertOnSubmit(q)
                db.SubmitChanges()
                lblSubmitStatus.Style.Value = "color:Cyan;"
                lblSubmitStatus.Text = "پیام شما با موفقیت ارسال شد."
            Catch ex As Exception
                Response.Write(ex.Message)
                lblSubmitStatus.Style.Value = "color:Orange;"
                lblSubmitStatus.Text = "ارسال نا موفق - خطا سرور."

            End Try
        Else
            lblSubmitStatus.Style.Value = "color:Orange;"
            lblSubmitStatus.Text = "کد امنیتی با دقت وارد شود."
        End If


    End Sub
End Class
