﻿<%@ Page Title="" Language="VB" MasterPageFile="~/MainFrame.master" AutoEventWireup="false" CodeFile="ContactView.aspx.vb" Inherits="ContactView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
<meta name="author" content="شرکت نارم" />
<meta name="DC.subject" content="خدمات حسابداری و کامپیوتر و هوش مصنوعی , طراحی سایت , بهینه سازی سایت , طراحی وب , طراحی وب سایت , طراحی فروشگاه اینترنتی" /></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <!-- MAIN CONTENT -->
    <div class="container">
        <div class="row">
            <section id="maincontent" class="seven columns positionleft ">
                <div class="padcontent">

                    <asp:PlaceHolder ID="BodyContactPlaceHolder" runat="server"></asp:PlaceHolder>

                    <section>
                        <div id="contactform">
                            <fieldset>
                                <label for="txtNameFamili" id="name_label">نام و نام خانوادگی :</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorNameAndFamily" ControlToValidate="txtNameFamili" runat="server" ErrorMessage="نام و نام خانوادگی وارد شود" ValidationGroup="contact" Style="background-color:red;color:white; margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionNameAndFamily" ControlToValidate="txtNameFamili" runat="server" ErrorMessage="فارسی و صحیح وارد شود" ValidationGroup="contact" Style="background-color:red;color:white;margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[ابپتثجچحخدذرزژئسشصضطظعغفق  کگلمنوهیآیيك\s]+\s*$"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" type="text" name="name" ID="txtNameFamili" required="required" value="" Style="height: 8px; width: 100%;" class="text-input" />
                                <label for="txtEmail" id="email_label">ایمیل :</label>
<%--                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="ایمیل وارد نشده" ValidationGroup="contact" Style="background-color:red;color:white;margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>--%>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="ایمیل وارد شود" ValidationGroup="contact" Style="background-color:red;color:white; margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="ایمیل نادرست" ValidationGroup="contact" Style="background-color:red;color:white;margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,6}$"></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" type="email" name="email" class="text-input" ID="txtEmail" required="required" size="50" value="" Style="height: 8px; width: 100%; border: solid 1px #cccfc5; color: #888; background: #e0e2db; box-shadow: 0 0 0 4px #eaede5;" />
                                <label for="txtWebsite" id="name_website">وب سایت :</label>
                                <asp:RegularExpressionValidator ID="RegularExpressionWebsite" ControlToValidate="txtWebsite" runat="server" ErrorMessage="آدرس وبسایت نادرست" ValidationGroup="contact" Style="background-color:red;color:white;margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" Display="Dynamic" SetFocusOnError="true" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ></asp:RegularExpressionValidator>
                                <asp:TextBox runat="server" type="text" name="website" ID="txtWebsite" placeholder="http://www.narem.ir" value="" Style="height: 8px; width: 100%;" class="text-input" />
                                <label for="txtMessage" id="msg_label">پیام :</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorMessage" runat="server" ControlToValidate="txtMessage" ErrorMessage="متن پیام وارد شود" ValidationGroup="contact" Style="background-color:red;color:white;margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 1px 1px;" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:TextBox runat="server" name="msg" ID="txtMessage" Style="width: 100%;" required="required" class="text-input" Rows="4" TextMode="MultiLine" />
                                <br />
                            </fieldset>
                            <br />
                            <table style=" border:hidden;border-radius:8px;">
                                <tr>
                                    <th>
                                        <asp:Label runat="server" ID="lblSubmitStatus" Text="" />
                                    </th>
                                </tr>
                                <tr>
                                    <td style="background-color:rgba(255,255,255,1);">
                                        <telerik:RadCaptcha ID="RadCaptcha1" CaptchaTextBoxCssClass="aligncenter" ValidationGroup="contact" CaptchaImage-ImageCssClass="aligncenter" CaptchaTextBoxLabel="" runat="server"></telerik:RadCaptcha>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="background-color:rgba(0,0,0,0); border:hidden;">
                                        <asp:Button runat="server" style="width:100%;" type="submit" ValidationGroup="contact" name="submit" class="button aligncenter" ID="btnSubmit" Text="ارسال پیام" />
                                    </td>
                                </tr>
                            </table>
                            
                            

                        </div>

                        <!-- end contactform -->

                    </section>

                </div>
            </section>

            <aside class="sidebar five columns">

                <ul>

                    <li class="widget-container">
                        <h2 class="widget-title">ساعات کار
                        </h2>
                        <asp:PlaceHolder ID="WorkingHoursPlaceHolder" runat="server"></asp:PlaceHolder>
                    </li>
                    <li class="widget-container">
                        <h2 class="widget-title">محل ما
                        </h2>
                        <div class="textwidget">
                            <asp:PlaceHolder ID="AddressAndTellPlaceHolder" runat="server"></asp:PlaceHolder>

                        </div>
                    </li>
                    <li class="widget-container">
                        <h2 class="widget-title">شبکه‌های اجتماعی
                        </h2>
                        <ul class="rp-widget">
                            <asp:PlaceHolder ID="SocialNetworkPlaceHolder" runat="server"></asp:PlaceHolder>

                        </ul>
                    </li>
                </ul>

            </aside>

        </div>
    </div>
    <!-- END MAIN CONTENT -->

</asp:Content>