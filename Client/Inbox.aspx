<%@ Page Title="" Language="VB" MasterPageFile="../Client/ClientMasterPage.master" AutoEventWireup="false" CodeFile="Inbox.aspx.vb" Inherits="Inbox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">صندوق دریافت <small>پیام‌های دریافتی</small></h1>

                    <ol class="breadcrumb">
                        <li class="">
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-inbox"></i> Inbox
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <asp:SqlDataSource ID="DataSourceComment" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [Comment] WHERE [IDClient]=@IDClient ORDER BY [IDC] DESC" DeleteCommand="Delete From [Comment] Where [IDC]=@IDC">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="CommentView" Name="IDC" PropertyName="SelectedValue" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="IDClient" SessionField="IDCli" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div class="text-center">
                        <asp:GridView ID="CommentView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourceComment" Width="100%" DataKeyNames="IDC">
                            <Columns>
                                <asp:CommandField ButtonType="Button" SelectText="اتخاب" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                </asp:CommandField>
                                <asp:BoundField DataField="NameAndFamily" HeaderText="نام و نام خانوادگی" SortExpression="NameAndFamily" />
                                <asp:BoundField DataField="Date" HeaderText="تاریخ" SortExpression="Date" />
                                <asp:BoundField DataField="Seen" HeaderText="دیده شده" SortExpression="Seen" />
                                <asp:CommandField ButtonType="Button" DeleteText="حذف" ShowDeleteButton="True">
                                    <ControlStyle CssClass="btn btn-danger btn-xs" Width="100%" />
                                </asp:CommandField>
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="False" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="form-group">
                            <label for="contact-Title" class="col-lg-2 control-label">نام و نام خانوادگی:</label>
                            <div class="col-lg-10">
                                <asp:Label runat="server" for="Text" ID="lblNameAndFamily" Text="---" class="" placeholder="نام و نام خانوادگی" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label for="contact-message" class=" control-label">ایمیل:</label>
                            </div>
                            <div class="col-lg-10 ">
                                <asp:Label runat="server" for="Email" ID="lblEmail" class="" Text="---" placeholder="پست الکترنیکی" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label for="contact-message" class=" control-label">پیام:</label>

                            </div>

                            <div class="col-lg-10 ">
                                <hr />
                                <asp:Label Style="border-color: red;" runat="server" for="Text" ID="lblarea" class="" Text="---" placeholder="پیام" />
                                <hr />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label for="contact-message" class=" control-label">تاریخ:</label>
                            </div>
                            <div class="col-lg-10 ">
                                <asp:Label runat="server" for="Date" ID="lblDate" class="" Text="---" placeholder="تاریخ" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label for="contact-message" class=" control-label">زمان:</label>
                            </div>
                            <div class="col-lg-10 ">
                                <asp:Label runat="server" for="Time" ID="lblTime" Text="---" class="" placeholder="زمان" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label for="contact-message" class=" control-label">وب سایت:</label>
                            </div>
                            <div class="col-lg-10 ">
                                <asp:Label runat="server" for="Website" ID="lblWebsite" Text="---" class="" placeholder="وب سایت" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-2">
                                <label for="contact-message" class=" control-label">وضعیت:</label>
                            </div>
                            <div class="col-lg-10 ">
                                <span class="badge alert-success">
                                    <asp:Label ID="lblStatus" CssClass="col-xs-12 checkbox" runat="server" Text="نامشخص" Checked="True" /></span>
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

