<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Model.Login"%>
<% 
	Login users = null;
	if(session.getAttribute("ipUserName") != null) {
		users = (Login) session.getAttribute("ipUserName");
	}
%>
<!-- saved from url=(0106)https://gis21.thuathienhue.gov.vn/gexplorer.aspx?id=2A6DCB82-7AC7-44B2-A770-9BA4F185B823&tab=1&active=home -->
<html><head id="ctl00_Head1"><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"><title>
    Hệ thống thông tin nhà ở xã hội
</title><link href="./css/css" rel="stylesheet" type="text/css"><link href="./css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Loading Bootstrap -->
    <link rel="stylesheet" href="./css/bootstrap.css" type="text/css"><link rel="stylesheet" href="./css/gishue.css" type="text/css"><link href="./css/css(1)" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="./css/csshandler.ashx">
<link rel="search" type="application/opensearchdescription+xml" title="Hệ thống thông tin nhà ở xã hội Tìm kiếm" href="Search.jsp">
<link rel="shortcut icon" href="images/favicon.icon">
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/jquery-ui.min.js" type="text/javascript"></script>
<link rel="canonical" href="TrangChu.html"></head>
<body class="page-homepage-carousel">
    <!-- Wrapper -->
    <div class="wrapper">
        
        <form method="post" action="TrangChuCD.jsp" id="banDoForm">
</script>
<script src="./css/WebResource.axd" type="text/javascript"></script>
<script src="./css/ScriptResource.axd" type="text/javascript"></script>
<script src="./css/ScriptResource(1).axd" type="text/javascript"></script>
<script type="text/javascript">
</script>

<div class="aspNetHidden">

    <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334">
</div>           
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
                                        <li class="trangchu limenu active nopdding"><a href="TrangChuCD.jsp" title="Trang chủ" class=" no-link">
                                           <p class="hidden-xs hidden-sm">Trang chủ</p>
                                            <i class="fa fa-home hidden-lg hidden-md"></i></a></li>
											  <li class="dukhach limenu nopdding to"><a href="BanDoChuyenNganhCD.jsp" title="Quỹ tín dụng địa phương" class=" no-link"><i class="fa fa-users hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Đăng ký mua nhà</p>
                                        </a></li>
                                       <!--   <li class="dukhach limenu nopdding to"><a href="QuanLyDuAn.jsp" title="Quỹ tín dụng địa phương" class=" no-link"><i class="fa fa-users hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Đánh giá các dự án</p>
                                        </a></li> -->
                                        <li class="home limenu nopdding"><a href="BanDoChuyenNganhCD.jsp" title="Bản đồ chuyên ngành" class=" no-link"><i class="fa fa-map hidden-lg hidden-md"></i>
                                            <p class="hidden-xs hidden-sm">Bản đồ chuyên ngành</p>
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
                <div class="row">
                    <div id="main" class="col-md-12">                       
                        <div id="ctl00_divCenter" class="art-layout-cell art-content-wide center-nomargins cmszone">
<script src="./js/cookie.js.tải xuống" type="text/javascript"></script>
<script src="./js/purl.js.tải xuống" type="text/javascript"></script>

<script src="./js/libAPI.js.tải xuống" type="text/javascript"></script><script src="./js/OpenLayers.js.tải xuống"></script><script src="./js/gClient.js.tải xuống"></script><script src="./js/gClientGlobal.js.tải xuống"></script><script src="./js/VectorMap.js.tải xuống"></script><script src="./js/gServer.js.tải xuống"></script>
<script src="./js/variables.js.tải xuống" type="text/javascript"></script>
<script src="./js/common.js.tải xuống" type="text/javascript"></script>

<script src="./js/rightPanelView.js.tải xuống" type="text/javascript"></script>
<script src="./js/leftMenu.js.tải xuống" type="text/javascript"></script>

<script src="./js/init.js.tải xuống" type="text/javascript"></script>
<div>
  <div class="container">
     <div class="row">
        <div class="col-md-3">
            <div id="ctl00_mainContent_ctl00_pnlOuterWrap" class="">
                <div class="rtop"><div class="r1"></div><div class="r2"></div><div class="r3"></div><div class="r4"></div></div>
                <div id="ctl00_mainContent_ctl00_pnlInnerWrap" class="panelwrapper mymodule">
                    <div id="ctl00_mainContent_ctl00_upGallery">		
                    <a id="module67" class="moduleanchor"></a>
                    <div id="ctl00_mainContent_ctl00_pnlOuterBody" class="">
                        <div id="ctl00_mainContent_ctl00_pnlInnerBody" class="modulecontent">                        
</div>                   
</div>                    
	</div>
                    <div id="ctl00_mainContent_ctl00_divCleared" class="cleared">

                    
</div>               
</div>
                <div class="rbottom"><div class="r4"></div><div class="r3"></div><div class="r2"></div><div class="r1"></div></div>        
</div>
        </div>
     </div>
  </div>  
</div>
<script type="text/javascript">
    $($('h2.moduletitle')[0]).css('font-size', '14px');
</script> 
  <!-- /breadcrumb --> 
  <!-- Page Content -->
  <div id="page-content">


    <div id="giaodien1" class="container" style="display: block;">
      <div class="row"> 
        <!--SIDEBAR Content-->
        <div id="treeLeftExplorer" class="col-md-3" style="">
          <div id="page-sidebar" class="sidebar">
            <aside class="news-small" id="news-small">
              <header>
                <h2>Danh mục</h2>
              </header>
              <div class="treeMenu ">
                <div id="collapsibleControl" style="display:none;">
                  <nav> <a href="javascript:;" class="featured-color nicetree_expand btn btn-small" rel="verticalMenu">Mở rộng</a> <a href="javascript:;" class="featured-color nicetree_collapse btn btn-small" rel="verticalMenu ">Thu gọn</a> </nav>
                </div>
                <style id="verticalMenuCss" type="text/css">
                </style>
                <ul id="verticalMenu" class="items nicetree"><li class=" item blue active actived nt_open withsubsections lv1-Title dropDown" lvl="1"><a lvl="1" href="" class=" selected" onclick="clickRootNode(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;, this);"><b>Tất cả</b></a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;79EA1200-F815-4EFD-85F8-2A151A8BB653&#39;,this)">Dân tộc </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;9B3FE592-96C2-4582-8922-C9C2DEA838F9&#39;,this)">Du lịch </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;E5C562AF-566B-49E2-ABE4-253C52F44252&#39;,this)">Đầu tư </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;B6FFEA4A-AAD1-4CEF-9294-77BEACF8FDD9&#39;,this)">Giáo dục và Đào tạo </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;5A464951-EA96-4063-AC7F-58812900144A&#39;,this)">Lao động - Thương binh và Xã hội </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;A15A51E7-54F2-42F1-BC42-3E373FE8FFD3&#39;,this)">Nông nghiệp và Phát triển nông thôn </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;EBE739E6-E33F-4FB2-A2A0-47342C13BE1D&#39;,this)">Tài nguyên - Môi trường </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;2793236E-81BE-4C68-B091-8389C0493067&#39;,this)">Thông tin và Truyền thông </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;516FC868-9A5A-443B-943D-D9A5321BD904&#39;,this)">Văn hóa và Thể Thao </a></li><li class="item  blue lv1-Title dropDown" lvl="1">
				<a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;421384B2-AF1A-4FAF-B2C6-CC47D7526B10&#39;,this)">Xây dựng </a></li><li class="item  blue lv1-Title dropDown" lvl="1"><a title="" style="cursor: pointer;" lvl="1" class="" flagcheked="0" onclick="clickCollection(&#39;A31B6BFA-45E3-4164-A7BC-E8494D45BAD1&#39;,this)">Y tế </a></li></ul>
              </div>
               
              </aside>
            <!-- /.news-small --> 
            
          </div>
          <!-- /#sidebar --> 
        </div>
        <!-- /.col-md-4 --> 
        
        <!--MAIN Content-->
        <div id="treeRightExplorer" class="col-md-9">
          <div id="page-main">
            <section id="right-sidebar">
              <header>
                <h2 id="lblCollectionName"></h2><h2 style="display:none" class="noInline">&nbsp;&nbsp;/&nbsp;&nbsp;</h2><h4 class="noInline child" id="lblSubCollection"></h4>
              </header>
              <div class="pageTitle nopdding col-sm-12">
                <h4 id="totalCount1" class="pageResult col-sm-10 col-xs-12">104 Kết quả được tìm thấy</h4>
                <div class="paging pag nopdding col-sm-2 col-xs-12">
                        <nav id="idPhanTrang"><a href="" onclick="" class="first">Đầu</a><span></span><a href="" class="num itemEffect radius3px actived " onclick=""><b>1</b></a><span></span><a href="" class="num itemEffect radius3px" onclick="loadItemCollection(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;,2)">2</a><span></span><a href="" class="num itemEffect radius3px" onclick="loadItemCollection(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;,3)">3</a><span></span><a href="" onclick="loadItemCollection(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;,18)" class="last">Cuối</a><span></span></nav>	
                </div>
              </div>
              <p id="lblCollectionDescription">Tất cả tài nguyên</p>

              <div class="display"><div title="Xóa bộ nhớ đệm" onclick="clearLocalStorage();" class="buttonRefresh buttonDrop featured-bg radius3px white-color myriad"><span></span></div><div class="display-list" onclick="display(&#39;list&#39;);">List</div><div class="active-display-grid">Grid</div></div>


              <div id="div-items-grid" class="gridMaps" style="display: block;"><div class="row"><div class="col-md-4"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;822FB25A-3BEA-41C7-819F-777041D0A60F&#39;)" href=""><img src="./images/anhDaiDien.png"></a></div><div class="stick-to-bottom"><div class="feature-des"><ul><li>Ngày tạo : 9/6/2018</li><li>Người tạo : Thu Ha</li></ul></div><a onclick="fnXemUngDung(&#39;822FB25A-3BEA-41C7-819F-777041D0A60F&#39;)" class="btn btn-framed btn-color-grey btn-small">Chi tiết</a></div><div class="background featuredBg"></div></figure><a href="" onclick="fnXemUngDung(&#39;822FB25A-3BEA-41C7-819F-777041D0A60F&#39;)"><h3 class="title" title="Tra cứu thông tin đất đai">Tra cứu thông tin đất đai</h3></a><div class="description"></div></article></div><div class="col-md-4"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;33C606D8-F4B6-404D-914F-8F5BACB458E1&#39;)" href=""><img src="./images/anhDaiDien(1).png"></a></div>
			  <div class="stick-to-bottom"><div class="feature-des"><ul><li>Ngày tạo : 20/11/2018</li><li>Người tạo : Thu Ha</li></ul></div><a onclick="fnXemUngDung(&#39;33C606D8-F4B6-404D-914F-8F5BACB458E1&#39;)" class="btn btn-framed btn-color-grey btn-small">Chi tiết</a></div><div class="background featuredBg"></div></figure><a href="" onclick="fnXemUngDung(&#39;33C606D8-F4B6-404D-914F-8F5BACB458E1&#39;)">
			  <h3 class="title" title="Bản đồ tra cứu thông tin quy hoạch xây dựng tỉnh Thừa Thiên Huế">Bản đồ tra cứu thông tin quy hoạch xây dựng tỉn...</h3></a>
			  <div class="description"></div></article></div><div class="col-md-4"><article class="featured-course"><figure class="image"><div class="image-wrapper">
			  <a onclick="fnXemUngDung(&#39;64365C07-19F7-4465-9391-2EAA4E0085FD&#39;)" href=""><img src="./images/anhDaiDien(2).png"></a></div>
			  <div class="stick-to-bottom"><div class="feature-des"><ul><li>Ngày tạo : 13/1/2018</li><li>Người tạo : Thu Ha</li></ul></div>
			  <a onclick="fnXemUngDung(&#39;64365C07-19F7-4465-9391-2EAA4E0085FD&#39;)" class="btn btn-framed btn-color-grey btn-small">Chi tiết</a></div>
			  <div class="background featuredBg"></div></figure><a href="" onclick="fnXemUngDung(&#39;64365C07-19F7-4465-9391-2EAA4E0085FD&#39;)">
			  <h3 class="title" title="Bản đồ tra cứu thông tin quy hoạch chuyên ngành">Bản đồ tra cứu thông tin quy hoạch chuyên ngành</h3></a>
			  <div class="description"></div></article></div></div><div class="row"><div class="col-md-4"><article class="featured-course"><figure class="image">
			  <div class="image-wrapper">
          <a onclick="fnXemUngDung(&#39;2099FBB0-AFC0-4F0A-83F3-F79827ACB6AF&#39;)" href=""><img src="./images/anhDaiDien(3).png"></a></div>
			  <div class="stick-to-bottom"><div class="feature-des"></div>
        <a onclick="fnXemUngDung(&#39;2099FBB0-AFC0-4F0A-83F3-F79827ACB6AF&#39;)" class="btn btn-framed btn-color-grey btn-small">Chi tiết</a></div><div class="background featuredBg"></div></figure>
			  <a href="" onclick="fnXemUngDung(&#39;2099FBB0-AFC0-4F0A-83F3-F79827ACB6AF&#39;)">
			  <h3 class="title" title="Bản đồ Đối phó bão lụt tỉnh Thừa Thiên Huế">Bản đồ Đối phó bão lụt tỉnh Thái Bình</h3></a>
			  <div class="description"></div></article></div><div class="col-md-4"><article class="featured-course"><figure class="image">
			  <div class="image-wrapper">
          <a onclick="fnXemUngDung(&#39;7075ACDC-300A-4EC8-A56A-366A25121814&#39;)" href="">
            <img src="./images/anhDaiDien(4).png"></a></div><div class="stick-to-bottom"><div class="feature-des"></div><a onclick="fnXemUngDung(&#39;7075ACDC-300A-4EC8-A56A-366A25121814&#39;)" class="btn btn-framed btn-color-grey btn-small">Chi tiết</a></div><div class="background featuredBg"></div></figure><a href="" onclick="fnXemUngDung(&#39;7075ACDC-300A-4EC8-A56A-366A25121814&#39;)"><h3 class="title" title="Bản đồ Quy hoạch thuỷ lợi tỉnh Thừa Thiên Huế đến năm 2025 và định hướng đến năm 2035">Bản đồ Quy hoạch thuỷ lợi tỉnh Thừa Thiên Huế đ...</h3></a><div class="description"></div></article></div><div class="col-md-4"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;8891A6D3-852E-4DFF-B31E-0C2500997C3E&#39;)" href=""><img src="./images/anhDaiDien(5).png"></a></div><div class="stick-to-bottom"><div class="feature-des"></div>
			  <a onclick="fnXemUngDung(&#39;8891A6D3-852E-4DFF-B31E-0C2500997C3E&#39;)" class="btn btn-framed btn-color-grey btn-small">Chi tiết</a></div><div class="background featuredBg"></div></figure><a href="" onclick="fnXemUngDung(&#39;8891A6D3-852E-4DFF-B31E-0C2500997C3E&#39;)"><h3 class="title" title="Bản đồ GIS ngành Lao động - Thương binh và Xã hội năm 2018">Bản đồ GIS ngành Lao động - Thương binh và Xã h...</h3></a><div class="description"></div></article></div></div></div>
              <div id="div-items-list" class="listMaps" style="display: none;"><div class="row"><div class="col-md-12"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;822FB25A-3BEA-41C7-819F-777041D0A60F&#39;)"><img src="./images/anhDaiDien.png"></a></div></figure><a onclick="fnXemUngDung(&#39;822FB25A-3BEA-41C7-819F-777041D0A60F&#39;)"><h3 class="title" title="Tra cứu thông tin đất đai">Tra cứu thông tin đất đai</h3></a><div class="description"><ul><li>Ngày tạo : 9/6/2018</li><li>Người tạo : Thu Ha</li></ul></div><div class="read-more stick-to-bottom"><a onclick="fnXemUngDung(&#39;822FB25A-3BEA-41C7-819F-777041D0A60F&#39;)" class=" darkColor">Chi tiết</a></div></article></div></div><div class="row"><div class="col-md-12"><article class="featured-course">
			  <figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;33C606D8-F4B6-404D-914F-8F5BACB458E1&#39;)"><img src="./images/anhDaiDien(1).png"></a></div></figure><a onclick="fnXemUngDung(&#39;33C606D8-F4B6-404D-914F-8F5BACB458E1&#39;)"><h3 class="title" title="Bản đồ tra cứu thông tin quy hoạch xây dựng thành phố Hà Nội">Bản đồ tra cứu thông tin quy hoạch xây dựng tỉn...</h3></a><div class="description"><ul><li>Ngày tạo : 20/1/2018</li><li>Người tạo : Thu Ha</li></ul></div><div class="read-more stick-to-bottom"><a onclick="fnXemUngDung(&#39;33C606D8-F4B6-404D-914F-8F5BACB458E1&#39;)" class=" darkColor">Chi tiết</a></div></article></div></div><div class="row"><div class="col-md-12"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;64365C07-19F7-4465-9391-2EAA4E0085FD&#39;)"><img src="./images/anhDaiDien(2).png"></a></div></figure><a onclick="fnXemUngDung(&#39;64365C07-19F7-4465-9391-2EAA4E0085FD&#39;)">
			  <h3 class="title" title="Bản đồ tra cứu thông tin quy hoạch chuyên ngành">Bản đồ tra cứu thông tin quy hoạch chuyên ngành</h3></a><div class="description"><ul><li>Ngày tạo : 13/1/2018</li><li>Người tạo : Thu Ha</li></ul></div><div class="read-more stick-to-bottom">
			  <a onclick="fnXemUngDung(&#39;64365C07-19F7-4465-9391-2EAA4E0085FD&#39;)" class=" darkColor">Chi tiết</a></div></article></div></div><div class="row"><div class="col-md-12"><article class="featured-course"><figure class="image">
			  <div class="image-wrapper"><a onclick="fnXemUngDung(&#39;2099FBB0-AFC0-4F0A-83F3-F79827ACB6AF&#39;)"><img src="./images/anhDaiDien(3).png"></a></div></figure><a onclick="fnXemUngDung(&#39;2099FBB0-AFC0-4F0A-83F3-F79827ACB6AF&#39;)"><h3 class="title" title="Bản đồ Đối phó bão lụt tỉnh Thừa Thiên Huế">Bản đồ Đối phó bão lụt tỉnh Thừa Thiên Huế</h3></a><div class="description"></div><div class="read-more stick-to-bottom"><a onclick="fnXemUngDung(&#39;2099FBB0-AFC0-4F0A-83F3-F79827ACB6AF&#39;)" class=" darkColor">Chi tiết</a></div></article></div></div>
			  <div class="row"><div class="col-md-12"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;7075ACDC-300A-4EC8-A56A-366A25121814&#39;)"><img src="./images/anhDaiDien(4).png"></a></div></figure><a onclick="fnXemUngDung(&#39;7075ACDC-300A-4EC8-A56A-366A25121814&#39;)"><h3 class="title" title="Bản đồ Quy hoạch thuỷ lợi tỉnh Thừa Thiên Huế đến năm 2025 và định hướng đến năm 2035">Bản đồ Quy hoạch thuỷ lợi tỉnh Thừa Thiên Huế đ...</h3></a><div class="description"></div><div class="read-more stick-to-bottom"><a onclick="fnXemUngDung(&#39;7075ACDC-300A-4EC8-A56A-366A25121814&#39;)" class=" darkColor">Chi tiết</a></div></article></div></div>
			  <div class="row"><div class="col-md-12"><article class="featured-course"><figure class="image"><div class="image-wrapper"><a onclick="fnXemUngDung(&#39;8891A6D3-852E-4DFF-B31E-0C2500997C3E&#39;)"><img src="./images/anhDaiDien(5).png"></a></div></figure><a onclick="fnXemUngDung(&#39;8891A6D3-852E-4DFF-B31E-0C2500997C3E&#39;)"><h3 class="title" title="Bản đồ GIS ngành Lao động - Thương binh và Xã hội năm 2018">Bản đồ GIS ngành Lao động - Thương binh và Xã h...</h3></a><div class="description"></div><div class="read-more stick-to-bottom"><a onclick="fnXemUngDung(&#39;8891A6D3-852E-4DFF-B31E-0C2500997C3E&#39;)" class=" darkColor">Chi tiết</a></div></article></div></div></div>

              <div class="pageTitle nopdding col-sm-12" "="">
              <h4 id="totalCount2" class="pageResult col-sm-10 col-xs-12">104 Kết quả được tìm thấy</h4>
                <div class="paging pag nopdding col-sm-2 col-xs-12">
                       <nav id="idPhanTrang2"><a href="" onclick="" class="first">Đầu</a><span></span><a href="" class="num itemEffect radius3px actived " onclick=""><b>1</b></a><span></span><a href="" class="num itemEffect radius3px" onclick="loadItemCollection(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;,2)">2</a><span></span><a href="" class="num itemEffect radius3px" onclick="loadItemCollection(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;,3)">3</a><span></span><a href="" onclick="loadItemCollection(&#39;2A6DCB82-7AC7-44B2-A770-9BA4F185B823&#39;,18)" class="last">Cuối</a><span></span></nav>	
                </div>
              </div>

            </section>
          </div>
          <!-- /#page-main --> 
        </div>
        <!-- /.col-md-8 --> 
        <!-- end MAIN Content --> 
        
      </div>
      <!-- /.row --> 
    </div>
    <!-- /.container -->  
    <!--Slide-->
    <section id="featured-courses" style="display: none;">
     
    </section>     
  </div>
  <!-- end Page Content -->                   
</div>
                        
                        <div class="container">
                            <div class="homepage-carousel-wrapper">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="image-carousel">
                                            <div class="image-carousel-slide">
                                                <a href="TrangChu.html" target="_blank" title="Kênh phản ảnh hiện trường">
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





<style>
@media (min-width:320px) {
    .pag {
        position: relative!important;
    }
}
    #verticalMenu li 
    {
        display: list-item !important;
        padding: 7px 0 !important;    
    }
    
    .panelwrapper.mymodule moduletitle h2 
    {
        font-size: 14px !important;    
    }
    
    ul.list-links li 
    {
        display: list-item !important;     
    }
    
    .display .buttonRefresh { 
        display: inline-block;
        float: left;
        padding: 7px 0px 7px 7px;
        font-size: 12px;
        background: url('./images/refeshicon.png') center left no-repeat;
        height: 24px;
        cursor: pointer;
        background-color: #59C3CA;
    }

    .display .buttonRefresh span {
        margin-left: 22px;
    }
	.ModuleEditLink{display:none}
</style>     
        <!--<script type="text/javascript" src="/Data/Sites/1/skins/gCloudGISHUE/js/jquery-2.1.0.min.js"></script> -->
        <script type="text/javascript" src="./js/jquery-migrate-1.2.1.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/bootstrap.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/selectize.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/owl.carousel.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/jquery.validate.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/jquery.placeholder.js.tải xuống"></script>
        <script type="text/javascript" src="./js/jQuery.equalHeights.js.tải xuống"></script>
        <script type="text/javascript" src="./js/icheck.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/jquery.vanillabox-0.1.5.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/retina-1.1.0.min.js.tải xuống"></script>
        <script type="text/javascript" src="./js/jquery-tree-1.0.js.tải xuống"></script>
        <script type="text/javascript" src="./js/custom.js.tải xuống"></script>
        <link rel="stylesheet" href="./css/style2.css" type="text/css">
    </div>


</body></html>