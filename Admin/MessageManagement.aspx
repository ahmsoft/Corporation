<%@ Page Title="" Language="VB" MasterPageFile="AdminMasterPage.master" AutoEventWireup="false" CodeFile="MessageManagement.aspx.vb" Inherits="MessageManagement1" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">مدیریت پیام <small>پیام های مطالب سایت</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-edit"></i>Message Management
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <asp:SqlDataSource ID="DataSourceMessage" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" InsertCommand="INSERT INTO [Message] ([IDM], [Title], [MSG], [Date], [Time], [IDC], [Rank], [IsShow], [Priority], [Access], [Keyword]) VALUES (@IDM, @Title, @MSG, @Date, @Time, @IDC, @Rank, @IsShow, @Priority, @Access, @Keyword)" SelectCommand="SELECT * FROM [Message]" DeleteCommand="Delete From [Message] Where [IDM]=@IDM">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="MessageView" Name="IDM" PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="IDM" Type="Int32" />
                            <asp:Parameter Name="Title" Type="String" />
                            <asp:Parameter Name="MSG" Type="String" />
                            <asp:Parameter Name="Date" Type="String" />
                            <asp:Parameter Name="Time" Type="String" />
                            <asp:Parameter Name="IDC" Type="Int32" />
                            <asp:Parameter Name="Rank" Type="Int32" />
                            <asp:Parameter Name="IsShow" Type="Boolean" />
                            <asp:Parameter Name="Priority" Type="Int32" />
                            <asp:Parameter Name="Access" Type="String" />
                            <asp:Parameter Name="Keyword" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <div class="text-center">
                        <asp:GridView ID="MessageView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourceMessage" Width="100%" DataKeyNames="IDM">
                            <Columns>
                                <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                </asp:CommandField>
                                <asp:BoundField DataField="Title" HeaderText="عنوان" SortExpression="Title" />
                                <asp:BoundField DataField="Priority" HeaderText="اولویت" SortExpression="Priority" />
                                <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True">
                                    <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="form-group">
                            <label for="txtSubject" class="col-lg-1 control-label">عنوان:</label>
                            <div class="col-lg-11">
                                <asp:TextBox runat="server" for="Text" ID="txtSubject" class="form-control" placeholder="عنوان پیام" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-1 center-block">
                                <label for="txtEditor" class=" control-label">پیام:</label>
                            </div>
                            <div class="col-lg-11 center-block">
                                <telerik:RadEditor ID="txtEditor" runat="server" Skin="Bootstrap" Width="100%" ToolbarMode="Floating"></telerik:RadEditor>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-1 center-block">
                                <label for="txtPicPost" class=" control-label">تصویر پیام:</label>
                            </div>
                            <div class="col-lg-11 center-block">
                                <asp:TextBox runat="server" for="Text" ID="txtPicPost" class="form-control" placeholder="آدرس تصویر پیام" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 center-block">
                                <asp:CheckBox ID="CheckBoxIsShow" Style="margin: 5px;" CssClass="col-xs-12 checkbox" runat="server" Text="پیام نمایش داده شود." Checked="True" />
                            </div>
                            <div class="col-md-12 center-block">
                                <asp:TextBox runat="server" ID="txtPeriority" placeholder="اولویت" type="number" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 center-block">
                                <asp:Label ID="lblOldMoment" Style="margin: 5px;" CssClass="col-xs-12 label-default" runat="server" Text=" " Checked="True" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label for="contact-Title" class="col-lg-1 control-label">زمان ثبت:</label>
                            <div class="col-lg-11">
                                <div class="input-group date">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input runat="server" type="text" id="tarikh" class="form-control pull-right" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="form-group">
                            <label for="contact-Title" class="col-lg-1 control-label">برچسب:</label>
                            <div class="col-lg-11">
                                <asp:TextBox runat="server" for="Text" ID="txtKeyword" class="form-control" placeholder="کلامات کلیدی جدا کننده ; " />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 btn-group">
                                <asp:Button ID="btnUpdateMessage" runat="server" class="col-xs-6 btn btn-default" Text="ذخیره تغییرات" />
                                <asp:Button ID="btnSaveNewMessage" runat="server" class="col-xs-6 btn btn-primary" Text="ایجاد پیام جدید" />
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</asp:Content>

