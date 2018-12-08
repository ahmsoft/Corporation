<%@ Page Title="" Language="VB" MasterPageFile="AdminMasterPage.master" AutoEventWireup="false" CodeFile="FAQManagement.aspx.vb" Inherits="FAQManagement1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
                    <h1 class="page-header">F.A.Q مدیریت <small>مدیریت سوالات متداول</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-question-circle"></i>F.A.Q Management
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <asp:SqlDataSource ID="DataSourceFAQ" runat="server" ConnectionString="<%$ ConnectionStrings:AHMDBConnectionString %>" SelectCommand="SELECT * FROM [FAQ]" DeleteCommand="Delete From [FAQ] Where [IDF]=@IDF">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="FAQView" Name="IDF" PropertyName="SelectedValue" />
                        </DeleteParameters>
                    </asp:SqlDataSource>
                    <div class="text-center">
                        <asp:GridView ID="FAQView" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataSourceID="DataSourceFAQ" Width="100%" DataKeyNames="IDF">
                            <Columns>
                                <asp:CommandField ButtonType="Button" SelectText="انتخاب" ShowSelectButton="True">
                                    <ControlStyle CssClass="btn btn-success btn-xs" Width="100%" />
                                </asp:CommandField>
                                <asp:BoundField DataField="Question" HeaderText="پرسش" SortExpression="Question" />
                                <asp:BoundField DataField="Seen" HeaderText="وضعیت" SortExpression="Seen" />
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
                            <label for="contact-Title" class="col-lg-1 control-label">پرسش:</label>
                            <div class="col-lg-11">
                                <asp:TextBox runat="server" for="Text" ID="txtQ" class="form-control" placeholder="پرسش متداول" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-1 center-block">
                                <label for="contact-message" class=" control-label">پاسخ:</label>
                            </div>
                            <div class="col-lg-11 center-block">
                                <telerik:RadEditor ID="txtEditor" Width="100%" runat="server" Skin="Bootstrap" ToolbarMode="Floating"></telerik:RadEditor>

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
                            <div class="col-md-12 center-block">
                                <asp:CheckBox ID="CheckBoxIsShow" Style="margin: 5px;" CssClass="col-xs-12 checkbox" runat="server" Text="پیام نمایش داده شود." Checked="True" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 center-block">
                                <asp:label ID="lblOldMoment" Style="margin: 5px;" CssClass="col-xs-12 label-default" runat="server" Text=" " Checked="True" />
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
                            <div class="col-md-12 center-block">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 btn-group">
                                <asp:Button ID="btnUpdateMessage" runat="server" class="col-xs-6 btn btn-primary" Text="ذخیره تغییرات" />
                                <asp:Button ID="btnSaveNewMessage" runat="server" class="col-xs-6 btn btn-default" Text="ایجاد پرسش و پاسخ جدید" />
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

