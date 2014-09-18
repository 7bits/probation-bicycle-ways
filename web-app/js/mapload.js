const ALL_TRACKS = 1;
const USERS_TRACKS = 0;
const HEAT_MAP = 0;
const LINES = 1;
var map;//google карта
var routeMode = HEAT_MAP;
var viewMode = ALL_TRACKS;
var lines = [];
var rotator = new Rotator();

urlParam = function(name){
    var results = new RegExp('[\?&amp;]' + name + '=([^&amp;#]*)').exec(window.location.href);
    if(results)
        return results[1] || 0;
    else{
        return null;
    }
}

function pullProcessed() {
    path = getUrl() + "/route/getProcessed";
    $.ajax({
        url: path,
        type: "post",
        dataType: "json",
        success: function (data) {
            var successMessage = data.successMessage;
            var errorMessage = data.errorMessage;
            var list = data.list;
            if(list.length > 0){
                console.log(list);
                var success = [];
                var error = [];
                for(i = 0; i < list.length; i++){
                    if(list[i][1] != 2){
                        error.push(list[i][0])
                    }
                    else{
                        success.push(list[i][0])
                    }
                }
                if(success.length)
                    $.notify(successMessage + success, "success");
                if(error.length)
                    $.notify(errorMessage + error, "error");
            }
        },
        error: function (jqXHR) {
            data = jQuery.parseJSON(jqXHR.responseText);
        },
        complete:function () {
        }
    });
}

function drawRoutes(viewMode) {
    var mode =  $('#route')[0];
    path = getUrl() + "/route/";
    if(viewMode == ALL_TRACKS) {
        path += "getRoute";
        if(mode != null){
            mode.textContent = "все маршруты";
        }
    }
    else{
        path += "getUsersRoute";
        if(mode != null){
            mode.textContent = "мои маршруты";
        }
    }
    document.getElementById('loaderBackground').style.display = 'block';
    rotator.start();
    $.ajax({
        url: path,
        type: "post",
        dataType: "json",
        success: function (data) {
            var routeArray = [];
            $.each(data, function (route, valR) {
                var myRoute = [];
                $.each(valR, function (point, valP) {
                    var Point = [];
                    $.each(valP, function (coord, valC) {
                        Point.push(valC);
                    });
                    var googleMapPoint = new google.maps.LatLng(Point[0], Point[1]);
                    myRoute.push(googleMapPoint);
                });
                routeArray.push(myRoute);
            });
            setAll(null);
            lines = [];
            lines = createRoute(routeArray, routeMode);
            displayRoute();
        },
        error: function (jqXHR) {
            data = jQuery.parseJSON(jqXHR.responseText);
        },
        complete:function () {
            document.getElementById('loaderBackground').style.display = 'none';
            rotator.stop();
        }
    });
}

function setAll(mode){
    if(lines.data != null){
        lines.setMap(mode);
    }
    else{
        for(i = 0 ; i < lines.length; i++)
            lines[i].setMap(mode);
    }
}

$("document").ready(function () {
    if($("#loadInput") !=null){
        document.getElementById('loaderBackground').style.display = 'block';
        var load = $("#loadInput");
        load.hover(
            function () {
                $("#uploadIcon")[0].src = getUrl() + "/img/icon_active.png";
            },
            function () {
                $("#uploadIcon")[0].src = getUrl() + "/img/Waypoint.png";
            }
        );
    }

    $('#loadInput').click( function() {
        var userfile = $("#userfile")[0];
        if(userfile.value != ""){
            document.getElementById('loadFile').submit();
        }
        else{
            $.notify("Файл не выбран");
        }
        return false;
    });

    var loadedCode = $("#loadedCode")[0];
    if(loadedCode != null){
        var loadedMessage = $("#loadedMessage")[0].value;
        document.getElementById('loaderBackground').style.display = 'none';
        if(loadedCode.value == "true"){
            $.notify(loadedMessage, "success");
        }
        else{
            $.notify(loadedMessage);
        }
    }
    window.setInterval(pullProcessed, 5000);
    if (document.getElementById('getUsersRoutes') != null) {
        document.getElementById('getUsersRoutes').onclick = function () {
            viewMode = USERS_TRACKS;
            drawRoutes(viewMode);
        }

    }
    if (document.getElementById('getAllRoutes') != null) {
        document.getElementById('getAllRoutes').onclick = function () {
            viewMode = ALL_TRACKS;
            drawRoutes(viewMode);
        }
    }
    
    if ($("#userfile") != null) {
        $("#userfile").change(function () {
            var path = this.value;
            var fileName = path.replace(/^.*[\\\/]/, '')
            var file = $("#fileName")[0];
            file.innerText = fileName;
            file.textContent = fileName;
        });
    }

    var mapOptions = {
        zoom: 10,
        center: new google.maps.LatLng(54.988744, 73.369271),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false
    };
    map = new google.maps.Map(document.getElementById('mapCanvas'), mapOptions);
    map.set('styles', [
        {
            featureType: 'road',
            elementType: 'geometry',
            stylers: [
                { color: '#AAAAAA' },
                { weight: 0.8 }
            ]
        },
        {
            featureType: 'road',
            elementType: 'labels',
            stylers: [
                { saturation: -100 },
                { invert_lightness: true }
            ]
        }
    ]);
    var mode = document.createElement("input");
    mode.id = "changeMap";
    mode.type = "button";
    mode.value = "hm\\fp";
    mode.onclick = function () {
        if (!routeMode) {
            routeMode = LINES;
        } else {
            routeMode = HEAT_MAP;
        }
        setAll(null);
        drawRoutes(viewMode);
    }
    map.controls[google.maps.ControlPosition.LEFT].push(mode);
    drawRoutes(viewMode);

});

function routesToPoints(routes){
    var points = [];
    for (i = 0; i < routes.length; i++) {
        for (j = 0; j < routes[i].length; j++) {
        points.push(routes[i][j]);
    }
    }
    return points;
}

function createRoute(routeArray, routeMode) {
    var routes = [];
    if(routeMode == LINES)
        $.each(routeArray, function (route, valR) {
            var flightPath = new google.maps.Polyline({
                path: valR,
                strokeColor: "#0000FF",
                strokeOpacity: 0.3,
                strokeWeight: 7
            });
            routes.push(flightPath);
        });
    else {
        var pointArray = new google.maps.MVCArray(routesToPoints(routeArray));
        routes = new google.maps.visualization.HeatmapLayer({
            data: pointArray, opacity: 1, radius: 5, gradient: [
                'rgba(0, 255, 255, 0)',
                'rgba(0, 255, 255, 0.4)',
                'rgba(0, 191, 255, 0.4)',
                'rgba(0, 127, 255, 0.4)',
                'rgba(0, 63, 255, 0.4)',
                'rgba(0, 0, 255, 0.42)',
                'rgba(0, 0, 223, 0.47)',
                'rgba(0, 0, 191, 0.52)',
                'rgba(0, 0, 159, 0.57)',
                'rgba(0, 0, 127, 0.62)',
                'rgba(63, 0, 91, 0.67)',
                'rgba(127, 0, 63, 0.72)',
                'rgba(191, 0, 31, 0.77)',
                'rgba(255, 0, 0, 0.8)'
            ]
        });
    }
    return routes;
}

function displayRoute() {
    setAll(map);
}

function routeToStaticMapURL(route) {

    var centerLat = 54.988744;
    var centerLng = 73.369271;
    var maxLat = (route[0]).lat();
    var minLat = (route[0]).lat();
    var maxLng = (route[0]).lng();
    var minLng = (route[0]).lng();
    centerLat = 0;
    centerLng = 0;
    for(i = 0; i < (route).length; i++) {
        centerLat += (route[i]).lat();
        centerLng += (route[i]).lng();
        if((route[i]).lat() > maxLat) {
            maxLat = (route[i]).lat();
        }
        if((route[i]).lat() < minLat) {
            minLat = (route[i]).lat();
        }
        if((route[i]).lng() > maxLng) {
            maxLng = (route[i]).lng();
        }
        if((route[i]).lng() < minLng) {
            minLng = (route[i]).lng();
        }
    }
    centerLat /= route.length;
    centerLng /= route.length;

    var mapWidth = 300;
    var mapHeight = 300;
    var worldCoordinateLength = (maxLat - minLat)*(maxLat - minLat) + (maxLng - minLng)*(maxLng - minLng);
    var pixselCoordinateLength = mapWidth*mapWidth + mapHeight*mapHeight;
    var zoom = Math.log(pixselCoordinateLength/worldCoordinateLength) / (2*Math.log(2));
    zoom -= zoom%1;

    var mapType = "roadmap";
    var mapSensor = "false";
    var urlImg = "http://maps.googleapis.com/maps/api/staticmap";
    urlImg += "?center=" + centerLat + "," + centerLng;
    urlImg += "&zoom=" + zoom;
    urlImg += "&size=" + mapWidth + "x" + mapHeight;
    urlImg += "&maptype=" + mapType;
    urlImg += "&sensor=" + mapSensor;

    urlImg += "&path=color:0x0000ff|weight:5"
    for(i = 0; i < route.length; ) {
        var step = Math.floor( route.length/10 );
        urlImg += "|" + (route[i]).lat() + "," + (route[i]).lng();
        i += step;
    }
    return urlImg;
}