
/**
* @requires gClient/Core/Layer/Markers.js
*/

/**
* Class: gClient.Map
*
* Ví dụ:
* >
*
* Kế thừa từ:
*  - <gClient.Map>
*/

gClient.VectorMap = OpenLayers.Class(gClient.Map, {

	selectFeatureControl: null, //control select
	hoverFeatureControl: null, //control hover
	featureselected_callback: null,
	featureunselected_callback: null,

	arrayChart: [], //danh sách biểu đồ 
	arrayGroupLayer: [], //danh sách nhóm lớp bản đồ
	arrayDataLayer: [],
	masterLayer: null,
	mauNenMacDinh: '#FFFFFF', //mặc định màu nền trắng cho lớp nền mặc định
	cauHinhMoRong: null, //cấu hình các thuộc tính mở rộng của map
	UUID: null,
	/** 
    * APIMethod: constructor đối tượng <gClient.VectorMap>
    * Hàm khởi tạo/// <reference path="VectorMap.js" />

    *
    * Parameters:
    * div - <string> - Mã thẻ div chưa bản đồ
    * BaseMaps - <array> - Mảng đối tượng basemap
    */
	initialize: function (div, BaseMaps) {
		this.masterLayer = null;
		this.arrayChart = [];
		this.arrayGroupLayer = [];
		this.arrayDataLayer = [];
		this.controls = [
				new OpenLayers.Control.ScaleLine(),
				new OpenLayers.Control.Navigation(),
				new gClient.Control.BaseLayerSwitcher(),
				new gClient.Control.PanZoomBarV2()];

		OpenLayers.Map.prototype.initialize.apply(this, arguments);

		var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
		var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");

		var max_extent = new OpenLayers.Bounds(
					102.06723935844, 8.3449739956849, 109.54867032767, 23.26804108858);
		if (typeof (MAX_EXTENT) != 'undefined' && MAX_EXTENT != undefined && MAX_EXTENT != null) {
			max_extent = MAX_EXTENT.clone();
		}
		this.markerLayer = new gClient.Layer.Markers("markers", {});
		this.addLayer(this.markerLayer);
		this.markerLayer.map = this;
		//=======Add HoverLayer====================
		this.hoverLayer = new gClient.Layer.Markers("hover", {});
		this.addLayer(this.hoverLayer);
		this.hoverLayer.map = this;
		this.hoverLayer.displayInLayerSwitcher = false;
		//=======Add selectLayer====================
		this.selectLayer = new OpenLayers.Layer.Vector("layerSelect", {
			isBaseLayer: false
		});
		this.addLayer(this.selectLayer);
		this.selectLayer.map = this;
		this.selectLayer.displayInLayerSwitcher = false;
		//=======End add selectLayer====================

		max_extent.transform(EPSG_4326, EPSG_900913);

		//Giới hạn mưc zoom
		this.maxExtent = max_extent;
		this.projection = EPSG_900913;
		this.displayProjection = EPSG_4326;
		this.units = 'm';

		//BaseMaps : Danh sách các bản đồ nền
		if (BaseMaps != undefined) {
			for (var i = 0; i < BaseMaps.length; i++) {
				var nameLayerTem = BaseMaps[i].name;
				var maxLevel = BaseMaps[i].maxLevel;
				var urlLayer = BaseMaps[i].url; // +'/tile/${z}/${x}/${y}.png';
				var layerTem = new gClient.Layer.gServer(nameLayerTem, urlLayer, {
					minLevel: 0,
					maxLevel: maxLevel
				});
				this.addLayer(layerTem);
			}
			this.zoomToExtent(max_extent);
		}
		this.hoverFeatureControl = new OpenLayers.Control.SelectFeature([], {
			clickout: true,
			toggle: true,
			multiple: false,
			hover: true,
			highlightOnly: true,
			renderIntent: "temporary",
			toggleKey: "ctrlKey", // ctrl key removes from selection
			multipleKey: "shiftKey" // shift key adds to selection

		});
		this.selectFeatureControl = new gClient.Control.SelectFeature([], {
			clickout: true,
			toggle: false,
			multiple: false,
			hover: true,
			toggleKey: "ctrlKey", // ctrl key removes from selection
			multipleKey: "shiftKey", // shift key adds to selection
			map: this
		}, 'onFeatureSelected');

		this.hoverFeatureControl.handlers['feature'].stopDown = false;
		this.hoverFeatureControl.handlers['feature'].stopUp = false;
		this.selectFeatureControl.handlers['feature'].stopDown = false;
		this.selectFeatureControl.handlers['feature'].stopUp = false;
		this.addControl(this.hoverFeatureControl);
		this.addControl(this.selectFeatureControl);
		this.arrayChart = [];

		//đăng ký sự kiện zoomend của map để hiển thị theo mức xem cấu hình của lớp bản đồ
		//this.events.register('zoomend', this, this.zoomendMap);
	},


	zoomendMap: function () {
		var ls = this.layers;
		var shouldRedraw = false;
		for (var i = 0; i < ls.length; i++) {
			if (ls[i].displayInLayerSwitcher == true && ls[i].isBaseLayer == false) {
				if (ls[i].checked != undefined) continue;
				var zoomLevel = this.getZoomCurrent();
				if (ls[i].mucXemNhoNhat == undefined || ls[i].mucXemNhoNhat == null
                    || ls[i].mucXemLonNhat == undefined || ls[i].mucXemLonNhat == null) continue;

				if (zoomLevel >= ls[i].mucXemNhoNhat && zoomLevel <= ls[i].mucXemLonNhat) {
					var min = null;
					var max = null;
					//lấy mức xem của group layer
					var group = this.arrayGroupLayer;
					for (var k = 0; k < group.length; k++) {
						if (group[k].maLopBanDo.toString() == ls[i].nhom.toString()) {
							min = group[k].mucXemNhoNhat;
							max = group[k].mucXemLonNhat;
							break;
						}
					}
					if (min != null && max != null) {
						if (ls[i].mucXemNhoNhat >= min && ls[i].mucXemLonNhat <= max)
							flag = true;
						else if (ls[i].mucXemNhoNhat <= min && min <= zoomLevel
                                && ls[i].mucXemLonNhat >= max && max >= zoomLevel)
							flag = true;

						else
							flag = false;
					}
					else
						flag = true;
				}
				else {
					flag = false;
				}
				if (flag == true && ls[i].getVisibility() != flag)
					shouldRedraw = true;
				ls[i].setVisibility(flag, false);
			}
		}
		//console.log(shouldRedraw);
		if(this.masterLayer) this.masterLayer.redraw(shouldRedraw);
	},

	/** 
    * APIMethod: openVectorMap
    * Mở bản đồ theo đối tượng mapconfig trả về
    *
    * Parameters:
    * config - <object> or <string> Đối tượng JSON hoặc đường dẫn dịch vụ bản đồ
    * callback - <Function(data)> Hàm callback với trường hợp openVectorMap là đường dẫn dịch vụ bản đồ
    * option - <object>: Lựa chọn thêm: khung nhìn hiện tại
    */
	openVectorMap: function (config, callback, options) {
	    var me = this;
        
        //nếu tồn tại tham số x, y, level thì zoom đến vị trí đó
	    if (typeof getUrlVars == 'undefined') {
	        function getUrlVars() {
	            var vars = [], hash;
	            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
	            for (var i = 0; i < hashes.length; i++) {
	                hash = hashes[i].split('=');
	                vars.push(hash[0]);
	                vars[hash[0]] = hash[1];
	            }
	            return vars;
	        }
	    }
	    var level = getUrlVars()["level"];
	    var x = getUrlVars()["x"];
	    var y = getUrlVars()["y"];

	    var khungNhinHienTai = null;
	    if (level != undefined && x != undefined && y != undefined) {
	        khungNhinHienTai = {
	            level: level,
	            x: x,
	            y: y
	        };
	        options = options || {};
	        if (options.khungNhinHienTai == undefined) {
	            options.khungNhinHienTai = khungNhinHienTai;
	        }
	    }
		function openmap(mapconfig) {
			if (mapconfig == undefined || mapconfig == null) return;
			var layerActive = null;
			var layerBlank = null; //layer basemap default
			//remove các layer dữ liệu thuộc map
			for (var i = me.layers.length - 1; i >= 0; i--) {
				if (me.layers[i].CLASS_NAME == 'gClient.Layer.Canvas')
					me.removeLayer(me.layers[i]);
			}
			var mauNen = mapconfig.mauNenMacDinh;
			var cauHinhMoRong = null;
			var layerIds = '';
			try {
				cauHinhMoRong = JSON.parse(mapconfig.cauHinhMoRong);
			} catch (ex) { }

			me.cauHinhMoRong = cauHinhMoRong;
			if (mauNen == undefined || mauNen == null) mauNen = '#FFFFFF';
			me.mauNenMacDinh = mauNen;

			var maBanDo = mapconfig.maBanDo;
			var tenBanDo = mapconfig.tenBanDo;
			var moTa = mapconfig.moTa;
			var loaiBanDo = mapconfig.loaiBanDo;
			var nguoiTao = mapconfig.nguoiTao;
			var nguoiCapNhat = mapconfig.nguoiCapNhat;
			var cacLopBanDo = mapconfig.cacLopBanDo;
			var bieuDo = mapconfig.bieuDo;
			var vungBaoHienTai_map = mapconfig.khungNhinHienTai;
			var vungBaoNhoNhat_map = mapconfig.vungBaoNhoNhat;
			var vungBaoLonNhat_map = mapconfig.vungBaoLonNhat;
			var vungBaoGioiHan_map = mapconfig.vungBaoGioiHan;
			var mucXemNhoNhat_map = mapconfig.mucXemNhoNhat;
			var mucXemLonNhat_map = mapconfig.mucXemLonNhat;

			//gán thông tin map
			me.UUID = (mapconfig.UUID) ? mapconfig.UUID : '';
			me.maBanDo = maBanDo;
			me.tenBanDo = tenBanDo;
			me.moTa = moTa;
			me.loaiBanDo = loaiBanDo;
			me.nguoiTao = nguoiTao;
			me.nguoiCapNhat = nguoiCapNhat;
			me.vungBaoGioiHan = vungBaoGioiHan_map;
			me.vungBaoLonNhat = vungBaoLonNhat_map;
			me.vungBaoNhoNhat = vungBaoNhoNhat_map;
			me.khungNhinHienTai = vungBaoHienTai_map;
			me.mucXemLonNhat = mucXemLonNhat_map;
			me.mucXemNhoNhat = mucXemNhoNhat_map;
			me.bieuDo = bieuDo;
			if (cacLopBanDo == undefined || cacLopBanDo == null) cacLopBanDo = [];
			for (var i = 0; i < cacLopBanDo.length; i++) {
				var item = cacLopBanDo[i];
				var maLopBanDo = item.maLopBanDo;
				var tenLopBanDo = item.tenLopBanDo;
				var moTa = item.moTa;
				var maBanDo = item.maBanDo;
				var lopDuLieu = item.lopDuLieu;
				var heQuyChieu = item.heQuyChieu;
				var kieuKhongGian = item.kieuKhongGian;
				var maDichVu = item.maDichVu;
				var trinhBayNangCao = item.trinhBayNangCao;
				var duongDanAnh = item.duongDanAnh;
				var laLopNen = item.laLopNen;
				var hienThi = item.hienThi;
				var nhom = item.nhom;
				var duongDan = me.ChuanHoaDuongDan(item.duongDan);
				var kieuTrinhBay = item.kieuTrinhBay;
				var mucXemNhoNhat = item.mucXemNhoNhat;
				var mucXemLonNhat = item.mucXemLonNhat;
				var vungBaoNhoNhat = item.vungBaoNhoNhat;
				var vungBaoLonNhat = item.vungBaoLonNhat;
				var cauHinhHienThi = item.cauHinhHienThi;
				var cauHinhNhan = item.cauHinhNhan;
				var thuTuHienThi = item.thuTuHienThi;
				var mucHienThi = item.mucHienThi;
				var maLopDuLieu = item.maLopDuLieu;
				var cauHinhMoRong = item.cauHinhMoRong;
				var hienthimacdinh = true;
				//lấy theo cấu hình mở rộng
				if (cauHinhMoRong != null) {
					try {
						var chmr = JSON.parse(cauHinhMoRong);
						hienThi = chmr.hienThiMacDinh;
						hienthimacdinh = chmr.hienThiMacDinh;
					} catch (ex) { }
				}
				var c = true;
				//lấy theo mức xem nhỏ nhất và level hiện tại
				if (vungBaoHienTai_map != null && vungBaoHienTai_map != ''
                    && vungBaoHienTai_map.level != undefined) {
					if (mucXemNhoNhat > vungBaoHienTai_map.level) {
						c = false;
					}
				}

				var whereClause = (item.dieuKienLoc != undefined) ? item.dieuKienLoc : '';

				if (kieuKhongGian.toUpperCase() == 'GROUP' || kieuKhongGian.toUpperCase() == 'GROUPDATA') {
					me.addGroupLayer(new gClient.Layer.Canvas(tenLopBanDo, duongDan, {
						maLopBanDo: maLopBanDo,
						maBanDo: maBanDo,
						tenLopBanDo: tenLopBanDo,
						moTa: moTa,
						maLopDuLieu: maLopDuLieu,
						lopDuLieu: lopDuLieu,
						heQuyChieu: heQuyChieu,
						kieuKhongGian: kieuKhongGian,
						maDichVu: maDichVu,
						trinhBayNangCao: trinhBayNangCao,
						duongDan: duongDan,
						kieuTrinhBay: kieuTrinhBay,
						mucXemNhoNhat: mucXemNhoNhat,
						mucXemLonNhat: mucXemLonNhat,
						mucHienThi: mucHienThi,
						cauHinhHienThi: cauHinhHienThi,
						cauHinhNhan: cauHinhNhan,
						dieuKienLoc: whereClause,
						laLopNen: laLopNen,
						hienThi: hienThi,
						nhom: nhom,
						thuTuHienThi: item.thuTuHienThi,
						vungBaoLonNhat: vungBaoLonNhat,
						vungBaoNhoNhat: vungBaoNhoNhat,
						cauHinhMoRong: cauHinhMoRong,
						map: me,
						getCauHinhHienThi: me.getCauHinhHienThi
					}));
				}
				else if (kieuKhongGian.toUpperCase() == 'DATA') {
					me.addDataLayer(new gClient.Layer.Canvas(tenLopBanDo, duongDan, {
						maLopBanDo: maLopBanDo,
						maBanDo: maBanDo,
						tenLopBanDo: tenLopBanDo,
						moTa: moTa,
						maLopDuLieu: maLopDuLieu,
						lopDuLieu: lopDuLieu,
						heQuyChieu: heQuyChieu,
						kieuKhongGian: kieuKhongGian,
						maDichVu: maDichVu,
						trinhBayNangCao: trinhBayNangCao,
						duongDan: duongDan,
						kieuTrinhBay: kieuTrinhBay,
						mucXemNhoNhat: mucXemNhoNhat,
						mucXemLonNhat: mucXemLonNhat,
						mucHienThi: mucHienThi,
						cauHinhHienThi: cauHinhHienThi,
						cauHinhNhan: cauHinhNhan,
						dieuKienLoc: whereClause,
						laLopNen: laLopNen,
						hienThi: hienThi,
						nhom: nhom,
						thuTuHienThi: item.thuTuHienThi,
						vungBaoLonNhat: vungBaoLonNhat,
						vungBaoNhoNhat: vungBaoNhoNhat,
						cauHinhMoRong: cauHinhMoRong,
						map: me,
						getCauHinhHienThi: me.getCauHinhHienThi
					}));
				}
				else if (kieuKhongGian.toUpperCase() == 'CHART') {
					me.addChartLayer(new gClient.Layer.Canvas(tenLopBanDo, duongDan, {
						maLopBanDo: maLopBanDo,
						maBanDo: maBanDo,
						tenLopBanDo: tenLopBanDo,
						moTa: moTa,
						lopDuLieu: lopDuLieu,
						heQuyChieu: heQuyChieu,
						kieuKhongGian: kieuKhongGian,
						maDichVu: maDichVu,
						trinhBayNangCao: trinhBayNangCao,
						duongDan: duongDan,
						maLopDuLieu: maLopDuLieu,
						kieuTrinhBay: kieuTrinhBay.length > 0 ? JSON.parse(kieuTrinhBay) : '',
						mucXemNhoNhat: mucXemNhoNhat,
						mucXemLonNhat: mucXemLonNhat,
						mucHienThi: mucHienThi,
						cauHinhHienThi: cauHinhHienThi,
						cauHinhNhan: cauHinhNhan,
						dieuKienLoc: whereClause,
						laLopNen: laLopNen,
						hienThi: hienThi,
						nhom: nhom,
						thuTuHienThi: item.thuTuHienThi,
						vungBaoLonNhat: vungBaoLonNhat,
						vungBaoNhoNhat: vungBaoNhoNhat,
						cauHinhMoRong: cauHinhMoRong,
						map: me,
						getCauHinhHienThi: me.getCauHinhHienThi
					}));
				}
				else if (kieuKhongGian.toUpperCase() != 'HEATMAP'
				&& kieuKhongGian.toUpperCase() != 'IMAGE' && laLopNen == false) {// Trường hợp là layer Canvas
					kieuTrinhBay = kieuTrinhBay.length > 0 ? JSON.parse(kieuTrinhBay) : '';
					var layerTem = null;

					//chỉnh sửa lại các defautls style từ version 1.1 trở về trước
					try {
						var rules = kieuTrinhBay.styles['default'].rules;
						if (rules.length == 1 && rules[0].filter == undefined) //chỉ tồn tại 1 rule và không có filter tức là rule defaults
						{
							kieuTrinhBay.styles['default'].title = rules[0].title;
							kieuTrinhBay.styles['default'].defaultStyle = rules[0].symbolizer;
							kieuTrinhBay.styles['default'].rules = new Array();
						}
					} catch (ex) { }


					layerIds += maLopBanDo + ',';

					//lớp không được hiển thị mặc định thì luôn luôn tắt
					layerTem = new gClient.Layer.Canvas(tenLopBanDo, duongDan, {
						maLopBanDo: maLopBanDo,
						maBanDo: maBanDo,
						tenLopBanDo: tenLopBanDo,
						moTa: moTa,
						lopDuLieu: lopDuLieu,
						heQuyChieu: heQuyChieu,
						kieuKhongGian: kieuKhongGian,
						maDichVu: maDichVu,
						trinhBayNangCao: trinhBayNangCao,
						duongDan: duongDan,
						maLopDuLieu: maLopDuLieu,
						kieuTrinhBay: kieuTrinhBay, // item.kieuTrinhBay,
						mucXemNhoNhat: mucXemNhoNhat,
						mucXemLonNhat: mucXemLonNhat,
						mucHienThi: mucHienThi,
						cauHinhHienThi: cauHinhHienThi,
						cauHinhNhan: cauHinhNhan,
						dieuKienLoc: whereClause,
						laLopNen: laLopNen,
						hienThi: hienThi && c,
						nhom: nhom,
						thuTuHienThi: item.thuTuHienThi,
						vungBaoLonNhat: vungBaoLonNhat,
						vungBaoNhoNhat: vungBaoNhoNhat,
						cauHinhMoRong: cauHinhMoRong,
						map: me,
						getCauHinhHienThi: me.getCauHinhHienThi
					});
					if (layerTem.tileSize == null)
						layerTem.tileSize = me.tileSize;
					if (!hienthimacdinh)
						layerTem.checked = hienThi;//gán cờ cho layer

					me.addLayer(layerTem);

					layerTem.hover = true;
					if (layerTem.labelLayer) {
						layerTem.labelLayer.setZIndex((layerTem.getZIndex() + 2));
					}
				} else {
					//nếu cấu hình map hiển thị nhỏ nhất hoặc lớn nhất
					var minLevelBaseMap = (mucXemNhoNhat == undefined || mucXemNhoNhat == null || mucXemNhoNhat.length == 0) ? 0 : parseFloat(mucXemNhoNhat);
					var maxLevelBaseMap = (mucXemLonNhat == undefined || mucXemLonNhat == null || mucXemLonNhat.length == 0) ? 22 : parseFloat(mucXemLonNhat);

					//tồn tại minLevel của map
					if (mucXemNhoNhat_map != undefined && mucXemNhoNhat_map != null
					&& minLevelBaseMap < parseFloat(mucXemNhoNhat_map)) {
						minLevelBaseMap = parseFloat(mucXemNhoNhat_map);
					}

					//tồn tại maxLevel của map
					if (mucXemLonNhat_map != undefined && mucXemLonNhat_map != null && maxLevelBaseMap > parseFloat(mucXemLonNhat_map)) {
						maxLevelBaseMap = parseFloat(mucXemLonNhat_map);
					}

					try {
						if (typeof (ARRAY_BASEMAP) != 'undefined' && ARRAY_BASEMAP[maDichVu]) //tồn tại cấu hình mảng dịch vụ nền
							duongDan = ARRAY_BASEMAP[maDichVu];
						else {
							var arrayDD = JSON.parse(duongDan);
							duongDan = arrayDD;
						}
					} catch (ex) { }

					//add các lớp bản đồ nền
					var layerItem = new gClient.Layer.gServer(tenLopBanDo, duongDan, {
						maLopBanDo: maLopBanDo,
						maBanDo: maBanDo,
						tenLopBanDo: tenLopBanDo,
						moTa: moTa,
						maLopDuLieu: maLopDuLieu,
						lopDuLieu: lopDuLieu,
						heQuyChieu: heQuyChieu,
						kieuKhongGian: kieuKhongGian,
						maDichVu: maDichVu,
						trinhBayNangCao: trinhBayNangCao,
						duongDan: duongDan,
						kieuTrinhBay: kieuTrinhBay, // item.kieuTrinhBay,
						mucXemNhoNhat: minLevelBaseMap,
						mucXemLonNhat: maxLevelBaseMap,
						mucXemBanDoLonNhat: mucXemLonNhat_map,
						mucHienThi: mucHienThi,
						cauHinhHienThi: cauHinhHienThi,
						cauHinhNhan: cauHinhNhan,
						dieuKienLoc: whereClause,
						laLopNen: laLopNen,
						hienThi: hienThi && c,
						nhom: nhom,
						thuTuHienThi: item.thuTuHienThi,
						vungBaoLonNhat: vungBaoLonNhat,
						vungBaoNhoNhat: vungBaoNhoNhat
					});
					if (hienThi && layerActive == null && laLopNen == true)
						layerActive = layerItem; //lưu lại baselayer được active

					//gán cờ cho layer
					if (!hienthimacdinh)
						layerItem.checked = hienThi;

					me.addLayer(layerItem);
				}
			}
			var level = 0;
			if (layerBlank == null) {
				//lấy mức xem nhỏ nhất và lớn nhất của lớp nền mặc định

				var b = me.getBaseLayers();
				var minBlank = mucXemNhoNhat_map;
				var maxBlank = mucXemLonNhat_map;
				level = minBlank;

				for (var i = 0; i < b.length; i++) {
					//lấy min của các mức xem nhỏ nhất của các lớp nền
					if (parseInt(minBlank) > parseInt(b.mucXemNhoNhat)) minBlank = parseInt(b.mucXemNhoNhat);

					//lấy max của các mức xem lớn nhất của các lớp nền
					if (parseInt(maxBlank) < parseInt(b.mucXemLonNhat)) maxBlank = parseInt(b.mucXemLonNhat);
				}

				layerBlank = new gClient.Layer.Blank('Không nền', '', {
					backgroundColor: mauNen, kieuKhongGian: 'BLANK',
					mucXemNhoNhat: minBlank,
					mucXemLonNhat: maxBlank
				});
			}

			layerIds = layerIds.substr(0, layerIds.length - 1);
			if (maBanDo && layerIds.length > 0) {
				var mapurl = '/gservices/rest/geodatas/' + maBanDo + '/' + layerIds + '/tile/${z}/${x}/${y}?srs=4326';
				if (typeof (URLRESTHOST) != 'undefined' && URLRESTHOST != undefined && URLRESTHOST != null)
					mapurl = URLRESTHOST + mapurl;
				me.masterLayer = new gClient.Layer.Canvases('masterLayer', mapurl, { map: me });
				me.masterLayer.displayInLayerSwitcher = false;
				me.addLayer(me.masterLayer);
			}
			me.addLayer(layerBlank); //basemap default
			//set default base layer
			if (layerActive != null) {
				me.setBaseLayer(layerActive);
			}
			else me.setBaseLayer(layerBlank);

			var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
			var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");

			var restricted_Extent = null;
			//Vùng bao giới hạn
			if (vungBaoGioiHan_map != null && vungBaoGioiHan_map != "") {
				restricted_Extent = new OpenLayers.Bounds(
            			vungBaoGioiHan_map.left, vungBaoGioiHan_map.bottom, vungBaoGioiHan_map.right, vungBaoGioiHan_map.top);
				restricted_Extent.transform(EPSG_4326, EPSG_900913);
				me.restrictedExtent = restricted_Extent;
			}
			//Vùng bao lớn nhất
			var max_extent = null;
			if (vungBaoLonNhat_map != null && vungBaoLonNhat_map != "") {

				max_extent = new OpenLayers.Bounds(
            			vungBaoLonNhat_map.left, vungBaoLonNhat_map.bottom, vungBaoLonNhat_map.right, vungBaoLonNhat_map.top);
				max_extent.transform(EPSG_4326, EPSG_900913);
				me.maxExtent = max_extent;
			}
			if (options != undefined && options.khungNhinHienTai != undefined && options.khungNhinHienTai != null) {
				vungBaoHienTai_map = options.khungNhinHienTai;
			}
			//Zoom tới vùng hiện tại nếu có, nếu không thì zoom tới vùng maxExtent
			if (vungBaoHienTai_map != null && vungBaoHienTai_map != '' && vungBaoHienTai_map.x != '' && vungBaoHienTai_map.y != '' && vungBaoHienTai_map.level != '') {
				if (layerActive != null) level = layerActive.mucXemNhoNhat;
				me.setCenter((new OpenLayers.LonLat(vungBaoHienTai_map.x, vungBaoHienTai_map.y).transform(EPSG_4326, EPSG_900913)), vungBaoHienTai_map.level - level); //set center & level hiện tại
			} else if (max_extent != null) {
				me.zoomToExtent(me.maxExtent);
			}
			//me.hoverFeatureControl.setLayer(me.getVectorLayer());
			var layers = me.getVectorLayer();
			if (layers.length > 0) {
				me.selectFeatureControl.setLayer(layers);
			}
			me.selectFeatureControl.activate();
			me.events.register('addlayer', me, me.newLayerAdded);
			me.events.register('zoomend', me, me.zoomendMap);
			if (me.masterLayer)
				me.masterLayer.startRenderer();
		}

		if (typeof (config) == 'string') //nếu là đường dẫn dịch vụ
		{
			config = me.ChuanHoaDuongDan(config);
			this.duongDanDichVu = config;
			$.ajax({
				type: 'GET',
				url: config,
				contentType: "application/jsonp; charset=utf-8",
				dataType: 'jsonp',
				success: function (data) {
					openmap(data);
					if (callback != undefined)
						callback(data);
				},
				error: function () {
					openmap(null);
					if (callback != undefined)
						callback(null);
				}
			});
		} else
			openmap(config); //nếu là đối tượng JSON
	},

	newLayerAdded: function (obj) {
		var map = obj.object;
		var layer = obj.layer;
		if (layer.CLASS_NAME == 'gClient.Layer.Canvas') {
			map.selectFeatureControl.setLayer(layer);
			if (!map.masterLayer) {
				var mapurl = '/gservices/rest/geodatas/' + map.maBanDo + '/' + layer.maLopBanDo + '/tile/${z}/${x}/${y}?srs=4326';
				map.masterLayer = new gClient.Layer.Canvases('masterLayer', mapurl, { map: map });
				map.masterLayer.displayInLayerSwitcher = false;
				map.addLayer(map.masterLayer);
			}
			if (layer.grid.length == 0)
				layer.initGriddedTiles(map.getExtent());
			for (var i = 0; i < layer.map.masterLayer.tiles.length; i++) {
				layer.map.masterLayer.tiles[i].reRender();
			}
			layer.events.on({ 'visibilitychanged': layer.map.masterLayer.layerChangeVisibility });
		}
	},
	/** 
    * APIMethod: ChuanHoaDuongDan
    * Chuẩn hóa đường dẫn dịch vụ
    *
    * Parameters:
    * url - <string> Chuẩn hóa đường dẫn
    */
	ChuanHoaDuongDan: function (url) {
		//nếu tồn tại đường dẫn host và đường dẫn chuẩn hóa không phải đường dẫn tuyệt đối
		if (typeof (URLRESTHOST) != 'undefined' && URLRESTHOST != undefined && URLRESTHOST != null
			&& url != undefined && url.toLowerCase().match('http') == null)
			return URLRESTHOST + url;
		else
			return url;
	},

	/** 
    * APIMethod: addVectorLayer
    * Thêm lớp bản đồ vào bản đồ
    *
    * Parameters:
    * layer - <gClient.Layer> Lớp bản đồ
    */
	addVectorLayer: function (layer) {
		this.addLayer(layer);
	},

	/** 
    * APIMethod: removeVectorLayer
    * Xóa lớp bản đồ từ bản đồ
    *
    * Parameters:
    * layer - <gClient.Layer> Lớp bản đồ
    */
	removeVectorLayer: function (layer) {
		this.removeLayer(layer);
		this.hoverFeatureControl.setLayer(this.getVectorLayer());
		this.selectFeatureControl.setLayer(this.getVectorLayer());
	},

	/** 
    * APIMethod: addGroupLayer
    * Thêm lớp dữ liệu dạng group vào bản đồ
    *
    * Parameters:
    * layer - <gClient.Layer> Nhóm lớp bản đồ
    */
	addGroupLayer: function (layer) {
		this.arrayGroupLayer.push(layer);
	},

	/** 
    * APIMethod: removeGroupLayer
    * Xóa lớp bản đồ dạng group, không phải không gian từ bản đồ
    *
    * Parameters:
    * layer - <gClient.Layer.Canvas> Nhóm lớp bản đồ
    */
	removeGroupLayer: function (layer) {
		if (layer == undefined || layer == null || layer.maLopBanDo == undefined) return;
		for (var index = 0; index < this.arrayGroupLayer.length; index++) {
			if (layer.maLopBanDo.toLowerCase() === this.arrayGroupLayer[index].maLopBanDo.toLowerCase()) {
				delete this.arrayGroupLayer.splice(index, 1);
				break;
			}
		}
	},

	/** 
    * APIMethod: addDataLayer
    * Thêm lớp dữ liệu thuộc tính vào bản đồ
    *
    * Parameters:
    * layer - <gClient.Layer> Lớp thuộc tính
    */
	addDataLayer: function (layer) {
		this.arrayDataLayer.push(layer);
	},

	/** 
    * APIMethod: removeDataLayer
    * Xóa lớp bản đồ dạng dữ liệu, không phải không gian từ bản đồ
    *
    * Parameters:
    * layer - <gClient.Layer.Canvas> Lớp bản đồ
    */
	removeDataLayer: function (layer) {
		if (layer == undefined || layer == null || layer.maLopBanDo == undefined) return;
		for (var index = 0; index < this.arrayDataLayer.length; index++) {
			if (layer.maLopBanDo.toLowerCase() === this.arrayDataLayer[index].maLopBanDo.toLowerCase()) {
				delete this.arrayDataLayer.splice(index, 1);
				break;
			}
		}
	},


	/** 
    * APIMethod: addChartLayer
    * Thêm lớp biểu đồ
    *
    * Parameters:
    * object - <object> Đối tượng biểu đồ
    */
	addChartLayer: function (object) {
		this.arrayChart.push(object);
	},

	/** 
    * APIMethod: removeChartLayer
    * Xóa lớp biểu đồ từ bản đồ
    *
    * Parameters:
    * layerId - <string> Mã lớp bản đồ
    */
	removeChartLayer: function (layerId) {
		if (layerId == undefined || layerId == null) return;
		for (var index = 0; index < this.arrayChart.length; index++) {
			if (layerId.toLowerCase() === this.arrayChart[index].maLopBanDo.toLowerCase()) {
				this.arrayChart.splice(index, 1);
				break;
			}
		}
	},

	/*
    */
	activeSelectFeatureControl: function () {
		if (this.selectFeatureControl != null)
			this.selectFeatureControl.activate();
	},

	/*
    */
	deactiveSelectFeatureControl: function () {
		if (this.selectFeatureControl != null)
			this.selectFeatureControl.deactivate();
	},

	/*
    */
	activeHoverFeatureControl: function () {
		if (this.hoverFeatureControl != null)
			this.hoverFeatureControl.activate();
	},

	/*
    */
	deactiveHoverFeatureControl: function () {
		if (this.hoverFeatureControl != null)
			this.hoverFeatureControl.deactivate();
	},

	/** 
    * APIMethod: getVectorLayer
    * Lấy danh sách lớp vector
    * Parameters:
    *
    * Returns:Lấy tất cả các lớp vector
    * layer - <[gClient.Layer.Canvas]> Mảng lớp vector
    */
	getVectorLayer: function () {
		var listLayer = [];
		var layers = this.layers;
		for (var i = 0; i < layers.length; i++) {
			if (layers[i].CLASS_NAME == 'gClient.Layer.Canvas') {
				listLayer.push(layers[i]);
			}
		}
		return listLayer;
	},

	/** 
    * APIMethod: getBaseLayers
    * Lấy danh sách lớp bản đồ nền
    * Parameters:
    *
    * Returns:Lấy tất cả các lớp bản đồ nền
    * layer - <[gClient.Layer]> Mảng lớp bản đồ nền
    */
	getBaseLayers: function () {
		var map = this;
		var baseLayers = [];
		var layers = map.layers;
		for (var i = 0; i < layers.length; i++) {
			if (layers[i].isBaseLayer && layers[i].displayInLayerSwitcher === true && layers[i].kieuKhongGian != 'BLANK') {
				baseLayers.push(layers[i]);
			}
		}
		return baseLayers;
	},

	/** 
    * APIMethod: getOverLayLayers
    * Lấy danh sách lớp chuyên đề
    * 
    * Parameters:
    * 
    * Returns:Lấy tất cả các lớp chuyên đề
    * layer - <[gClient.Layer]> Mảng lớp chuyên đề
    */
	getOverLayLayers: function () {
		var overlayLayers = this.layers;
		var arr = [];
		//add lớp vector
		for (var i = 0; i < overlayLayers.length; i++) {
			if (!overlayLayers[i].isBaseLayer && overlayLayers[i].displayInLayerSwitcher == true)
				arr.push(overlayLayers[i]);
		}

		//add lớp data
		for (var index = 0; index < this.arrayDataLayer.length; index++) {
			arr.push(this.arrayDataLayer[index]);
		}

		return arr;
	},

	/** 
    * APIMethod: getLayerByFeatureClassName
    * Lấy danh sách lớp chuyên đề theo lớp dữ liệu
    * 
    * Parameters:
    * fcName - <string> Tên lớp dữ liệu. Không phân biệt chữ hoa chữ thường
    * sid - <string> Mã dịch vụ
    * Returns:Lấy tất cả các lớp chuyên đề
    * layers- <[gServer.Layer]> nếu tồn tại.Ngược lại trả về null
    */
	getLayerByFeatureClassName: function (fcName, sid) {
		function getBy(m, b, c) {
			var d = "function" == typeof c.test;
			try {
				return OpenLayers.Array.filter(m['layers'], function (a) {
					if (a[b] && c)
						return a[b].toLowerCase() == c.toLowerCase() || d && c.test(a[b])
					else return new Array();
				})
			} catch (ex) { }
		}
		var layers = getBy(this, 'lopDuLieu', fcName);
		//var layers = this.getLayersBy('lopDuLieu', fcName);
		var gLayers = [];
		if (layers.length > 0) {
			for (var i = 0; i < layers.length; i++) {
				if (layers[i].CLASS_NAME == 'gClient.Layer.Canvas') {
					if (sid) {
						if (layers[i].maDichVu == sid)
							gLayers.push(layers[i]);
					} else {
						gLayers.push(layers[i]);
					}
				}
			}
			if (gLayers.length > 0)
				return gLayers;
			else return null;
		}
		else return null;
	},


	/** 
    * APIMethod: getLayerByLayerID
    * Lấy danh sách lớp chuyên đề theo lớp dữ liệu
    * 
    * Parameters:
    * layerID - <string> Mã lớp bản đồ
    * Returns:Lấy một lớp bản đồ
    * layers- <[gServer.Layer]> nếu tồn tại.Ngược lại trả về null
    */
	getLayerByLayerID: function (layerID) {
		//lấy từ lớp vector, lớp data, lớp group
		var layers = this.layers;
		layers = layers.concat(this.arrayChart);
		layers = layers.concat(this.arrayDataLayer);
		layers = layers.concat(this.arrayGroupLayer);
		if (layerID && layerID != "" && layers.length > 0) {
			for (var i = 0; i < layers.length; i++) {
				if (layers[i].maLopBanDo != undefined && layers[i].maLopBanDo != null
                && layers[i].maLopBanDo.toString() == layerID.toString())
					return layers[i];
			}
		}
		return null;
	},

	/** 
    * APIMethod: zoomToLayer
    * Lấy danh sách lớp chuyên đề theo lớp dữ liệu
    * 
    * Parameters:
    * layer - <gClient.Layer> Lớp chuyên đề
    */
	zoomToLayer: function (layer) {
		var bounds = new OpenLayers.Bounds();
		var extend = layer.vungBaoLonNhat;
		var epsg4326 = new OpenLayers.Projection('EPSG:4326');
		var epsg900913 = new OpenLayers.Projection('EPSG:900913');
		if (extend != "") {
			var b = new OpenLayers.Bounds(extend.left, extend.bottom, extend.right, extend.top).transform(epsg4326, epsg900913);
			bounds.extend(b);
		}
		//nếu chưa có vùng bao lấy vùng bao của map
		if (bounds.bottom == null || bounds.left == null || bounds.right == null || bounds.top == null) {
			var maxExtent = this.map.vungBaoGioiHan;
			bounds = new OpenLayers.Bounds(maxExtent.left, maxExtent.bottom, maxExtent.right, maxExtent.top).transform(epsg4326, epsg900913);
		}
		this.zoomToExtent(bounds);
	},

	/** 
    * APIMethod: getZoomCurrent
    * Lấy mức zoom hiện tại
    * 
    * Parameters:
    */
	getZoomCurrent: function () {
		return this.getZoom() + this.baseLayer.mucXemNhoNhat;
	},

	removeAllPopup: function () {
		while (this.popups.length) {
			this.removePopup(this.popups[0]);
		}
	},

	/** 
    * APIMethod: getCauHinhHienThi
    * Lấy thông tin cấu hình hiển thị mặc định của layer
    * 
    * Parameters:
    */
	getCauHinhHienThi: function () {
		var fields = null;
		var url = "/gservices/rest/geodatas/" + this.maDichVu + "/" + this.lopDuLieu + "/-1";
		$.ajax({
			type: 'GET',
			url: url,
			contentType: "application/json; charset=utf-8",
			dataType: 'jsonp',
			async: false,
			success: function (data) {
				fields = data.fields;
			}
		})
		return fields;
	},
	CLASS_NAME: "gClient.VectorMap"
});
