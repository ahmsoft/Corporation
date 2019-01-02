<%@ Page Language="VB" MasterPageFile="~/MainFrame.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<meta name="author" content="شرکت نارم" />
<meta name="DC.subject" content="خدمات حسابداری و کامپیوتر و هوش مصنوعی , طراحی سایت , بهینه سازی سایت , طراحی وب , طراحی وب سایت , طراحی فروشگاه اینترنتی" />
<meta name="description" content="وبلاگ و مطالب وب سایت شرکت نارم که توسط مدیریت محترم شرکت مهندس امیرحسن مروجی AHMSoft تایید و ثبت شده است." />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:LinqDataSource ID="DataSourcePosts" runat="server" ContextTypeName="LinqDBClassesDataContext" EntityTypeName="" OrderBy="Priority,IDM desc" TableName="Messages" Where="IsShow == @IsShow &amp;&amp; Access == @Access">
        <WhereParameters>
            <asp:Parameter DefaultValue="True" Name="IsShow" Type="Boolean" />
            <asp:Parameter DefaultValue="All" Name="Access" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:ListView ID="ListViewPost" runat="server" DataSourceID="DataSourcePosts" DataKeyNames="IDM">
        <AlternatingItemTemplate>
            <article class='post'>
                <div class='posttitle'>
                    <div class='owner'><%# Eval("Moment") %> نوشته شده توسط <a href='/Biography'>Admin</a></div>
                    <h2><a href='PostView/Default/<%# Eval("Title").ToString.Replace(" ", "-") %>'><%# Eval("Title") %></a></h2>
                    <div class='clear'></div>
                </div>
                <div class=' row'>
                    <div class='postimg four columns'>
                        <img alt='' src='<%# Eval("Pic") %>'>
                    </div>
                    <div class='eight columns'>
                        <div class='entry-content'>
                            <p><%# Eval("MSG") %></p>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <a class='button positionleft' href='PostView/Default/<%# Eval("Title").ToString.Replace(" ", "-") %>'>ادامه مطلب</a>
            </article>
            <hr />
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">IDM:
            <asp:Label ID="IDMLabel1" runat="server" Text='<%# Eval("IDM") %>' />
                <br />
                Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                MSG:
            <asp:TextBox ID="MSGTextBox" runat="server" Text='<%# Bind("MSG") %>' />
                <br />
                Date:
            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Time:
            <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                <br />
                IDC:
            <asp:TextBox ID="IDCTextBox" runat="server" Text='<%# Bind("IDC") %>' />
                <br />
                Rank:
            <asp:TextBox ID="RankTextBox" runat="server" Text='<%# Bind("Rank") %>' />
                <br />
                <asp:CheckBox ID="IsShowCheckBox" runat="server" Checked='<%# Bind("IsShow") %>' Text="IsShow" />
                <br />
                Priority:
            <asp:TextBox ID="PriorityTextBox" runat="server" Text='<%# Bind("Priority") %>' />
                <br />
                Access:
            <asp:TextBox ID="AccessTextBox" runat="server" Text='<%# Bind("Access") %>' />
                <br />
                Keyword:
            <asp:TextBox ID="KeywordTextBox" runat="server" Text='<%# Bind("Keyword") %>' />
                <br />
                Pic:
            <asp:TextBox ID="PicTextBox" runat="server" Text='<%# Bind("Pic") %>' />
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
            <span>درحال حاضر پیامی توسط مدیر ثبت نشده.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">Title:
            <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                MSG:
            <asp:TextBox ID="MSGTextBox" runat="server" Text='<%# Bind("MSG") %>' />
                <br />
                Date:
            <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                <br />
                Time:
            <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                <br />
                IDC:
            <asp:TextBox ID="IDCTextBox" runat="server" Text='<%# Bind("IDC") %>' />
                <br />
                Rank:
            <asp:TextBox ID="RankTextBox" runat="server" Text='<%# Bind("Rank") %>' />
                <br />
                <asp:CheckBox ID="IsShowCheckBox" runat="server" Checked='<%# Bind("IsShow") %>' Text="IsShow" />
                <br />
                Priority:
            <asp:TextBox ID="PriorityTextBox" runat="server" Text='<%# Bind("Priority") %>' />
                <br />
                Access:
            <asp:TextBox ID="AccessTextBox" runat="server" Text='<%# Bind("Access") %>' />
                <br />
                Keyword:
            <asp:TextBox ID="KeywordTextBox" runat="server" Text='<%# Bind("Keyword") %>' />
                <br />
                Pic:
            <asp:TextBox ID="PicTextBox" runat="server" Text='<%# Bind("Pic") %>' />
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
            <article class='post'>
                <div class='posttitle'>
                    <div class='owner'><%# Eval("Moment") %> نوشته شده توسط <a href='/Biography'>Admin</a></div>
                    <h2><a href='PostView/Default/<%# Eval("Title").ToString.Replace(" ", "-") %>'><%# Eval("Title") %></a></h2>
                    <div class='clear'></div>
                </div>
                <div class=' row'>
                    <div class='postimg four columns'>
                        <img alt='' src='<%# Eval("Pic") %>'>
                    </div>
                    <div class='eight columns'>
                        <div class='entry-content'>
                            <p><%# Eval("MSG") %></p>
                        </div>
                    </div>
                </div>
                <br />

                <br />
                <a class='button positionleft' href='PostView/Default/<%# Eval("Title").ToString.Replace(" ", "-") %>'>ادامه مطلب</a>
            </article>
            <hr />
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <article class='post'>
                <div class='posttitle'>
                    <div class='owner'><%# Eval("Moment") %> نوشته شده توسط <a href='/Biography'>Admin</a></div>
                    <h2><a href='PostView/Default/<%# Eval("Title").ToString.Replace(" ", "-") %>'><%# Eval("Title") %></a></h2>
                    <div class='clear'></div>
                </div>
                <div class=' row'>
                    <div class='postimg four columns'>
                        <img alt='' src='<%# Eval("Pic") %>'>
                    </div>
                    <div class='eight columns'>
                        <div class='entry-content'>
                            <p><%# Eval("MSG") %></p>
                        </div>
                    </div>
                </div>
                <br />
                <br />
                <a class='button positionleft' href='PostView/Default/<%# Eval("Title").ToString.Replace(" ", "-") %>'>ادامه مطلب</a>
            </article>
            <hr />
        </SelectedItemTemplate>
    </asp:ListView>

    <div class="wp-pagenavi">
    <asp:DataPager ID="DataPager" runat="server" PagedControlID="ListViewPost" QueryStringField="PageID" PageSize="2">
        <Fields>
            <asp:NumericPagerField CurrentPageLabelCssClass="current" />
        </Fields>
    </asp:DataPager>

    </div>
</asp:Content>