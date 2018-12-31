<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html>

<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>ورود | کنترل پنل</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="AdminComponents/dist/css/bootstrap-theme.css">
  <!-- Bootstrap rtl -->
  <link rel="stylesheet" href="AdminComponents/dist/css/rtl.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="AdminComponents/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="AdminComponents/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="AdminComponents/dist/css/AdminLTE.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="AdminComponents/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition login-page" style="background-color: #111;">
<div class="login-box">
  <div class="login-logo">
      <a href="/Home" style="color: rgb(255, 216, 0);"><b>NAREM.</b>IR</a><br />
    <a style="color: #fff;" href="/Admin/AdminPanel.aspx"><b>ورود به سایت</b></a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body" style="background-color: #222;border-radius:20px;">
    <p style="color: #fff;" class="login-box-msg">فرم زیر را تکمیل کنید و ورود بزنید</p>

    <form runat="server" >
      <div class="form-group has-feedback">
        <asp:TextBox runat="server" ID="txtUsername" required="required" class="form-control" style="color: #fff;background-color:rgba(255,255,255,0.1);" placeholder="نام کاربری" />
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <asp:TextBox runat="server" ID="txtPassword" type="password" required="required" class="form-control" style="color: #fff;background-color:rgba(255,255,255,0.1);" placeholder="رمز عبور" />
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <div class="checkbox icheck">
            <label>
              <asp:CheckBox runat="server" ID="chk" style="color: #fff;" Text="مرا به خاطر بسپار" type="checkbox" />
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-12">
          <asp:Button runat="server" ID="btnArival" Text="ورود" type="submit" style="border-radius:5px;"  class="btn btn-primary btn-block btn-flat" />
        </div>
        <!-- /.col -->
      </div>
    </form>

    <!-- /.social-auth-links -->
  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="AdminComponents/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="AdminComponents/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="AdminComponents/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
