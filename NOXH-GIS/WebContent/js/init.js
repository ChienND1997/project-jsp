var result = [];
var layerShort;
var _layers = [];
var cauHinhLayerShortList;
var configLayerShort;
var _configMap
var ThonhTinCHiTietShortList = [];
var _fieldRelation = [];
var _fieldsSearch = [];
var _activeMap = false;
var defaultStyle = new OpenLayers.Style({
    'strokeWidth': 4,
    fillColor: "LightGoldenrod1",
    strokeColor: "#F0A71F",
    pointRadius: 15,
    'externalGraphic': "gCitywork/gCloudgis/ShortList/images/location.png"
});
var selectStyle = new OpenLayers.Style({
    strokeWidth: 4,
    fillColor: "LightGoldenrod1",
    strokeColor: "#0000FF",
    pointRadius: 15,
    'externalGraphic': "gCitywork/gCloudgis/ShortList/images/locationactive.png"
});
var styleMap = new OpenLayers.StyleMap({
    'default': defaultStyle,
    'select': selectStyle
});
function applyMargins() {

    var leftToggler = $(".mini-submenu-left");
    var rightToggler = $(".mini-submenu-right");
    if (leftToggler.is(":visible")) {
        $("#map .ol-zoom")
          .css("margin-left", 0)
          .removeClass("zoom-top-opened-sidebar")
          .addClass("zoom-top-collapsed");
    } else {
        $("#map .ol-zoom")
          .css("margin-left", $(".sidebar-left").width())
          .removeClass("zoom-top-opened-sidebar")
          .removeClass("zoom-top-collapsed");
    }
    if (rightToggler.is(":visible")) {
        $("#map .ol-rotate")
          .css("margin-right", 0)
          .removeClass("zoom-top-opened-sidebar")
          .addClass("zoom-top-collapsed");
    } else {
        $("#map .ol-rotate")
          .css("margin-right", $(".sidebar-right").width())
          .removeClass("zoom-top-opened-sidebar")
          .removeClass("zoom-top-collapsed");
    }
}
function isConstrained() {
    return $("div.mid").width() == $(window).width();
}
function applyInitialUIState() {
    if (isConstrained()) {
        $(".sidebar-left .sidebar-body").fadeOut('slide');
        $(".sidebar-right .sidebar-body").fadeOut('slide');
        $('.mini-submenu-left').fadeIn();
        $('.mini-submenu-right').fadeIn();
    }
}
var DonViHanhChinh;
$(function () {
    $(".modal [data-toggle='modal']").click(function () {
        $(this).closest(".modal").modal('hide');
    });

    $('#StartDate').datepicker()
        .on('changeDate', function (ev) {
            $('#StartDate').datepicker('hide');
        });
    $('#EndDate').datepicker()
         .on('changeDate', function (ev) {
             $('#EndDate').datepicker('hide');
         });

    $('.dropdown-submit-input .dropdown-menu a').click(function (e) {
        e.preventDefault();
        $(this).closest('.dropdown-submit-input').find('input').val($(this).data('value'));
        $(this).closest('form').submit();
    });
    $('.dropdown-toggle').dropdown();

    // Fix input element click problem
    $('.dropdown input, .dropdown label, .dropdown select,.dropdown button ,.dropdown a, .dropdown div').click(function (e) {
        e.stopPropagation();
    });

    $("#txtSearch").keypress(function (event) {
        if (event.keyCode == 13) {
            OnClickTimKiem();
            return false;
        }
    });
    $('#StartDate').datepicker({
        format: "DD/MM/YYYY"
    });
    $('#EndDate').datepicker({
        format: "DD/MM/YYYY"
    });

    //$('.fancybox').fancybox();
    $("#lovely-things-list").height($(window).height() - 110);
    $('.sidebar-left .slide-submenu').on('click', function () {
        var thisEl = $(this);
        thisEl.closest('.sidebar-body').fadeOut('slide', function () {
            $('.mini-submenu-left').fadeIn();
            applyMargins();
        });
    });
    $('.mini-submenu-left').on('click', function () {
        var thisEl = $(this);
        $('.sidebar-left .sidebar-body').toggle('slide');
        thisEl.hide();
        applyMargins();
    });
    $('.sidebar-right .slide-submenu').on('click', function () {
        var thisEl = $(this);
        thisEl.closest('.sidebar-body').fadeOut('slide', function () {
            $('.mini-submenu-right').fadeIn();
            applyMargins();
        });
    });
    $('.mini-submenu-right').on('click', function () {
        var thisEl = $(this);
        $('.sidebar-right .sidebar-body').toggle('slide');
        thisEl.hide();
        applyMargins();
    });
    $(window).on("resize", applyMargins);
    //Load Ban do
    var itemID = getQuerystring("itemID");
    var url = URLDSERVICES + '/item/' + itemID;
    $.ajax({
        type: "GET",
        url: url,
        dataType: "jsonp",
        success: function (data) {
            var checkItemID = data.ItemID;
            if (checkItemID != "") {
                var AppConfig;
                AppConfig = JSON.parse(data.Config);
                _configMap = AppConfig.config;
                DonViHanhChinh = AppConfig.dvhc;
                var layers = _configMap.layers;
                var title = AppConfig.title;
                $("#idtitle").text(title);
                if (AppConfig.titlesub != undefined)
                    $('#TieuDe_Sub').html(AppConfig.titlesub);
                else $('#TieuDe_Sub').html(title);
                var mapid = _configMap.mapid;
                var url = URLSERVICEVECTORMAP + "/map/" + mapid;
                $.ajax({
                    type: "GET",
                    url: url,
                    dataType: "jsonp",
                    success: function (mapconfig) {
                        map = gMaps.addMap(new gClient.VectorMap('map'));
                        addLayerShortlist();
                        var cacLopBanDo = mapconfig.cacLopBanDo;
                        var cacLopBanDoNew = [];
                        if (cacLopBanDo.length > 0) {

                            for (var i = 0; i < cacLopBanDo.length; i++) {
                                if (cacLopBanDo[i].maLopBanDo + "" == layers[0].id + "") {
                                    cauHinhLayerShortList = cacLopBanDo[i];
                                }
                                if (cacLopBanDo[i].kieuKhongGian == "IMAGE")
                                    cacLopBanDoNew.push(cacLopBanDo[i]);
                            }
                        }
                        //Tạo panel tìm kiếm theo cấu hình gserver
                        var tablerelation = _configMap.tablerelation;
                        if (tablerelation == "true") {
                            var url_fields = GEODATAURL + "/" + cauHinhLayerShortList.maDichVu + "/" + cauHinhLayerShortList.lopDuLieu + '/-1';
                            $.ajax({
                                type: 'GET',
                                url: url_fields,
                                async: false,
                                //contentType: "application/json; charset=utf-8",
                                dataType: 'jsonp',
                                success: function (data) {

                                    if (data != null) {
                                        var fields = data.fields;
                                        for (var k = 0; k < fields.length; k++) {
                                            if (fields[k].showsearch != '0') {
                                                _fieldsSearch.push(fields[k]);
                                            }
                                            if (fields[k].viewtype == 'tablerelation') {
                                                _fieldRelation.push(fields[k]);
                                            }
                                        }
                                    }
                                }
                            });
                        }
                        var tabTimKiem = _configMap.TimKiemNangCao;
                        if (tabTimKiem == "tkthongtinduongpho") {
                            $("#TabDuongPho").attr("style", "display:block");
                            $("#TabDuAnDauTu").attr("style", "display:none");
                            $("#TabDuAnDauTuDPT").attr("style", "display:none");
                        }
                        else if (tabTimKiem == "tkduandangphattrien") {
                            $("#TabDuongPho").attr("style", "display:none");
                            $("#TabDuAnDauTu").attr("style", "display:none");
                            $("#TabDuAnDauTuDPT").attr("style", "display:block");
                        } else if (tabTimKiem == "tkduandautu") {
                            $("#TabDuongPho").attr("style", "display:none");
                            $("#TabDuAnDauTu").attr("style", "display:block");
                            $("#TabDuAnDauTuDPT").attr("style", "display:none");
                        }
                        mapconfig.cacLopBanDo = cacLopBanDoNew;
                        //open map
                        map.openVectorMap(mapconfig);
                        //Thao tac du lieu
                        mapHienThiDuLieu(cauHinhLayerShortList, DonViHanhChinh);
                    },
                    error: function (status) {
                    }
                });
            }
        },
        error: function (status) {
        }
    });
    //end
    applyInitialUIState();
    applyMargins();
});
var layerVecter_ShortList = "";
var controlSelect_ShortList = ""
function dinhViBanDoShortList(arrayList, iszoom) {
    controlSelect_ShortList.unselectAll();   //Unselect các đối tượng cũ
    for (var i = 0; i < arrayList.length; i++) {
        var fea = layerVecter_ShortList.getFeatureBy('idFeature', arrayList[i].xDaiDien + '_' + arrayList[i].yDaiDien); //Tìm kiếm feature theo code
        controlSelect_ShortList.select(fea); //Select đối tượng tìm được
    }
    if (iszoom == '1') {
        var lonlat = new OpenLayers.LonLat(arrayList[0].xDaiDien, arrayList[0].yDaiDien).transform(EPSG_4326, map.getProjectionObject());
        map.setCenter(lonlat); //set center vào đối tượng
    }
}
function getURLByFilter(filter) {
    var url = GEODATAURL + "/" + _layer.maDichVu + "/" + _layer.lopDuLieu + "?outFormat=json";
    if (filter != undefined && filter != '')
        url = url + "&filter=" + filter;
    var fields = 'madoituong,malienket,xdaidien,ydaidien,';
    var cauHinhHienThi = _layer.cauHinhHienThi;
    for (var i = 0; i < cauHinhHienThi.length; i++) {
        if (cauHinhHienThi[i].showcollapse != 0) {
            fields += cauHinhHienThi[i].name.toLowerCase() + ",";
        }
    }
    return url;
}
function OnClickTimKiem() {
    var valueSearch = $('#txtSearch').val();
    var arrChHienThi = _configMap.fieldTKCoBan;
    var chHienThi = null;

    for (var i = 0; i < arrChHienThi.length; i++) {
        chHienThi = arrChHienThi[i];
        break;
    }
    if (chHienThi == null)
        return;
    var TimKiemConten = "";
    if (chHienThi != null) {
        TimKiemConten = chHienThi.name.toLowerCase().trim();
    }
    var filter = '';
    if (valueSearch != '') {
        filter = TimKiemConten + " like N'%" + valueSearch + "%'";
    }
    var url = getURLByFilter(encodeURI(filter));
    ShowDuLieu(url);
}
function mapHienThiDuLieu(layer, DVHC) {
    var maTinh = DVHC.madvhc;
    var tableTinh = DVHC.tableTinh;
    var tableHuyen = DVHC.tableHuyen;
    var tableXa = DVHC.tableXa;
    var URL_DSHUYEN = URL_GEODATAS + '/' + tableHuyen;
    var url_huyen = URL_DSHUYEN + '?filter=maTinh=' + maTinh;
    $.ajax({
        type: 'GET',
        dataType: 'jsonp',
        url: url_huyen,
        success: function (data) {
            var dsQuanHuyen = data.searchResult;
            var arrChHienThi = _configMap.donvihanhchinh;
            var fieldsMaHuyen = arrChHienThi.mahuyen;
            var fieldTenHuyen = arrChHienThi.tenhuyen;
            var htmlconten = "";
            htmlconten += "<option value='0'>Tất cả</option>";
            for (var i = 0; i < dsQuanHuyen.length; i++) {
                var value = dsQuanHuyen[i][fieldsMaHuyen.name.toLowerCase()];
                var tenhuyen = dsQuanHuyen[i][fieldTenHuyen.name.toLowerCase()];
                htmlconten += "<option value='" + value + "'>" + tenhuyen + "</option>";
            }
            $('#SlQuanHuyen').html(htmlconten);
            $('#SLQuanHuyenDA').html(htmlconten);
        },
        complete: function () {

        },
        error: function () { }
    });

    _layer = layer;
    var filter = '';
    if (_layer.dieuKienLoc != undefined && _layer.dieuKienLoc != '')
        filter = encodeURI(_layer.dieuKienLoc);
    var url = getURLByFilter(filter);
    ShowDuLieu(url);
}
var feass = [];
function ShowDuLieu(url) {
    layerShort = cauHinhLayerShortList;
    configLayerShort = _layers;

    var fields = 'madoituong,malienket,xdaidien,ydaidien,';

    var imagefield = '';
    var imagename = '';
    var titlefield = '';
    var videofield = '';
    var sortfield = '';
    try {
        imagefield = configLayer.imagefield.toLowerCase();
        imagename = configLayer.imagename.toLowerCase();
        titlefield = configLayer.titlefield.toLowerCase();
        videofield = configLayer.videofield.toLowerCase();

        sortfield = configLayer.sortfield.toLowerCase();
    } catch (e) {
    }
    if (imagefield == '' || imagefield == undefined) imagefield = 'hinhanh';
    if (imagename == '' || imagename == undefined) imagename = 'anhdaidien.jpg';
    if (titlefield == '' || titlefield == undefined) titlefield = 'tendoituong';
    if (videofield == '' || videofield == undefined) videofield = 'video';
    if (sortfield == '' || sortfield == undefined) sortfield = '';
    $.ajax({
        type: "GET",
        url: url,
        async: false,
        dataType: "jsonp",
        success: function (data) {
            $('#TongSoBanGhi').html(data.resultCount);
            result = data.searchResult;
            for (var i = 0; i < result.length; i++) {
                if (result[i][imagefield] != null && result[i][imagefield] != undefined) {
                    if (result[i][imagefield] == '')
                        result[i]['anhdaidienfooter'] = FILEMANAGERURL + '/content/' + DATAID + '/' + _layer.lopDuLieu + '/' + result[i].madoituong + '/' + imagefield + '/' + imagename;
                    else
                        result[i]['anhdaidienfooter'] = FILEMANAGERURL + '/content/' + result[i][imagefield] + '/' + imagename;
                }
            }
        },
        error: function (status) {

        }
    });

    var arrChHienThi = _configMap.cauHinhHienThi;
    var arrChtIimKiem = _configMap.CauHinhTimKiem;
    var chHienThi = null;
    var chTimKiem = null;
    if (arrChtIimKiem != undefined) {
        for (var i = 0; i < arrChtIimKiem.length; i++) {
            if (arrChtIimKiem[i].tenBang == _layer.lopDuLieu) {
                chTimKiem = arrChtIimKiem[i];
                break;
            }
        }
    }

    for (var i = 0; i < arrChHienThi.length; i++) {
        if (arrChHienThi[i].tenBang == _layer.lopDuLieu) {
            chHienThi = arrChHienThi[i];
            break;
        }
    }
    if (chHienThi == null)
        return;

    var fieldsTTChung = chHienThi.fieldsThongTinChung;
    var fieldTieuDe = chHienThi.fieldTieuDe;
    var fieldChiTiet = chHienThi.fieldChiTiet;
    var html = "";
    html += '<ul class="list-group" id="ulShortList">'

    var fieldsTieuDeTK = chTimKiem.fieldTieuDe;
    var fieldsTrinhBayTK = chTimKiem.fieldsTrinhBay;
    var lstMaDT = '';
    for (var i = 0; i < result.length; i++) {
        var maDT = result[i].madoituong;
        lstMaDT += maDT;
        if (i != result.length - 1) lstMaDT += ',';
        html += '<li class="list-group-item" id="item_' + result[i].madoituong + '" style="cursor:pointer;padding-top:0px;border-right:0px;"  onclick=ChiTietShortList(' + result[i].madoituong + ',1) >';
        if (fieldsTieuDeTK != null) {
            var chiTiet = result[i][fieldsTieuDeTK.name.toLowerCase().trim()];
            html += '<b style="padding-top: 5px; width:100%;float:left"><span class="name">' + chiTiet + '</span></b>'
        }
        for (var j = 0; j < fieldsTrinhBayTK.length; j++) {
            var alias = fieldsTrinhBayTK[j].alias;
            var value = result[i][fieldsTrinhBayTK[j].name.toLowerCase()];
            if (value) {
                html += '<br>' + alias + ': ' + value.substring(0, 50) + "...";
            } else {
                html += '<br>' + alias + ': ' + value;
            }
        }
        html += '</li>'
    }
    html += '</ul>';
    $('#lovely-things-list').html(html);
    //hiliegh bản đồ
    layerVecter_ShortList.removeAllFeatures();
    var format = new OpenLayers.Format.WKT();

    for (var i = 0; i < result.length; i++) {
        var lon = result[i].xdaidien;
        var lat = result[i].ydaidien;
        var point = new OpenLayers.Geometry.Point(lon, lat).transform(EPSG_4326, EPSG_900913);
        var geom = result[i].geom;
        var typeGeo = format.read(geom);
        if (typeGeo != undefined) {
            typeGeo.geometry.transform(EPSG_4326, EPSG_900913);
            typeGeo.madoituong = result[i].madoituong;
            typeGeo.idFeature = lon + '_' + lat;
            typeGeo.attributes = result[i];
            typeGeo.attributes.maDoiTuong = result[i].madoituong;
            typeGeo.attributes.maLienKetCha = null;
            feass.push(typeGeo);
        }
    }
    //Add cacs feature quan hệ nếu có
    for (var i = 0; i < _fieldRelation.length; i++) {
        var sources = JSON.parse(_fieldRelation[i].sources);
        var source = sources.source;
        var des = sources.destination;
        var filter = " " + des.key + " in (select " + source.key + " from " + source.table + " where madoituong in (" + lstMaDT + "))";
        var url = GEODATAURL + "/" + _layer.maDichVu + "/" + des.table + "?outFormat=json";
        url = url + "&filter=" + filter;
        $.ajax({
            type: "GET",
            url: url,
            async: false,
            dataType: "jsonp",
            success: function (data) {
                var result = data.searchResult;
                for (var j = 0; j < result.length; j++) {
                    var lon = result[j].xdaidien;
                    var lat = result[j].ydaidien;
                    var point = new OpenLayers.Geometry.Point(lon, lat).transform(EPSG_4326, EPSG_900913);
                    var pointFeature = new OpenLayers.Feature.Vector(point);
                    pointFeature.idFeature = lon + '_' + lat;
                    pointFeature.attributesSub = result[j];
                    pointFeature.attributes.maDoiTuong = null;
                    pointFeature.attributes.maLienKetCha = result[j]['' + des.key.toLowerCase() + '']
                    feass.push(pointFeature);
                }
            },
            error: function (status) {
            }
        });
    }
    layerVecter_ShortList.addFeatures(feass);

    if (result.length > 0) {

        ChiTietShortList(result[0].madoituong, 1);
        if ($('#item_' + result[0].madoituong).hasClass('active') == false) {
            $('.list-group-item').removeClass('active');
            $('#item_' + result[0].madoituong).addClass('active');
        }
    }
    else {
        layerVecter_ShortList.removeAllFeatures();
        map.removeAllPopup();
    }
}

function addLayerShortlist() {
    layerVecter_ShortList = new OpenLayers.Layer.Vector('ShortList', { styleMap: styleMap });
    map.addLayers([layerVecter_ShortList]);
    controlSelect_ShortList = new OpenLayers.Control.SelectFeature(
                           layerVecter_ShortList,
                       {
                           clickout: true, toggle: false,
                           multiple: true, hover: false,
                           toggleKey: "ctrlKey", // ctrl key removes from selection
                           multipleKey: "shiftKey" // shift key adds to selection
                           //box: true
                       }
                   );
    map.addControl(controlSelect_ShortList);
    controlSelect_ShortList.activate();
    layerVecter_ShortList.events.on({
        'featureselected': function (evt) {

            var feature = evt.feature;
            var attribute = feature.attributes;
            if (_activeMap) {
                //  controlSelect_ShortList.unselectAll();
                var maDoiTuong = attribute.madoituong;
                if (maDoiTuong == null || maDoiTuong == undefined) {
                    var malienKet = attribute.maLienKetCha;
                    for (var i = 0; i < result.length; i++) {
                        if (result[i].malienket == malienKet) {
                            maDoiTuong = result[i].madoituong;
                            attribute = result[i];
                            break;
                        }
                    }
                }
                ChiTietShortList(maDoiTuong, 0);
                if ($('#item_' + maDoiTuong).hasClass('active') == false) {
                    $('.list-group-item').removeClass('active');
                    $('#item_' + maDoiTuong).addClass('active');
                }
                $('#lovely-things-list').scrollTop(0);
                var kc = $('#item_' + maDoiTuong).offset().top;
                $('#lovely-things-list').scrollTop(kc - 200);
            }
        }
    });
}
function ChiTietShortList(maDoiTuong, iszoom) {
    _activeMap = false;
    var data = [];
    var checkshow = false;
    var heightFormInfo = null;
    var widthFormInfo = null;
    var status_thongtinchung = true;
    for (var i = 0; i < result.length; i++) {
        if (result[i].madoituong == maDoiTuong) {
            data = result[i];
            break;
        }
    }
    if (data.geom == "Null") {
        console.log(feass);
        console.log(data);
        $('#ulShortList li').on('click', function () {
            $('#ulShortList li').removeClass('active');
            $(this).addClass('active');
        });
        controlSelect_ShortList.unselectAll();
        map.removeAllPopup();
        var sub = [];
        // _activeMap = true;
        var array = [];
        for (var i = 0; i < feass.length; i++) {
            if (feass[i].attributesSub != undefined) {
                var par = feass[i].attributes;
                sub.push(feass[i].attributesSub);
            }

        }
        for (var i = 0; i < sub.length; i++) {
            array.push({ xDaiDien: sub[i].xdaidien, yDaiDien: sub[i].ydaidien })
        }
        dinhViBanDoShortList(array, iszoom);
        _activeMap = true;
        if (sub.length > 0) {
            for (var i = 0; i < sub.length; i++) {
                if (data.malienket == sub[i].maduandt) {
                    if (data.madoituong == maDoiTuong || maDoiTuong != undefined) {
                        var htmlModal = "";
                        var htmlcontenTab = "";
                        var htmlcontenTabMoTa = "";
                        var htmlcontenTabChiTiet = "";
                        var htmlcontenTabHinhAnh = "";
                        htmlModal += '<div class="modal-dialog" style="margin-top:6%">'
                        var resulstThongTin = cauHinhLayerShortList.cauHinhHienThi;
                        var key;
                        var datas = [];
                        var datass = [];
                        var Thongtinchung = false;
                        var html = ""
                        var AddHtmlhtmleditor
                        var doiTuongHienThi = [];
                        var arrFieldHTML = [];
                        var arrFieldAnh = [];
                        var arrFieldVieo = [];
                        var htmlThongTinChung = AddThongTinChung(data);
                        html += '<div id="conten" class="MiniPopup">';
                        html += htmlThongTinChung;
                        html += '</div>';

                        var lonlat = new OpenLayers.LonLat(sub[0].xdaidien, sub[0].ydaidien).transform(EPSG_4326, EPSG_900913);
                        //map.setCenter(lonlat);
                        map.removeAllPopup();
                        var popup = new OpenLayers.Popup.CSSFramedCloud("chicken",
                                                             lonlat,
                                                             null,
                                                             html,
                                                             null, true, function (evt) {
                                                                 map.removeAllPopup(); controlSelect_ShortList.unselectAll();
                                                                 $('#ulShortList li').removeClass('active');
                                                             });
                        map.addPopup(popup);
                        $('#ulShortList li').on('click', function () {
                            $('#ulShortList li').removeClass('active');
                            $(this).addClass('active');
                        });
                        $('[data-toggle="popover"]').popover({
                            //placement: 'bottom',
                            container: 'body',
                            html: true,
                            title: '<span class="text-info"><strong>Thông tin chi tiết</strong></span>',
                        });
                        $('.fancybox').fancybox();
                    }
                } else {

                    controlSelect_ShortList.unselectAll();
                    map.removeAllPopup();
                    alert('Không xác đinh được vị trí trên bản đồ !');
                    return;
                };
            }
        }
        else {
            alert('Không xác đinh được vị trí trên bản đồ !');
        }
        return;
    }
    var arrF = [];
    if (_fieldRelation.length > 0) {
        var sources = JSON.parse(_fieldRelation[0].sources);
        var source = sources.source;
        var des = sources.destination;
        var filter = " " + des.key + " in (select " + source.key + " from " + source.table + " where madoituong = " + data.madoituong + ")";
        var url = GEODATAURL + "/" + _layer.maDichVu + "/" + des.table + "?outFormat=json";
        url = url + "&filter=" + filter;
        var resultSub = [];
        $.ajax({
            type: "GET",
            url: url,
            async: false,
            dataType: "jsonp",
            success: function (data) {
                resultSub = data.searchResult;
            },
            error: function (status) {
            }
        });
        if (resultSub.length > 0) {
            //add các điểm sub
            for (var i = 0; i < resultSub.length; i++) {
                arrF.push({ xDaiDien: resultSub[i].xdaidien, yDaiDien: resultSub[i].ydaidien });
            }
        }
    }

    arrF.push({ xDaiDien: data.xdaidien, yDaiDien: data.ydaidien });
    dinhViBanDoShortList(arrF, iszoom);
    _activeMap = true;

    if (data.madoituong == maDoiTuong || maDoiTuong != undefined) {
        var htmlModal = "";
        var htmlcontenTab = "";
        var htmlcontenTabMoTa = "";
        var htmlcontenTabChiTiet = "";
        var htmlcontenTabHinhAnh = "";
        htmlModal += '<div class="modal-dialog" style="margin-top:6%">'
        var resulstThongTin = cauHinhLayerShortList.cauHinhHienThi;
        var key;
        var datas = [];
        var datass = [];
        var Thongtinchung = false;
        var html = ""
        var AddHtmlhtmleditor
        var doiTuongHienThi = [];
        var arrFieldHTML = [];
        var arrFieldAnh = [];
        var arrFieldVieo = [];
        var htmlThongTinChung = AddThongTinChung(data);
        html += '<div id="conten" class="MiniPopup">';
        html += htmlThongTinChung;
        html += '</div>';

        var lonlat = new OpenLayers.LonLat(data.xdaidien, data.ydaidien).transform(EPSG_4326, EPSG_900913);
        //map.setCenter(lonlat);
        map.removeAllPopup();
        var popup = new OpenLayers.Popup.CSSFramedCloud("chicken",
                                             lonlat,
                                             null,
                                             html,
                                             null, true, function (evt) {
                                                 map.removeAllPopup(); controlSelect_ShortList.unselectAll();
                                                 $('#ulShortList li').removeClass('active');
                                             });
        map.addPopup(popup);
        $('#ulShortList li').on('click', function () {
            $('#ulShortList li').removeClass('active');
            $(this).addClass('active');
        });
        $('[data-toggle="popover"]').popover({
            //placement: 'bottom',
            container: 'body',
            html: true,
            title: '<span class="text-info"><strong>Thông tin chi tiết</strong></span>',
        });
        $('.fancybox').fancybox();
    }
}

function AddThongTinChung(data) {
    var arrChHienThi = _configMap.cauHinhHienThi;
    var chHienThi = null;
    for (var i = 0; i < arrChHienThi.length; i++) {
        if (arrChHienThi[i].tenBang == _layer.lopDuLieu) {
            chHienThi = arrChHienThi[i];
            break;
        }
    }
    if (chHienThi == null)
        return;
    var fieldsTTChung = chHienThi.fieldsThongTinChung;
    var fieldTieuDe = chHienThi.fieldTieuDe;
    var fieldsChiTiet = chHienThi.fieldsChiTiet;
    var fieldHinhAnh = chHienThi.fieldHinhAnh;
    var fieldsKieuHienThi = chHienThi.kieuHienThiPopup;
    var widthModal = chHienThi.widthPopup;
    var heightModal = chHienThi.heightPopup;
    var htmlcontenTab = "";
    var html = "";
    if (fieldTieuDe != null) {
        var chiTiet = data[fieldTieuDe.name.toLowerCase().trim()];
        var subChiTiet = chiTiet;

        htmlcontenTab += "<h4><span style='font-size: 16px;'><b>" + subChiTiet + "</b></span></h4>";
    }
    for (var i = 0; i < fieldsTTChung.length; i++) {
        var alias = fieldsTTChung[i].alias;
        var value = data[fieldsTTChung[i].name.toLowerCase()];
        htmlcontenTab += "<p>" + alias + ": " + value + "</p>";
    }
    if (fieldsChiTiet != null) {
        if (fieldsKieuHienThi == "modal") {
            if (widthModal == undefined && heightModal == undefined) {
                $("#modal-dialog").css({ "width": "800", "height": "500" });
            }
            else {
                $("#modal-dialog").css({ "width": '' + widthModal + '', "height": '' + heightModal + '' });
            }
            for (var i = 0; i < fieldsChiTiet.length; i++) {
                var chiTiet = data[fieldsChiTiet[i].name.toLowerCase().trim()];
                var alias = fieldsChiTiet[i].alias;
                var htmlNoiDung = '';

                htmlNoiDung += chiTiet;
                $('#modal-title').html(alias);
                $('#modal-body').html(htmlNoiDung);
                chiTiet = chiTiet.replace(/'/g, "\"");
                htmlcontenTab += "<p>" + alias + ": ";
                htmlcontenTab += "<a href='#ModalS' onclick='show()'  title='Thông tin chi tiết' data-toggle='modal'>Xem chi tiết</a></p>";
            }
        } else {
            for (var i = 0; i < fieldsChiTiet.length; i++) {
                var chiTiet = data[fieldsChiTiet[i].name.toLowerCase().trim()];
                var alias = fieldsChiTiet[i].alias;
                chiTiet = chiTiet.replace(/'/g, "\"");
                htmlcontenTab += "<p>" + alias + ": ";
                htmlcontenTab += "<a href='#' id='example' data-html='true' data-toggle='popover' data-trigger='focus' data-content='" + chiTiet + "'>Xem chi tiết</a></p>";
            }
        }
    }
    if (fieldHinhAnh != null) {
        var chiTiet = data[fieldHinhAnh.name.toLowerCase().trim()];
        var alias = fieldHinhAnh.alias;
        var htmHinhAnh = getHTMLHinhAnhPopup(data.madoituong, fieldHinhAnh.name.toLowerCase().trim());
        htmHinhAnh = htmHinhAnh.replace(/'/g, "\"");
        htmlcontenTab += "<p>" + alias + ": ";
        htmlcontenTab += "<a href='#'  title='Danh sách ảnh' data-html='true' data-toggle='popover' data-trigger='focus' data-content='" + htmHinhAnh + "'>Hình ảnh</a></p>";
    }
    html += '<div id="Thongtinchung" class="tab-pane fade in active" style="width:100%;">';
    html += htmlcontenTab;
    html += '</div>';
    return html;
}

function getHTMLHinhAnhPopup(maDoiTuong, fieldHinhAnh) {
    var urlhinhanh = FILEMANAGERURL + '/metadata/' + DATAID + '/' + layerShort.lopDuLieu + '/' + maDoiTuong + '/' + fieldHinhAnh;
    var htmlF = "";
    $.ajax({
        url: urlhinhanh,
        type: 'GET',
        async: false,
        dataType: 'jsonp',
        success: function (dataResponse) {
            var lstData = dataResponse.Nodes;
            for (var i = 0; i < lstData.length; i++) {
                if (i % 3 == 0) {
                    htmlF += "<p style='padding-bottom:10px'>";
                }
                htmlF += "<a style='padding:5px' class='fancybox' href = '" + FILEMANAGERURL + '/content/' + lstData[i].PathFileView + "' data-fancybox-group = 'shortList'>"
                + "<img src = '" + FILEMANAGERURL + '/content/' + lstData[i].PathFileView + "' width='130px' height='130px' /></a>";
                if (i % 3 == 2) {
                    htmlF += "</p>";
                }
                if (i == lstData.length - 1 && i % 3 != 2) {
                    htmlF += "</p>";
                }
            }
        }
    });
    return htmlF;
}

var htmlliiMT = "";
function AddHtml(data, fieldDetail) {
    var alias = fieldDetail.alias;
    var value = data[fieldDetail.name.toLowerCase()];
    var html = "";
    html += '<div id="' + fieldDetail.name + '" style="height: 400px !important;padding-top: 10px;padding-left: 14px;padding-right: 14px;padding-button: 14px" class="tab-pane fade">';
    html += value;
    html += '</div>';
    return html;
}

function Addfobject(data, fileDetail) {
    var alias = fileDetail.alias;
    var value = data[fileDetail.name.toLowerCase()];
    var html = "";
    html += '<div id="' + fileDetail.name + '" style="height: 400px !important" class="tab-pane fade">';
    html += value;
    html += '</div>';
    return html;
}

function OnClickTimKiemNangCaoDuongPho() {
    var valueTenDuong = $('#inputTenDuong').val();
    var valueQuanHuyen = $('#SlQuanHuyen').find(":selected").text();
    // var valueLoaiTen = $('#SLoaiTen').val();
    console.log($('#SlQuanHuyen').find(":selected").val())
    var valueLoaiTen = "";
    valueLoaiTen = $('#SLoaiTen').find(":selected").text();
    var filter = '';
    if (valueTenDuong != "")
        if (filter == "")
            filter += "tenDuong like N'%" + valueTenDuong + "%'";
        else filter += " and tenDuong like N'%" + valueTenDuong + "%'";
    if (valueQuanHuyen != "Tất cả")
        if (filter == "")
            filter += "quanHuyen like N'%" + valueQuanHuyen + "%'";
        else filter += " and quanHuyen like N'%" + valueQuanHuyen + "%'";
    if (valueLoaiTen != "Tất cả")
        if (filter == "")
            filter += "loaiTen like N'%" + valueLoaiTen + "%'";
        else filter += " and loaiTen like N'%" + valueLoaiTen + "%'";
    var url = getURLByFilter(encodeURI(filter));
    ShowDuLieu(url);
}

function OnClickTimKiemNangCaoDuAn() {
    var valueTenDuAn = $('#inputTenDuAn').val();
    var valueQuanHuyen = $('#SLQuanHuyenDA').find(":selected").text();
    // var valueLoaiTen = $('#SLoaiTen').val();
    var valueLinhVuc = "";
    valueLinhVuc = $('#Linhvuc').find(":selected").text();
    var filter = '';
    if (valueTenDuAn != "")
        if (filter == "")
            filter += "tenDuAn like N'%" + valueTenDuAn + "%'";
        else filter += " and tenDuAn like N'%" + valueTenDuAn + "%'";
    if (valueQuanHuyen != "Tất cả")
        if (filter == "")
            filter += "quanHuyen like N'%" + valueQuanHuyen + "%'";
        else filter += " and quanHuyen like N'%" + valueQuanHuyen + "%'";
    if (valueLinhVuc != "Tất cả")
        if (filter == "")
            filter += "linhVuc like N'%" + valueLinhVuc + "%'";
        else filter += " and linhVuc like N'%" + valueLinhVuc + "%'";
    var url = getURLByFilter(encodeURI(filter));
    ShowDuLieu(url);
}

function OnClickTimKiemNangCaoDuAnDPT() {
    var valueTenDuANDPT = $('#inputTenDuAnDPT').val();
    var valueDiaDiem = $('#inputdiaDiem').val();
    // var valueLoaiTen = $('#SLoaiTen').val();
    var valueTuNgay = $('#StartDate').val();
    //console.log($("#StartDate").datepicker({ dateFormat: "dd-mm-yy" }).val())
    var valueDenNgay = $('#EndDate').val();
    var dateStart = new Date(valueTuNgay);
    var dateEnd = new Date(valueDenNgay);
    $('#error').text("");
    if (dateStart > dateEnd) {
        $('#error').text("Ngày bắt đầu phải nhỏ hơn ngày kết thúc!")
        return;
    }
    var filter = '';
    if (valueTenDuANDPT != "")
        if (filter == "")
            filter += "tenDuAn like N'%" + valueTenDuANDPT + "%'";
        else filter += " and tenDuAn like N'%" + valueTenDuANDPT + "%'";
    if (valueDiaDiem != "")
        if (filter == "")
            filter += "diaDiem like N'%" + valueDiaDiem + "%'";
        else filter += " and diaDiem like N'%" + valueDiaDiem + "%'";
    if (valueTuNgay != "" && valueDenNgay != "")
        if (filter == "")
            filter += "ngay between CONVERT(datetime,'" + valueTuNgay + "',103) and CONVERT(datetime,'" + valueDenNgay + "',103)";
        else filter += " and ngay between CONVERT(datetime,'" + valueTuNgay + "',103) and CONVERT(datetime,'" + valueDenNgay + "',103)";
    else if (valueTuNgay != "" && valueDenNgay == "")
        if (filter == "")
            filter += "ngay > CONVERT(datetime,'" + valueTuNgay + "',103)";
        else filter += " and ngay > CONVERT(datetime,'" + valueTuNgay + "',103)";
    else if (valueTuNgay == "" && valueDenNgay != "")
        if (filter == "")
            filter += "ngay < CONVERT(datetime,'" + valueDenNgay + "',103)";
        else filter += " and ngay < CONVERT(datetime,'" + valueDenNgay + "',103)";
    var url = getURLByFilter(encodeURI(filter));
    ShowDuLieu(url);
}
function XoaTimKiem() {
    //
    $('#inputTenDuong').val('');
    $('#SlQuanHuyen option[value=0]').attr('selected', 'selected');
    $('#SLoaiTen option[value=1]').attr('selected', 'selected');
    //
    $('#inputTenDuAn').val("");
    $('#SLQuanHuyenDA option[value=0]').attr('selected', 'selected');
    $('#Linhvuc option[value=1]').attr('selected', 'selected');
    //
    $('#inputTenDuAnDPT').val("");
    $('#inputdiaDiem').val("");
    $('#StartDate').val("");
    $('#EndDate').val("");
    //
    var filter = '';
    var url = getURLByFilter(encodeURI(filter));
    ShowDuLieu(url);
}
function show() {
    $("#ModalS").modal();
}
function maxSize() {
    $("#ModalS")
       .css("display", "block")
    $('#ModalS').modal({
        backdrop: 'static',
        keyboard: true
    });
    $("#modal-dialog")
        // .css("display", "block")
         .removeClass("zoom-miniSize")
         .addClass("zoom-max");
}
//function miniSize() {
//    $("#ModalS")
//       .css("display", "block")
//    $('#ModalS').modal({
//        backdrop: 'static',
//        keyboard: true
//    });
//    $("#modal-dialog")
//        // .css("margin-left", 0)
//         .removeClass("zoom-max")
//         .addClass("zoom-miniSize");

//}