var URLBASEMAP = 'http://g1.cloudgis.vn/services/rest/maps';
var URLBASESERVICE = '/gservices/rest';
var URLGCITYWORK = '/gCityworkServices/rest/citywork/gsv_data';
var SERVICEID = 'gsv_system';
var DATASERVICEIDS = [];
DATASERVICEIDS[1] = 'gsv_data';
var URLGEONAME = URLBASESERVICE + '/geoname/' + SERVICEID;
var URLDIRECTION = '';
//var serivceBussiness = 'https://gis21.thuathienhue.gov.vn:4001';
//var hostPortal = 'https://gis21.thuathienhue.gov.vn:4000';

var AU_CODE = '01';
var MAPDEFAULTEXTENT = { "left": 105.4101646847674, "bottom": 15.172644962777687, "right": 109.81842884491894, "top": 17.431658441704304 };

var APPLICATIONS = []; //siteId tương ứng với từng tên ứng dụng
APPLICATIONS[1] = "gcloud";
APPLICATIONS[2] = "gMic";
var FEATUREINFOPAGE = [];
FEATUREINFOPAGE["gMic"] = "gmicfeatureinfo.aspx";

//mảng bản đồ nền theo cấu hình dịch vụ
var ARRAY_BASEMAP = {
  //  giaothong: ["http://g1.cloudgis.vn/services/rest/maps/roadmap/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/roadmap/tile/${z}/${x}/${y}.png"],
 //   hanhchinh: ["http://g1.cloudgis.vn/services/rest/maps/adminmap/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/adminmap/tile/${z}/${x}/${y}.png"],
    googlemap: ["http://g1.cloudgis.vn/services/rest/maps/googlemap/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/googlemap/tile/${z}/${x}/${y}.png"],
   // googlesat: ["http://g1.cloudgis.vn/services/rest/maps/googlesat/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/googlesat/tile/${z}/${x}/${y}.png"]
    googlesat: ["https://gis21.thuathienhue.gov.vn/gservices/rest/maps/googlesat/tile/${z}/${x}/${y}.png"],
	gtthuathienhue: ["https://gis21.thuathienhue.gov.vn/gservices/rest/maps/hue_giaothong/tile/${z}/${x}/${y}.png"],
	bddhthuathienhue: ["https://gis21.thuathienhue.gov.vn/gservices/rest/maps/hue_diahinh/tile/${z}/${x}/${y}.png"]
}

var MAP_CONFIG = {
    "chuDe": "",
    "khungNhinHienTai": null,
    "loaiBanDo": "BDCD",
    "maBanDo": "",
    "maUngDung": "",
    "moTa": "",
    "mucXemLonNhat": 22,
    "mucXemNhoNhat": 0,
    "nguoiCapNhat": "",
    "nguoiTao": "",
    "tenBanDo": "",
    "tuKhoa": "",
    "vungBaoGioiHan": MAPDEFAULTEXTENT,
    "vungBaoLonNhat": MAPDEFAULTEXTENT,
    "vungBaoNhoNhat": null,
    "mauNenMacDinh": "#FFFFFF",
    "cacLopBanDo": [{
        "cauHinhHienThi": null,
        "dieuKienLoc": "",
        "duongDan": '["http://g1.cloudgis.vn/services/rest/maps/googlesat/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/googlesat/tile/${z}/${x}/${y}.png"]',
        "duongDanAnh": "",
        "heQuyChieu": "",
        "hienThi": false,
        "kieuKhongGian": "IMAGE",
        "kieuTrinhBay": "",
        "laLopNen": true,
        "lopDuLieu": "",
        "maBanDo": "",
        "maDichVu": "googlesat",
        "maLopBanDo": "",
        "moTa": "",
        "mucHienThi": 0,
        "mucXemLonNhat": 22,
        "mucXemNhoNhat": 0,
        "thuTuHienThi": 4,
        "nhom": "",
        "tenLopBanDo": "Vệ tinh",
        "trinhBayNangCao": null,
        "vungBaoLonNhat": null,
        "vungBaoNhoNhat": null

    }, {
        "cauHinhHienThi": null,
        "dieuKienLoc": "",
        "duongDan": '["http://g1.cloudgis.vn/services/rest/maps/googlemap/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/googlemap/tile/${z}/${x}/${y}.png"]',
        "duongDanAnh": "",
        "heQuyChieu": "",
        "hienThi": true,
        "kieuKhongGian": "IMAGE",
        "kieuTrinhBay": "",
        "laLopNen": true,
        "lopDuLieu": "",
        "maBanDo": "",
        "maDichVu": "googlemap",
        "maLopBanDo": "",
        "moTa": "",
        "mucHienThi": 0,
        "mucXemLonNhat": 22,
        "mucXemNhoNhat": 0,
        "thuTuHienThi": 3,
        "nhom": "",
        "tenLopBanDo": "Google",
        "trinhBayNangCao": null,
        "vungBaoLonNhat": null,
        "vungBaoNhoNhat": null
    }, {
        "cauHinhHienThi": null,
        "dieuKienLoc": "",
        "duongDan": '["http://g1.cloudgis.vn/services/rest/maps/roadmap/tile/${z}/${x}/${y}.png","http://g2.cloudgis.vn/services/rest/maps/roadmap/tile/${z}/${x}/${y}.png"]',
        "duongDanAnh": "",
        "heQuyChieu": "",
        "hienThi": false,
        "kieuKhongGian": "IMAGE",
        "kieuTrinhBay": "",
        "laLopNen": true,
        "lopDuLieu": "",
        "maBanDo": "",
        "maDichVu": "giaothong",
        "maLopBanDo": "",
        "moTa": "",
        "mucHienThi": 0,
        "mucXemLonNhat": 18,
        "mucXemNhoNhat": 0,
        "thuTuHienThi": 2,
        "nhom": "",
        "tenLopBanDo": "Giao thông",
        "trinhBayNangCao": null,
        "vungBaoLonNhat": null,
        "vungBaoNhoNhat": null
    }, {
        "cauHinhHienThi": null,
        "dieuKienLoc": "",
        "duongDan": '["http://g1.cloudgis.vn/services/rest/maps/adminmap/tile/${z}/${x}/${y}.png", "http://g2.cloudgis.vn/services/rest/maps/adminmap/tile/${z}/${x}/${y}.png"]',
        "duongDanAnh": "",
        "heQuyChieu": "",
        "hienThi": false,
        "kieuKhongGian": "IMAGE",
        "kieuTrinhBay": "",
        "laLopNen": true,
        "lopDuLieu": "",
        "maBanDo": "",
        "maDichVu": "hanhchinh",
        "thuTuHienThi": 1,
        "maLopBanDo": "",
        "moTa": "",
        "mucHienThi": 0,
        "mucXemLonNhat": 18,
        "mucXemNhoNhat": 0,
        "nhom": "",
        "tenLopBanDo": "Hành chính",
        "trinhBayNangCao": null,
        "vungBaoLonNhat": null,
        "vungBaoNhoNhat": null
    }]
}
