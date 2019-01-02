<%@ Page Title="" Language="VB" MasterPageFile="~/MainFrame.master" AutoEventWireup="false" CodeFile="FAQView.aspx.vb" Inherits="FAQView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<meta name="author" content="شرکت نارم" />
    <meta name="DC.subject" content="خدمات حسابداری و کامپیوتر و هوش مصنوعی , طراحی سایت , بهینه سازی سایت , طراحی وب , طراحی وب سایت , طراحی فروشگاه اینترنتی" />
    <meta name="description" content="سوالات متداولی که توسط بازدید کنندگان در سایت ما ثبت شده و توسط مدیر سایت به آن‌ها پاسخ داده شده است" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>

        <asp:LinqDataSource ID="DataSourceFAQ" runat="server" ContextTypeName="LinqDBClassesDataContext" EntityTypeName="" TableName="FAQs" Where="IsShow == @IsShow" OrderBy="IDF desc">
            <WhereParameters>
                <asp:Parameter DefaultValue="True" Name="IsShow" Type="Boolean" />
            </WhereParameters>
        </asp:LinqDataSource>
        <div class="wp-pagenavi">
        <asp:ListView ID="ListViewFAQ" runat="server" DataKeyNames="IDF" DataSourceID="DataSourceFAQ">
            <AlternatingItemTemplate>
                <div class='posttitle'>
                    <h4><a href='PostView/FAQ/<%# Eval("Question").ToString.Replace(" ", "-") %>'><%# Eval("Question") %></a></h4>
                </div>
                <p><%# Eval("Answer") %></p>
                زمان:
                <asp:Label ID="MomentLabel" runat="server" Text='<%# Eval("Moment") %>' /><hr />
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="">IDF:
                <asp:Label ID="IDFLabel1" runat="server" Text='<%# Eval("IDF") %>' />
                    <br />
                    Question:
                <asp:TextBox ID="QuestionTextBox" runat="server" Text='<%# Bind("Question") %>' />
                    <br />
                    Answer:
                <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' />
                    <br />
                    <asp:CheckBox ID="IsShowCheckBox" runat="server" Checked='<%# Bind("IsShow") %>' Text="IsShow" />
                    <br />
                    Moment:
                <asp:TextBox ID="MomentTextBox" runat="server" Text='<%# Bind("Moment") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">Question:
                <asp:TextBox ID="QuestionTextBox" runat="server" Text='<%# Bind("Question") %>' />
                    <br />
                    Answer:
                <asp:TextBox ID="AnswerTextBox" runat="server" Text='<%# Bind("Answer") %>' />
                    <br />
                    <asp:CheckBox ID="IsShowCheckBox" runat="server" Checked='<%# Bind("IsShow") %>' Text="IsShow" />
                    <br />
                    Moment:
                <asp:TextBox ID="MomentTextBox" runat="server" Text='<%# Bind("Moment") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                    <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <div class='posttitle'>
                    <h4><a href='PostView/FAQ/<%# Eval("Question").ToString.Replace(" ", "-") %>'><%# Eval("Question") %></a></h4>
                </div>
                <p><%# Eval("Answer") %></p>
                زمان:
                <asp:Label ID="MomentLabel" runat="server" Text='<%# Eval("Moment") %>' /><hr />
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <div class='posttitle'>
                    <h4><a href='PostView/FAQ/<%# Eval("Question").ToString.Replace(" ", "-") %>'><%# Eval("Question") %></a></h4>
                </div>
                <p><%# Eval("Answer") %></p>
                زمان:
                <asp:Label ID="MomentLabel" runat="server" Text='<%# Eval("Moment") %>' /><hr />
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:DataPager ID="DataPager" runat="server" PagedControlID="ListViewFAQ" QueryStringField="PageID" PageSize="2">
            <Fields>
                <asp:NumericPagerField CurrentPageLabelCssClass="current" />
            </Fields>
        </asp:DataPager>

    </div>
    <section>
        <table style="width: 100%;">
            <tr>
                <th>
                    <asp:Label runat="server" ID="lblSubmitStatus" Text="پرسش شما پس از پاسخ و تایید مدیر ثبت خواهد شد" /></th>
            </tr>
            <tr>
                <td>
                    <label for="txtQuestion" id="Question_label">سوال جدید :</label>
                            <asp:TextBox runat="server" type="text" name="name" ID="txtQuestion" required="required" value="" Style="height: 8px; width: 100%;" class="text-input" />
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadCaptcha ID="RadCaptcha" runat="server" CaptchaTextBoxCssClass="aligncenter" CaptchaImage-ImageCssClass="aligncenter " CaptchaTextBoxLabel=""></telerik:RadCaptcha>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button runat="server" type="submit" Style="width: 100%;" name="submit" class="button aligncenter" ID="btnSubmit" Text="ارسال" />
                </td>
            </tr>
        </table>




        <!-- end contactform -->
        <br />

    </section>
</asp:Content>

