<%@ Page Title="" Language="VB" MasterPageFile="~/MainFrame.master" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="/StoreComponents/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;" >
        <p class="alert alert-danger" style="text-align:center;">صفحه مورد نظر شما حذف و یا مسیر صفحه در نوار آدرس اشتباه تایپ شده است.<br/>لطفا مجددا تلاش فرمائید و یا از قسمت جستجو سایت، مطلب مورد نظر خود را بیابید. </p>
        <img src="Lamonte/images/404.png" style="margin-top:-38px;" width="150"/><br />
        <input type="button" class="btn btn-success" style="text-align:center;" value="بازگشت به صفحه قبل" onclick="history.go(-1)" />
    </div>
</asp:Content>

