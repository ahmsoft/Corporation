<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="OnlineUsersManagement.aspx.vb" Inherits="Admin_OnlineUsersManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
         
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">بازدیدکنندگان <small>مشخصات کاربران</small></h1>

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
            <div class="box-header clearfix">
              <asp:Button runat="server" ID="btnClear" class="btn btn-sm btn-default btn-flat pull-right" text="حذف همه" />
            </div>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <asp:GridView ID="OnlineView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="SqlDataSourceUsersOnlineDetails" Width="100%" DataKeyNames="IDOnline">
                        <Columns>
                            <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                            </asp:CommandField>
                            <asp:BoundField DataField="DateAndTime" HeaderText="زمان" SortExpression="DateAndTime" />
                            <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True">
                                <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" HorizontalAlign="Center" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceUsersOnlineDetails" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [UsersOnlineDetails] ORDER BY [IDOnline] DESC" DeleteCommand="DELETE From [UsersOnlineDetails] Where [IDOnline]=@IDOnline">
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="100%" AutoGenerateRows="False" DataKeyNames="IDOnline" DataSourceID="SqlDataSource1" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="IDOnline" HeaderText="IDOnline" InsertVisible="False" ReadOnly="True" SortExpression="IDOnline" />
                    <asp:BoundField DataField="MachinName" HeaderText="MachinName" SortExpression="MachinName" />
                    <asp:BoundField DataField="IPAddress" HeaderText="IPAddress" SortExpression="IPAddress" />
                    <asp:BoundField DataField="Browser" HeaderText="Browser" SortExpression="Browser" />
                    <asp:BoundField DataField="Platform" HeaderText="Platform" SortExpression="Platform" />
                    <asp:BoundField DataField="DateAndTime" HeaderText="DateAndTime" SortExpression="DateAndTime" />
                    <asp:BoundField DataField="Page" HeaderText="Page" SortExpression="Page" />
                </Fields>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [UsersOnlineDetails] WHERE ([IDOnline] = @IDOnline)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="OnlineView" Name="IDOnline" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <!-- /.container-fluid -->
    </div>

</asp:Content>

