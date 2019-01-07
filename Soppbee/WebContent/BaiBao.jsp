<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.Login"%>
<%@page import="DAO.RegisterDAO"%>
<!DOCTYPE html>

<% 
	Login users = null;
	if(session.getAttribute("ipUserName") != null) {
		users = (Login) session.getAttribute("ipUserName");
	}
%>
<html><head id="ctl00_Head1"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"><title>
	THÁI BÌNH KHẢO SÁT XÂY DỰNG CƠ SỞ DỮ LIỆU GIS 3D BẰNG MÁY BAY KHÔNG NGƯỜI LÁI
</title><link href="./css/css" rel="stylesheet" type="text/css"><link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Loading Bootstrap -->
    <link rel="stylesheet" href="./css/bootstrap.css" type="text/css"><link rel="stylesheet" href="./css/gishue.css" type="text/css"><link href="./css/css(1)" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="./css/mediaelementplayer.min.css">
<link rel="stylesheet" type="text/css" href="./css/csshandler.ashx">
<link rel="shortcut icon" href="images/favicon.png">
<script src="./js/jquery.min.js." type="text/javascript"></script>
<script src="./js/jquery-ui.min.js." type="text/javascript"></script>


<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2&appId=1114092748771921&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

</head>
<body class="page-homepage-carousel">
    <!-- Wrapper -->
    <div class="wrapper">      
        <form method="post" action="BaiBao.jsp" id="aspnetForm">
<script src="./css/WebResource.axd" type="text/javascript"></script>
<script src="./js/mediaelement-and-player.min.js." type="text/javascript"></script>
<script src="./css/ScriptResource.axd" type="text/javascript"></script>
<script src="./js/ScriptResource(1).axd" type="text/javascript"></script>                     
<script type="text/javascript" src="./js/mojosuperfish.js."></script>
            <!-- Header -->
            <div class="container">
                <div class="row" style="background: #0a64a3">
                    <div class="col-md-12" id="idImageHeaderExplorer">
                        <h3 class="hidden-xs" style="color: white">HỆ THỐNG THÔNG TIN NHÀ Ở XÃ HỘI</h3>
                        <h6 class="hidden-lg hidden-md hidden-sm" style="color: white">HỆ THỐNG THÔNG TIN NHÀ Ở XÃ HỘI</h6>
                    </div>
                </div>
                <div class="row" style="background: #0a64a3; height: 49px">
                    <div class="col-md-12">
                        <nav class="navbar">
                            <div class="container-fluid menu">
                                 <div class="col-md-9 col-sm-9 col-xs-8 nopdding">
                                    <ul class="nav navbar-nav" style="height: 100%!important; margin-top: 0px!important">
                                        <li class="trangchu limenu active nopdding"><a href="TrangChuCD.jsp" title="Trang chủ" class=" no-link">
                                           <a href="TrangChu.jsp" title="Trang chủ" class=" no-link">
                                            <p class="hidden-xs hidden-sm">Trang chủ</p>
                                            <i class="fa fa-home hidden-lg hidden-md"></i></a></li>
                                        <li class="dukhach limenu nopdding to">
                                        	<a href="QuanLyCongDan.jsp" title="Nguoi mua nha" class=" no-link">
                                       			 <i class="fa fa-users hidden-lg hidden-md"></i>
                                           		 <p class="hidden-xs hidden-sm">Quản lý Người mua nhà</p>
                                        </a></li>
                                            <i class="fa fa-home hidden-lg hidden-md"></i></a></li>
                                         <li class="dukhach limenu nopdding to"><a href="BanDoChuyenNganhCD.jsp" title="Quỹ tín dụng địa phương" class=" no-link"><i class="fa fa-users hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Đánh giá các dự án</p>
                                        </a></li>
                                        <li class="home limenu nopdding"><a href="BanDoChuyenNganhCD.jsp" title="Bản đồ chuyên ngành" class=" no-link"><i class="fa fa-map hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Bản đồ chuyên ngành</p>
                                        </a></li>
                                    </ul>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-4 nopdding">
                                    <ul class="ul-nav-right list-unstyled child-navigation nopdding">
                                    <%if (users != null) {%>
                                        <li class="nav-right nopdding" style="padding-right: 14px"><a title="<%= users.getAccount() %>" target="_blank" class=" no-link"><i class="fa fa-lock hidden-lg hidden-md "></i>
                                            <p class="hidden-xs hidden-sm"><%= users.getAccount() %></p>
                                            <%} %>
                                      
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="row">
                    <div id="main" class="col-md-12">
                        
                        <div id="ctl00_divCenter" class="art-layout-cell art-content-wide center-nomargins cmszone">                           
<div id="ctl00_mainContent_pnlOuterWrap" class="">

<div class="rtop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>

<div id="ctl00_mainContent_BlogView1_pnlInnerWrap" class="">	
	<div id="ctl00_mainContent_BlogView1_pnlOuterBody" class="container">

        <div id="ctl00_mainContent_BlogView1_pnlInnerBody" class="row">        
<div id="ctl00_mainContent_BlogView1_navTop_divNav" class="col-md-3">
    <div id="ctl00_mainContent_BlogView1_navTop_pnlDatePicker" class="blogcal">
	</div>
    <div id="ctl00_mainContent_BlogView1_navTop_pnlArchives" class="cloudweb">
        <h3>
Lưu trữ
</h3>
<ul class="blognav">
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl01_Hyperlink6" href="BaiBao.jsp">Tháng Mười Hai, 2018 (49)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl02_Hyperlink6" href="BaiBao.jsp">Tháng Mười Một, 2018 (7)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl03_Hyperlink6" href="BaiBao.jsp">Tháng Mười, 2018 (15)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl04_Hyperlink6" href="BaiBao.jsp">Tháng Chín, 2018 (13)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl05_Hyperlink6" href="BaiBao.jsp">Tháng Tám, 2018 (5)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl06_Hyperlink6" href="BaiBao.jsp">Tháng Bảy, 2018 (15)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl07_Hyperlink6" href="BaiBao.jsp">Tháng Sáu, 2018 (8)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl08_Hyperlink6" href="BaiBao.jsp">Tháng Mười Hai, 2017 (34)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl09_Hyperlink6" href="BaiBao.jsp">Tháng Mười, 2017 (26)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl10_Hyperlink6" href="BaiBao.jsp">Tháng Chín, 2017 (19)</a></li>
    
        <li>
        <a id="ctl00_mainContent_BlogView1_navTop_archive_dlArchive_ctl11_Hyperlink6" href="BaiBao.jsp">Tháng Tám, 2017 (11)</a></li>  
    </ul> 
</div>	
    <div id="ctl00_mainContent_BlogView1_navTop_pnlSideBottom" class="cloudweb"> 
</div>	
	<div id="ctl00_mainContent_BlogView1_navTop_pnlCategories" class="cloudweb">

        
    
</div>
    

</div>


            <div id="ctl00_mainContent_BlogView1_divblog" class="col-md-9">
		
				
				
				
				
                <div id="ctl00_mainContent_BlogView1_pnlDateTop" class="title paddingTitle">

					<h2 class=" moduletitle ">THÁI BÌNH KHẢO SÁT XÂY DỰNG CƠ SỞ DỮ LIỆU GIS 3D BẰNG MÁY BAY KHÔNG NGƯỜI LÁI (UAV)</h2>
					<div style="blog-detail-meta">
						<span class="author">
						<span class="fa fa-user"></span>
                        Gửi bởi Thu Hà</span>
						&nbsp;|&nbsp;
						<span class="date">
							24 Tháng Mười Hai 2018 10:02:34 CH
						</span>
						&nbsp;|&nbsp;
						
						
					</div>
					
					
                    
                
</div>
				
				
                <div id="ctl00_mainContent_BlogView1_divTopPager" class="blogpager">

                    <a id="ctl00_mainContent_BlogView1_lnkPreviousPostTop" title="Xây dựng bản đồ cảnh báo doanh nghiệp xăng dầu hết hạn cấp phép" class="postlink prevpost" href="https://gis21.thuathienhue.gov.vn/x%c3%a2y-d%e1%bb%b1ng-b%e1%ba%a3n-%c4%91%e1%bb%93-c%e1%ba%a3nh-b%c3%a1o-doanh-nghi%e1%bb%87p-x%c4%83ng-d%e1%ba%a7u-h%e1%ba%bft-h%e1%ba%a1n-c%e1%ba%a5p-ph%c3%a9p.aspx">Bài trước &lt;&lt;</a>
                    
                
</div>
				
				
                
                
				
				<div id="ctl00_mainContent_BlogView1_pnlDetails">
			
                    
                    
                    <div class="blogtext">
                        <p>
	Thực hiện việc xây dựng hệ thống thông tin địa lý 3 chiều (GIS3D) phục vụ quy hoạch, quản lý đô thị tỉnh THÁI BÌNH. Trong hai&nbsp;ngày 22-23/12/2018, Công ty TNHH MTV Trắc địa Bản đồ phối hợp với Sở Thông tin và Truyền thông tỉnh THÁI BÌNH triển khai khảo sát, bay chụp bằng máy bay không người lái tại 02 khu vực của tỉnh THÁI BÌNH:</p>
<p>
	- Khu vực Tử Cấm Thành và Ủy ban tỉnh THÁI BÌNH với diện tích 2km<sup>2</sup> – phục vự thử nghiệm xây dựng thành phố thông minh 3D</p>
<p>
	- Khu vực Làng cổ Phước Tích, Phong Điền, THÁI BÌNH với diện tích 0,935km<sup>2</sup> – phục vụ thử nghiệm xây dựng cơ sở dữ liệu và bản đồ 3D khu di tích, bảo tồn.</p>
<p>
	<strong>Công việc khảo sát gồm:</strong></p>
<p>
	<strong>1. Lập kế hoạch bay</strong></p>
<p>
	- Chọn/ nhập khẩu bản đồ nền</p>
<p>
	-Vùng phủ sóng highlight</p>
<p>
	- Định nghĩa cao độ bay tự động</p>
<p>
	- Định nghĩa điểm chụp ảnh</p>
<p>
	- Xác định múi hạ cánh an toàn</p>
<p>
	<strong>2. Giám sát tiến trình bay</strong></p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Theo dõi tiến trình bay qua phần mềm điều khiển máy bay</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Hạ cánh tự động theo khu vực hạ cánh được xác định</p>
<p>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Nhập hình ảnh theo nhật ký chuyến bay</p>
<p>
	<strong>3. Thực hiện các công việc xử lý sau chuyến bay và lập báo cáo phân tích</strong></p>
<p>
	<strong>Một số hình ảnh trong quá trình khảo sát bay tại Kinh thành Huế</strong></p>
<p style="text-align: center;">
	<strong><img alt="" src="./images/wp_20181215_09_32_32_pro.jpg" style="width: 309px; height: 550px;">​</strong></p>
<p style="text-align: center;">
	<strong><img alt="" src="./images/wp_20181215_09_35_12_pro.jpg" style="width: 309px; height: 550px;"></strong></p>
<p style="text-align: center;">
	<strong><img alt="" src="./images/wp_20181215_09_38_13_pro.jpg" style="width: 550px; height: 309px;"></strong></p>
<p style="text-align: center;">
	<strong><img alt="" src="./images/wp_20181215_09_44_31_pro.jpg" style="width: 550px; height: 309px;"></strong></p>
<p style="text-align: center;">
	<strong><img alt="" src="./images/uva.jpg" style="width: 550px; height: 292px;"></strong></p>
<p style="text-align: right;">
	"Thu Hà"</p>
<p>
	&nbsp;</p>
				
				
                <div class="blogcopyright">
                    <span id="ctl00_mainContent_BlogView1_lblCopyright"></span>
                </div>
				
				
                
                
				
				<div class="share-post">
					<div class="icons">
						<div id="ctl00_mainContent_BlogView1_divAddThis" class="blogaddthis">
							
						</div>

						

						

						
					</div>
                </div>
				
				
                <div id="ctl00_mainContent_BlogView1_divBottomPager" class="clearfix">

                    <a id="ctl00_mainContent_BlogView1_lnkPreviousPost" title="Xây dựng bản đồ cảnh báo doanh nghiệp xăng dầu hết hạn cấp phép" class="pull-left" href="BaiBao.jsp">Bài trước &lt;&lt;</a>
                    
                
</div>
                
                
                <div id="ctl00_mainContent_BlogView1_pnlFeedback" class="bcommentpanel">

				
                <h3 class=" moduletitle "></h3>
                    <div class="blogcomments">
                        
                    </div>
                    <fieldset id="ctl00_mainContent_BlogView1_fldEnterComments">
                         <legend>
                            <label>New Comment</label>
                        </legend> 
                        
                        
                        <div class="fb-comments" data-href="http://localhost:8080/NOXH-GIS/BaiBao.jsp" data-width="850" data-numposts="5"></div>
                        
                        <div id="ctl00_mainContent_BlogView1_pnlCommentsClosed">
			
                            
                        
		</div>
                        
                    </fieldset>
                
</div>
                
            
	</div>
            
            
        


		
        
</div>
    
</div>
    <div id="ctl00_mainContent_BlogView1_divCleared" class="cleared">

	
    
</div>

</div>

<div class="rbottom"><div class="r4"></div><div class="r3"></div><div class="r2"></div><div class="r1"></div></div>	

</div>

                        
</div>
                        
                        <div class="container">
                            <div class="homepage-carousel-wrapper">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="image-carousel">
                                            <div class="image-carousel-slide">
                                                <a href="BaiBao.jsp" target="_blank" title="Kênh phản ảnh hiện trường">
                                                    <img class="col-md-12 col-sm-12 col-xs-12" src="./images/footer.jpg" alt="">
                                                </a>
                                            </div>
                                        </div>
                                        <!-- /.slider-image -->
                                    </div>
                                </div>
                                <!-- /.slider-image -->
                            </div>
                        </div>
                        <!-- <div id="page-footer" style="background:rgba(0, 0, 0, 0) url('/Data/Sites/1/skins/gishue/img/footer.jpg') no-repeat scroll center center / 1145px 125px; height:125px; margin:0 auto;"> </div> -->
                    </div>
                </div>
            </div>
            <script type="text/javascript">
                function getQuerystring(key, default_) {
                    if (default_ == null) default_ = "";
                    key = key.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
                    var regex = new RegExp("[\\?&]" + key + "=([^&#]*)");
                    var qs = regex.exec(window.location.href);
                    if (qs == null)
                        return default_;
                    else
                        return qs[1];
                }
                function HideMenuToolbar() { $("#toolbar").fadeOut(); $("#toolbarbut").fadeIn("slow"); }
                function ShowMenuToolbar() { $("#toolbar").fadeIn(); $("#toolbarbut").fadeOut("slow"); }
                $(document).ready(function () {
                    var active = getQuerystring("active");
                    if (active != "") {
                        $('.nav-left-menu li').removeClass('active');
                        $('.' + active).addClass('active');
                    } else {
                        $('.trangchu').addClass('active');
                    }
                    $("span.downarr a").click(function () { HideMenuToolbar(); Set_Cookie('openstate', 'closed') });
                    $("span.showbar a").click(function () { ShowMenuToolbar(); Set_Cookie('openstate', 'open') });
                    $("span.downarr a, span.showbar a").click(function () { return false; });
                    var openState = Get_Cookie('openstate');
                    if (openState != null) { if (openState == 'closed') { HideMenuToolbar(); } if (openState == 'open') { ShowMenuToolbar(); } }

                    $('.sf-menu.sf-navbar').addClass('nav navbar-nav');

                    // Sub menu

                    $($('li.sf-with-ul').find('a')[0]).addClass('has-child no-link');

                    var ul = $('nav.bs-navbar-collapse').find('ul').filter(function (index) {
                        var ul_temp = $('nav.bs-navbar-collapse').find('ul')[1]
                        if ($(ul_temp).hasClass('sf-menu') == false)
                            return ul_temp;
                    });

                    if (ul != undefined) {
                        $(ul).addClass('list-unstyled child-navigation');
                    }


                    // Current active
                    var current_tab = $('li.current')[0];
                    $(current_tab).removeClass('current');
                    $(current_tab).addClass('active');

                });
            </script>
            
            
            
        

    <style>
        .AspNet-Menu-Horizontal ul, .AspNet-Menu-Horizontal li {
            display: inline-block;
            margin: 0;
            line-height: 1;
        }

        li.topnavitem {
            border: none !important;
        }

        #topRelatedLink nav a {
            border-left: 1px solid #C4C4C4 !important;
            padding: 5px 8px !important;
        }

        #topRelatedLink nav ul li:first-child a {
            border-left: 0 none !important;
            padding-left: 0;
        }

        #topRelatedLink nav li:first-child a {
            border-left: 0 none !important;
            padding-left: 0;
        }

        .welcomeText {
            display: inline-block;
        }

        .ulloginout li {
            border: 4px solid gray;
            background: gray;
        }

        .nav-right {
            float: right;
            height: 41px;
            padding-top: 8px;
        }

        li.nav-right a {
            color: #fff;
            font-size: 15px;
            padding-left: 8px;
            padding-right: 8px;
            height: 41px;
        }
    </style>
</form>
        <!--<script type="text/javascript" src="/Data/Sites/1/skins/gCloudGISHUE/js/jquery-2.1.0.min.js"></script> -->
        <script type="text/javascript" src="./js/jquery-migrate-1.2.1.min.js."></script>
        <script type="text/javascript" src="./js/bootstrap.min.js."></script>
        <script type="text/javascript" src="./js/selectize.min.js."></script>
        <script type="text/javascript" src="./js/owl.carousel.min.js."></script>
        <script type="text/javascript" src="./js/jquery.validate.min.js."></script>
        <script type="text/javascript" src="./js/jquery.placeholder.js."></script>
        <script type="text/javascript" src="./js/jQuery.equalHeights.js."></script>
        <script type="text/javascript" src="./js/icheck.min.js."></script>
        <script type="text/javascript" src="./js/jquery.vanillabox-0.1.5.min.js."></script>
        <script type="text/javascript" src="./js/retina-1.1.0.min.js."></script>
        <script type="text/javascript" src="./js/jquery-tree-1.0.js."></script>
        <script type="text/javascript" src="./js/custom.js."></script>
        <link rel="stylesheet" href="./css/style2.css" type="text/css">
    </div>


</body>
</html>