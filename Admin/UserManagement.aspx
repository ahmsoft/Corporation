<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="UserManagement.aspx.vb" Inherits="Admin_UserManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">مدیریت کاربران <small>مدیریت کاربران و مشتریان طرف قرار داد</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-edit"></i>User Management
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <asp:SqlDataSource ID="DataSourceUser" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
                    <div class="text-center">
                        <asp:GridView ID="MessageView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourceUser" Width="100%" DataKeyNames="IDU">
                            <Columns>
                                <asp:CommandField ButtonType="Button" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" InsertText="درج" NewText="جدید" SelectText="جزئیات" ShowSelectButton="True" UpdateText="ذخیره">
                                    <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                </asp:CommandField>
                                <asp:BoundField DataField="Name" HeaderText="نام" SortExpression="Name" />
                                <asp:BoundField DataField="Family" HeaderText="نام خانوادگی" SortExpression="Family" />
                                <asp:CheckBoxField DataField="Active" HeaderText="مشتری" SortExpression="Active" />
                                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" CancelText="انصراف" DeleteText="حذف" EditText="ویرایش" InsertText="درج" NewText="جدید" SelectText="انتخاب" UpdateText="ذخیره">
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
                </div>
            </div>

            <hr />
            <div class="row">
                <div class="form-group col-md-12">
                    <label for="txtMessage" class="col-md-1 control-label" style="width: 100%;">پیام صفحه اصلی:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtMessage" class="form-control" TextMode="MultiLine" placeholder="پیام صفحه اصلی" />
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="txtRequest" class="col-md-1 control-label" style="width: 100%;">درخواست:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtRequest" class="form-control" placeholder="درخواست" />
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtClient" class="col-md-1 control-label" style="width: 100%;">مشتری:</label>
                    <div class="col-md-12">
                        <select id="rdoNewDesign" runat="server" class="form-control select2 text-center" style="width: 100%;">
                            <option selected="selected">مشتری</option>
                            <option>کاربر</option>
                        </select>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="form-group col-md-3">
                    <label for="txtName" class="col-md-1 control-label" style="width: 100%;">نام:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtName" class="form-control" placeholder="نام" />
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="txtFamily" class="col-md-1 control-label" style="width: 100%;">فامیل:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtFamily" class="form-control" placeholder="نام خانوادگی" />
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="txtGender" class="col-md-1 control-label" style="width: 100%;">جنسیت:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtGender" class="form-control" placeholder="جنسیت" />
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="txtBirthday" class="col-md-1 control-label" style="width: 100%;">تاریخ تولد:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtBirthday" class="form-control" placeholder="روز / ماه / سال" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-3">
                    <label for="txtUsername" class="col-md-1 control-label" style="width: 100%;">نام کاربری:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtUsername" class="form-control" placeholder="نام کاربری" />
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="txtPassword" class="col-md-1 control-label" style="width: 100%;">کلمه عبور:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtPassword" class="form-control" placeholder="کلمه عبور" />
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="txtEmail" class="col-md-1 control-label" style="width: 100%;">ایمیل:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtEmail" class="form-control" placeholder="پست الکترونیکی" />
                    </div>
                </div>
                <div class="form-group col-md-3">
                    <label for="txtPhone" class="col-md-1 control-label" style="width: 100%;">تلفن تماس:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtPhone" class="form-control" placeholder="- - - - - - - - - - 0" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="txtAddress" class="col-md-1 control-label" style="width: 100%;">آدرس:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtAddress" class="form-control" placeholder="آدرس" />
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label for="txtPhoto" class="col-md-1 control-label" style="width: 100%;">تصویر:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtPhoto" class="form-control" placeholder="آدرس تصویر" />
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="form-group col-md-2">
                    <label for="txtNo1" class="col-md-1 control-label" style="width: 100%;">No1:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtNo1" class="form-control" placeholder="No1" />
                    </div>
                </div>
                <div class="form-group col-md-2">
                    <label for="txtNo2" class="col-md-1 control-label" style="width: 100%;">No2:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtNo2" class="form-control" placeholder="No2" />
                    </div>
                </div>
                <div class="form-group col-md-2">
                    <label for="txtNo3" class="col-md-1 control-label" style="width: 100%;">No3:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtNo3" class="form-control" placeholder="No3" />
                    </div>
                </div>
                <div class="form-group col-md-2">
                    <label for="txtNo4" class="col-md-1 control-label" style="width: 100%;">No4:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtNo4" class="form-control" placeholder="No4" />
                    </div>
                </div>
                <div class="form-group col-md-2">
                    <label for="txtNo5" class="col-md-1 control-label" style="width: 100%;">No5:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtNo5" class="form-control" placeholder="No5" />
                    </div>
                </div>
                <div class="form-group col-md-2">
                    <label for="txtNo6" class="col-md-1 control-label" style="width: 100%;">No6:</label>
                    <div class="col-md-12">
                        <asp:TextBox runat="server" for="Text" ID="txtNo6" class="form-control" placeholder="No6" />
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
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</asp:Content>

