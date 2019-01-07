/**
* Class: gServer
* gServer JavaScipt API cung cấp các chức năng sau.
* 
*    - Quản lý danh sách các đối tượng map
*    - Thông tin cấu hình của đối tượng map
*    - Các hàm CRUD với dữ liệu của một lớp dữ  liệu
*    - Các hàm tìm kiếm trên một lớp dữ liệu
*    - Các hàm CRUD với  một bảng bất kỳ
*    - Thông tin và khai thác kho tài liệu số
*/
gServer = {};

function ChuanHoaDuongDan(url) {
    //nếu tồn tại đường dẫn host và đường dẫn chuẩn hóa không phải đường dẫn tuyệt đối
    if (typeof (URLRESTHOST) != 'undefined' && URLRESTHOST != undefined && URLRESTHOST != null
        && url != undefined && url.toLowerCase().match('http') == null)
        return URLRESTHOST + url;
    else
        return url;
}

Class = function (methods) {
    var klass = function () {
        this.initialize.apply(this, arguments);
    };

    for (var property in methods) {
        klass.prototype[property] = methods[property];
    }

    if (!klass.prototype.initialize) klass.prototype.initialize = function () { };

    return klass;
};
/**
* Class: gServer.Maps
* Quản lý danh sách các đối tượng map kiểu gClient.Vectormap.
* Cung cấp các hàm thêm, cập nhật, xóa đối tượng map trong danh sách
*/
gServer.Maps = Class({
    maps: null,
    /** 
    * APIMethod: constructor
    * Khai báo gServer Javascript API
    *
    * Parameters:
    */
    initialize: function () {
        this.maps = {};
    },
    /** 
    * APIMethod: addMap
    *
    * Parameters:
    * map - {<map> }
    *
    * Returns: trả về bản đồ vừa thêm mới
    */
    addMap: function (map) {
        this.maps[map.div.id] = map;
        return this.maps[map.div.id];
    },

    /** 
    * APIMethod: updateMap
    *
    * Parameters:
    * map - {<map> }
    */
    updateMap: function (map) {
        this.maps[map.div.id] = map;
    },
    /** 
    * APIMethod: removeMap
    *
    * Parameters:
    * divID - {<string>} thẻ div chứa bản đồ
    */
    removeMap: function (divId) {
        delete maps[divId];
    },

    /** 
    * APIMethod: getMapByDivId
    *
    * Parameters:
    * divId - {<string> }  mã thẻ div
    *
    * Returns: trả về bản đồ chứa trong thẻ div
    */
    getMapByDivId: function (divId) {
        return this.maps[divId];
    },

    /** 
    * APIMethod: getMapById
    *
    * Parameters:
    * mapId - {<string> }  mã bản đồ
    *
    * Returns: trả về bản đồ 
    */
    getMapById: function (mapId) {
        for (var key in this.maps) {
            if (this.maps[key].maBanDo === mapId) {
                return this.maps[key];
            }
        }
        return null;
    }

});

/**
* Class: gServer.Map
* Cung cấp các hàm lấy danh sách bản đồ, thông tin mô tả bản đồ
*/
gServer.Map = Class({
    map: null, //bản đồ
    duongDanDichVu: null,
    urlBaseService: null,
    serviceId: null,
    /** 
    * APIMethod: constructor
    *
    * Parameters:
    * map - {<map> || string}
    *   -Tham số map hoặc là <map> hoặc là đường dẫn dich vụ của bản đồ
    */
    initialize: function (map) {
        var type = typeof (map);
        if (type == 'object') {
            this.map = map;
            this.duongDanDichVu = map.duongDanDichVu;
            this.urlBaseService = this.duongDanDichVu.split('vectormaps/')[0];
            this.serviceId = this.duongDanDichVu.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }
        else if (type == 'string' && map != '') {
            this.duongDanDichVu = map;
            this.urlBaseService = map.split('vectormaps/')[0];
            this.serviceId = map.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }

    },
    /** 
    * APIMethod: getConfig
    * lấy thông tin cấu hình của bản đồ
    *
    * Parameters:
    * map - {<map> || string}
    *   -Tham số map hoặc là <map> hoặc là đường dẫn dich vụ của bản đồ
    * callback - {function}
    * options - {object}
    *
    * Returns:- Trả về thông tin cấu hình bản đồ
    */
    getConfig: function (map, callback, options) {
        if (!callback) return;
        var type = typeof (map);
        if (type == 'object') {
            this.map = map;
            this.duongDanDichVu = map.duongDanDichVu;
            this.urlBaseService = this.duongDanDichVu.split('vectormaps/')[0];
            this.serviceId = this.duongDanDichVu.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }
        else if (type == 'string' && map != '') {
            this.duongDanDichVu = map;
            this.urlBaseService = map.split('vectormaps/')[0];
            this.serviceId = map.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }
        else if (this.duongDanDichVu == null)
            return;
        $.ajax({
            type: 'GET',
            async: false,
            url: this.duongDanDichVu,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: getLayers
    * lấy thông tin cấu hình của bản đồ
    *
    * Parameters:
    * map - {<map> || string}
    *   -Tham số map hoặc là <map> hoặc là đường dẫn dich vụ của bản đồ
    * callback - {function}
    * options - {object}
    *
    * Returns:- Trả về danh sách các layer của bản đồ
    */
    getLayers: function (map, callback, options) {
        if (!callback) return;
        var type = typeof (map);
        if (type == 'object') {
            this.map = map;
            this.duongDanDichVu = map.duongDanDichVu;
            this.urlBaseService = this.duongDanDichVu.split('vectormaps/')[0];
            this.serviceId = this.duongDanDichVu.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }
        else if (type == 'string' && map != '') {
            this.duongDanDichVu = map;
            this.urlBaseService = map.split('vectormaps/')[0];
            this.serviceId = map.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }
        else if (this.duongDanDichVu == null)
            return;

        var url = this.duongDanDichVu + '/layer';
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: getMaps
    * lấy danh sách bản đồ
    *
    * Parameters:
    * url - {string} đường dẫn lấy danh sách bản đồ
    * callback - {function}
    * options - {object}
    *    - *url* - {<string>}   đường dẫn lấy danh sách bản đồ
    *    - *appCode* - {<string>}  mã dịch vụ
    *
    * Returns:- Trả về danh sách các layer của bản đồ
    */
    getMaps: function (url, callback, options) {
        if (!callback) return;
        var urlTmp;
        if (url && url != '')
            urlTmp = url;
        else if (this.urlBaseService != null && this.serviceId != null) {
            urlTmp = this.urlBaseService + 'vectormaps/' + this.serviceId + '/map';
            if (options && options.appCode)
                urlTmp += '?appcode=' + options.appCode;
        }
        else return;

        $.ajax({
            type: 'GET',
            url: urlTmp,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    CLASS_NAME: 'gServer.Map'
});



/**
* Class: gServer.Layer
* Cung cấp các hàm CRUD với dữ liệu của một lớp bản đồ
*/
gServer.Layer = Class({
    layer: null,
    duongDan: null,
    serviceId: null,
    lopDuLieu: null,
    urlData: null,
    /** 
    * APIMethod: constructor
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * options - {object} 
    */
    initialize: function (layer, options) {
        this.checkParamaters(layer);
    },
    checkParamaters: function (layer) {
        var type = typeof (layer);
        if (type == 'object') {
            this.layer = layer;
            this.duongDan = layer.duongDan;
            this.serviceId = layer.maDichVu;
            this.lopDuLieu = layer.lopDuLieu;
            var root = this.duongDan.split('geodatas/')[0];
            this.urlData = root + 'geodatas/' + this.serviceId + '/' + this.lopDuLieu;
        }
        else if (type == 'string' && layer != '') {
            this.duongDan = layer;
            var root = layer.split('geodatas/')[0];
            var tmp = layer.split('geodatas/')[1];
            this.serviceId = tmp.split('/')[0];
            this.lopDuLieu = tmp.split('/')[3];
            this.urlData = root + 'geodatas/' + this.serviceId + '/' + this.lopDuLieu;
        }
    },
    /** 
    * APIMethod: getFeature
    * lấy thông tin feature theo mã
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * fid - {string}
    * callback - {function}
    * options - {object}
    *    - *fields* - {string}  danh sách các trường của lớp dữ liệu, nếu để trống thì lấy tất cả các trường
    *    - *outFormat* - {<string>}   điều kiện lọc theo cú pháp sql
    *    - *relation* - {<string>}   danh sách các trường cách nhau bằng dấu phẩy    
    */
    getFeature: function (layer, fid, callback, options) {
        if (!callback) return;
        this.checkParamaters(layer);
        if (this.urlData == null) {
            return;
        }
        var url = this.urlData + '/' + fid;
        var optionsUrl = '';
        if (options != undefined) {
            if (options.outFormat) optionsUrl += '&outFormat=' + options.outFormat;
            if (options.relation) optionsUrl += '&relation=' + options.relation;
            if (options.fields) optionsUrl += '&fields=' + options.fields;
            if (optionsUrl != '') {
                optionsUrl = optionsUrl.substring(1, optionsUrl.length);
                optionsUrl = '?' + optionsUrl;
            }
        }
        url += optionsUrl;
        $.ajax({
            type: 'GET',
            async: false,
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },

    /** 
    * APIMethod: getFeature
    * lấy thông tin feature theo mã
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * filter - {string} điều kiện lọc dữ liệu theo định dạng sql
    * fields - {string} danh sách các trường của lớp dữ liệu, nếu để trống thì lấy tất cả các trường
    * callback - {function}
    * options - {object}
    *    - *outFormat* - {<string>}   điều kiện lọc theo cú pháp sql
    *    - *relation* - {<string>}   danh sách các trường cách nhau bằng dấu phẩy
    *    - *orderby* - {<string>}   mệnh đề sắp xếp dữ liệu theo cú pháp sql
    *    - *page* - {<int>}   trang
    *    - *limit* - {<int>}  số bản ghi trên một trang
    */
    getFeatures: function (layer, callback, options) {
        if (!callback) return;
        this.checkParamaters(layer);
        if (this.urlData == null) {
            return;
        }
        var url = this.urlData;
        var optionsUrl = '';
        if (options != undefined) {
            if (options.filter) optionsUrl += '&filter=' + options.filter;
            if (options.fields) optionsUrl += '&fields=' + options.fields;
            if (options.outFormat) optionsUrl += '&outFormat=' + options.outFormat;
            if (options.relation) optionsUrl += '&relation=' + options.relation;
            if (options.orderby) optionsUrl += '&orderby=' + options.orderby;
            if (options.page != undefined && options.limit != undefined) {
                optionsUrl += '&page=' + options.page;
                optionsUrl += '&start=' + (options.page * options.limit - options.limit);
                optionsUrl += '&limit=' + options.limit;
            }
            if (optionsUrl != '') {
                optionsUrl = optionsUrl.substring(1, optionsUrl.length);
                optionsUrl = '?' + optionsUrl;
            }
        }
        url += optionsUrl;

        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                showMsgClick('Lỗi khi lấy dữ liệu', false);
            }
        });
    },
    /** 
    * APIMethod: addFeature
    * thêm mới feature
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * data - {object} dữ liệu dạng key value
    * callback - {function}
    * options - {object}
    */
    addFeature: function (layer, data, callback, options) {
        if (!callback) return;
        if (data.length) {
            data = JSON.stringify(data);
        }
        this.checkParamaters(layer);
        if (this.urlData == null) {
            return;
        }
        $.ajax({
            type: 'POST',
            url: this.urlData,
            contentType: "application/json; charset=utf-8",
            data: data,
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: deleteFeature
    * xóa feature
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * fid - {int} mã đối tượng
    * callback - {function}
    * options - {object}
    */
    deleteFeature: function (layer, fid, callback, options) {
        if (!callback) return;
        this.checkParamaters(layer);
        if (this.urlData == null) {
            return;
        }
        var url = this.urlData + '/' + fid;
        $.ajax({
            type: 'DELETE',
            url: url,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            },
            error: function () {
            },
            complete: function () {
            }
        });
    },
    /** 
    * APIMethod: updateFeature
    * Cập nhật đối tượng
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * fid - {string}
    * data - {object} dữ liệu dạng key value
    * callback - {function}
    * options - {object}
    */
    updateFeature: function (layer, fid, data, callback, options) {
        if (!callback) return;
        if (data.length) {
            data = JSON.stringify(data);
        }
        this.checkParamaters(layer);
        if (this.urlData == null) {
            return;
        }
        var url = this.urlData + '/' + fid;
        $.ajax({
            type: 'PUT',
            url: url,
            data: data,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            },
            error: function () {
            },
            complete: function () {
            }
        });
    },


    CLASS_NAME: 'gServer.Layer'
});


/**
* Class: gServer.Features
* Cung cấp các hàm tìm kiếm trên các lớp của một bản đồ
*/
gServer.Features = Class({
    map: null,
    duongDanDichVu: null,
    urlBaseService: null,
    serviceId: null,
    dataServiceIds: null,
    overlayLayers: null,
    /** 
    * APIMethod: constructor
    *
    * Parameters:
    * map - {map}
    * options - {object} 
    */
    initialize: function (map) {
        this.checkParamaters(map);
    },
    checkParamaters: function (map) {
        var type = typeof (map);
        if (type == 'object') {
            this.map = map;
            this.duongDanDichVu = map.duongDanDichVu;
            this.urlBaseService = this.duongDanDichVu.split('vectormaps/')[0];
            this.serviceId = this.duongDanDichVu.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
            this.overlayLayers = map.getVectorLayer();
            this.dataServiceIds = [];
            for (var i = 0; i < this.overlayLayers.length; i++) {
                var dataId = {};
                dataId.maDichVu = this.overlayLayers[i].maDichVu;
                dataId.lopDuLieu = this.overlayLayers[i].lopDuLieu;
                this.dataServiceIds.push(dataId);
            }
        }
        else if (type == 'string' && map != '') {
            this.duongDanDichVu = map;
            this.urlBaseService = map.split('vectormaps/')[0];
            this.serviceId = map.split('vectormaps/')[1];
            this.serviceId = this.serviceId.split('/')[0];
        }
    },
    /** 
    * APIMethod: geoNameSearch
    * tìm kiếm địa điểm theo từ khóa
    *
    * Parameters:
    * map - {<Map> || string}
    *   -Tham số map hoặc là <Map> hoặc là đường dẫn dich vụ của bản đồ
    * keyword - {string}
    * type - {string} POINT,POLYGON,LINESTRING,ALL
    * callback - {function}
    * options - {object}    
    *    - *urlBaseService* - {<string>}  đường dẫn base serviec        
    *    - *maDichVu* - {<string>}  mã dịch vụ hệ thống        
    *    - *page* - {<int>}   trang
    *    - *limit* - {<int>}  số bản ghi trên một trang
    *
    * Returns: trả về danh sách các địa điểm
    */
    geoNameSearch: function (map, keyword, type, callback, options) {
        if (!callback) return;
        this.checkParamaters(map);
        if (options != undefined) {
            if (options.urlBaseService) this.urlBaseService = options.urlBaseService;
            if (options.maDichVu) this.maDichVu = options.maDichVu;
        }
        else {
            if (this.urlBaseService == null || this.serviceId) return;
            if (this.maDichVu == null || this.maDichVu) return;
        }

        var url = this.urlBaseService + 'features/' + this.serviceId + '/search/geoname';
        var paging = '';
        if (options != undefined) {
            paging = '&page=' + options.page + '&start=' + (options.page * options.limit - options.limit) + '&limit=' + options.limit;
        }
        url += '?keyword=' + keyword + '&type=' + type + '&outFormat=json' + paging;
        $.ajax({
            type: 'GET',
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: featuresSearch
    * tìm kiếm feature theo từ khóa, điều kiện (tìm kiếm toàn văn)
    *
    * Parameters:
    * map - {<Map> || string}
    *   -Tham số map hoặc là <Map> hoặc là đường dẫn dich vụ của bản đồ
    * keyword - {string}
    * callback - {function}
    * options - {object}
    *    - *filter* - {<string>}  điều kiện lọc dạng sql              
    *    - *featureclasses* - {<string>}  chuỗi tên bảng cách nhau bằng dấu phẩy             
    *    - *urlBaseService* - {<string>}  đường dẫn base serviec        
    *    - *madichvu* - {<string>}  mã dịch vụ hệ thống           
    *    - *outFormat* - {<string>}   định dạng dữ liệu trả về
    *    - *page* - {<int>}   trang    
    *    - *limit* - {<int>}  số bản ghi trên một trang
    *
    * Returns:
    * (code)
    * {
    *	//Tổng số bản ghi
    *	resultsCount: 100,
    *	//Danh sách kết quả theo trang
    *	searchResult: [
    *		{
    *			key:BTS_01,
    *			name:Trạm BTS 01,
    *			resultNumber:1,
    *			tableName:BTS,
    *			xRepresent:107.5916,
    *			yRepresent:16.45806,
    *			geom:POINT (107.5916 16.45806),
    *			...
    *		},
    *		...	
    *       //Thông tin cấu hình trình bày khái quát đối tượng
    *		displayFields: [
    *			{
    *				tentruong: tendoituong,
    *				nhanhienthi: tenDoiTuong,
    *				giatri: 'abc'
    *			},
    *			...
    *		],
    *		//Thông tin cấu hình trình bày chi tiết đối tượng
    *		displayFieldsGrid: [
    *			{
    *				tentruong: tendoituong,
    *				nhanhienthi: tenDoiTuong,
    *				giatri: 'abc'
    *			},
    *			…
    *		]}
    *		]
    * }
    * (end)
    */
    featuresSearch: function (map, keyword, callback, options) {
        if (!callback) return;
        this.checkParamaters(map);
        var featureclasses = '';
        var maDichVu = '';
        if (options && options.featureclasses) {
            featureclasses = options.featureclasses;
        }
        else {
            if (this.overlayLayers != null && this.overlayLayers.length >= 0) {
                for (var i = 0; i < this.overlayLayers.length; i++) {
                    featureclasses += this.overlayLayers[i].lopDuLieu;
                    if (i < this.overlayLayers.length - 1)
                        featureclasses += ',';
                }
            }
            else return;
        }
        if (options && options.madichvu) {
            maDichVu = options.madichvu;
        }
        else {
            if (this.dataServiceIds != null) {
                maDichVu = this.dataServiceIds[0].maDichVu;
            }
            else return;
        }
        if (options && options.urlBaseService) {
            this.urlBaseService = options.urlBaseService;
        }
        else {
            if (this.urlBaseService == null) return;
        }
        var optionsUrl = '';
        if (options != undefined) {
            if (options.filter) optionsUrl += '&filter=' + options.filter;
            if (options.outFormat) optionsUrl += '&outFormat=' + options.outFormat;
            if (options.page != undefined && options.limit != undefined) {
                optionsUrl += '&page=' + options.page;
                optionsUrl += '&start=' + (options.page * options.limit - options.limit);
                optionsUrl += '&limit=' + options.limit;
            }
        }
        if (this.duongDanDichVu != null) {
            optionsUrl += '&duongDanDichVu=' + this.duongDanDichVu;
        }
        var url = this.urlBaseService + 'features/' + maDichVu + '/search/feature?feature=' + featureclasses + '&keyword=' + keyword;
        url += optionsUrl;
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback(null, options);
            }
        });
    },
    /** 
    * APIMethod: featureSearch
    * tìm kiếm feature theo từ khóa, điều kiện
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * keyword - {string}    
    * callback - {function}
    * options - {object}    
    *    - *filter* - {<string>}   điều kiện lọc
    *    - *outFormat* - {<string>}   định dạng dữ liệu trả về
    *    - *urlBaseService* - {<string>}  đường dẫn base serviec        
    *    - *madichvu* - {<string>}  mã dịch vụ hệ thống        
    *    - *lopdulieu* - {<string>}  Tên bảng cần tìm kiếm  
    *    - *page* - {<int>}   trang    
    *    - *limit* - {<int>}  số bản ghi trên một trang
    *
    * Returns:
    * (code)
    * {
    *	//Tổng số bản ghi
    *	resultsCount: 100,
    *	//Thông tin cấu hình trình bày khái quát đối tượng
    *	meta: {
    *	displayFields: [
    *		{
    *			tentruong: tendoituong,
    *			nhanhienthi: tenDoiTuong,
    *			giatri: ''
    *		},
    *		...
    *	],
    *	displayFieldsGrid: [
    *		{
    *			tentruong: tendoituong,
    *			nhanhienthi: tenDoiTuong,
    *			giatri: ''
    *		},
    *		…
    *	]},
    *	searchResult: [
    *			{
    *               key:BTS_01,
    *			    name:Trạm BTS 01,
    *			    resultNumber:1,
    *			    tableName:BTS,
    *			    xRepresent:107.5916,
    *			    yRepresent:16.45806,
    *			    geom:POINT (107.5916 16.45806),
    *			    ...
    *			},
    *			...	
    *			]
    * }
    * (end)
    */
    featureSearch: function (layer, keyword, callback, options) {
        if (!callback) return;
        var maDichVu, lopDuLieu, urlBaseService;
        var type = typeof (layer);
        if (type == 'object') {
            maDichVu = layer.maDichVu;
            lopDuLieu = layer.lopDuLieu;
            urlBaseService = layer.duongDan.split('geodatas/')[0];
        }
        else if (type == 'string' && layer != '') {
            urlBaseService = layer.split('geodatas/')[0];
            var tmp = layer.split('geodatas/')[1];
            maDichVu = tmp.split('/')[0];
            lopDuLieu = tmp.split('/')[3];
        }
        else if (options && options.urlBaseService && options.madichvu && options.lopdulieu) {
            urlBaseService = options.urlBaseService;
            maDichVu = options.madichvu;
            lopDuLieu = options.lopdulieu;
        }
        else return;
        var url = urlBaseService + 'features/' + maDichVu + '/search/advance?feature=' + lopDuLieu + '&keyword=' + keyword;
        var optionsUrl = '';
        if (options != undefined) {
            if (options.filter) optionsUrl += '&filter=' + options.filter;
            if (options.outFormat) optionsUrl += '&outFormat=' + options.outFormat;
            if (options.page != undefined && options.limit != undefined) {
                optionsUrl += '&page=' + options.page;
                optionsUrl += '&start=' + (options.page * options.limit - options.limit);
                optionsUrl += '&limit=' + options.limit;
            }
        }
        url += optionsUrl;
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback(null, options);
            }
        });
    },
    /** 
    * APIMethod: featureInfo
    * lấy thông tin khái quát của feature
    *
    * Parameters:
    * layer - {Layer || string}
    *   -Tham số layer hoặc là <Layer> hoặc là đường dẫn lớp bản đồ
    * fid - {string}
    * callback - {function}
    * options - {object}
    *    - *urlBaseService* - {<string>}  đường dẫn base serviec        
    *    - *madichvu* - {<string>}  mã dịch vụ hệ thống        
    *    - *lopdulieu* - {<string>}  Tên bảng cần tìm kiếm  
    *
    * Returns:
    * (code)
    * {
    *	resultsCount: 2,
    *	searchResult: [
    *		{
    *			tableName: BTS,
    *			key: EVN_H01,
    *			data:[
    *				{
    *					fieldName: tenDoiTuong,
    *					displayLabel: Tên đối tượng,
    *					value,EVN_H01,
    *					displayType,text,
    *					displayNumber,3,
    *					displayClass,title
    *				},
    *				{
    *					fieldName: maLoaiTram,
    *					displayLabel: Mã loại trạm,
    *					value,T1,
    *					displayType,text,
    *					displayNumber,8,
    *					displayClass,content
    *				},
    *				…
    *				]
    *		},
    *		...
    *	]
    *
    * }
    * (end)
    */
    featureInfo: function (layer, fid, callback, options) {
        if (!callback) return;
        var maDichVu, lopDuLieu, urlBaseService;
        var type = typeof (layer);
        if (type == 'object') {
            maDichVu = layer.maDichVu;
            lopDuLieu = layer.lopDuLieu;
            urlBaseService = layer.duongDan.split('geodatas/')[0];
        }
        else if (type == 'string' && layer != '') {
            urlBaseService = layer.split('geodatas/')[0];
            var tmp = layer.split('geodatas/')[1];
            maDichVu = tmp.split('/')[0];
            lopDuLieu = tmp.split('/')[3];
        }
        else if (options && options.urlBaseService && options.madichvu && options.lopdulieu) {
            urlBaseService = options.urlBaseService;
            maDichVu = options.madichvu;
            lopDuLieu = options.lopdulieu;
        }
        else return;
        var url = urlBaseService + 'features/' + maDichVu + '/search/info?feature=' + lopDuLieu + '&ids=' + fid + '&outFormat=json';
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback(null, options);
            }
        });
    },
    /** 
    * APIMethod: featureDetail
    * lấy  thông tin chi tiết của feature
    *
    * Parameters:
    * layer - {<Layer>}
    * fid - {string}
    * callback - {function}
    * options - {object}
    *    - *urlBaseService* - {<string>}  đường dẫn base serviec        
    *    - *madichvu* - {<string>}  mã dịch vụ hệ thống        
    *    - *lopdulieu* - {<string>}  Tên bảng cần tìm kiếm  
    *
    * Returns:
    * (code)
    * {
    *	resultsCount: 2,
    *	searchResult: [
    *		{
    *			tableName: BTS,
    *			key: EVN_H01,
    *			data:[
    *				{
    *					fieldName: tenDoiTuong,
    *					displayLabel: Tên đối tượng,
    *					value,EVN_H01,
    *					displayType,text,
    *					displayNumber,3,
    *					displayClass,title
    *				},
    *				{
    *					fieldName: maLoaiTram,
    *					displayLabel: Mã loại trạm,
    *					value,T1,
    *					displayType,text,
    *					displayNumber,8,
    *					displayClass,content
    *				},
    *				…
    *				]
    *		},
    *		...
    *	]
    *
    * }
    * (end)
    */
    featureDetail: function (layer, fid, callback, options) {
        if (!callback) return;
        var maDichVu, lopDuLieu, urlBaseService;
        var type = typeof (layer);
        if (type == 'object') {
            maDichVu = layer.maDichVu;
            lopDuLieu = layer.lopDuLieu;
            urlBaseService = layer.duongDan.split('geodatas/')[0];
        }
        else if (type == 'string' && layer != '') {
            urlBaseService = layer.split('geodatas/')[0];
            var tmp = layer.split('geodatas/')[1];
            maDichVu = tmp.split('/')[0];
            lopDuLieu = tmp.split('/')[3];
        }
        else if (options && options.urlBaseService && options.madichvu && options.lopdulieu) {
            urlBaseService = options.urlBaseService;
            maDichVu = options.madichvu;
            lopDuLieu = options.lopdulieu;
        }
        else return;
        var url = urlBaseService + 'features/' + maDichVu + '/search/detail?feature=' + lopDuLieu + '&ids=' + fid + '&outFormat=json';
        if (options != undefined) {
            if (options.maLopBanDo) url += '&maLopBanDo=' + options.maLopBanDo;
            if (options.systemId) url += '&systemId=' + options.systemId;
        }
        $.ajax({
            type: 'GET',
            async: false,
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback(null, options);
            },
            complete: function () {
            }
        });
    },
    /** 
    * APIMethod: featureIdentify
    * Xác định các đối tượng tại vị trí cụ thể trên bản đồ
    *
    * Parameters:
    * point - {<point>}
    * callback - {function}
    * options - {object}
    */
    featureIdentify: function (point, callback, options) {
        if (!callback) return;
        var point = new OpenLayers.Geometry.Point(lonlat.lon, lonlat.lat);
        var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
        var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");
        var lonlat1 = point.transform(EPSG_900913, EPSG_4326);
        var common = new gClient.Utils.Common();
        //Ban kinh 1 Pixel
        var numberPixel = 6;
        var radi = common.convertMetertoDegree(map.getResolution() * numberPixel);
        //var geoBuffer = common.generateGeometryBuffer(lonlat1, radi);
        //Tao hinh vuong de tim kiem
        var geoBuffer = OpenLayers.Geometry.Polygon.createRegularPolygon(lonlat1, radi, 4, 0);
        var url = this.urlBaseService + 'features/' + this.serviceId + '/search/identify';
        if (this.duongDanDichVu != null) url += '?duongDanDichVu=' + this.duongDanDichVu;
        var dataIndentify = {};
        dataIndentify.dataServiceIds = this.dataServiceIds;
        dataIndentify.geometry = geoBuffer;
        $.ajax({
            type: 'POST',
            url: url,
            data: dataIndentify,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback(null, options);
            }
        });
    },
    /** 
    * APIMethod: searchFeatureInPolygon
    * Xác định các đối tượng tại vị trí cụ thể trên bản đồ
    *
    * Parameters:
    * layer - {<layer>}
    * polygon - {<string>}
    * filter - {<string>}
    * callback - {function}
    * options - {object}
    *    - *page* - {<int>}   trang    
    *    - *limit* - {<int>}  số bản ghi trên một trang
    *
    * Returns:
    * (code)
    * {
    *	//Tổng số bản ghi
    *	resultsCount: 100,
    *	//Thông tin cấu hình trình bày khái quát đối tượng
    *	meta: {
    *	displayFields: [
    *		{
    *			tentruong: tendoituong,
    *			nhanhienthi: tenDoiTuong,
    *			giatri: ''
    *		},
    *		...
    *	],
    *	//Thông tin cấu hình trình bày chi tiết đối tượng
    *	displayFieldsGrid: [
    *		{
    *			tentruong: tendoituong,
    *			nhanhienthi: tenDoiTuong,
    *			giatri: ''
    *		},
    *		…
    *	]},
    *	//Danh sách kết quả theo trang
    *	searchResult: [
    *			{key:BTS_01,
    *			name:Trạm BTS 01,
    *			resultNumber:1,
    *			tableName:BTS,
    *			xRepresent:107.5916,
    *			yRepresent:16.45806,
    *			geom:POINT (107.5916 16.45806),
    *			...
    *			},
    *			...	
    *			]
    * }
    * (end)
    */
    searchFeatureByPolygon: function (layer, polygon, filter, callback, options) {
        if (!callback) return;
        var maDichVu, lopDuLieu, urlBaseService;
        var type = typeof (layer);
        if (type == 'object') {
            maDichVu = layer.maDichVu;
            lopDuLieu = layer.lopDuLieu;
            urlBaseService = layer.duongDan.split('geodatas/')[0];
        }
        else if (type == 'string' && layer != '') {
            urlBaseService = layer.split('geodatas/')[0];
            var tmp = layer.split('geodatas/')[1];
            maDichVu = tmp.split('/')[0];
            lopDuLieu = tmp.split('/')[3];
        }
        else if (options && options.urlBaseService && options.madichvu && options.lopdulieu) {
            urlBaseService = options.urlBaseService;
            maDichVu = options.madichvu;
            lopDuLieu = options.lopdulieu;
        }
        else return;
        var url = urlBaseService + 'features/';
        url += maDichVu + '/search/polygon?feature=' + lopDuLieu;
        url += '&polygon=' + polygon + '&filter=' + filter + '&outFormat=json';
        var paging = '';
        if (options != undefined) {
            paging = '&page=' + options.page + '&start=' + (options.page * options.limit - options.limit) + '&limit=' + options.limit;
        }
        url += paging;

        $.ajax({
            type: 'GET',
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
            },
            complete: function () {
            }
        });
    },
    /** 
    * APIMethod: searchFeatureByRadius
    * Xác định các đối tượng tại vị trí cụ thể trên bản đồ
    *
    * Parameters:
    * point - {<point>}
    * filter - {string}
    * callback - {function}
    * options - {object}
    *    - *outFormat* - {<int>}   định dạng dữ liệu trả về
    *    - *units* - {<int>}   đơn vị
    *    - *page* - {<int>}   trang
    *    - *limit* - {<int>}  số bản ghi trên một trang
    *
    * Returns:
    * (code)
    * {
    *	//Tổng số bản ghi
    *	resultsCount: 100,
    *	//Thông tin cấu hình trình bày khái quát đối tượng
    *	meta: {
    *	displayFields: [
    *		{
    *			tentruong: tendoituong,
    *			nhanhienthi: tenDoiTuong,
    *			giatri: ''
    *		},
    *		...
    *	],
    *	//Thông tin cấu hình trình bày chi tiết đối tượng
    *	displayFieldsGrid: [
    *		{
    *			tentruong: tendoituong,
    *			nhanhienthi: tenDoiTuong,
    *			giatri: ''
    *		},
    *		…
    *	]},
    *	//Danh sách kết quả theo trang
    *	searchResult: [
    *			{
    *               key:BTS_01,
    *			    name:Trạm BTS 01,
    *			    resultNumber:1,
    *			    tableName:BTS,
    *			    xRepresent:107.5916,
    *			    yRepresent:16.45806,
    *			    geom:POINT (107.5916 16.45806),
    *			    ...
    *			},
    *			...	
    *			]
    * }
    * (end)
    */
    searchFeatureByRadius: function (layer, ORIGIN, RADIUS, NEAREST, filter, callback, options) {
        if (!callback) return;
        var maDichVu, lopDuLieu, urlBaseService;
        var type = typeof (layer);
        if (type == 'object') {
            maDichVu = layer.maDichVu;
            lopDuLieu = layer.lopDuLieu;
            urlBaseService = layer.duongDan.split('geodatas/')[0];
        }
        else if (type == 'string' && layer != '') {
            urlBaseService = layer.split('geodatas/')[0];
            var tmp = layer.split('geodatas/')[1];
            maDichVu = tmp.split('/')[0];
            lopDuLieu = tmp.split('/')[3];
        }
        else if (options && options.urlBaseService && options.madichvu && options.lopdulieu) {
            urlBaseService = options.urlBaseService;
            maDichVu = options.madichvu;
            lopDuLieu = options.lopdulieu;
        }
        else return;
        var url = urlBaseService + 'features/';
        url += maDichVu + '/search/radius?feature=' + lopDuLieu;
        url += '&origin=' + ORIGIN + '&radius=' + RADIUS + '&nearest=' + NEAREST + '&filter=' + filter;
        var paging = '';
        if (options != undefined) {
            paging = '&outFormat=' + options.outFormat + '&units=' + options.units + '&page=' + options.page + '&start=' + (options.page * options.limit - options.limit) + '&limit=' + options.limit;
        }
        url += paging;

        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
            },
            complete: function () {
            }
        });
    },
    CLASS_NAME: 'gServer.Features'
});

/**
* Class: gServer.Table
* Cung cấp hàm CRUD với một bảng dữ liệu bất kỳ
*/
gServer.Table = Class({
    urlBaseService: null,
    serviceId: null,
    /** 
    * APIMethod: constructor
    *
    * Parameters:
    * map - {gClient.Vectomap}
    * options - {object} 
    */
    initialize: function (urlBaseService, serviceId) {
        this.urlBaseService = urlBaseService;
        this.serviceId = serviceId;
    },
    /** 
    * APIMethod: getTables
    * lấy danh sách các bảng
    *
    * Parameters:
    * callback - {function}
    * options - {object}
    *    - *exclude* - {<string>}   loại bỏ các bảng có tiền tố này
    */
    getTables: function (callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table';
        var optionsUrl = '';
        if (options != undefined) {
            if (options.exclude) optionsUrl += '?exclude=' + options.exclude;
        }
        url += optionsUrl;
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: getDatas
    * lấy các bản ghi của một bảng
    *
    * Parameters:
    * tableName - {string} tên bảng
    * callback - {function}
    * options - {object}
    *    - *filter* - {<string>}   điều kiện lọc theo cú pháp sql
    *    - *fields* - {<string>}   danh sách các trường cách nhau bằng dấu phẩy
    *    - *orderby* - {<string>}   mệnh đề sắp xếp dữ liệu theo cú pháp sql
    *    - *page* - {<int>}   trang
    *    - *limit* - {<int>}  số bản ghi trên một trang
    */
    getDatas: function (tableName, callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table/' + tableName;
        var optionsUrl = '';
        if (options != undefined) {
            if (options.filter) optionsUrl += '&filter=' + options.filter;
            if (options.fields) optionsUrl += '&fields=' + options.fields;
            if (options.orderby) optionsUrl += '&orderby=' + options.orderby;
            if (options.page != undefined && options.limit != undefined) {
                optionsUrl += '&page=' + options.page;
                optionsUrl += '&start=' + (options.page * options.limit - options.limit);
                optionsUrl += '&limit=' + options.limit;
            }
            if (optionsUrl != '') {
                optionsUrl = optionsUrl.substring(1, optionsUrl.length);
                optionsUrl = '?' + optionsUrl;
            }
        }
        url += optionsUrl;
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: getData
    * lấy thông tin một bản ghi theo mã
    *
    * Parameters:
    * tableName - {string} tên bảng
    * fid - {string}
    * callback - {function}
    * options - {object}
    *    - *filter* - {<string>}   điều kiện lọc theo cú pháp sql
    *    - *outFormat* - {<string>}  định dạng dữ liệu trả về
    */
    getData: function (tableName, fid, callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table/' + tableName + '/' + fid;
        var optionsUrl = '';
        if (options != undefined) {
            if (options.fields) optionsUrl += '&fields=' + options.fields;
            if (options.outFormat) optionsUrl += '&outFormat=' + options.outFormat;
            if (optionsUrl != '') {
                optionsUrl = optionsUrl.substring(1, optionsUrl.length);
                optionsUrl = '?' + optionsUrl;
            }
        }
        url += optionsUrl;
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: addData
    * thêm mới một bản ghi
    *
    * Parameters:
    * tableName - {string} tên bảng
    * data - {object} dữ liệu dạng key và value
    * callback - {function}
    * options - {object}
    */
    addData: function (tableName, data, callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table/' + tableName;
        $.ajax({
            type: 'POST',
            url: url,
            data: data,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: updateData
    * cập nhật một bản ghi
    *
    * Parameters:
    * tableName - {string} tên bảng
    * fid - {string} mã đối tượng
    * data - {object} dữ liệu dạng key và value
    * callback - {function}
    * options - {object}
    */
    updateData: function (tableName, fid, data, callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table/' + tableName + '/' + fid;
        $.ajax({
            type: 'PUT',
            url: url,
            data: data,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: deleteData
    * xóa một bản ghi
    *
    * Parameters:
    * tableName - {string} tên bảng
    * fid - {string} mã đối tượng
    * callback - {function}
    * options - {object}
    */
    deleteData: function (tableName, fid, callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table/' + tableName + '/' + fid;
        $.ajax({
            type: 'DELETE',
            url: url,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            }
        });
    },
    /** 
    * APIMethod: getFields
    * cập nhật một bản ghi
    *
    * Parameters:
    * tableName - {string} tên bảng
    * callback - {function}
    * options - {object}
    */
    getFields: function (tableName, callback, options) {
        if (!callback) return;
        var url = this.urlBaseService + 'geodatas/' + this.serviceId + '/table/' + tableName + '/fields';
        $.ajax({
            type: 'PUT',
            url: url,
            data: data,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                callback(data, options);
            }
        });
    },
    CLASS_NAME: 'gServer.Features'
});

/**
* Class: gServer.Collections
* Đối tượng làm việc với Collection - Bộ sưu tập
*/
gServer.Collections = Class({

    url: null,
    serviceid: null,
    /** 
    * APIMethod: constructor
    * Hàm khởi tạo
    *
    * Parameters:
    * url - <string> - Đường dẫn dịch vụ dServer
    * serviceid - <string> - Mã dịch vụ dServer
    */
    initialize: function (url, serviceid, options) {
        if (url != undefined)
            this.url = url;
        if (serviceid != undefined)
            this.serviceid = serviceid;
    },

    /** 
    * APIMethod: getCollection
    * Lấy đối tượng collection theo mã
    *
    * Parameters:
    * id - <string>  Mã collection
    * callback - <Function(data,options)> Hàm callback xử lý
    * options - <object> Một số tham biến {url,serviceid}
    * 
    * Returns:
    * (code)
    {
    "AdditionalWorkNeeded":true,
    "AggregationCodes":"String content",
    "Contributor":"String content",
    "Coverage":"String content",
    "CreateDate":"\/Date(928124400000+0700)\/",
    "Creator":"String content",
    "DateCreate":"String content",
    "Deleted":true,
    "Description":"String content",
    "DiskSize_MB":9223372036854775807,
    "FileCount":2147483647,
    "Format":"String content",
    "GroupID":"String content",
    "HitDownload":2147483647,
    "HitQuantity":2147483647,
    "Identifier":"String content",
    "ItemID":"String content",
    "Language":"String content",
    "Link":"String content",
    "ListPathFile":[{
    "FileName":"String content",
    "FullName":"String content",
    "IsValid":true,
    "PathFile":"String content",
    "PathFileView":"String content",
    "Size":1.26743233E+15,
    "Type":"String content"
    }],
    "Locked":true,
    "MainJPEG":"String content",
    "MainThumbnail":"String content",
    "ModifyDate":"\/Date(928124400000+0700)\/",
    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    "Path":"String content",
    "PathFolderItem":"String content",
    "PathImage":"String content",
    "Publisher":"String content",
    "Rect":[{
    "x":"String content",
    "xMax":"String content",
    "xMin":"String content",
    "y":"String content",
    "yMax":"String content",
    "yMin":"String content"
    }],
    "Relation":"String content",
    "Rights":"String content",
    "SortDate":2147483647,
    "Source":"String content",
    "Status":"String content",
    "Subject":"String content",
    "Suppliers":"String content",
    "TemplateID":"String content",
    "TextSearchable":true,
    "Title":"String content",
    "TotalSize":9223372036854775807,
    "Type":"String content",
    "UserCreate":"String content",
    "UserModify":"String content",
    "VID":"String content",
    "acl_id":2147483647,
    "acl_uuid":"String content",
    "isPrivate":true,
    "isSpace":true,
    "parentID":"String content",
    "resUUID":"String content"
    }
    * (end)
    */
    getCollection: function (id, callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/space/" + id;

        $.ajax({
            type: 'GET',
            async: false,
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback(null, options)
            },
            complete: function () {
            }
        });
    },

    /** 
    * APIMethod: getCollections
    * Lấy collection theo điều kiện tùy biến
    *
    * Parameters:
    * filter - <string> Điều kiện lọc
    * parentid - <string> Mã collection cha
    * callback - <Function(data,options)> Hàm callback xử lý
    * options - <object> Một số tham biến {url,serviceid}
    * 
    * Returns:
    * (code)
    * {
    *   "code": 2147483647,
    *   "data":
    *        [{
    "AdditionalWorkNeeded":true,
    "AggregationCodes":"String content",
    "Contributor":"String content",
    "Coverage":"String content",
    "CreateDate":"\/Date(928124400000+0700)\/",
    "Creator":"String content",
    "DateCreate":"String content",
    "Deleted":true,
    "Description":"String content",
    "DiskSize_MB":9223372036854775807,
    "FileCount":2147483647,
    "Format":"String content",
    "GroupID":"String content",
    "HitDownload":2147483647,
    "HitQuantity":2147483647,
    "Identifier":"String content",
    "ItemID":"String content",
    "Language":"String content",
    "Link":"String content",
    "ListPathFile":[{
    "FileName":"String content",
    "FullName":"String content",
    "IsValid":true,
    "PathFile":"String content",
    "PathFileView":"String content",
    "Size":1.26743233E+15,
    "Type":"String content"
    }],
    "Locked":true,
    "MainJPEG":"String content",
    "MainThumbnail":"String content",
    "ModifyDate":"\/Date(928124400000+0700)\/",
    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    "Path":"String content",
    "PathFolderItem":"String content",
    "PathImage":"String content",
    "Publisher":"String content",
    "Rect":[{
    "x":"String content",
    "xMax":"String content",
    "xMin":"String content",
    "y":"String content",
    "yMax":"String content",
    "yMin":"String content"
    }],
    "Relation":"String content",
    "Rights":"String content",
    "SortDate":2147483647,
    "Source":"String content",
    "Status":"String content",
    "Subject":"String content",
    "Suppliers":"String content",
    "TemplateID":"String content",
    "TextSearchable":true,
    "Title":"String content",
    "TotalSize":9223372036854775807,
    "Type":"String content",
    "UserCreate":"String content",
    "UserModify":"String content",
    "VID":"String content",
    "acl_id":2147483647,
    "acl_uuid":"String content",
    "isPrivate":true,
    "isSpace":true,
    "parentID":"String content",
    "resUUID":"String content"
    }],
    *   "message":"String content",
    *   "resultCount":9223372036854775807,
    *   "success":true
    * }
    * (end)
    */
    getCollections: function (parentid, callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/spaces";
        if (parentid != undefined && parentid != null && parentid.length > 0)
            url = url + "?parentid=" + parentid;
        else
            url = url + "?isparent=true";
        if (options != undefined) {
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;
            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
            if (options.all != undefined) url = url + "&all=" + options.all;
            if (options.filter != undefined) url = url + "&filter=" + options.filter;
        }
        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    },


    /** 
    * APIMethod: getItems
    * Lấy danh sách item theo collection
    *
    * Parameters:
    * collectionid - <string> Mã collection
    * callback - <Function(data,options)> Hàm callback
    * options - <object> Các tham số lựa chọn dịch vụ và phân trang {url,serviceid,page,start,limit}
    * all - <string> = 1 hoặc true nếu muốn lấy tất cả item của các collection con, cháu,...
    * 
    * Returns:
    * (code)
    * {
    *    "code":2147483647,
    *    "data":[{
    *	    "AdditionalWorkNeeded":true,
    *	    "AggregationCodes":"String content",
    *	    "Contributor":"String content",
    *	    "Coverage":"String content",
    *	    "CreateDate":"\/Date(928124400000+0700)\/",
    *	    "Creator":"String content",
    *	    "DateCreate":"String content",
    *	    "Deleted":true,
    *	    "Description":"String content",
    *	    "DiskSize_MB":9223372036854775807,
    *	    "FileCount":2147483647,
    *	    "Format":"String content",
    *	    "GroupID":"String content",
    *	    "HitDownload":2147483647,
    *	    "HitQuantity":2147483647,
    *	    "Identifier":"String content",
    *	    "ItemID":"String content",
    *	    "Language":"String content",
    *	    "Link":"String content",
    *	    "ListPathFile":[{
    *		    "FileName":"String content",
    *		    "FullName":"String content",
    *		    "IsValid":true,
    *		    "PathFile":"String content",
    *		    "PathFileView":"String content",
    *		    "Size":1.26743233E+15,
    *		    "Type":"String content"
    *	    }],
    *	    "Locked":true,
    *	    "MaBieuGhi":"String content",
    *	    "MainJPEG":"String content",
    *	    "MainThumbnail":"String content",
    *	    "ModifyDate":"\/Date(928124400000+0700)\/",
    *	    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    *	    "PathFolderItem":"String content",
    *	    "PathImage":"String content",
    *	    "Publisher":"String content",
    *	    "Rect":[{
    *		    "x":"String content",
    *		    "xMax":"String content",
    *		    "xMin":"String content",
    *		    "y":"String content",
    *		    "yMax":"String content",
    *		    "yMin":"String content"
    *	    }],
    *	    "Relation":"String content",
    *	    "Rights":"String content",
    *	    "SortDate":2147483647,
    *	    "Source":"String content",
    *	    "Status":"String content",
    *	    "Subject":"String content",
    *	    "Suppliers":"String content",
    *	    "TextSearchable":true,
    *	    "Title":"String content",
    *	    "TotalSize":9223372036854775807,
    *	    "Type":"String content",
    *	    "UserCreate":"String content",
    *	    "UserModify":"String content",
    *	    "VID":"String content",
    *	    "isPrivate":true
    *    }],
    *    "message":"String content",
    *    "resultCount":9223372036854775807,
    *    "success":true
    * }
    * (end)
    */
    getItems: function (collectionid, callback, options, all) {
        if (!callback) return;
        var a = 0;
        if (all != undefined) a = all;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/aggregation/" + collectionid + "/items?all=" + a + "&page=";
        if (options != undefined && options.page != undefined) url = url + options.page;
        else url = url + "1";
        if (options != undefined) {
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;
            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
        }


        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    }
});


/**
* Class: gServer.Items
* Đối tượng làm việc với Item
*/
gServer.Items = Class({

    url: null,

    serviceid: null,

    /** 
    * APIMethod: constructor
    * Hàm khởi tạo
    *
    * Parameters:
    * url - <string> - Đường dẫn dịch vụ dServer
    * serviceid - <string> - Mã dịch vụ dServer
    */
    initialize: function (url, serviceid, options) {
        if (url != undefined)
            this.url = url;
        if (serviceid != undefined)
            this.serviceid = serviceid;
    },

    /** 
    * APIMethod: getItem
    * Lấy thông tin đối tượng item theo mã item
    *
    * Parameters:
    * id - <string>  Mã item
    * callback - <Function(data,options)> Hàm callback
    * options - <object> Các tham số lựa chọn: {url,serviceid}
    * 
    * Returns:
    * (code)
    * {
    * 	"AdditionalWorkNeeded":true,
    * 	"AggregationCodes":"String content",
    * 	"Contributor":"String content",
    * 	"Coverage":"String content",
    * 	"CreateDate":"\/Date(928124400000+0700)\/",
    * 	"Creator":"String content",
    * 	"DateCreate":"String content",
    * 	"Deleted":true,
    * 	"Description":"String content",
    * 	"DiskSize_MB":9223372036854775807,
    * 	"FileCount":2147483647,
    * 	"Format":"String content",
    * 	"GroupID":"String content",
    * 	"HitDownload":2147483647,
    * 	"HitQuantity":2147483647,
    * 	"Identifier":"String content",
    * 	"ItemID":"String content",
    * 	"Language":"String content",
    * 	"Link":"String content",
    * 	"ListPathFile":[{
    * 		"FileName":"String content",
    * 		"FullName":"String content",
    * 		"IsValid":true,
    * 		"PathFile":"String content",
    * 		"PathFileView":"String content",
    * 		"Size":1.26743233E+15,
    * 		"Type":"String content"
    * 	}],
    * 	"Locked":true,
    * 	"MaBieuGhi":"String content",
    * 	"MainJPEG":"String content",
    * 	"MainThumbnail":"String content",
    * 	"ModifyDate":"\/Date(928124400000+0700)\/",
    * 	"ModifyFirstDate":"\/Date(928124400000+0700)\/",
    * 	"PathFolderItem":"String content",
    * 	"PathImage":"String content",
    * 	"Publisher":"String content",
    * 	"Rect":[{
    * 		"x":"String content",
    * 		"xMax":"String content",
    * 		"xMin":"String content",
    * 		"y":"String content",
    * 		"yMax":"String content",
    * 		"yMin":"String content"
    * 	}],
    * 	"Relation":"String content",
    * 	"Rights":"String content",
    * 	"SortDate":2147483647,
    * 	"Source":"String content",
    * 	"Status":"String content",
    * 	"Subject":"String content",
    * 	"Suppliers":"String content",
    * 	"TextSearchable":true,
    * 	"Title":"String content",
    * 	"TotalSize":9223372036854775807,
    * 	"Type":"String content",
    * 	"UserCreate":"String content",
    * 	"UserModify":"String content",
    * 	"VID":"String content",
    * 	"isPrivate":true
    * }
    * (end)
    */
    getItem: function (id, callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        $.ajax({
            type: 'GET',
            async: false,
            url: this.url + "/" + this.serviceid + "/item/" + id,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                if (data.data.length > 0)
                    callback(data.data[0], options);
                else
                    callback(null, options);
            },
            error: function () {
                callback(null, options)
            },
            complete: function () {
            }
        });
    },

    /** 
    * APIMethod: getItems
    * Lấy danh sách tất cả item
    *
    * Parameters:
    * callback - <Function(data,options> Hàm callback
    * options - <object> Các tham số lựa chọn dịch vụ và phân trang {url,serviceid,page,start,limit}
    * 
    * Returns:
    * (code)
    * {
    *    "code":2147483647,
    *    "data":[{
    *	    "AdditionalWorkNeeded":true,
    *	    "AggregationCodes":"String content",
    *	    "Contributor":"String content",
    *	    "Coverage":"String content",
    *	    "CreateDate":"\/Date(928124400000+0700)\/",
    *	    "Creator":"String content",
    *	    "DateCreate":"String content",
    *	    "Deleted":true,
    *	    "Description":"String content",
    *	    "DiskSize_MB":9223372036854775807,
    *	    "FileCount":2147483647,
    *	    "Format":"String content",
    *	    "GroupID":"String content",
    *	    "HitDownload":2147483647,
    *	    "HitQuantity":2147483647,
    *	    "Identifier":"String content",
    *	    "ItemID":"String content",
    *	    "Language":"String content",
    *	    "Link":"String content",
    *	    "ListPathFile":[{
    *		    "FileName":"String content",
    *		    "FullName":"String content",
    *		    "IsValid":true,
    *		    "PathFile":"String content",
    *		    "PathFileView":"String content",
    *		    "Size":1.26743233E+15,
    *		    "Type":"String content"
    *	    }],
    *	    "Locked":true,
    *	    "MaBieuGhi":"String content",
    *	    "MainJPEG":"String content",
    *	    "MainThumbnail":"String content",
    *	    "ModifyDate":"\/Date(928124400000+0700)\/",
    *	    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    *	    "PathFolderItem":"String content",
    *	    "PathImage":"String content",
    *	    "Publisher":"String content",
    *	    "Rect":[{
    *		    "x":"String content",
    *		    "xMax":"String content",
    *		    "xMin":"String content",
    *		    "y":"String content",
    *		    "yMax":"String content",
    *		    "yMin":"String content"
    *	    }],
    *	    "Relation":"String content",
    *	    "Rights":"String content",
    *	    "SortDate":2147483647,
    *	    "Source":"String content",
    *	    "Status":"String content",
    *	    "Subject":"String content",
    *	    "Suppliers":"String content",
    *	    "TextSearchable":true,
    *	    "Title":"String content",
    *	    "TotalSize":9223372036854775807,
    *	    "Type":"String content",
    *	    "UserCreate":"String content",
    *	    "UserModify":"String content",
    *	    "VID":"String content",
    *	    "isPrivate":true
    *    }],
    *    "message":"String content",
    *    "resultCount":9223372036854775807,
    *    "success":true
    * }
    * (end)
    */
    getItems: function (callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/items?page=";
        if (options != undefined && options.page != undefined) url = url + options.page;
        else url = url + "1";
        if (options != undefined) {
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;

            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
        }

        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    },

    /** 
    * APIMethod: getItemsByType
    * Lấy danh sách item theo loại tài liệu
    *
    * Parameters:
    * type - <string> Mã collection
    * callback - <Function(data,options> Hàm callback
    * options - <object> Các tham số lựa chọn dịch vụ và phân trang {url,serviceid,page,start,limit}
    * 
    * Returns:
    * (code)
    * {
    *    "code":2147483647,
    *    "data":[{
    *	    "AdditionalWorkNeeded":true,
    *	    "AggregationCodes":"String content",
    *	    "Contributor":"String content",
    *	    "Coverage":"String content",
    *	    "CreateDate":"\/Date(928124400000+0700)\/",
    *	    "Creator":"String content",
    *	    "DateCreate":"String content",
    *	    "Deleted":true,
    *	    "Description":"String content",
    *	    "DiskSize_MB":9223372036854775807,
    *	    "FileCount":2147483647,
    *	    "Format":"String content",
    *	    "GroupID":"String content",
    *	    "HitDownload":2147483647,
    *	    "HitQuantity":2147483647,
    *	    "Identifier":"String content",
    *	    "ItemID":"String content",
    *	    "Language":"String content",
    *	    "Link":"String content",
    *	    "ListPathFile":[{
    *		    "FileName":"String content",
    *		    "FullName":"String content",
    *		    "IsValid":true,
    *		    "PathFile":"String content",
    *		    "PathFileView":"String content",
    *		    "Size":1.26743233E+15,
    *		    "Type":"String content"
    *	    }],
    *	    "Locked":true,
    *	    "MaBieuGhi":"String content",
    *	    "MainJPEG":"String content",
    *	    "MainThumbnail":"String content",
    *	    "ModifyDate":"\/Date(928124400000+0700)\/",
    *	    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    *	    "PathFolderItem":"String content",
    *	    "PathImage":"String content",
    *	    "Publisher":"String content",
    *	    "Rect":[{
    *		    "x":"String content",
    *		    "xMax":"String content",
    *		    "xMin":"String content",
    *		    "y":"String content",
    *		    "yMax":"String content",
    *		    "yMin":"String content"
    *	    }],
    *	    "Relation":"String content",
    *	    "Rights":"String content",
    *	    "SortDate":2147483647,
    *	    "Source":"String content",
    *	    "Status":"String content",
    *	    "Subject":"String content",
    *	    "Suppliers":"String content",
    *	    "TextSearchable":true,
    *	    "Title":"String content",
    *	    "TotalSize":9223372036854775807,
    *	    "Type":"String content",
    *	    "UserCreate":"String content",
    *	    "UserModify":"String content",
    *	    "VID":"String content",
    *	    "isPrivate":true
    *    }],
    *    "message":"String content",
    *    "resultCount":9223372036854775807,
    *    "success":true
    * }
    * (end)
    */
    getItemsByType: function (type, callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/items/" + type + "?page=";
        if (options != undefined && options.page != undefined) url = url + options.page;
        else url = url + "1";
        if (options != undefined) {
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;

            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
        }

        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    },

    /** 
    * APIMethod: getItemByCollection
    * Lấy danh sách item theo collection
    *
    * Parameters:
    * collectionid - <string> Mã collection
    * callback - <Function(data,options> Hàm callback
    * options - <object> Các tham số lựa chọn dịch vụ và phân trang {url,serviceid,page,start,limit}
    * all - <string> = 1 hoặc true nếu muốn lấy tất cả item của các collection con, cháu,...
    * 
    * Returns:
    * (code)
    * {
    *    "code":2147483647,
    *    "data":[{
    *	    "AdditionalWorkNeeded":true,
    *	    "AggregationCodes":"String content",
    *	    "Contributor":"String content",
    *	    "Coverage":"String content",
    *	    "CreateDate":"\/Date(928124400000+0700)\/",
    *	    "Creator":"String content",
    *	    "DateCreate":"String content",
    *	    "Deleted":true,
    *	    "Description":"String content",
    *	    "DiskSize_MB":9223372036854775807,
    *	    "FileCount":2147483647,
    *	    "Format":"String content",
    *	    "GroupID":"String content",
    *	    "HitDownload":2147483647,
    *	    "HitQuantity":2147483647,
    *	    "Identifier":"String content",
    *	    "ItemID":"String content",
    *	    "Language":"String content",
    *	    "Link":"String content",
    *	    "ListPathFile":[{
    *		    "FileName":"String content",
    *		    "FullName":"String content",
    *		    "IsValid":true,
    *		    "PathFile":"String content",
    *		    "PathFileView":"String content",
    *		    "Size":1.26743233E+15,
    *		    "Type":"String content"
    *	    }],
    *	    "Locked":true,
    *	    "MaBieuGhi":"String content",
    *	    "MainJPEG":"String content",
    *	    "MainThumbnail":"String content",
    *	    "ModifyDate":"\/Date(928124400000+0700)\/",
    *	    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    *	    "PathFolderItem":"String content",
    *	    "PathImage":"String content",
    *	    "Publisher":"String content",
    *	    "Rect":[{
    *		    "x":"String content",
    *		    "xMax":"String content",
    *		    "xMin":"String content",
    *		    "y":"String content",
    *		    "yMax":"String content",
    *		    "yMin":"String content"
    *	    }],
    *	    "Relation":"String content",
    *	    "Rights":"String content",
    *	    "SortDate":2147483647,
    *	    "Source":"String content",
    *	    "Status":"String content",
    *	    "Subject":"String content",
    *	    "Suppliers":"String content",
    *	    "TextSearchable":true,
    *	    "Title":"String content",
    *	    "TotalSize":9223372036854775807,
    *	    "Type":"String content",
    *	    "UserCreate":"String content",
    *	    "UserModify":"String content",
    *	    "VID":"String content",
    *	    "isPrivate":true
    *    }],
    *    "message":"String content",
    *    "resultCount":9223372036854775807,
    *    "success":true
    * }
    * (end)
    */
    getItemsByCollection: function (collectionid, callback, options, all) {
        if (!callback) return;
        var a = 0;
        if (all != undefined) a = all;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/aggregation/" + collectionid + "/items?all=" + a + "&page=";
        if (options != undefined && options.page != undefined) url = url + options.page;
        else url = url + "1";
        if (options != undefined) {
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;
            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
        }


        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    },

    /** 
    * APIMethod: getItemsByKeyword
    * Lấy danh sách item theo từ khóa tìm kiếm
    *
    * Parameters:
    * keyword - <string> - Từ khóa tìm kiếm
    * callback - <Function(data,options> Hàm callback
    * options - <object> Các tham số lựa chọn dịch vụ và phân trang {url,serviceid,page,start,limit}
    * 
    * Returns:
    * (code)
    * {
    *    "code":2147483647,
    *    "data":[{
    *	    "AdditionalWorkNeeded":true,
    *	    "AggregationCodes":"String content",
    *	    "Contributor":"String content",
    *	    "Coverage":"String content",
    *	    "CreateDate":"\/Date(928124400000+0700)\/",
    *	    "Creator":"String content",
    *	    "DateCreate":"String content",
    *	    "Deleted":true,
    *	    "Description":"String content",
    *	    "DiskSize_MB":9223372036854775807,
    *	    "FileCount":2147483647,
    *	    "Format":"String content",
    *	    "GroupID":"String content",
    *	    "HitDownload":2147483647,
    *	    "HitQuantity":2147483647,
    *	    "Identifier":"String content",
    *	    "ItemID":"String content",
    *	    "Language":"String content",
    *	    "Link":"String content",
    *	    "ListPathFile":[{
    *		    "FileName":"String content",
    *		    "FullName":"String content",
    *		    "IsValid":true,
    *		    "PathFile":"String content",
    *		    "PathFileView":"String content",
    *		    "Size":1.26743233E+15,
    *		    "Type":"String content"
    *	    }],
    *	    "Locked":true,
    *	    "MaBieuGhi":"String content",
    *	    "MainJPEG":"String content",
    *	    "MainThumbnail":"String content",
    *	    "ModifyDate":"\/Date(928124400000+0700)\/",
    *	    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    *	    "PathFolderItem":"String content",
    *	    "PathImage":"String content",
    *	    "Publisher":"String content",
    *	    "Rect":[{
    *		    "x":"String content",
    *		    "xMax":"String content",
    *		    "xMin":"String content",
    *		    "y":"String content",
    *		    "yMax":"String content",
    *		    "yMin":"String content"
    *	    }],
    *	    "Relation":"String content",
    *	    "Rights":"String content",
    *	    "SortDate":2147483647,
    *	    "Source":"String content",
    *	    "Status":"String content",
    *	    "Subject":"String content",
    *	    "Suppliers":"String content",
    *	    "TextSearchable":true,
    *	    "Title":"String content",
    *	    "TotalSize":9223372036854775807,
    *	    "Type":"String content",
    *	    "UserCreate":"String content",
    *	    "UserModify":"String content",
    *	    "VID":"String content",
    *	    "isPrivate":true
    *    }],
    *    "message":"String content",
    *    "resultCount":9223372036854775807,
    *    "success":true
    * }
    * (end)
    */
    getItemsByKeyword: function (keyword, callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/items/search?text=" + keyword;
        if (options != undefined) {
            if (options.page != undefined) url = url + "&page=" + options.page;
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;
            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
        }


        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    },

    /** 
    * APIMethod: getItemsByBBOX
    * Lấy danh sách item theo bbox
    *
    * Parameters:
    * bbox - <object> Vùng bao tìm kiếm item: {xmin,xmax,ymin,ymax}
    * callback - <Function(data,options> Hàm callback
    * options - <object> Các tham số lựa chọn dịch vụ và phân trang {url,serviceid,page,start,limit}
    * 
    * Returns:
    * (code)
    * {
    *    "code":2147483647,
    *    "data":[{
    *	    "AdditionalWorkNeeded":true,
    *	    "AggregationCodes":"String content",
    *	    "Contributor":"String content",
    *	    "Coverage":"String content",
    *	    "CreateDate":"\/Date(928124400000+0700)\/",
    *	    "Creator":"String content",
    *	    "DateCreate":"String content",
    *	    "Deleted":true,
    *	    "Description":"String content",
    *	    "DiskSize_MB":9223372036854775807,
    *	    "FileCount":2147483647,
    *	    "Format":"String content",
    *	    "GroupID":"String content",
    *	    "HitDownload":2147483647,
    *	    "HitQuantity":2147483647,
    *	    "Identifier":"String content",
    *	    "ItemID":"String content",
    *	    "Language":"String content",
    *	    "Link":"String content",
    *	    "ListPathFile":[{
    *		    "FileName":"String content",
    *		    "FullName":"String content",
    *		    "IsValid":true,
    *		    "PathFile":"String content",
    *		    "PathFileView":"String content",
    *		    "Size":1.26743233E+15,
    *		    "Type":"String content"
    *	    }],
    *	    "Locked":true,
    *	    "MaBieuGhi":"String content",
    *	    "MainJPEG":"String content",
    *	    "MainThumbnail":"String content",
    *	    "ModifyDate":"\/Date(928124400000+0700)\/",
    *	    "ModifyFirstDate":"\/Date(928124400000+0700)\/",
    *	    "PathFolderItem":"String content",
    *	    "PathImage":"String content",
    *	    "Publisher":"String content",
    *	    "Rect":[{
    *		    "x":"String content",
    *		    "xMax":"String content",
    *		    "xMin":"String content",
    *		    "y":"String content",
    *		    "yMax":"String content",
    *		    "yMin":"String content"
    *	    }],
    *	    "Relation":"String content",
    *	    "Rights":"String content",
    *	    "SortDate":2147483647,
    *	    "Source":"String content",
    *	    "Status":"String content",
    *	    "Subject":"String content",
    *	    "Suppliers":"String content",
    *	    "TextSearchable":true,
    *	    "Title":"String content",
    *	    "TotalSize":9223372036854775807,
    *	    "Type":"String content",
    *	    "UserCreate":"String content",
    *	    "UserModify":"String content",
    *	    "VID":"String content",
    *	    "isPrivate":true
    *    }],
    *    "message":"String content",
    *    "resultCount":9223372036854775807,
    *    "success":true
    * }
    * (end)
    */
    getItemsByBBOX: function (bbox, callback, options) {
        if (!callback) return;
        if (options != undefined) {
            if (options.url != undefined) this.url = options.url;
            if (options.serviceid != undefined) this.serviceid = options.serviceid;
        }
        var url = this.url + "/" + this.serviceid + "/items/searchmap?bbox=" + bbox.xmin + "," + bbox.ymin + "," + bbox.xmax + "," + bbox.ymax;
        if (options != undefined) {
            if (options.page != undefined) url = url + "&page=" + options.page;
            if (options.start != undefined) url = url + "&start=" + options.start;
            if (options.limit != undefined) url = url + "&limit=" + options.limit;

            if (options.columnsort != undefined) url = url + "&columnsort=" + options.columnsort;
            if (options.typesort != undefined) url = url + "&typesort=" + options.typesort;
        }

        $.ajax({
            type: 'GET',
            url: url,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (data) {
                callback(data, options);
            },
            error: function () {
                callback([], options)
            },
            complete: function () {
            }
        });
    }
});


gServer.NetWork = Class({

    layer: null,

    url: null,

    initialize: function (_layer, _url) {
        this.layer = _layer;
        this.url = _url;
    },

    solveNetWork: function (params, _url, callback, enabled) {
        if (!callback) callback = function () { };
        var layerNetWork = this.layer;
        //Clear feature Results
        //layerNetWork.removeAllFeatures();
        var feas = layerNetWork.getFeaturesByAttribute("type", "result");
        layerNetWork.removeFeatures(feas);
        //for (var i = 0; i < feas.length; i++) {
        //	feas[i].destroy();
        //}

        var para = '';
        for (var index in params) {
            if (params.hasOwnProperty(index)) {
                var attr = params[index];
                para += index + '=' + attr + "&";
            }
        }

        if (para != '')
            para = para.substring(0, para.length - 1);
        var url = '';
        if (_url != undefined)
            url = _url + "?" + para;
        else url = this.url + "?" + para;
        $.ajax({
            type: "GET",
            url: url,
            dataType: "jsonp",
            success: function (result) {
                var color = '#0000FF';
                if (enabled != undefined && enabled == true) color = '#FF0000';
                var stylepoint = {
                    'pointRadius': 5,
                    'strokeWidth': 1,
                    'fillOpacity': 1,
                    'fillColor': color
                };
                var styleLine = {
                    strokeWidth: 2.5,
                    strokeColor: '#FF0000',
                    fillOpacity: 0.5,
                    fillColor: '#0000FF'
                };
                if ((params.flowElements == 'FEEdges') || (params.flowElements == 'FEJunctionsAndEdges')) {
                    if (result.edges) {
                        var resultFeatures = result.edges;
                        for (var j = 0, jl = resultFeatures.length; j < jl; j++) {
                            var featureSet = resultFeatures[j];
                            var format = new OpenLayers.Format.EsriGeoJSON();
                            var feature = format.read(featureSet);
                            if (feature == null) continue;
                            for (var i = 0; i < feature.length; i++) {
                                feature[i].attributes.type = "edges";
                                feature[i].geometry.transform(EPSG_4326, EPSG_900913);
                                var clsName = feature[i].geometry.CLASS_NAME;
                                if (clsName == 'OpenLayers.Geometry.Point')
                                    feature[i].style = stylepoint;
                                else if (clsName == 'OpenLayers.Geometry.LineString')
                                    feature[i].style = styleLine;
                                feature[i].attributes.type = "result";
                            }

                            layerNetWork.addFeatures(feature);
                        }
                    }
                }
                if (params.flowElements == 'FEJunctions' || params.flowElements == 'FEJunctionsAndEdges') {
                    if (result.junctions) {
                        var resultFeatures = result.junctions;
                        var format = new OpenLayers.Format.EsriGeoJSON();
                        for (var j = 0, jl = resultFeatures.length; j < jl; j++) {
                            var feature = format.read(resultFeatures[j]);
                            if (feature == null) continue;
                            for (var i = 0; i < feature.length; i++) {
                                feature[i].attributes.type = "junctions";
                                feature[i].geometry.transform(EPSG_4326, EPSG_900913);
                                var clsName = feature[i].geometry.CLASS_NAME;
                                if (clsName == 'OpenLayers.Geometry.Point')
                                    feature[i].style = stylepoint;
                                else if (clsName == 'OpenLayers.Geometry.LineString')
                                    feature[i].style = styleLine;
                                feature[i].attributes.type = "result";
                            }

                            layerNetWork.addFeatures(feature);
                        }
                    }
                }

                if (result.totalCost) {
                }

                if (result.segmentCosts) {
                }


                if (result.flagsNotFound && result.flagsNotFound.length > 0) {
                }

                if (result.barriersNotFound && result.barriersNotFound.length > 0) {
                }

                //callback(true);
                callback(result);
            },
            complete: function (data) {
            },
            error: function (status) {
                callback(false);
            }
        });
    }
});


gServer.gViewer = Class({
    map: null,

    /** 
    * APIMethod: constructor
    * Hàm khởi tạo
    *
    * Parameters:
    * div - <string> - Id thẻ div chứa map
    * mapid - <string> - Mã bản đồ
    */
    initialize: function (div, mapid) {
        this.map = new gClient.VectorMap(div);
        var url = URLRESTHOST + '/gservices/rest/vectormaps/gsv_system/map/' + mapid;
        this.map.openVectorMap(url);
    },

    setCenter: function (lon, lat, lvzoom) {
        var map = this.map;
        var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
        var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");
        map.addMarker(lon, lat, 'diemdanhdau', 'black', '', { clean: true, onactive: function () { }, color: "#505050", yOffset: 20 });
        if (lvzoom != undefined) {
            var mucXemLonNhat = (map.mucXemLonNhat || map.baseLayer.mucXemLonNhat);
            var mucXemNhoNhat = (map.mucXemNhoNhat || map.baseLayer.mucXemNhoNhat);
            if (lvzoom > mucXemLonNhat)
                lvzoom = mucXemLonNhat;
            var lvlZoom = lvzoom - mucXemNhoNhat;
            map.setCenter(new OpenLayers.LonLat(lon, lat).transform(EPSG_4326, EPSG_900913), lvlZoom);
        }

        map.setCenter(new OpenLayers.LonLat(lon, lat).transform(EPSG_4326, EPSG_900913));
    },

    /** 
    * APIMethod: zoomOut
    * Thu nhỏ bản đồ
    *
    * Parameters:
    */
    zoomOut: function () {
        this.map.zoomOut();
    },

    /** 
    * APIMethod: zoomIn
    * Phóng to
    *
    * Parameters:
    */
    zoomIn: function () {
        this.map.zoomIn();
    },

    /** 
    * APIMethod: selectFeature
    * Marker vị trí của feature trên bản đồ, phóng tới level mong muôn
    *
    * Parameters:
    * tablename - <string> - Tên bảng muốn truy vấn
    * fid - <string> - Mã đối tượng
    * levelZoom - <string> - Mức hiển thị của bản đồ
    */
    selectFeature: function (tablename, fid, callback, levelZoom) {
        var me = this;
        var map = this.map;
        map.markerLayer.removeAllFeatures();
        var url_geodatas = URLRESTHOST + '/gservices/rest/geodatas/gsv_data';
        var url = url_geodatas + "/" + tablename + "/" + fid;
        $.ajax({
            type: 'GET',
            dataType: 'jsonp',
            fid: fid,
            url: url,
            success: function (data) {
                var fid = this.fid;
                var lon = data.xdaidien;
                var lat = data.ydaidien;
                map.addMarker(lon, lat, fid, 'black', '', { clean: true, onactive: function () { }, color: "#505050", yOffset: 20 });
                var geom = data.geom;
                if (levelZoom == undefined) levelZoom = 16;
                var mucXemLonNhat = (map.mucXemLonNhat || map.baseLayer.mucXemLonNhat);
                var mucXemNhoNhat = (map.mucXemNhoNhat || map.baseLayer.mucXemNhoNhat);
                if (levelZoom > mucXemLonNhat)
                    levelZoom = mucXemLonNhat;
                var lvlZoom = levelZoom - mucXemNhoNhat;
                var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
                var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");
                map.setCenter(new OpenLayers.LonLat(lon, lat).transform(EPSG_4326, EPSG_900913), lvlZoom);
                if (callback != undefined)
                    callback(data);
            },
            complete: function () {
            },
            error: function () {
            }
        });
    },

    selectFeatureByMaTram: function (tablename, matram) {

    },

    selectFeatureByFilter: function (tablename, filter, callback, levelZoom) {
        var me = this;
        var map = this.map;
        map.markerLayer.removeAllFeatures();
        var url_geodatas = URLRESTHOST + '/gservices/rest/geodatas/gsv_data';
        var url = url_geodatas + "/" + tablename + "?filter=" + filter + '&page=1&start=0&limit=10';
        //Kết quả có thể sẽ nhiều hơn 1 
        $.ajax({
            type: 'GET',
            async: false,
            url: url,
            contentType: "application/json; charset=utf-8",
            dataType: 'jsonp',
            success: function (datasuccess) {
                var searchResult = datasuccess.searchResult;
                var data = searchResult[0];
                var lon = data.xdaidien;
                var lat = data.ydaidien;
                map.addMarker(lon, lat, '', 'black', '', { clean: true, onactive: function () { }, color: "#505050", yOffset: 20 });
                var geom = data.geom;
                if (levelZoom == undefined) levelZoom = 16;
                var mucXemLonNhat = (map.mucXemLonNhat || map.baseLayer.mucXemLonNhat);
                var mucXemNhoNhat = (map.mucXemNhoNhat || map.baseLayer.mucXemNhoNhat);
                if (levelZoom > mucXemLonNhat)
                    levelZoom = mucXemLonNhat;
                var lvlZoom = levelZoom - mucXemNhoNhat;
                var EPSG_900913 = new OpenLayers.Projection("EPSG:900913");
                var EPSG_4326 = new OpenLayers.Projection("EPSG:4326");
                map.setCenter(new OpenLayers.LonLat(lon, lat).transform(EPSG_4326, EPSG_900913), lvlZoom);
                if (callback != undefined)
                    callback(data);
            }
        });
    }
});