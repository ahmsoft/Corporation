<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head runat="server">
    <meta name="google-site-verification" content="rgsLMXfPMEQsWHxdPujB5o2ftXvgKXGFpRW0jzOuNNs" />
    <style>
        html::-webkit-scrollbar {
            background-color: rgb(50,50,50);
            width: 10px;
        }

        html::-webkit-scrollbar-thumb {
            background-color: #7baa00;
        }

            html::-webkit-scrollbar-thumb:hover {
                background-color: #7b9900;
            }

        html::-o-scrollbar {
            background-color: rgb(50,50,50);
            width: 10px;
        }

        html::-o-scrollbar-thumb {
            background-color: #7baa00;
        }

            html::-o-scrollbar-thumb:hover {
                background-color: #7b9900;
            }
    </style>

    <!-- Basic Page Needs
  ================================================== -->
    <title>نارم | NAREM.IR</title>
<meta charset="utf-8" />
<meta name="title" content="نارم | NAREM.IR">
<meta name="description" content="فعالیت شرکت ما در زمینه‌ی طراحی سیستم‌های حسابداری و توسعه‌ی سیستم‌های نرم افزاری مبتنی بر وب، مناسب با نیاز مشتریان است. تلفن تماس با ما:09391815029">
<meta name="keywords" content="نارم , امیرحسن مروجی , نگار اعتبار رایان مبنا , خدمات حسابداری و کامپیوتر">
<meta name="robots" content="index, follow">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="language" content="English">
<meta name="revisit-after" content="1 days">
<meta name="author" content="امیرحسن مروجی">

    <meta name="DC.subject" content="خدمات حسابداری و کامپیوتر , طراحی سایت , بهینه سازی سایت , طراحی وب , طراحی وب سایت , طراحی فروشگاه اینترنتی" />

    <!-- Mobile Specific Metas
  ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />


    <!-- CSS
  ================================================== -->
    <link rel="stylesheet" href="/Lamonte/styles/style.css" />
    <link rel="stylesheet" href="/Lamonte/styles/inner.css" />
    <link rel="stylesheet" href="/Lamonte/styles/flexslider.css" />
    <link rel="stylesheet" href="/Lamonte/styles/prettyPhoto.css" media="screen" />
    <link rel="stylesheet" href="/Lamonte/styles/color.css" />
    <link rel="stylesheet" href="/Lamonte/styles/layout.css" />


    <!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

    <!-- Favicons
	================================================== -->
    <link rel="shortcut icon" href="/Lamonte/images/favicon.ico" />

    <!-- Ionicons -->
    <link rel="stylesheet" href="Admin/AdminComponents/bower_components/Ionicons/css/ionicons.min.css" />
    <script type="text/javascript">
        function CloseSession() {
            location.href = 'LogOut.aspx';
        }
        window.onbeforeunload = CloseSession;
    </script>
</head>


<body class="home">

    <div id="bodychild">
        <div id="outercontainer">

            <!-- HEADER -->
            <div id="outerheader">

                <header>
                    <!-- LOGO -->
                    <div id="logo">
                        <a href="Home">
                            <img src="/Lamonte/images/logoT.png" alt="نارم | NAREM.IR" /></a>
                    </div>
                    <!-- END LOGO -->

                    <!-- MAINMENU -->
                    <div id="outermainmenu">
                        <div class="container">
                            <div class="row">
                                <section id="navigation" class="twelve columns">
                                    <nav id="nav-wrap">
                                        <ul id="topnav" class="sf-menu">
                                            <li class="current"><a href="<% Server.MapPath("/Home") %>/Home">صفحه اصلی</a></li>
                                            <li><a href="#">خدمات</a>
                                                <ul>
                                                    <li><a href="<% Server.MapPath("/Order") %>/Order">سفارش وب سایت</a></li>
                                                    <%--<li><a href="<% Server.MapPath("/About") %>/About">خدمات حسابداری</a></li>--%>
                                                    <%--<li><a href="<% Server.MapPath("/About") %>/About">خدمات کامپیوتری</a></li>--%>
                                                </ul>
                                            </li>
                                            <li><a href="<% Server.MapPath("/Posts") %>/Posts">مطالب سایت</a></li>
                                            <li class="space"><a href="<% Server.MapPath("/News") %>/News">اخبار سایت</a></li>
                                            <li><a href="<% Server.MapPath("/About") %>/About">درباره ما</a>
                                                <ul>
                                                    <li><a href="<% Server.MapPath("/Biography") %>/Biography">درباره مدیر</a></li>
                                                    <li><a href="<% Server.MapPath("/About") %>/About">درباره شرکت و سایت</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="<% Server.MapPath("/Contact") %>/Contact">تماس با ما</a></li>
                                        </ul>
                                        <!-- topnav -->
                                    </nav>
                                    <!-- nav -->
                                </section>
                            </div>
                        </div>
                    </div>
                    <!-- END MAINMENU -->


                    <!-- SLIDER -->
                    <div id="outerslider">
                        <div id="slidercontainer">

                            <section id="slider" class="flexslider">
                                <div class="slider-pattern"></div>
                                <ul class="slides">
                                    <li>
                                        <img src="/images/1.jpg" style="width: 100%; height: 420px;" alt="خدمات حسابداری و کامپیوتر شرکت نارِم" />
                                        <div class="flex-caption">
                                            <div class="slider-text">
                                                <h1>خدمات حسابداری، هوش مصنوعی و نرم افزاری</h1>
                                                <p class="slider-desc" title="درباره تخصص اصلی تیم ما در شرکت نارِم">ارائه کلیه ی خدمات هوش مصنوعی، حسابداری و نرم افزاری تخصص اصلی تیم ما محسوب می‌شود.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="/images/2.jpg" style="width: 100%; height: 420px;" alt="طراحی و توسعه سیستم‌های نرم افزاری مبتنی بر وب شرکت نارِم" />
                                        <div class="flex-caption">
                                            <div class="slider-text">
                                                <h1>طراحی و توسعه سیستم‌های نرم افزاری مبتنی بر وب</h1>
                                                <p class="slider-desc" title="طراحی و توسعه‌ی سیستم‌های اختصاصی حسابداری، کامپیوتری و نرم افزاری مبتنی بر وب  ">ما کلیه وب سایت‌های خود را با استفاده از سیستم اختصاصی به صورت واکـنش‌گرا و با قالب اختصاصی بر اساس نـیازهای مشـتریان طراحی می‌کنیم.</p>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <img src="/images/3.jpg" style="width: 100%; height: 420px;" alt="تبلیغات شرکت نارِم" />
                                        <div class="flex-caption">
                                            <div class="slider-text">
                                                <h1>تبلیغات</h1>
                                                <p class="slider-desc" title="تبلیغات آنلاین اینترنتی شرکت نارِم">هر کسب و کاری که وارد دنیای اینترنت می‌شود به کمک تبلیغات آنلاین و برندسازی اینترنتی می‌تواند به راحتی خود را نمایان کرده و سریع رشد کند.</p>
                                            </div>
                                        </div>
                                    </li>

                                </ul>
                            </section>

                        </div>
                    </div>
                    <!-- END SLIDER -->

                </header>
            </div>
            <!-- END HEADER -->

            <!-- BEFORE CONTENT -->
            <div id="outerbeforecontent">
                <div class="light">
                    <div class="container">
                        <div class="row">
                            <div class="twelve columns">
                                <h3>نگار اعتبار رایان مبنا</h3>
                                <h4>« سهامی خاص »</h4>
                                <h1>وب سایت شرکت <span class="colortext">نــــــــــارِم </span>
                                    <br>
                                    خدمات حسابداری و کامپیوتر، طراحی فروشگاه اینترنتی، طراحی سیستم نرم‌افزاری</h1>
                                <br />
                                <a href="/Login" class="button" style="font-size: large;">ورود به پنل اختصاصی</a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END BEFORE CONTENT -->


            <!-- MAIN CONTENT -->
            <div id="outermain">
                <div class="container">
                    <div class="row">
                        <section id="maincontent" class="twelve columns">

                            <section class="content">

                                <div class="promotion">
                                    <div class="row">
                                        <div class="one_fourth columns">
                                            <img src="/Lamonte/images/icon1.png" alt="تجزیه تحلیل در شرکت نارِم" />
                                            <h2><a href="PostView/Page/تجزیه-و-تحلیل">تجزیه تحلیل</a></h2>
                                            <p>استخراج نیازمندی‌ها، مهندسی آن‌ها و تجزیه تحلیل آن‌ها، اولین گام در توسعه سیستم‌های نرم‌افزاری است.</p>
                                            <a href="PostView/Page/تجزیه-تحلیل" class="button">ادامه مطلب</a>
                                        </div>

                                        <div class="one_fourth columns">
                                            <img src="/Lamonte/images/icon2.png" alt="طراحی سیستم در شرکت نارِم" />
                                            <h2><a href="PostView/Page/طراحی">طراحی</a></h2>
                                            <p>بعد از ایجاد مدل تجزیه و تحلیل، طراحی سیستم بصورت مدل در گام دوم فرایند توسعه سیستم‌های نرم‌افزاری است.</p>
                                            <a href="PostView/Page/طراحی" class="button">ادامه مطلب
                                            </a>
                                        </div>

                                        <div class="one_fourth columns">
                                            <img src="/Lamonte/images/icon3.png" alt="پیاده‌سازی سیستم در شرکت نارِم" />
                                            <h2><a href="PostView/Page/پیاده‌سازی">پیاده‌سازی</a></h2>
                                            <p>آنالیز کلمات کلیدی، قوانین سئو و بهینه‌سازی سایت، باعث افزایش رتبه‌ سایت در موتورهای جستجو خواهد شد که باعث جذب بیشتر مشتریان خواهد شد.</p>
                                            <a href="PostView/Page/پیاده‌سازی" class="button">ادامه مطلب
                                            </a>
                                        </div>

                                        <div class="one_fourth columns">
                                            <img src="/Lamonte/images/icon4.png" alt="تست سیستم در شرکت نارِم" />
                                            <h2><a href="PostView/Page/تست">تست</a></h2>
                                            <p>تبلیغات آنلاین مبتنی بر وب در تجارت امروزه به عنوان یکی از قدرتمندترین ابزارهای تبلیغاتی و بازاریابی است.</p>
                                            <a href="PostView/Page/تست" class="button">ادامه مطلب
                                            </a>
                                        </div>
                                    </div>
                                </div>

                            </section>

                        </section>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTENT -->


            <!-- FOOTER -->
            <footer id="footersection">

                <!-- COPYRIGHT -->
                <div id="outerfooter">
                    <div class="container">
                        <div class="row">
                            <div class="twelve columns">

                                <ul id="footer-nav">
                                    <li><a href="/Home">صفحه اصلی</a></li>
                                    <li><a href="/About">درباره ما</a></li>
                                    <li><a href="/Order">سفارش آنلاین</a></li>
                                    <li><a href="/Posts">مطالب سایت</a></li>
                                    <li><a href="http://www.zarinp.al/@ahmsoft">درگاه پرداخت آنلاین</a></li>
                                    <li><a href="/News">اخبار سایت</a></li>
                                    <li><a href="/Contact">تماس با ما</a></li>
                                </ul>

                                <ul class="sn">
                                    <li><a href="https://twitter.com/ahmoravveji" title="Twitter"><span class="icon-img twitter"></span></a></li>
                                    <li><a href="https://facebook.com/ah.moravveji/" title="Facebook"><span class="icon-img facebook"></span></a></li>
                                    <li><a href="https://plus.google.com/+AmirHasanMoravveji" title="Google+"><span class="icon-img google"></span></a></li>
                                    <li><a href="http://telegram.me/ahmoravveji" title="Telegram"><span class="icon-img pinterest"></span></a></li>
                                </ul>
                                <center><script src="https://cdn.zarinpal.com/trustlogo/v1/trustlogo.js" type="text/javascript"></script></center>

                                <div id="copyleft">
                                    مشاوره طراحی سیستم‌های نرم افزاری، مدیریت پروژه سیستم‌های نرم افزاری، ارائه خدمات حسابداری و کامپیوتر.<br />
                                    کپی رایت@2018 تمام حقوق مادی و معنوی این سایت متعلق به شـرکت نــارم می‌باشد
                                    <a href="http://www.narem.ir">شرکت سهامی خاص نگار اعتبار رایان مبنا NAREM.ir</a>
                                </div>
                                <div id="toTop">top</div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END COPYRIGHT -->

            </footer>
            <!-- END FOOTER -->
            <div class="clear"></div>
            <!-- clear float -->
        </div>
        <!-- end outercontainer -->
    </div>
    <!-- end bodychild -->


    <!-- ////////////////////////////////// -->
    <!-- //      Javascript Files        // -->
    <!-- ////////////////////////////////// -->
    <script type="text/javascript" src="/Lamonte/js/jquery-1.7.1.min.js"></script>

    <!-- jQuery Superfish -->
    <script type="text/javascript" src="/Lamonte/js/hoverIntent.js"></script>
    <script type="text/javascript" src="/Lamonte/js/superfish.js"></script>
    <script type="text/javascript" src="/Lamonte/js/supersubs.js"></script>

    <!-- jQuery PrettyPhoto -->
    <script type="text/javascript" src="/Lamonte/js/jquery.prettyPhoto.js"></script>
    <script type="text/javascript" src="/Lamonte/js/fade.js"></script>

    <!-- jQuery Dropdown Mobile -->
    <script type="text/javascript" src="/Lamonte/js/tinynav.min.js"></script>

    <!-- Custom Script -->
    <script type="text/javascript" src="/Lamonte/js/custom.js"></script>

    <!-- jQuery Flexslider -->
    <script type="text/javascript" src="/Lamonte/js/jquery.flexslider-min.js"></script>
    <script type="text/javascript">
        jQuery(window).load(function () {
            jQuery('#slider').flexslider({
                animation: "fade",
                animationDuration: 600,
                directionNav: false,
                touch: true,
                controlNav: true
            });

            jQuery('#carousel').flexslider({
                animation: "slide",
                animationLoop: false,
                itemWidth: 235,
                itemMargin: 5,
                minItems: 2,
                maxItems: 3,
                touch: true,
                directionNav: true,
                controlNav: false
            });

        });
    </script>
    <!---begin Crisp code--->
    <script type="text/javascript">
        window.$crisp = [];
        window.CRISP_WEBSITE_ID = "55e2eb86-5fb2-47b6-84bb-ddce6f1188a6"; (function () { d = document; s = d.createElement("script"); s.src = "https://client.crisp.chat/l.js"; s.async = 1; d.getElementsByTagName("head")[0].appendChild(s); })();
    </script>
    <!---end Crisp code--->
</body>
</html>


