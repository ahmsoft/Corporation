<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="ProductManagement.aspx.vb" Inherits="Admin_ProductManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">محصولات فروشگاه <small>مدیریت محصولات</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-fw fa-dashboard"></i>Dashboard
                        </li>
                        <li>
                            <i class="fa fa-fw fa-shopping-cart"></i>Store
                        </li>
                        <li class="active">
                            <i class="fa fa-fw fa-puzzle-piece"></i>Product Management
                        </li>

                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="form-group">
                    <label>گروه محصولات:</label>
                    <asp:DropDownList runat="server" ID="drpCat" placeholder="انتخاب گروه" class="form-control" DataSourceID="SqlDataSourceCat" DataTextField="CatName" DataValueField="IDCat" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCat" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT [IDCat], [CatName] FROM [Category] ORDER BY [IDCat], [CatName]"></asp:SqlDataSource>
                    <br />
                    <p class="help-block">مدیریت محصول از .</p>

                </div>
                <div class="col-lg-12 col-md-12">
                    <asp:GridView ID="ProductView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceProduct" Width="100%" DataKeyNames="IDP">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                            <asp:BoundField DataField="Price" HeaderText="قیمت" SortExpression="Price" />
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
                    <asp:SqlDataSource ID="SqlDataSourceProduct" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE [IDCat]=@IDCat ORDER BY [IDP] DESC, [Name]" DeleteCommand="Delete From [Product] Where [IDP]=@IDP">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="ProductView" Name="IDP" PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drpCat" Name="IDCat" PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>نام:</label>
                        <asp:TextBox runat="server" ID="txtProductName" placeholder="نام محصول" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label>برند:</label>
                        <asp:TextBox runat="server" ID="txtBrand" placeholder="نام برند" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>مدل:</label>
                        <asp:TextBox runat="server" ID="txtModel" placeholder="نام مدل" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>برچسب:</label>
                        <asp:TextBox runat="server" ID="txtKeyword" placeholder="کلمات کلیدی" class="form-control" />
                    </div>
                </div>
                <div class="col-lg-6">

                    <div class="form-group">
                        <label>قیمت:</label>
                        <asp:TextBox runat="server" ID="txtPrice" placeholder="قیمت" class="form-control" />

                    </div>
                    <div class="form-group">
                        <label>توضیحات:</label>
                        <asp:TextBox runat="server" ID="txtDescription" placeholder="توضیحات محصول" class="form-control" />

                    </div>
                    <div class="form-group">
                        <label>امتیاز:</label>
                        <asp:TextBox runat="server" ID="txtRank" placeholder="امتیاز محصول" class="form-control" />

                    </div>
                    <div class="form-group">
                        <label>تصویر:</label>
                        <asp:TextBox runat="server" ID="txtProductPic" placeholder="آدرس تصویر محصول" class="form-control" />
                        <asp:Label runat="server" ID="lblProductPic" />
                    </div>

                </div>
                <div class="col-lg-12">
                    <div class="form-group">
                        <asp:Button ID="btnUpdateProduct" runat="server" class="col-xs-6 btn btn-default" Text="ذخیره تغییرات" />
                        <asp:Button ID="btnSaveNewProduct" runat="server" class="col-xs-6 btn btn-primary" Text="ایجاد محصول جدید" />
                    </div>

                </div>

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->
    </div>
</asp:Content>

