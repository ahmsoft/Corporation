<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="LinkManagement.aspx.vb" Inherits="Admin_LinkManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">مدیریت لینک‌ها <small>مدیریت لینک‌های بلاک</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-list"></i>Link Management
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="form-group">
                    <label>Block:</label>
                    <asp:DropDownList runat="server" ID="drpBlock" placeholder="انتخاب بلاک" class="form-control" DataSourceID="SqlDataSourceBlock" DataTextField="Name" DataValueField="IDB" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceBlock" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT [IDB], [Name] FROM [Block] ORDER BY [IDB], [Name]"></asp:SqlDataSource>
                    <br />
                    <p class="help-block">مدیریت لینک‌ها از .</p>

                </div>
                <div class="col-lg-12 col-md-12">
                    <asp:GridView ID="LinkView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceLink" Width="100%" DataKeyNames="IDL">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
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
                    <asp:SqlDataSource ID="SqlDataSourceLink" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Link] WHERE [IDB]=@IDB ORDER BY [IDB], [IDL], [Name]" DeleteCommand="Delete From [Link] Where [IDL]=@IDL">
                        <DeleteParameters>
                            <asp:Parameter Name="IDL" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drpBlock" Name="IDB" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>نام:</label>
                        <asp:TextBox runat="server" ID="txtLinkName" placeholder="نام پیوند" class="form-control" />
                    </div>

                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>آدرس:</label>
                        <asp:TextBox runat="server" ID="txtLinkAddress" placeholder="آدرس پیوند" class="form-control" />
                    </div>

                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>توضیح:</label>
                        <asp:TextBox runat="server" ID="txtLinkAlt" placeholder="توضیح کوتاه" class="form-control" />
                    </div>
                    <div class="col-md-12 center-block">
                        <asp:TextBox runat="server" ID="txtPeriority" placeholder="اولویت" type="number" />
                    </div>
                </div>
                <div class="form-group col-lg-6">
                    <label>مقصد:</label>
                    <asp:DropDownList runat="server" ID="drpLinkTarget" placeholder="انتخاب مقصد" class="form-control">
                        <asp:ListItem Value="_blank">پنجره جدید</asp:ListItem>
                        <asp:ListItem Value="_self">پنجره جاری</asp:ListItem>
                        <asp:ListItem Value="_parent">صفحه اصلی</asp:ListItem>
                        <asp:ListItem Value="_top">صفحه جاری</asp:ListItem>
                    </asp:DropDownList>
                    
                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <asp:Button ID="btnUpdateLink" runat="server" class="col-xs-6 btn btn-default" Text="ذخیره تغییرات" />
                        <asp:Button ID="btnSaveNewLink" runat="server" class="col-xs-6 btn btn-primary" Text="ایجاد لینک جدید" />
                    </div>

                </div>

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>
</asp:Content>

