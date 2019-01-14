﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OrderSite.aspx.vb" Inherits="OrderSite" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="شرکت نارم" />
    <meta name="DC.subject" content="خدمات حسابداری و کامپیوتر و هوش مصنوعی , طراحی سایت , بهینه سازی سایت , طراحی وب , طراحی وب سایت , طراحی فروشگاه اینترنتی" />
    <title>فرم ثبت سفارش مشتری | شرکت نارم</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/AdminComponents/dist/css/bootstrap-theme.css">
    <!-- Bootstrap rtl -->
    <link rel="stylesheet" href="/AdminComponents/dist/css/rtl.css">
    <!-- babakhani datepicker -->
    <link rel="stylesheet" href="/AdminComponents/dist/css/persian-datepicker-0.4.5.min.css" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/AdminComponents/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/AdminComponents/bower_components/Ionicons/css/ionicons.min.css">
    <!-- daterange picker -->
    <link rel="stylesheet" href="/AdminComponents/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="/AdminComponents/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="/AdminComponents/plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="/AdminComponents/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="/AdminComponents/plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/AdminComponents/bower_components/select2/dist/css/select2.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/AdminComponents/dist/css/AdminLTE.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/AdminComponents/dist/css/skins/_all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <form runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
            <Scripts>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js"></asp:ScriptReference>
                <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js"></asp:ScriptReference>
            </Scripts>
        </telerik:RadScriptManager>
        <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        </telerik:RadAjaxManager>
        <div class="">

            <header class="main-header">
                <!-- Logo -->
                <a href="Home" class="logo">
                    <!-- mini logo for sidebar mini 50x50 pixels -->
                    <!-- logo for regular state and mobile devices -->
                    <span class="logo-lg"><b>شرکت نارم</b><img src="/Lamonte/images/logominiT.png" style="width: 100px;" /></span>
                </a>
                <!-- Header Navbar: style can be found in header.less -->
                <nav class="navbar navbar-static-top">
                    <!-- Sidebar toggle button-->

                    <!-- Delete This after download -->
                    <!-- End Delete-->



                    <div class="navbar-custom-menu">
                        <ul class="nav navbar-nav">
                            <!-- Messages: style can be found in dropdown.less-->
                            <li class="dropdown messages-menu">
                                <a href="Posts" class="dropdown-toggle" data-toggle="">
                                    <i class="">مطالب سایت</i>
                                </a>
                            </li>
                            <!-- Notifications: style can be found in dropdown.less -->
                            <li class="dropdown notifications-menu">
                                <a href="News" class="dropdown-toggle" data-toggle="">
                                    <i class="">اخبار</i>
                                </a>

                            </li>
                            <!-- Tasks: style can be found in dropdown.less -->
                            <li class="dropdown tasks-menu">
                                <a href="Contact" class="dropdown-toggle" data-toggle="">
                                    <i class="">تماس با ما</i>
                                </a>

                            </li>
                            <!-- User Account: style can be found in dropdown.less -->

                            <!-- Control Sidebar Toggle Button -->

                        </ul>
                    </div>
                </nav>
            </header>
            <!-- right side column. contains the logo and sidebar -->

            <!-- Content Wrapper. Contains page content -->
            <div class="">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>فرم ثبت سفارش 
        <small>دریافت اطلاعات لازم برای طراحی وب سایت</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Home"><i class="fa fa-desktop"></i>صفحه اصلی </a></li>
                        <li><a href="Posts">مطالب سایت </a></li>
                        <li class="active">ثبت سفارش </li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">

                    <!-- SELECT2 EXAMPLE -->
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">اطلاعات اولیه </h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- /.form-group -->
                                    <br />
                                    <label for="txtNameAndFamily">نام و نام خانوادگی</label><span style="color: red;">*</span>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-address-book"></i>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorNameAndFamily" ControlToValidate="txtNameAndFamily" runat="server" ErrorMessage="وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionNameAndFamily" ControlToValidate="txtNameAndFamily" runat="server" ErrorMessage="فارسی وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[ابپتثجچحخدذرزژئسشصضطظعغفق  کگلمنوهیآیيك\s]+\s*$"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtNameAndFamily" placeholder="به عنوان مثال: امیرحسن مروجی." runat="server" type="Text" required="required" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.form-group -->
                                    <br />
                                    <label for="txtTel">تلفن ثابت</label><span style="color: red;">*</span>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone"></i>
                                        </div>
                                        <asp:TextBox ID="txtTel" placeholder="به عنوان مثال: 05135026982" runat="server" type="text" required="required" class="form-control" data-inputmask='"mask": "09999999999"' data-mask />
                                    </div>
                                    <br />
                                    <!-- /.input group -->
                                    <label for="txtMobile">تلفن همراه</label><span style="color: red;">*</span>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mobile"></i>
                                        </div>
                                        <asp:TextBox ID="txtMobile" placeholder="به عنوان مثال: 09391815029" runat="server" type="text" required="required" class="form-control" data-inputmask='"mask": "09999999999"' data-mask />
                                    </div>
                                    <!-- /.form-group -->

                                </div>
                                <!-- /.col -->


                                <div class="col-md-6">
                                    <br />
                                    <!-- /.input group -->
                                    <label for="txtEmail">پست الکترونیک</label><span style="color: red;">*</span>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-at"></i>
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="نادرست" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[\w-\.]{1,}\@([\da-zA-Z-]{1,}\.){1,}[\da-zA-Z-]{2,6}$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="وارد شود" ValidationGroup="contact" Style="color: white; margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txtEmail" placeholder="به عنوان مثال: ah.moravveji.edu@gmail.com" runat="server" type="Email" required="required" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.form-group -->
                                    <br />
                                    <label for="txtJob">زمینه فعالیت</label><span style="color: red;">*</span>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-cc-jcb"></i>
                                        </div>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtJob" runat="server" ErrorMessage="وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtJob" runat="server" ErrorMessage="فارسی وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[ابپتثجچحخدذرزژئسشصضطظعغفق  کگلمنوهیآیيك\s]+\s*$"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtJob" placeholder="به عنوان مثال: تولیدی کفش." runat="server" type="text" required="required" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.form-group -->
                                    <br />
                                    <label for="txtAddress">آدرس</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-location-arrow"></i>
                                        </div>
                                        <asp:TextBox ID="txtAddress" placeholder="به عنوان مثال: مشهد - خیابان صیاد شیرازی - صیاد شیرازی 18 - پلاک 32 واحد 3." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.col -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <span>از طریق این اطلاعات ما با شما تماس خواهیم گرفت  </span>
                        </div>
                    </div>
                    <!-- /.box -->
                    <div class="box box-success ">
                        <div class="box-header with-border">
                            <h3 class="box-title">اطلاعات تکمیلی </h3>

                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <!-- /.form-group -->
                                    <br />
                                    <div class="form-group">
                                        <label for="rdoNewDesign">
                                            آیا این اولین وب سایت شما است یا قصد طراحی مجدد وب سایت فعلی خود را دارید؟
                                        </label>
                                        <select id="rdoNewDesign" runat="server" class="form-control select2 text-center" style="width: 100%;">
                                            <option selected="selected">طراحی جدید</option>
                                            <option>طراحی مجدد</option>
                                        </select>
                                    </div>
                                    <label for="txtNameFa">نام سایت به فارسی</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-flag-checkered"></i>
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="txtNameFa" runat="server" ErrorMessage="فارسی وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[ابپتثجچحخدذرزژئسشصضطظعغفق  کگلمنوهیآیيك1234567890\s]+\s*$"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtNameFa" placeholder="به عنوان مثال: نارم." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <br />
                                    <label for="txtNameEn">نام سایت به انگلیسی:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-flag-checkered"></i>
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ControlToValidate="txtNameEn" runat="server" ErrorMessage="لاتین وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1234567890\s]+\s*$"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtNameEn" placeholder="به عنوان مثال: NAREM." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <br />
                                    <label for="txtSubject">موضوع سایت:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-comments-o"></i>
                                        </div>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ControlToValidate="txtSubject" runat="server" ErrorMessage="فارسی وارد شود" ValidationGroup="contact" Style="margin-bottom: auto; font-size: 14px; border-radius: 4px 4px 0px 0px; padding: 2px 2px 5px 5px;" CssClass="label-danger" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\s*[ابپتثجچحخدذرزژئسشصضطظعغفق  کگلمنوهیآیيك1234567890\s]+\s*$"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtSubject" placeholder="به عنوان مثال: طراحی سایت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <br />
                                    <!-- /.input group -->
                                    <label for="txtCustomers">کدام گروه از اقشار جامعه منتظر بازدید از وب سایت شما هستند؟</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-users"></i>
                                        </div>
                                        <asp:TextBox ID="txtCustomers" placeholder="به عنوان مثال: شاغلین، جوانان، متخصصین، دانشجویان، تحصیل کرده، عموم مردم، افراد خاص." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.form-group -->
                                    <br />
                                    <!-- /.input group -->
                                    <label for="txtCompetition">دو یا چند نمونه از رقبای کاری خود را نام ببرید:</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-opencart"></i>
                                        </div>
                                        <asp:TextBox ID="txtCompetition" placeholder="به عنوان مثال: نام برند یا آدرس وب سایت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <br />
                                    <!-- /.form-group -->
                                    <label for="txtService">چه خدماتی قرار است در اختیار مشتریان شما قرار بگیرد؟</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-server"></i>
                                        </div>
                                        <asp:TextBox ID="txtService" placeholder="به عنوان مثال: پردازش سفارشات مشتری." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.form-group -->
                                    <!-- /.form-group -->
                                    <br />
                                    <label for="txtRequirements">دلایل نیاز شما به یک وب سایت چیست؟</label>
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-cab"></i>
                                        </div>
                                        <asp:TextBox ID="txtRequirements" placeholder="به عنوان مثال: معرفی کسب و کار و افزایش فروش ازطریق سفارشات آنلاین." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                    </div>
                                    <!-- /.input group -->
                                </div>
                                <!-- /.col -->


                                <div class="col-md-6">
                                    <br />
                                    <div class="form-group">
                                        <label for="txtSuggestedCost">زمان تحویل گرفتن وب سایت و هزینه پیشنهادی خود را مشخص نمایید:</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-clock-o"></i>
                                            </div>
                                            <asp:TextBox runat="server" type="text" ID="tarikh" class="form-control pull-right" />
                                            <asp:TextBox runat="server" type="text" ID="txtSuggestedCost" placeholder="هزینه پیشنهادی شما" class="form-control pull-right" data-inputmask='"mask": "تومان 999999999999"' data-mask />
                                        </div>
                                        <!-- /.input group -->
                                        <!-- /.form-group -->
                                        <br />
                                        <label for="txtSampleSite">چند وب سایت که از نظر گرافیک و محتوایی می پسندید:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-sitemap"></i>
                                            </div>
                                            <asp:TextBox ID="txtSampleSite" placeholder="به عنوان مثال: وب سایت شرکت طراحی سایت کاسپید wwww.Kaspid.com" Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                        </div>
                                        <!-- /.input group -->

                                        <!-- /.form-group -->
                                        <br />
                                        <label for="txtPurposeExistingSite">چه انتظاراتی از داشتن وب سایت دارید؟</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-eye"></i>
                                            </div>
                                            <asp:TextBox ID="txtPurposeExistingSite" placeholder="به عنوان مثال: نمایش دادن محصولات و نمونه کارهای کسب و کار." Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                        </div>
                                        <!-- /.form-group -->
                                        <br />
                                        <label for="txtPossibilities">چه امکاناتی برای وب سایت خود در نظر گرفته اید؟</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-coffee"></i>
                                            </div>
                                            <asp:TextBox ID="txtPossibilities" placeholder="به عنوان مثال: نمایش محصولات، خرید آنلاین، مدیریت محتوا، گالری تصاویر. " Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                        </div>
                                        <!-- /.input group -->
                                        <!-- /.form-group -->
                                        <br />
                                        <label for="txtStyle">کمی در مورد رنگ و گرافیک دلخواه خود توضیح دهید:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-th-large"></i>
                                            </div>
                                            <asp:TextBox ID="txtStyle" placeholder="به عنوان مثال: رنگ پس زمینه سفید و رنگ قالب سبز." Style="z-index: 0;" runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                        </div>
                                        <!-- /.input group -->
                                        <!-- /.form-group -->
                                        <br />
                                        <label for="txtAdvice">هر ایده و طرحی (واقعی یا تخیلی) در ذهن خود دارید در این قسمت وارد کنید. حتما نظر شما در حد توان عملی خواهد شد.</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-commenting"></i>
                                            </div>
                                            <asp:TextBox ID="txtAdvice" placeholder="به عنوان مثال: افزایش بازدید از وب سایت." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                        </div>
                                        <!-- /.input group -->
                                        <!-- /.form-group -->
                                        <br />
                                        <label for="txtDescription">توضیحات:</label>
                                        <div class="input-group">
                                            <div class="input-group-addon">
                                                <i class="fa fa-pencil-square-o"></i>
                                            </div>
                                            <asp:TextBox ID="txtDescription" placeholder="به عنوان مثال: حرف‌های نا گفته." runat="server" type="text" class="form-control" data-inputmask='"mask": ""' data-mask />
                                        </div>
                                        <!-- /.input group -->

                                    </div>
                                    <!-- /.col -->

                                </div>
                                <!-- /.row -->
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <span>با ورود این اطلاعات و ارسال آن ما را در طراحی آنچه می‌خواهید کمک کنید </span>
                            </div>
                        </div>

                    </div>
                </section>
                <table style="width: 100%;">
                    <tr>
                        <th class="ali">
                            <center><asp:Label runat="server" ID="lblSubmitStatus" Text="پس از ارسال درخواست سفارش منتظر تماس کارشناس شرکت ما باشید. " /></center>
                        </th>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <center><telerik:RadCaptcha ID="RadCaptcha" runat="server" CaptchaTextBoxCssClass="aligncenter" CaptchaImage-ImageCssClass="aligncenter " CaptchaTextBoxLabel=""></telerik:RadCaptcha></center>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button runat="server" type="submit" Style="width: 100%;" name="submit" ID="btnSubmit" Text="ارسال" class="btn btn-block btn-primary" />
                        </td>
                    </tr>
                </table>

            </div>
            <!-- ./wrapper -->
    </form>
    <!-- jQuery 3 -->
    <script src="AdminComponents/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="AdminComponents/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="AdminComponents/bower_components/select2/dist/js/select2.full.min.js"></script>
    <!-- InputMask -->
    <script src="AdminComponents/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="AdminComponents/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="AdminComponents/plugins/input-mask/jquery.inputmask.extensions.js"></script>
    <!-- date-range-picker -->
    <script src="AdminComponents/bower_components/moment/min/moment.min.js"></script>
    <script src="AdminComponents/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- bootstrap datepicker -->
    <script src="AdminComponents/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- bootstrap color picker -->
    <script src="AdminComponents/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
    <!-- bootstrap time picker -->
    <script src="AdminComponents/plugins/timepicker/bootstrap-timepicker.min.js"></script>
    <!-- SlimScroll -->
    <script src="AdminComponents/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- iCheck 1.0.1 -->
    <script src="AdminComponents/plugins/iCheck/icheck.min.js"></script>
    <!-- FastClick -->
    <script src="AdminComponents/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="AdminComponents/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="AdminComponents/dist/js/demo.js"></script>
    <!-- babakhani datepicker -->
    <script src="AdminComponents/dist/js/persian-date-0.1.8.min.js"></script>
    <script src="AdminComponents/dist/js/persian-datepicker-0.4.5.min.js"></script>
    <!-- Page script -->
    <script>
        $(document).ready(function () {
            $('#tarikh').persianDatepicker({
                altField: '#tarikhAlt',
                altFormat: 'X',
                format: 'D MMMM YYYY HH:mm a',
                observer: true,
                timePicker: {
                    enabled: true
                },
            });
        });
        $(function () {
            //Initialize Select2 Elements
            $('.select2').select2()

            //Datemask dd/mm/yyyy
            $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
            //Datemask2 mm/dd/yyyy
            $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
            //Money Euro
            $('[data-mask]').inputmask()

            //Date range picker
            $('#reservation').daterangepicker()
            //Date range picker with time picker
            $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A' })
            //Date range as a button
            $('#daterange-btn').daterangepicker(
                {
                    ranges: {
                        'Today': [moment(), moment()],
                        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                        'This Month': [moment().startOf('month'), moment().endOf('month')],
                        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    startDate: moment().subtract(29, 'days'),
                    endDate: moment()
                },
                function (start, end) {
                    $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
                }
            )

            //Date picker
            $('#datepicker').datepicker({
                autoclose: true
            })

            //iCheck for checkbox and radio inputs
            $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            })
            //Red color scheme for iCheck
            $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            })
            //Flat red color scheme for iCheck
            $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            })

            //Colorpicker
            $('.my-colorpicker1').colorpicker()
            //color picker with addon
            $('.my-colorpicker2').colorpicker()

            //Timepicker
            $('.timepicker').timepicker({
                showInputs: false
            })
        })
    </script>
    <!---begin Crisp code--->
    <script type="text/javascript">
        window.$crisp = [];
        window.CRISP_WEBSITE_ID = "55e2eb86-5fb2-47b6-84bb-ddce6f1188a6"; (function () { d = document; s = d.createElement("script"); s.src = "https://client.crisp.chat/l.js"; s.async = 1; d.getElementsByTagName("head")[0].appendChild(s); })();
    </script>
    <!---end Crisp code--->
</body>
</html>
