<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="DynamicPageManagement.aspx.vb" Inherits="Admin_DynamicPageManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js">
            </asp:ScriptReference>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js">
            </asp:ScriptReference>
        </Scripts>
    </telerik:RadScriptManager>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
    </telerik:RadAjaxManager>
    <div id="page-wrapper">

                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">مدیریت صفحه پویا <small>ایجاد و تغییرات</small></h1>

                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>Dashboard
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-newspaper-o"></i>Pages Management
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:SqlDataSource ID="DataSourcePage" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" InsertCommand="INSERT INTO [Page] ([ID], [PageTitle], [Body], [Keyword]) VALUES (@ID, @PageTitle, @Body, @Keyword)" SelectCommand="SELECT * FROM [Page]" DeleteCommand="Delete From [Page] Where [ID]=@ID">
                                    <DeleteParameters>
                                        <asp:ControlParameter ControlID="PageView" Name="ID" PropertyName="SelectedValue" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="ID" Type="Int32" />
                                        <asp:Parameter Name="Title" Type="String" />
                                        <asp:Parameter Name="Body" Type="String" />
                                        <asp:Parameter Name="Keyword" Type="String" />
                                    </InsertParameters>
                                </asp:SqlDataSource>
                                <div class="text-center">
                                    <asp:GridView ID="PageView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourcePage" Width="100%" DataKeyNames="ID">
                                        <Columns>
                                            <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                                <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                            </asp:CommandField>
                                            <asp:BoundField DataField="PageTitle" HeaderText="عنوان" SortExpression="Title" />
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
                                        <label for="contact-Title" class="col-lg-1 control-label">عنوان:</label>
                                        <div class="col-lg-11">
                                            <asp:TextBox runat="server" for="Text" ID="txtSubject" class="form-control" placeholder="عنوان صفحه" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-1 center-block">
                                            <label for="contact-message" class=" control-label">بدنه صفحه:</label>
                                        </div>
                                        <div class="col-lg-11 center-block">
                                      
                                            <telerik:RadEditor ID="txtEditor" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label for="contact-Title" class="col-lg-1 control-label">آدرس:</label>
                                        <div class="col-lg-11">
                                            <asp:TextBox runat="server" for="Text" ID="txtAddress1" class="form-control" placeholder="آدرس صفحه Page" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <label for="contact-Title" class="col-lg-1 control-label">برچسب:</label>
                                        <div class="col-lg-11">
                                            <asp:TextBox runat="server" for="Text" ID="txtKeyword" class="form-control" placeholder="کلمه کلیدی" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 btn-group">
                                            <asp:Button ID="btnUpdatePage" runat="server" class="col-xs-6 btn btn-default" Text="ذخیره تغییرات" />
                                            <asp:Button ID="btnSaveNewPage" runat="server" class="col-xs-6 btn btn-primary" Text="ایجاد صفحه جدید" />
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

