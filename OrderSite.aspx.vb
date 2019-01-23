Imports System.Net
Imports System.Net.NetworkInformation
Partial Class OrderSite
    Inherits System.Web.UI.Page
    'Public Function GetMachinName() As String
    '    Dim strHostName As String = Dns.GetHostName()
    '    Dim ipEntry As IPHostEntry = Dns.GetHostEntry(strHostName)
    '    GetMachinName = Convert.ToString(ipEntry.HostName)
    'End Function
    'Public Function GetUser_IP() As String
    '    Dim VisitorsIPAddr As String = String.Empty
    '    If (HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR") <> "") Then
    '        VisitorsIPAddr = HttpContext.Current.Request.ServerVariables("HTTP_X_FORWARDED_FOR").ToString()
    '    ElseIf (HttpContext.Current.Request.UserHostAddress.Length <> 0) Then
    '        VisitorsIPAddr = HttpContext.Current.Request.UserHostAddress
    '    End If
    '    GetUser_IP = VisitorsIPAddr

    'End Function
    'Public Function GetMACAddress() As String
    '    Dim nics As NetworkInterface() = NetworkInterface.GetAllNetworkInterfaces()
    '    Dim sMacAddress As String = String.Empty
    '    Dim Adapter As NetworkInterface
    '    For Each Adapter In nics

    '        If sMacAddress = String.Empty Then ' only Then Return MAC Address From first card  

    '            Dim properties As IPInterfaceProperties = Adapter.GetIPProperties()
    '            sMacAddress = Adapter.GetPhysicalAddress().ToString()
    '        End If
    '    Next
    '    GetMACAddress = sMacAddress
    'End Function
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim db = New LinqDBClassesDataContext
        If RadCaptcha.IsValid = True Then
            Try
                Dim qry = From m In db.Orders
                          Select m Where (m.SiteNameEn = Trim(txtNameEn.Text)) And (m.SiteNameFA = Trim(txtNameFa.Text))
                For Each m In qry
                    If m.SiteNameFA = (txtNameFa.Text) And (m.Mobile = txtMobile.Text) Then
                        lblSubmitStatus.Text = "این سفارش قبلا توسط شما ارسال شده."
                        Exit Try
                    End If
                Next
                Dim q As New Order
                q.NewDesign = rdoNewDesign.SelectedIndex
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
                q.ActiveForClient = False
                db.Orders.InsertOnSubmit(q)
                db.SubmitChanges()
                lblSubmitStatus.Style.Value = "color:green;"
                lblSubmitStatus.Text = "سفارش شما با موفقیت ارسال شد. لطفا منتظر تماس کارشناس شرکت باشید."
            Catch ex As Exception
                Response.Write(ex.Message)
                lblSubmitStatus.Style.Value = "color:Orange;"
                lblSubmitStatus.Text = "ارسال نا موفق - خطا سرور."
            End Try
        Else
            lblSubmitStatus.Style.Value = "color:red;"
            lblSubmitStatus.Text = "کد امنیتی اشتباه وارد شد."

        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.MetaKeywords = "سفارش , وب سایت , NAREM.IR , ثبت سفارش , درخواست پروژه , نارم , ثبت سفارش محصول , خدمات"
        Page.MetaDescription = "فرم ارسال درخواست سفارش طراحی وب سایت یا بهینه سازی وب سایت."
        'Try
        '    Dim browser As HttpBrowserCapabilities = Request.Browser
        '    Dim db = New LinqDBClassesDataContext
        '    Dim q = New UsersOnlineDetail
        '    q.Browser = browser.Browser
        '    q.Platform = browser.Platform
        '    q.DateAndTime = Now.ToLocalTime
        '    q.IPAddress = GetUser_IP()
        '    q.MachinName = GetMACAddress()
        '    q.Page = Request.CurrentExecutionFilePath
        '    db.UsersOnlineDetails.InsertOnSubmit(q)
        '    db.SubmitChanges()
        'Catch ex As Exception
        '    Response.Write(ex.Message)
        '    Dim db = New LinqDBClassesDataContext
        '    Dim UserTable As New FaultLog
        '    UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
        '    UserTable.ErrorMessage = ex.Message
        '    db.FaultLogs.InsertOnSubmit(UserTable)
        '    db.SubmitChanges()
        'End Try
    End Sub
End Class
