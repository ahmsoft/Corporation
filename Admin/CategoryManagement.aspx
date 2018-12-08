<%@ Page Title="" Language="VB" MasterPageFile="AdminMasterPage.master" AutoEventWireup="false" CodeFile="CategoryManagement.aspx.vb" Inherits="CategoryManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">فروشگاه <small>مدیریت گروه محصولات</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-fw fa-dashboard"></i>Dashboard
                        </li>
                        <li>
                            <i class="fa fa-fw fa-shopping-cart"></i>Store
                        </li>
                        <li class="active">
                            <i class="fa fa-fw fa-database "></i>Category Management
                        </li>

                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <asp:GridView ID="CateView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceCate" Width="100%" DataKeyNames="IDCat">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                            </asp:CommandField>
                            <asp:BoundField DataField="CatName" HeaderText="نام گروه" SortExpression="CatName" />
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
                    <asp:SqlDataSource ID="SqlDataSourceCate" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Category] ORDER BY [IDCat] DESC, [CatName]" DeleteCommand="Delete From [Category] Where [IDCat]=@IDCat
Delete From [Product] Where [IDCat]=@IDCat">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="CateView" Name="IDCat" PropertyName="SelectedValue" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>نام:</label>
                        <asp:TextBox runat="server" ID="txtCateName" placeholder="نام گروه محصولات" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>توضیحات:</label>
                        <asp:TextBox runat="server" ID="txtDescription" placeholder="توضیح محصولات" class="form-control" />
                        <br />
                        <p class="help-block">تصویر مناسب برای گروه محصول جاری</p>

                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>تصویر گروه محصول:</label>
                        <asp:TextBox runat="server" ID="txtCateBanner" placeholder="آدرس تصویر گروه محصول" class="form-control" />
                        <asp:Label runat="server" ID="lblCateBanner" />

                    </div>

                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <asp:Button ID="btnUpdateCate" runat="server" class="col-xs-6 btn btn-default" Text="ذخیره تغییرات" />
                        <asp:Button ID="btnSaveNewCate" runat="server" class="col-xs-6 btn btn-primary" Text="ایجاد گروه جدید" />
                    </div>

                </div>

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>

</asp:Content>

