<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="AboutManagement.aspx.vb" Inherits="Admin_AboutManagement" %>

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
                    <h1 class="page-header">مدیریت درباره <small>تنظیمات سایت</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-fw fa-wrench"></i>About Management
                        </li>

                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-10">
                    <div class="form-group">
                        <label>درباره مدیر:</label>
                        <telerik:RadEditor ID="txtAboutManager" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                    </div>
                    <div class="form-group">
                        <label>ایمیل:</label>
                        <asp:TextBox runat="server" ID="txtContact" placeholder="ایمیل جداکننده با کاراکتر ; امکان پپذیر است" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>برچسب:</label>
                        <asp:TextBox runat="server" ID="txtManagerKeyword" placeholder="برچسب درباره مدیر" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>تصویر مدیر:</label>
                        <asp:TextBox runat="server" ID="txtImageManager" placeholder="آدرس تصویر مدیر" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>درباره سایت:</label>

                        <telerik:RadEditor ID="txtSiteAbout" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                    </div>
                    <div class="form-group">
                        <label>برچسب:</label>
                        <asp:TextBox runat="server" ID="txtSiteKeyword" placeholder="برچسب درباره سایت:" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label>بیوگرافی:</label>
                        <telerik:RadEditor ID="txtBiography" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                    </div>
                    <div class="form-group">
                        <label>تصویر بیوگرافی:</label>
                        <asp:TextBox runat="server" ID="txtImageBiography" placeholder="آدرس تصویر بیوگرافی" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>برچسب:</label>
                        <asp:TextBox runat="server" ID="txtBiographyKeyword" placeholder="برچسب بیوگرافی" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>متن صفحه:</label>
                        <telerik:RadEditor ID="txtBodyContact" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                    </div>
                    <div class="form-group">
                        <label>تلفن همراه:</label>
                        <asp:TextBox runat="server" ID="txtMobile" placeholder="شماره تلفن همراه" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>آدرس:</label>
                        <telerik:RadEditor ID="txtAddress" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                    </div>
                    <div class="form-group">
                        <label>تلفن:</label>
                        <asp:TextBox runat="server" ID="txtTelephon" placeholder="شماره تلفن ثابت" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>ساعات کاری:</label>
                        <telerik:RadEditor ID="txtWorkingHours" runat="server" Width="100%" Skin="Bootstrap"></telerik:RadEditor>
                    </div>
                    <hr />
                    <h3>درصورت وجود نداشتن Null وارد نمایید.</h3>
                    <div class="form-group">
                        <label>تلگرام:</label>
                        <asp:TextBox runat="server" ID="txtTelegram" placeholder="لینک حساب تلگرام" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>گوگل پلاس:</label>
                        <asp:TextBox runat="server" ID="txtGooglePlus" placeholder="لینک حساب گوگل پلاس" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>لینکداین:</label>
                        <asp:TextBox runat="server" ID="txtLinkedin" placeholder="لینک حساب لینکداین" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>تویتر:</label>
                        <asp:TextBox runat="server" ID="txtTwitter" placeholder="لینک حساب تویتر" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label>اینستاگرام:</label>
                        <asp:TextBox runat="server" ID="txtInstagram" placeholder="لینک صفحه اینستاگرام" class="form-control" />
                    </div>

                    <div class="form-group">
                        <label>فیسبوک:</label>
                        <asp:TextBox runat="server" ID="txtFacebook" placeholder="لینک صفحه فیسبوک" class="form-control" />
                    </div>
                    <br />
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <asp:Button ID="btnUpdateAbout" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-primary" Text="ذخیره تغییرات" />

                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</asp:Content>