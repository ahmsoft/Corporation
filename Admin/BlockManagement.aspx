<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="BlockManagement.aspx.vb" Inherits="Admin_BlockManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">مدیریت بلاک <small>بلاک در مطالب سایت</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-bank"></i>Block Management
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <asp:GridView ID="BlockView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceBlock" Width="100%" DataKeyNames="IDB">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText ="انتخاب" ShowSelectButton="True">
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
                    <asp:SqlDataSource ID="SqlDataSourceBlock" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Block] ORDER BY [IDB] DESC, [Name]" DeleteCommand="Delete From [Block] Where [IDB]=@IDB
Delete From [Link] Where [IDB]=@IDB">
                        <DeleteParameters>
                            <asp:Parameter Name="IDB" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>نام:</label>
                        <asp:TextBox runat="server" ID="txtBlockName" placeholder="نام بلاک" class="form-control" />
                    </div>
                </div>
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>جایگاه:</label>
                        <asp:DropDownList runat="server" ID="drpPosition" placeholder="انتخاب جایگاه بلاک" class="form-control">
                            <asp:ListItem Selected="True" Value="Left">چپ</asp:ListItem>
                            <asp:ListItem Value="Right">راست</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                    </div>
                </div>
                <div class="col-md-12 center-block">
                                <asp:TextBox runat="server" ID="txtPeriority" placeholder="اولویت" type="number" />
                            </div>
            <div class="col-lg-12">
                <div class="form-group">
                    <asp:Button ID="btnUpdateBlock" runat="server" class="col-xs-6 btn btn-default" Text="ذخیره تغییرات" />
                    <asp:Button ID="btnSaveNewBlock" runat="server" class="col-xs-6 btn btn-primary" Text="ایجاد بلاک جدید" />
                </div>

            </div>

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>

</asp:Content>

