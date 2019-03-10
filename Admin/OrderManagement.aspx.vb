
Partial Class Admin_OrderManagement
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
            'OrderView_SelectedIndexChanged(sender, e)
        Catch ex As Exception
            Response.Write(ex.Message)

        End Try
    End Sub
    Protected Sub OrderView_SelectedIndexChanged(sender As Object, e As EventArgs) Handles OrderView.SelectedIndexChanged
        Dim db = New LinqDBClassesDataContext
        Try
            Dim qry = From m In db.Orders
                      Select m
                      Where m.IDO = Convert.ToInt32(OrderView.SelectedValue)
            For Each q In qry
                If q.NewDesign = True Then
                    rdoNewDesign.SelectedIndex = 1
                Else
                    rdoNewDesign.SelectedIndex = 0
                End If
                If q.SPL <> "" Then
                    txtSPL.Content = q.SPL
                Else
                    txtSPL.Content = "شرکت درحال انجام مراحل ابتدایی پروژه شماست. لطفا جهت پیگیری روند پیشرفت پروژه از همینجا اقدام نمایید."
                End If
                'txtSPL.Content = q.SPL
                txtAddress.Text = q.Address
                txtCompetition.Text = q.Competition
                txtCustomers.Text = q.Customers
                tarikh.Text = q.DeadLine
                txtDescription.Text = q.Description
                txtEmail.Text = q.Email
                txtJob.Text = q.Job
                txtMobile.Text = q.Mobile
                txtNameAndFamily.Text = q.NameAndFamily
                txtNameEn.Text = q.SiteNameEn
                txtNameFa.Text = q.SiteNameFA
                txtService.Text = q.Service
                txtPossibilities.Text = q.Possibilities
                txtPurposeExistingSite.Text = q.PurposeExistingSite
                txtRequirements.Text = q.Requirements
                txtSubject.Text = q.SiteSubject
                txtSampleSite.Text = q.SampleSite
                txtStyle.Text = q.Style
                txtTel.Text = q.Tel
                txtAdvice.Text = q.Thesis
                txtSuggestedCost.Text = q.SuggestedCosts
                If q.ActiveForClient = True Then
                    drpActiveClient.SelectedIndex = 1
                    frmClientInfo.Visible = True
                    frmContra.Visible = True
                    frmProgress.Visible = True
                Else
                    drpActiveClient.SelectedIndex = 0
                    frmClientInfo.Visible = False
                    frmContra.Visible = False
                    frmProgress.Visible = False
                End If
            Next
            txtUsername.Text = ""
            txtPassword.Text = ""
            txtContraName.Text = ""
            txtContra.Content = ""
            Dim qry1 = From m In db.Clients
                       Select m
                       Where m.IDO = Convert.ToInt32(OrderView.SelectedValue)
            For Each q In qry1
                txtUsername.Text = q.Username
                txtPassword.Text = q.Password
                txtPhotoClient.Text = q.Photo
            Next
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Protected Sub btnUpdateOrder_Click(sender As Object, e As EventArgs) Handles btnUpdateOrder.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Orders
                      Select m Where m.IDO = Convert.ToInt32(OrderView.SelectedValue)
            For Each q In qry
                If rdoNewDesign.SelectedIndex = 1 Then
                    q.NewDesign = True
                Else
                    q.NewDesign = False
                End If
                q.Address = txtAddress.Text
                q.Competition = txtCompetition.Text
                q.Customers = txtCustomers.Text
                q.DeadLine = tarikh.Text
                q.Description = txtDescription.Text
                q.Email = txtEmail.Text
                q.Job = txtJob.Text
                q.Mobile = txtMobile.Text
                q.NameAndFamily = txtNameAndFamily.Text
                q.SiteNameEn = txtNameEn.Text
                q.SiteNameFA = txtNameFa.Text
                q.Service = txtService.Text
                q.Possibilities = txtPossibilities.Text
                q.PurposeExistingSite = txtPurposeExistingSite.Text
                q.Requirements = txtRequirements.Text
                q.SiteSubject = txtSubject.Text
                q.SampleSite = txtSampleSite.Text
                q.Style = txtStyle.Text
                q.Tel = txtTel.Text
                q.Thesis = txtAdvice.Text
                q.SuggestedCosts = txtSuggestedCost.Text
                q.SPL = txtSPL.Content
                If drpActiveClient.SelectedIndex = 1 Then
                    q.ActiveForClient = True
                    frmClientInfo.Visible = True
                Else
                    q.ActiveForClient = False
                    frmClientInfo.Visible = False
                End If
            Next
            db.SubmitChanges()
            OrderView.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Public Function Substr(InputText As String, StartIndex As Integer, Length As Integer) As String
        Return InputText.Substring(StartIndex, Length) + " ... "
    End Function
    Protected Sub btnUpdateClient_Click(sender As Object, e As EventArgs) Handles btnUpdateClient.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Clients
                      Select m Where m.IDO = Convert.ToInt32(OrderView.SelectedValue)
            For Each q In qry
                q.Username = txtUsername.Text
                q.Password = txtPassword.Text
                q.Photo = txtPhotoClient.Text
            Next
            db.SubmitChanges()
            ClientView.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Protected Sub btnCreateClient_Click(sender As Object, e As EventArgs) Handles btnCreateClient.Click
        Dim db = New LinqDBClassesDataContext
        Try
            Dim qry = From m In db.Clients
                      Select m Where (m.Username = Trim(txtUsername.Text)) Or m.IDO = Convert.ToInt32(OrderView.SelectedValue)
            For Each m In qry
                If m.Username = Trim(txtUsername.Text) Then
                    lblSubmitStatus.Text = "این پنل ورود قبلا ثبت شده."
                    Exit Try
                    'ElseIf m.IDO = Convert.ToInt32(OrderView.SelectedValue) Then
                    'lblSubmitStatus.Text = "برای این مشتری قبلا پنل ورود ثبت شده."
                End If
            Next
            Dim q As New Client
            q.Username = txtUsername.Text
            q.Password = txtPassword.Text
            q.IDO = Convert.ToInt32(OrderView.SelectedValue)
            db.Clients.InsertOnSubmit(q)
            db.SubmitChanges()
            ClientView.DataBind()
            lblSubmitStatus.Text = "ثبت شد."
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try

    End Sub
    Protected Sub btnUpdateOrder1_Click(sender As Object, e As EventArgs) Handles btnUpdateOrder1.Click
        btnUpdateOrder_Click(sender, e)

    End Sub
    Protected Sub btnUpdateOrder2_Click(sender As Object, e As EventArgs) Handles btnUpdateOrder2.Click
        btnUpdateOrder_Click(sender, e)
    End Sub
    Protected Sub btnUpdateContra_Click(sender As Object, e As EventArgs) Handles btnUpdateContra.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.Contracts
                      Select m Where m.IDO = Convert.ToInt32(OrderView.SelectedValue)
            For Each q In qry
                q.Contract = txtContra.Content
                q.Title = txtContraName.Text
            Next
            db.SubmitChanges()
            ContractView.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Protected Sub btnCreateContra_Click(sender As Object, e As EventArgs) Handles btnCreateContra.Click
        Try
            Dim db = New LinqDBClassesDataContext
            Dim NewContra As New Contract
            NewContra.Title = txtContraName.Text
            NewContra.IDO = Convert.ToInt32(OrderView.SelectedValue)
            NewContra.Contract = txtContra.Content
            db.Contracts.InsertOnSubmit(NewContra)
            db.SubmitChanges()
            ContractView.DataBind()
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
    Protected Sub ContractView_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ContractView.SelectedIndexChanged
        Dim db = New LinqDBClassesDataContext
        Try
            Dim qry = From m In db.Contracts
                      Select m
                      Where m.IDCon = Convert.ToInt32(ContractView.SelectedValue)
            For Each q In qry
                txtContraName.Text = q.Title
                txtContra.Content = q.Contract
            Next
        Catch ex As Exception
            Response.Write(ex.Message)
        End Try
    End Sub
End Class