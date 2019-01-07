<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="x-border-box x-strict"><head id="ctl00_Head1"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><title>
	Đăng Ký
</title><link rel="stylesheet" type="text/css" href="css/ext-all.css">



    <script type="text/javascript" src="js/ext-4.1.0-ext-all.js"></script>
	
	<link rel="stylesheet" type="text/css" href="css/apps-style.css">
<link rel="stylesheet" type="text/css" href="css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="js/csshandler.ashx">
<meta name="description" content="đăng nhập">
<meta name="og:description" content="rang đăng nhập">
<link rel="shortcut icon" href="images/favicon.png">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script></head>
<body class="stretched stretched2 x-body x-webkit x-chrome x-reset" id="ext-gen1018">

	<form method="post" action="RegisterController" id="Register">
	<script src="js/WebResource.axd" type="text/javascript"></script>
	<script src="js/ScriptResource.axd" type="text/javascript"></script>
	<script src="js/ScriptResource(1).axd" type="text/javascript"></script>
	<script type="text/javascript"></script>
	<script src="js/WebResource(1).axd" type="text/javascript"></script>  
    <div id="divWating" style="display:none;z-index:20000;height: 20px">Vui lòng chờ...</div>
	<div id="loaderdiv" style="z-index:20000;"></div>
	<div id="headerControl">
		<div id="infoControl" class="mWidth clearfix">
		  <div style="width:300px;padding-left:20px" class="page-logo">
				<a href="login.jsp">
					<img style="margin: 3px 10px 0;max-width: 130px;" src="image/logo.png" alt="logo" class="logo-default">
				</a>
				<div class="menu-toggler sidebar-toggler">
				</div>
			</div>
		</div>
	</div>
	<!-- End headerControl -->
	
    <div id="main">       
        <div id="ctl00_divCenter" class="art-layout-cell art-content-wide center-nomargins cmszone">
    <div id="ctl00_mainContent_pnlLogin" class="panelwrapper login">
	<!--Responsive hiển thị nhiều màn hình -->
	<script>
		$(document).ready(function () {
		$("#wrapfooter").hide();;
		$("#bottomContent").show();
		var height = $(document).height();
		$('#slider').height(height);
		$('.swiper-slide').height(height);
		$('body').addClass('stretched');
		
		if (/mobile/i.test(navigator.userAgent)) {
			$('.settingrow.rememberrow').hide();
			$('.settingrow.registerrow').hide();
			$('.signUpBox.accordion.accordion-lg.divcenter.nobottommargin.clearfix.login-form').css('top','-160px');
		}
		});
	</script>
	     <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#ipUserName").keyup(function (e) {
                    clearTimeout(x_timer);
                    var account = $(this).val();
                    x_timer = setTimeout(function () {
                        check_account_ajax(account);
                    }, 1000);
                });

                function check_account_ajax(ipUserName) {
                	$("#user-result").html('<img src="img/ajax-loader.gif" />');
                    $.post('CheckEmailServlet', {'ipUserName': ipUserName}, function (data) {
                    	
                        $("#user-result").html(data);
                    });
                }
            });
        </script>

	<link rel="stylesheet" href="css/bootstrap.css" type="text/css">
	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/dark.css" type="text/css">
	<link rel="stylesheet" href="css/font-icons.css" type="text/css">
	<link rel="stylesheet" href="css/animate.css" type="text/css">
	<link rel="stylesheet" href="css/responsive.css" type="text/css">
	<link rel="stylesheet" href="css/formsignIn.css" type="text/css">
	
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   
	  <div id="wrapper1" class="clearfix" style="animation-duration: 1.5s; opacity: 1;">
			<!--<script src="gClient/API/js/jsplugin/jquery-1.7.1.min.js" type="text/javascript"></script>-->
	
			<header id="header" class="transparent-header sticky-header dark" data-sticky-class="not-dark">

				<div id="header-wrap">

					<div class="container clearfix">

						<div id="primary-menu-trigger"><i class="icon-reorder"></i></div>

						<!-- Logo
							============================================= -->
						<div id="logo">
							<a class="standard-logo" data-dark-logo="images/logo.png"><img src="images/logo(1).png" alt="gServer Logo"></a>
							<a class="retina-logo" data-dark-logo="images/logo@2x.png"><img src="images/logo@2x.png" alt="gServer Logo"></a>
						</div>
						<!-- #logo end -->

						<!-- Primary Navigation
							============================================= -->
						<nav id="primary-menu" class="dark">
							<ul>

							</ul>
						</nav>
						<!-- #primary-menu end -->

					</div>

				</div>

			</header>
			<!-- #header end -->

			<section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix" style="position: absolute; top: 0px; bottom: 0px; height: 626px;">

				<div class="swiper-container swiper-parent">
					<div class="swiper-wrapper">

						<div class="swiper-slide dark" style="background-image: url(&quot;images/gserver02.jpg&quot;); height: 626px;">
							<div class="container clearfix" id="formregister">		
								<div class="signUpBox accordion accordion-lg divcenter nobottommargin clearfix  login-form" style="max-width: 550px;top:-95px;">
									<img class="accessLogo" src="images/gServerlogo.jpg">
									<div class="acctitle"><h3>Đăng ký tài khoản</h3></div>
									<div class="acc_content clearfix">
									<!-- Bắt đầu -->
										<div id="login-form" name="login-form" class="nobottommargin">
										
											
        <div id="ctl00_mainContent_login1_LoginCtrl_pnlLContainer" onkeypress="javascript:return WebForm_FireDefaultButton(event, &#39;ctl00_mainContent_login1_LoginCtrl_Login&#39;)">
			
            <div class="col_full">
					
                    <label for="lbUserName" class="settinglabel">Tên tài khoản</label>
					<input name="ipUserName" type="text" maxlength="100" id="ipUserName" class="formcontrol"> <span id = "user-result"></span>
					
            </div>
			
			
			<div class="col_full">
					<label for="lbPassword" class="login-form-username">Mật khẩu</label>
					<input name="ipPassword" type="password" id="Password" class="formcontrol">
            </div>
			<div class="col_full">
					<label for="lbPassword" class="login-form-username">Nhập lại MK</label>
					<input name="ipPassword2" type="password" id="Password2" class="formcontrol">
            </div>
			<div class="col_full">
					<label for="lbEmail" class="login-form-username">Email</label>
					<input name="ipEmail" type="text" maxlength="100" id="Email" class="formcontrol">
            </div>
            <div href="#" class="settingrow buttonLogin">
                <span class="art-button-wrapper"><span class="art-button-l"> </span>
<span class="art-button-r"> </span>
<input type = "hidden" value = "insert" name = "command">
<input type="submit" name="submit" value="Đăng ký" id="Login" class="art-button">
</span>
            </div>	
            <div class="settingrow buttonrow" >
                <br>           
            </div>
		</div>
		</div>
		<!-- Kết thuc-->
		</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="staticBox dark" style="">
					<div class="sliderFooter">
						<div class="container clearfix">
							<div class="copyright">© copyright 2018 Thu Ha</div>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>       
</div>
</form>
<style type="text/css">

#headerControl {display:none;}


.settinglabel {
	font-size: 14px;
    width: 140px;
}

.lnkpasswordrecovery{color:#59C3CA;}

.lnkregister{color:#59C3CA;}

.settingrow.idrow label, .settingrow.passwordrow label{
    float: left;
	color:#59C3CA;
	font-size: 14px;
	font-weight: bold;
	margin-top: 6px;
	text-align: left;
	width: 75px;
}
#formregister input {
	box-sizing: content-box !important;
}

#formregister label{
	color: #555;
    cursor: pointer;
    display: inline-block;
    float: left;
    font-family: "Raleway",sans-serif;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 1px;
    margin-bottom: 10px;
    text-align: left;
}
#login-form .rememberrow input{
	float:left;
	margin-right: 10px;
	margin-top:10px;
}
#login-form .rememberrow label{
	text-transform:none
}

/* tablet */
@media all and (max-width: 1024px) {
    .settingrow.rememberrow{display:none; }
}

/* mobile phone */
@media all and (max-width: 768px) {
    .settingrow.rememberrow{display:none; }
}
</style>

</body>
</html>
