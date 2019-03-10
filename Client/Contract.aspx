<%@ Page Title="" Language="VB" MasterPageFile="~/Client/ClientMasterPage.master" AutoEventWireup="false" CodeFile="Contract.aspx.vb" Inherits="Client_Contract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="box box-primary" runat="server" id="frmClientInfo">
        <div class="box-header with-border">
            <h3 class="box-title">روند پیشرفت پروژه </h3>

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            
                <div class="row">
                    <div class="form-group col-md-12">
                        <label for="txtMessage" class="col-md-1 control-label" style="width: 100%;">عنوان قرارداد:</label>
                        <div class="col-md-12">
                            <asp:Label ID="lblTitle" runat="server" style="border-style:solid;border-color:rgb(88, 180, 88);padding:10px;"  Height="100%" Width="100%" />
                        </div>
                    </div>

                </div>
            <div class="row">
                    <div class="form-group col-md-12">
                        <label for="lblContract" class="col-md-1 control-label" style="width: 100%;">متن کامل قرارداد:</label>
                        <div class="col-md-12">
                            <asp:Label ID="lblContract" runat="server" style="border-style:solid;border-color:rgb(98, 98, 200);padding:10px;"  Height="100%" Width="100%" />
                        </div>
                    </div>

                </div>
            <!-- /.box-body -->
            <div class="box-footer">
                <span>درحال حاضر سیستم پنل مشتری در حال توسعه می‌باشد.  </span>
            </div>
        </div>
    </div>

</asp:Content>

