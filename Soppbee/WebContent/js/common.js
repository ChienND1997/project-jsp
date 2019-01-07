var gMaps = new gServer.Maps();
var map = null;
var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");
var URLBASESERVICE = '/gservices/rest';
var SERVICEID = 'gsv_system';
var DATAID = 'gsv_data';
//dserver
var URLDSERVERSERVICE = '/gservices/rest/dserver';
var DSERVERID = SERVICEID;
var DSERVERID_MANAGER = "drs_mgr"; //service quản trị file của thư mục kho tài liệu
var URLDSERVICES = URLDSERVERSERVICE + "/" + DSERVERID;
//vectormaps
var URLSERVICEVECTORMAP = URLBASESERVICE + "/vectormaps" + "/" + SERVICEID; //các service liên quan đến vectormaps

//geodata
var GEODATAURL = URLBASESERVICE + "/geodatas";

//geoname
var URLGEONAME = URLBASESERVICE + '/geoname/diadanh';
//filemanager
var FILEMANAGERURL = URLBASESERVICE + "/filemanagers/filemgr/";

var URL_GEOELEVATION = URLBASESERVICE + "/geoelevation";

var URL_GEODATAS = URLBASESERVICE + "/geodatas/" + DATAID;


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
