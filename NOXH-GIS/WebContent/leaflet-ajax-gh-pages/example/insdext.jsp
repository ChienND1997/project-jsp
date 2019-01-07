<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.*"%>
<%@page import="DAO.*"%>
<% 
	Login users = null ;
	
	 if(session.getAttribute("ipUserName") != null) {
		users = (Login) session.getAttribute("ipUserName");
	} 
	
	ShowDADAO show = new ShowDADAO();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=1024, user-scalable=no">
    <style>
      html { height: 100% }
      body { height: 100%; padding-left: 50px; padding-right: 50px;}
      #map{ height: 90%; width: 100%; float: right; }
    </style>
    <link rel="stylesheet" href="leaflet.css" />
 
<!-- Default Theme -->
<link rel="stylesheet" href="owl.theme.css">
 
<!--  jQuery 1.7+  -->
<script src="jquery.min.js"></script>
 
<!-- Include js plugin -->
<script src="owl.carousel.js"></script>
<script src="leaflet-src.js"></script>
<script type="text/javascript" src="../dist/leaflet.ajax.js"></script>
<script src="spin.js"></script>
<script src="leaflet.spin.js"></script>


<link rel="shortcut icon" href="images/favicon.png">

    <title>Dự Án</title>
    </head>
    <body>
		<div class="owl-carousel owl-theme">
         
			            <div class="col-md-12">
                            <div class="card">
                                <div class="card-content">
                                    <div class="table-responsive">
                                        
                                    </div>
                                </div>

                </div>
            </div>
			</div>
		</div>
    <div id="map"></div>

      <script type="text/javascript">var m= L.map('map').setView([20.983383, 105.86633], 17);
var osmDataAttr = 'Map data &copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors';
      var mopt = {
          url: 'https://api.mapbox.com/styles/v1/mapbox/streets-v9/tiles/256/{z}/{x}/{y}?access_token=pk.eyJ1IjoiY3dtIiwiYSI6InFoYkpvS00ifQ.WHqQ_q865NKjIQB6Wpoi2w',
          options: {attribution:'© <a href="https://www.mapbox.com/map-feedback/">Mapbox</a> © <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'}
        };
      var osm = L.tileLayer("http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",{attribution:osmDataAttr});
      var mq=L.tileLayer(mopt.url,mopt.options);

      mq.addTo(m);

      var baseMaps = {
          "Mapbox Streets": mq,
          "Open Street Map":osm
      };


function popUp(f,l){
    var out = [];
    if (f.properties){
        for(key in f.properties){
            out.push(key+": "+f.properties[key]);
        }
        l.bindPopup(out.join("<br />"));
    }
}
var jsonTest = new L.GeoJSON.AJAX("colleges.geojson",{onEachFeature:popUp});
var jsonpTest = L.geoJson.ajax("counties.jsonp",{onEachFeature:popUp,dataType:"jsonp"});

jsonTest.addTo(m);
var overlays={
"json":jsonTest,
"jsonp":jsonpTest
}

var lc=L.control.layers(baseMaps,overlays);
lc.addTo(m);
</script>

    </body>
</html>

