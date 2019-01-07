
//load javascript
(function () {
    var files = [
        '/gClient/API/js/gclientapi/OpenLayers.js',
        '/gClient/API/js/gclientapi/gClient.js',
        '/gClient/API/js/gclientapi/VectorMap.js',
        '/gClient/API/js/requirejs/require.js',
        '/gClient/API/gServer.js',
		'/gClient/API/js/common/gClientGlobal.js',
        '/gCitywork/gCloudgis/Common/common.js'
    ];

    var tags = new Array(files.length);
    for (var i = 0, len = files.length; i < len; i++) {
        tags[i] = "<script  charset='utf-8' src='" + files[i] + "'></script>";
    }
    document.write(tags.join(""));
})();
