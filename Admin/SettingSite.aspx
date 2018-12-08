<%@ Page Title="" Language="VB" MasterPageFile="../Admin/AdminMasterPage.master" AutoEventWireup="false" CodeFile="SettingSite.aspx.vb" Inherits="SettingSite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">تنظیمات <small>تنظیمات سایت</small></h1>

                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>Dashboard
                        </li>
                        <li class="active">
                            <i class="fa fa-fw fa-wrench"></i>Basic Setting
                        </li>

                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>نام سایت:</label>
                        <asp:TextBox runat="server" ID="txtSiteName" placeholder="نام سایت" class="form-control" />
                        <p class="help-block">بعنوان مثال AHMSoft.</p>
                    </div>
                    <div class="form-group">
                        <label>عنوان سایت:</label>
                        <asp:TextBox runat="server" ID="txtSiteTitle" placeholder="عنوان سایت" class="form-control" />
                        <p class="help-block">بعنوان مثال شرکت طراحی سایت.</p>
                    </div>

                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <asp:Button ID="btnUpdateMessage" runat="server" class="col-lg-12 col-md-12 col-sm-12 col-xs-12 btn btn-primary" Text="ذخیره تغییرات" />

                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </div>
</asp:Content>

