<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Model.*"%>
<%@page import="DAO.*"%>
<% 
	Login users = null ;
	
	 if(session.getAttribute("ipUserName") != null) {
		users = (Login) session.getAttribute("ipUserName");
	} 
	
	ShowDADAO show = new ShowDADAO();
%>

<html><head id="ctl00_Head1"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"><title>
    Hệ thống thông tin nhà ở xã hội
</title><link href="./css/css" rel="stylesheet" type="text/css"><link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Loading Bootstrap -->
<link rel="stylesheet" href="./css/bootstrap.css" type="text/css">
<link rel="stylesheet" href="./css/gishue.css" type="text/css"><link href="./css/css(1)" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="./css/csshandler.ashx">
<link rel="shortcut icon" href="images/favicon.png">
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui.min.js" type="text/javascript"></script>
    <!-- Bootstrap core CSS     -->
<link href="./css/bootstrap.min.css" rel="stylesheet" />
    <!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="./css/demo.css" rel="stylesheet" />
    <!--     Fonts and icons     -->
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="canonical" href="TrangChu.jsp">
    <!-- Wrapper -->
<script src="./css/WebResource.axd" type="text/javascript"></script>
<script src="./css/ScriptResource.axd" type="text/javascript"></script>
<script src="./css/ScriptResource(1).axd" type="text/javascript"></script>       
<script type="text/javascript" src="./js/mojosuperfish.js"></script>
</head>
<body class="page-homepage-carousel">

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
                                            <%} %>
                                      
                                    </ul>
                                </div>
                            </div>
                        </nav>
                    </div>
                </div>
            <h2>Hồ sơ dự án</h2>
			       <div class="card-header card-header-icon" data-background-color="rose">
                              
								 <br>
								   <div>
										 <div style = "float: left">
											 <a href = "ThemDuAn.jsp"><button type="button" rel="tooltip" class="btn btn-success" style="border-radius: 8px;">
                                                           Thêm hồ sơ
                                                        </button></a>
										</div>
										<!-- <div style = "padding-left: 500px; float: right;">
											<div style = "width: 500px">
												<input type="text" class="form-control" style = "height: 20px; width:400px; border-radius: 5px; float: left;" name = "timkiemten">
													<input type="button" rel="tooltip" class="btn btn-success" style="border-radius: 8px; float: right;">
                                                           Tìm kiếm
                                                    </input>
											</div>
										</div>  -->
									</div>
                                </div>
            <div class="col-md-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id ="myTable">
                                            <thead>
                                                <tr>
                                                    <th class="text-center">Mã dự án</th>
                                                    <th>Tên dự án</th>
                                                    <th>Vị trí</th>
                                                    <th>Diện tích</th>
                                                    <th class="text-right">Tổng số tòa nhà</th>
													 <th class="text-right">Mật độ xây dựng</th>
                                                    <th class="text-right">Actions</th>
                                                </tr>
                                            </thead>
                                                               
                                            <tbody>
                     
                      <%
                            for (DuAn list : show.getListDuAn()) {
                            	
                            	String deleteURL = "DeleteDA?maduan=" + list.getMaDA();
								//String deleteURL = "DeleteCD?cmnd=" + list.getCMND();
                            
                        %>
                     
                                                <tr>
                                                    <td class="text-center"><%= list.getMaDA() %></td>
                                                    <td><%= list.getTenDA() %></td>
                                                    <td><%= list.getVitriDA() %></td>
                                                    <td><%= list.getDienTich() %></td>
                                                    <td class="text-right"><%= list.getTongSoToaNha() %></td>
													  <td class="text-right"><%= list.getMaDoXD() %></td>
                                                    <td class="td-actions text-right">
													<a href = "./leaflet-ajax-gh-pages/example/index.jsp"><button type="button" rel="tooltip" class="btn btn-success" style="border-radius: 8px;">Xem                                                       
                                                     <%if (users.getIDR() == 2 || users.getIDR() == 3){ %>     
                                                     </button></a>
                                                          
                                                            <a href = "Show_editDA?maduan=<%=list.getMaDA()%>"><button type="button" rel="tooltip" class="btn btn-info" style="border-radius: 8px;">Sửa                                                        
                                                        </button></a>
                                                       <a href ="<%= deleteURL%>"> <button type="button" rel="tooltip" class="btn btn-danger" style="border-radius: 8px;"  onclick="return confirm('bạn có chắc xóa?')">
                                                           Xóa
                                                        </button></a><%} %>
                                                    </td>
                                                </tr>
                                                
                                                <%} %>
                                            </tbody>
                                            
                                        </table>
                                    </div>
                                </div>

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
                                <a href="./leaflet-ajax-gh-pages/example/index.jsp" "="" class="btn btn-info btn-sm" style="line-height: 0;color: #fff; min-height: 30px; float: right; margin-right: -15px; padding-top: 14px;">Xem thêm</a>
                            </h3>
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="col-md-4">
                                <section class="events small">
                                    <div id="ctl00_mainContent_ctl00_tinTuc1" class="section-content"><article class="event nearest"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/3283WP_20171215_09_44_31_Pro.jpg"></div><div class="col-md-8 col-blog-right">      <header class="header-blog"><a class="title-gishue" href="./leaflet-ajax-gh-pages/example/index.jsp" title="THÁI BÌNH KHẢO SÁT XÂY DỰNG CƠ SỞ DỮ LIỆU GIS 3D BẰNG MÁY BAY KHÔNG NGƯỜI LÁI (UAV)"><h5>Thái Bình xây dựng cơ sở mới về nhà ở xã hội...</h5></a></header>     <div class="additional-info"></div></div></aside></article><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/3285ct.jpg"></div><div class="col-md-8 col-blog-right">        <header class="header-blog"><a class="title-gishue" href="https://gis21.thuathienhue.gov.vn/x%C3%A2y-d%E1%BB%B1ng-b%E1%BA%A3n-%C4%91%E1%BB%93-c%E1%BA%A3nh-b%C3%A1o-doanh-nghi%E1%BB%87p-x%C4%83ng-d%E1%BA%A7u-h%E1%BA%BFt-h%E1%BA%A1n-c%E1%BA%A5p-ph%C3%A9p.aspx" title="Xây dựng bản đồ cảnh báo doanh nghiệp xăng dầu hết hạn cấp phép"><h5>Xây dựng bản đồ cảnh báo doanh nghiệp xăng dầu hết hạn cấp phép</h5></a></header>        <div class="additional-info"></div></div></aside></article></div>
                                </section>
                            </div>
                            <div class="col-md-4">
                                <section class="events small">
                                    <div id="ctl00_mainContent_ctl00_tinTuc2" class="section-content"><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/328820171218080014_3.jpg"></div><div class="col-md-8 col-blog-right">       <header class="header-blog"><a class="title-gishue" href="https://gis21.thuathienhue.gov.vn/h%E1%BB%99i-th%E1%BA%A3o-tri%E1%BB%83n-khai-%C4%91%E1%BB%81-t%C3%A0i-thu%E1%BB%99c-ch%C6%B0%C6%A1ng-tr%C3%ACnh-khoa-h%E1%BB%8Dc-c%C3%B4ng-ngh%E1%BB%87-c%E1%BA%A5p-qu%E1%BB%91c-gia-v%E1%BB%81-c%C3%B4ng-ngh%E1%BB%87-v%C5%A9-tr%E1%BB%A5-giai-%C4%91o%E1%BA%A1n-2016-%E2%80%93-2020.aspx" title="Hội thảo triển khai đề tài thuộc chương trình khoa học công nghệ cấp quốc gia về công nghệ vũ trụ giai đoạn 2016 – 2020."><h5>Hội thảo triển khai đề tài thuộc chương trình khoa học công nghệ cấp quốc gia về...</h5></a></header>       <div class="additional-info"></div></div></aside></article><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/anhDaiDien.png"></div><div class="col-md-8 col-blog-right">        <header class="header-blog"><a class="title-gishue" href="./leaflet-ajax-gh-pages/example/index.jsp" title="Nhận diện nhanh 5 ích lợi ứng dụng GIS trong lĩnh vực y tế"><h5>Nhận diện nhanh 5 ích lợi ứng dụng GIS trong lĩnh vực y tế</h5></a></header>       <div class="additional-info"></div></div></aside></article></div>
                                </section>
                            </div>
                            <div class="col-md-4">
                                <section class="events small">
                                    <div id="ctl00_mainContent_ctl00_tinTuc3" class="section-content"><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/3271kd.jpg"></div><div class="col-md-8 col-blog-right">     <header class="header-blog"><a class="title-gishue" href="https://gis21.thuathienhue.gov.vn/t%C3%ADch-h%E1%BB%A3p-csdl-gis-di-t%C3%ADch-l%C4%83ng-kh%E1%BA%A3i-%C4%91%E1%BB%8Bnh.aspx" title="Tích hợp CSDL GIS Di tích Lăng Khải Định"><h5>Tích hợp CSDL GIS Di tích Lăng Khải Định</h5></a></header>      <div class="additional-info"></div></div></aside></article><article class="event nearest-second"><aside><div class="col-md-4 col-blog-left"><img class="img-gishue" src="./images/32823Dadd.jpg"></div><div class="col-md-8 col-blog-right">     <header class="header-blog"><a class="title-gishue" href="./leaflet-ajax-gh-pages/example/index.jsp" title="Xây dựng dữ liệu 3D GIS giúp thử nghiệm quản lý đô thị thông minh và bảo tồn di tích"><h5>Xây dựng dữ liệu 3D GIS giúp thử nghiệm quản lý đô thị thông minh và bảo tồn di ...</h5></a></header>        <div class="additional-info"></div></div></aside></article></div>
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
                                                <a href="TrangChu.jsp" target="_blank" title="Kênh phản ảnh hiện trường">
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="scripts/script.js"></script>
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
<!--   Core JS Files   -->
<script src="./js/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="./js/arrive.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="./js/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="./js/moment.min.js"></script>
<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="./js/chartist.min.js"></script>
<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="./js/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="./js/bootstrap-notify.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="./js/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="./js/jquery-jvectormap.js"></script>
<!-- Sliders Plugin, full documentation here: https://refreshless.com/nouislider/ -->
<script src="./js/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="./js/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="./js/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin, full documentation here: https://limonte.github.io/sweetalert2/ -->
<script src="./js/sweetalert2.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="./js/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="./js/fullcalendar.min.js"></script>
<!-- Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="./js/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="./js/material-dashboard.js?v=1.2.1"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="./js/demo.js"></script>
<script type="./js/jquery.js"></script>
<script type="./js/bootstrap.min.js"></script>
<script src="./js/jquery.dataTables.js"></script>
<script src="./js/jquery.dataTables.min.js"></script>
<script src="./js/dataTables.bootstrap.min.js"></script>
<script>
$(document).ready(function() {
	$('#myTable').dataTable();
} );
</script>
</html>