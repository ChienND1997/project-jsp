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
	Hệ thống thông tin nhà ở xã hội
</title><link href="./css/css" rel="stylesheet" type="text/css"><link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Loading Bootstrap -->
    <link rel="stylesheet" href="./css/bootstrap.css" type="text/css"><link rel="stylesheet" href="./css/gishue.css" type="text/css"><link href="./css/css(1)" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="./css/csshandler.ashx">


<link rel="search" type="application/opensearchdescription+xml" title="Hệ thống thông tin nhà ở xã hội Tìm kiếm" href="search.jsp">
<link rel="shortcut icon" href="./images/favicon.png">
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui.min.js" type="text/javascript"></script>

<link rel="canonical" href="TrangChu.jsp"></head>
<body class="page-homepage-carousel">
    <!-- Wrapper -->
    <div class="wrapper">
        
        
<div class="aspNetHidden">
</div>
<script src="./css/WebResource.axd" type="text/javascript"></script>
<script src="./css/ScriptResource.axd" type="text/javascript"></script>
<script src="./css/ScriptResource(1).axd" type="text/javascript"></script>       
<script type="text/javascript" src="./js/mojosuperfish.js"></script>
            <!-- Header -->
            <div class="container">
                <div class="row" style="background: #0a64a3">
                    <div class="col-md-12" id="idImageHeaderExplorer">
                        <h3 class="hidden-xs" font-family="Helvetica, Arial, Tahoma, sans-serif" font-weight = "300" style="color: white" > HỆ THỐNG THÔNG TIN NHÀ Ở XÃ HỘI</h3>
                        
						<h6 class="hidden-lg hidden-md hidden-sm" style="color: white">HỆ THỐNG THÔNG TIN NHÀ Ở XÃ HỘI</h6>					
						</div>
               </div>
                <div class="row" style="background: #0a64a3; height: 49px">
                    <div class="col-md-12">
                        <nav class="navbar">
                            <div class="container-fluid menu">
                                <div class="col-md-9 col-sm-9 col-xs-8 nopdding">
                                    <ul class="nav navbar-nav" style="height: 100%!important; margin-top: 0px!important">
                                        <li class="trangchu limenu active nopdding">
                                        <a href="TrangChu.jsp" title="Trang chủ" class=" no-link">
                                            <p class="hidden-xs hidden-sm">Trang chủ</p>
                                            <i class="fa fa-home hidden-lg hidden-md"></i></a></li>
                                        <li class="dukhach limenu nopdding to">
                                        	<a href="QuanLyCongDan.jsp" title="Nguoi mua nha" class=" no-link">
                                       			 <i class="fa fa-users hidden-lg hidden-md"></i>
                                           		 <p class="hidden-xs hidden-sm">Quản lý Người mua nhà</p>
                                        </a></li>
                                         <li class="dukhach limenu nopdding to"><a href="QuanLyDuAn.jsp" title="Đối tượng" class=" no-link"><i class="fa fa-users hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Quản lý dự án</p>
                                        </a></li>
                                        <li class="home limenu nopdding"><a href="BanDoChuyenNganh.jsp" title="Bản đồ chuyên ngành" class=" no-link"><i class="fa fa-map hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Bản đồ chuyên ngành</p>
                                        </a></li>
                                       <li class="home limenu nopdding"><a href="HoSoOnline.jsp" title="Bản đồ chuyên ngành" class=" no-link"><i class="fa fa-map hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Hồ sơ online</p>
                                        </a></li>
                                    </ul>
                                </div>
                            
                                <div class="col-md-3 col-sm-3 col-xs-4 nopdding">
                                    <ul class="ul-nav-right list-unstyled child-navigation nopdding">
                                    <%if (users != null) {%>
                                        <li class="nav-right nopdding" style="padding-right: 14px"><a  title="<%= users.getAccount() %>" target="_blank" class=" no-link"><i class="fa fa-lock hidden-lg hidden-md "></i>
                                            <p class="hidden-xs hidden-sm"><%= users.getAccount() %></p>
                                        </a></li>
                                        <%} %>
                                        
                               <form method = "get" action = "LogoutServlet">
                                        <li class="nav-right nopdding" style="padding-right: 14px"><a style="padding: 15px 0px !important;">|</a></li>
                                        <li class="nav-right nopdding"><a href="LogoutServlet" title="Đăng Xuất"  class="no-link"><i class="fa fa-question-circle hidden-lg hidden-md "></i>
                                            <p class="hidden-xs hidden-sm">Đăng Xuất</p>
                                        </a></li>
                                        
                                </form>
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
                <div class="row">
                    <div id="main" class="col-md-12">
                        
                        <div id="ctl00_divCenter" class="art-layout-cell art-content-wide center-nomargins cmszone">

<div id="main">
    <div class="wrapper">
        <!-- Page Content -->
        <div id="page-content">
            <!-- Slider -->
            <!-- đóng tạm thời slide -->
            <div class="container">
                <div class="row">
                    <section class="tabVertical">
                        <div class="col-md-12 nopadding">
                            <div class="tab-content-slide">
                                <div class="tab-pane-slide active" id="tab01">
                                    <div class="col-md-12 nopadding">
                                        <div class="col-md-4">
                                            <a href="DuAnDangTrienKhai.jsp" class="appBox">
                                                <img class="col-md-12 col-xs-12" src="./images/doanhnghiep-duandautu.jpg">
                                            </a>
                                            <div class="col-md-12 col-xs-12 ">
                                                <a href="DuAnDangTrienKhai.jsp">
                                                    <h4 class="title-gishue">Dự án kêu gọi đầu tư</h4>
                                                </a>
                                                <p>Cung cấp cho người dân, doanh nghiệp các thông tin về danh sách các dự án kêu gọi đầu tư</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4 col_last ">
                                            <a href="DuAnSapHoanThanh.jsp" class="appBox">
                                                <img class="col-md-12 col-xs-12" src="./images/doanhnghiep-trienkhaiduan.jpg">
                                            </a>
                                            <div class="col-md-12 col-xs-12 ">
                                                <a href="DuAnSapHoanThanh.jsp">
                                                    <h4 class="title-gishue">Dự án đang triển khai</h4>
                                                </a>
                                                <p>Cung cấp cho người dân, doanh nghiệp về hiện trạng các dự án đang triển khai</p>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <a href="DuAnDaHoanThanh.jsp" class="appBox" >
                                                <img class="col-md-12 col-xs-12 " src="./images/dulich-360.jpg">
                                            </a>
                                            <div class="col-md-12 col-xs-12 ">
                                                <a href="DuAnDaHoanThanh.jsp">
                                                    <h4 class="title-gishue">Các dự án đã hoàn thành</h4>
                                                </a>
                                                <p>Cung cấp các thông tin về các dự án sắp hoàn thành trên các địa bàn..</p>
                                            </div>
                                        </div>
                                       
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                        
                    </section>
                </div>
            </div>
            <!-- end Slider -->
            <!-- News, Events, About -->
            <div class="container">
                <div class="homepage-carousel-wrapper">
                    <div class="row">
                        <!-- /.col-md-6 -->
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="image-carousel">
                                <div class="image-carousel-slide">
                                    <a href="TrangChu.jsp" target="_blank" title="Kênh phản ảnh hiện trường">
                                        <img class="col-md-12 col-sm-12 col-xs-12" src="./images/phananhhientruong.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- /.slider-image -->
                        </div>
                        <!-- /.col-md-6 -->
                    </div>
                    <!-- /.row -->
                    <div class="background"></div>
                </div>
                <!-- /.slider-wrapper -->
                <div class="slider-inner"></div>
            </div>
            <!-- /.container -->
            <div class="block">
                <div class="container">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-xs-12 nopadding">
                            <h3 class="titleNew" style="border-left: none; border-bottom: 1px solid #EF9F16; color: #EF9F16;">TIN TỨC NỔI BẬT
                                <a href="BaiBao.jsp" "="" class="btn btn-info btn-sm" style="line-height: 0;color: #fff; min-height: 30px; float: right; margin-right: -15px; padding-top: 14px;">Xem thêm</a>
                            </h3>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-4">
                              <section class="events small">
                                    <div id="ctl00_mainContent_ctl00_tinTuc1" class="section-content"><article class="event nearest"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/3283WP_20171215_09_44_31_Pro.jpg"></div><div class="col-md-8 col-blog-right">      <header class="header-blog"><a class="title-gishue" href="BaiBao.jsp" title="THÁI BÌNH KHẢO SÁT XÂY DỰNG CƠ SỞ DỮ LIỆU GIS 3D BẰNG MÁY BAY KHÔNG NGƯỜI LÁI (UAV)"><h5>Thái Bình xây dựng cơ sở mới về nhà ở xã hội...</h5></a></header>     <div class="additional-info"></div></div></aside></article><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/3285ct.jpg"></div><div class="col-md-8 col-blog-right">        <header class="header-blog"><a class="title-gishue" href="https://gis21.thuathienhue.gov.vn/x%C3%A2y-d%E1%BB%B1ng-b%E1%BA%A3n-%C4%91%E1%BB%93-c%E1%BA%A3nh-b%C3%A1o-doanh-nghi%E1%BB%87p-x%C4%83ng-d%E1%BA%A7u-h%E1%BA%BFt-h%E1%BA%A1n-c%E1%BA%A5p-ph%C3%A9p.aspx" title="Xây dựng bản đồ cảnh báo doanh nghiệp xăng dầu hết hạn cấp phép"><h5>Xây dựng bản đồ cảnh báo doanh nghiệp xăng dầu hết hạn cấp phép</h5></a></header>        <div class="additional-info"></div></div></aside></article></div>
                                </section>
                            </div>
                            <div class="col-md-4">
                                <section class="events small">
                                    <div id="ctl00_mainContent_ctl00_tinTuc2" class="section-content">
                                    <article class="event nearest-second"><aside>
                                    <div class="col-md-4 col-blog-left">
                                    <img class="img-gishue" src="./images/328820171218080014_3.jpg"></div>
                                    <div class="col-md-8 col-blog-right">    
                                       <header class="header-blog">
                                       <a class="title-gishue" href="BaiBao.jsp" title="Hội thảo triển khai đề tài thuộc chương trình khoa học công nghệ cấp quốc gia về công nghệ vũ trụ giai đoạn 2016 – 2020."><h5>Hội thảo triển khai đề tài thuộc chương trình khoa học công nghệ cấp quốc gia về...</h5></a></header>       <div class="additional-info"></div></div></aside></article><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/anhDaiDien.png"></div><div class="col-md-8 col-blog-right">        <header class="header-blog"><a class="title-gishue" href="./leaflet-ajax-gh-pages/example/index.jsp" title="Nhận diện nhanh 5 ích lợi ứng dụng GIS trong lĩnh vực y tế"><h5>Nhận diện nhanh 5 ích lợi ứng dụng GIS trong lĩnh vực y tế</h5></a></header>       <div class="additional-info"></div></div></aside></article></div>
                                </section>
                            </div>
                            <div class="col-md-4">
                                <section class="events small">
                                    <div id="ctl00_mainContent_ctl00_tinTuc3" class="section-content"><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/3271kd.jpg"></div><div class="col-md-8 col-blog-right">     <header class="header-blog"><a class="title-gishue" href="BaiBao.jsp" title="Tích hợp CSDL GIS Di tích Lăng Khải Định"><h5>Tích hợp CSDL GIS Di tích Lăng Khải Định</h5></a></header>      <div class="additional-info"></div></div></aside></article><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/32823Dadd.jpg"></div><div class="col-md-8 col-blog-right">     <header class="header-blog"><a class="title-gishue" href="./leaflet-ajax-gh-pages/example/index.html" title="Xây dựng dữ liệu 3D GIS giúp thử nghiệm quản lý đô thị thông minh và bảo tồn di tích"><h5>Xây dựng dữ liệu 3D GIS giúp thử nghiệm quản lý đô thị thông minh và bảo tồn di ...</h5></a></header>        <div class="additional-info"></div></div></aside></article></div>
                                </section>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                </div>
                <!-- /.container -->
                
            </div>
        </div>
        <!-- /.container -->
    </div>
    <!-- end News, Events, About -->
</div>                       
</div>
                        
                        <div class="container">
                            <div class="homepage-carousel-wrapper">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="image-carousel">
                                            <div class="image-carousel-slide">
                                                <a  target="_blank" title="Kênh phản ảnh hiện trường">
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
                    </div>
                </div>
            </div>
        <script type="text/javascript" src="./js/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="./js/bootstrap.min.js"></script>
        <script type="text/javascript" src="./js/selectize.min.js"></script>
        <script type="text/javascript" src="./js/owl.carousel.min.js"></script>
        <script type="text/javascript" src="./js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="./js/jquery.placeholder.js"></script>
        <script type="text/javascript" src="./js/jQuery.equalHeights.js"></script>
        <script type="text/javascript" src="./js/icheck.min.js"></script>
        <script type="text/javascript" src="./js/jquery.vanillabox-0.1.5.min.js"></script>
        <script type="text/javascript" src="./js/retina-1.1.0.min.js"></script>
        <script type="text/javascript" src="./js/jquery-tree-1.0.js"></script>
        <script type="text/javascript" src="./js/custom.js"></script>
        <link rel="stylesheet" href="./css/style2.css" type="text/css">
    </div>
	
                            
   
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
                         
<style type="text/css">
    @media (min-width:320px) {
    }


    @media (min-width:768px) {
        .btnXemThem {
            padding-top: 14px;
        }
    }

    @media (min-width:980px) {
        .btnXemThem {
            padding-top: 14px;
        }
    }

    @media (min-width:1024px) {
        .btnXemThem {
            padding-top: 14px;
        }
    }

    /*.navigation-wrapper {
        margin: 0 auto !important;
        width: 1140px !important;
    }*/

    #page-footer {
        background: rgba(0, 0, 0, 0) url("./images/footer.jpg") no-repeat scroll center center / 1140px 100%;
        height: 272px;
        margin: 0 auto;
    }

    img.img-gishue {
        width: 100%;
        padding: 0;
        max-width: 130px;
    }

    .events.small .event aside header a h5 {
        font-size: 13px !important;
        margin: 0 !important;
    }

    .additional-info, .additional-info p, .additional-info * {
        font-size: 12px !important;
    }

    .image-carousel .image-carousel-slide .image-carousel-box {
        background-color: #EF9F16 !important;
    }

    .color-white {
        color: #FFF !important;
    }

    .title-gishue {
        color: #108de5;
    }

    .appBox:after {
        background: none !important;
    }

    .header-blog {
        margin: 0 0 5px 0;
        padding: 0;
    }

    .col-blog-left, .col-blog-right {
        padding: 0;
    }

    .col-blog-left {
        padding-right: 6px;
    }

    .owl-pagination {
        margin-left: 6px;
    }

    .nopadding {
        padding-left: 0px !important;
        padding-right: 0px !important;
    }
</style>
<style>
    .featuredColor {
        color: #1f9cbe;
    }
</style>
</body>
</html>