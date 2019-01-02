<%@ Page Title="" Language="VB" MasterPageFile="~/MainFrame.master" AutoEventWireup="false" CodeFile="SearchResult.aspx.vb" Inherits="SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<meta name="author" content="شرکت نارم" />
<meta name="DC.subject" content="خدمات حسابداری و کامپیوتر و هوش مصنوعی , طراحی سایت , بهینه سازی سایت , طراحی وب , طراحی وب سایت , طراحی فروشگاه اینترنتی" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                        <div class="container">
                        <div class="row">
                            <section id="maincontent" class="twelve columns positionleft ">
                                <div class="padcontent">
                                    
                                    <asp:PlaceHolder ID="PostsPlaceHolder" runat="server"></asp:PlaceHolder>
                                    <asp:PlaceHolder ID="NewsPlaceHolder" runat="server"></asp:PlaceHolder>
                                    <asp:PlaceHolder ID="PagePlaceHolder" runat="server"></asp:PlaceHolder>
                                </div>
                            </section>


                        </div>
                    </div>

</asp:Content>

