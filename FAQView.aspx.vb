
Partial Class FAQView
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Page.Title = "سوالات متداول - شرکت طراحی سایت آریا سافت AriyaSoft.com - FAQ"

        Try
            Dim lblActive As System.Web.UI.HtmlControls.HtmlGenericControl = (Master.FindControl("menuLIPost"))
            lblActive.Attributes("Class") = "current space"
            Dim lblState As Label = Master.FindControl("StatusPage")
            lblState.Text = "سوالات متداول - شرکت طراحی سایت آریا سافت AriyaSoft.com - FAQ"
            Dim db = New LinqDBClassesDataContext
            Dim qry = From m In db.FAQs
                      Select m Order By m.IDF
            For Each q In qry
                For Each i In q.Keyword.ToString.Split(";")
                    Page.MetaKeywords += i.ToString + ","
                Next
            Next
        Catch ex As Exception
            Dim db = New LinqDBClassesDataContext
            Dim UserTable As New FaultLog
            UserTable.PageName = System.IO.Path.GetFileName(Request.CurrentExecutionFilePath)
            UserTable.ErrorMessage = ex.Message
            db.FaultLogs.InsertOnSubmit(UserTable)
            db.SubmitChanges()
            Response.Redirect(Server.MapPath("ErrorPage.aspx") + "/ErrorPage.aspx")
        End Try
        Dim mystring As String
        mystring = System.Web.HttpContext.Current.Request.Browser.Type
        If mystring.Contains("IE") Then
        End If
    End Sub
    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        If RadCaptcha.IsValid = True Then

            Try
                Dim db = New LinqDBClassesDataContext
                Dim qry = From m In db.FAQs
                          Select m Where m.Question = Trim(txtQuestion.Text)
                For Each m In qry
                    If m.Question = txtQuestion.Text Then
                        lblSubmitStatus.Text = "این سوال قبلا ارسال شده."
                        Exit Try
                    End If
                Next

                Dim q = New FAQ
                q.Question = txtQuestion.Text
                q.Moment = "زمان ثبت نشده"
                q.IsShow = False
                q.Answer = "پاسخ داده نشده"
                q.Keyword = "ثبت نشده"
                q.Seen = "New"
                db.FAQs.InsertOnSubmit(q)
                db.SubmitChanges()
                lblSubmitStatus.Style.Value = "color:Cyan;"
                lblSubmitStatus.Text = "پرسش شما با موفقیت ارسال شد. لطفا منتظر تایید مدیر باشید."
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
