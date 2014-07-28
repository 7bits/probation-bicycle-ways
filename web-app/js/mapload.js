var map;//google карта
var taxiData = [];
var routeArray = [];
var routeMode = 0;
var line = [];//список линий на карте
var heatmap = 0;//список точек

$("document").ready(function () {


    document.getElementById('screen').onclick = function () {
        var routeCount = 2;
        var urlImg = routeToStaticMapURL(routeArray[routeCount]);
        document.getElementById('route_img').src = urlImg;

    }
    $("#userfile").change(function () {
        document.getElementById("import_p").innerHTML = document.getElementById('userfile').value;
    });
    if (document.getElementById('get_users_routes') != null) {
        document.getElementById('get_users_routes').onclick = function () {
            var loader = document.createElement("div");
            loader.style.width = "126px";
            loader.style.height = "22px";
            loader.style.backgroundImage = "url(images/loader.gif)";
            map.controls[google.maps.ControlPosition.BOTTOM].push(loader);

            heatmap.setMap(null);
            for (i = 0; i < line.length; i++) {
                line[i].setMap(null);
            }
            line = [];
            heatmap = 0;
            routeArray = [];
            taxiData = [];
            $.ajax({
                url: "route/getUsersRoute",
                type: "post",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (route, valR) {
                        var myRoute = [];
                        $.each(valR, function (point, valP) {
                            var Point = [];
                            $.each(valP, function (coord, valC) {
                                Point.push(valC);
                            });
                            var googleMapPoint = new google.maps.LatLng(Point[0], Point[1]);
                            taxiData.push(googleMapPoint);
                            myRoute.push(googleMapPoint);
                        });
                        routeArray.push(myRoute);
                    });
                    createRoute();
                    displayRoute();
                    map.controls[google.maps.ControlPosition.BOTTOM].clear(loader);
                },
                error: function (jqXHR) {
                    data = jQuery.parseJSON(jqXHR.responseText);
                }
            });//end ajax
        }
    }
    if (document.getElementById('get_all_routes') != null) {
        document.getElementById('get_all_routes').onclick = function () {
            var loader = document.createElement("div");
            loader.style.width = "126px";
            loader.style.height = "22px";
            loader.style.backgroundImage = "url(images/loader.gif)";
            map.controls[google.maps.ControlPosition.BOTTOM].push(loader);

            heatmap.setMap(null);
            for (i = 0; i < line.length; i++) {
                line[i].setMap(null);
            }
            line = [];
            heatmap = 0;
            routeArray = [];
            taxiData = [];
            $.ajax({
                url: "route/getRoute",
                type: "post",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (route, valR) {
                        var myRoute = [];
                        $.each(valR, function (point, valP) {
                            var Point = [];
                            $.each(valP, function (coord, valC) {
                                Point.push(valC);
                            });
                            var googleMapPoint = new google.maps.LatLng(Point[0], Point[1]);
                            taxiData.push(googleMapPoint);
                            myRoute.push(googleMapPoint);
                        });
                        routeArray.push(myRoute);
                    });
                    createRoute();
                    displayRoute();
                    map.controls[google.maps.ControlPosition.BOTTOM].clear(loader);
                },
                error: function (jqXHR) {
                    data = jQuery.parseJSON(jqXHR.responseText);
                }
            });//end ajax
        }
    }

    var mapOptions = {
        zoom: 10,
        center: new google.maps.LatLng(54.988744, 73.369271),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false
    };
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
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

    var loader = document.createElement("div");
    loader.style.width = "126px";
    loader.style.height = "22px";
    loader.style.backgroundImage = "url(images/loader.gif)";
    map.controls[google.maps.ControlPosition.BOTTOM].push(loader);

    var mode = document.createElement("input");
    mode.style.width = "50px";
    mode.style.height = "22px";
    mode.style.marginRight = "5px";
    mode.type = "button";
    mode.value = "hm\\fp";
    mode.style.backgroundImage = "#000000";
    mode.onclick = function () {
        if (!routeMode) {
            routeMode = 1;
        } else {
            routeMode = 0;
        }
        displayRoute();
    }
    map.controls[google.maps.ControlPosition.LEFT].push(mode);

    $.ajax({
        url: "route/getRoute",
        type: "post",
        dataType: "json",
        success: function (data) {
            $.each(data, function (route, valR) {
                var myRoute = [];
                $.each(valR, function (point, valP) {
                    var Point = [];
                    $.each(valP, function (coord, valC) {
                        Point.push(valC);
                    });
                    var googleMapPoint = new google.maps.LatLng(Point[0], Point[1]);
                    taxiData.push(googleMapPoint);
                    myRoute.push(googleMapPoint);
                });
                routeArray.push(myRoute);
            });
            createRoute();
            displayRoute();
            map.controls[google.maps.ControlPosition.BOTTOM].clear(loader);
        },
        error: function (jqXHR) {
            data = jQuery.parseJSON(jqXHR.responseText);
        }
    });//end ajax

});


function toggleHeatmap() {
    heatmap.setMap(heatmap.getMap() ? null : map);
}

function changeGradient() {
    var gradient = [
        'rgba(0, 255, 255, 0)',
        'rgba(0, 255, 255, 1)',
        'rgba(0, 191, 255, 1)',
        'rgba(0, 127, 255, 1)',
        'rgba(0, 63, 255, 1)',
        'rgba(0, 0, 255, 1)',
        'rgba(0, 0, 223, 1)',
        'rgba(0, 0, 191, 1)',
        'rgba(0, 0, 159, 1)',
        'rgba(0, 0, 127, 1)',
        'rgba(63, 0, 91, 1)',
        'rgba(127, 0, 63, 1)',
        'rgba(191, 0, 31, 1)',
        'rgba(255, 102, 0, 1)'
    ];
    heatmap.setOptions({
        gradient: heatmap.get('gradient') ? null : gradient
    });
}

function changeRadius() {
    heatmap.setOptions({radius: heatmap.get('radius') ? null : 20});
}

function changeOpacity() {
    heatmap.setOptions({opacity: heatmap.get('opacity') ? null : 0.2});
}
function createRoute() {
    $.each(routeArray, function (route, valR) {
        var flightPath = new google.maps.Polyline({
            path: valR,
            strokeColor: "#FF0000",
            strokeOpacity: 0.5,
            strokeWeight: 1
        });
        line.push(flightPath);
    });

    var pointArray = new google.maps.MVCArray(taxiData);
    heatmap = new google.maps.visualization.HeatmapLayer({
        data: pointArray, opacity: 1.0, radius: 7, gradient: [
            'rgba(0, 255, 255, 0)',
            'rgba(0, 255, 255, 1)',
            'rgba(0, 191, 255, 1)',
            'rgba(0, 127, 255, 1)',
            'rgba(0, 63, 255, 1)',
            'rgba(0, 0, 255, 1)',
            'rgba(0, 0, 223, 1)',
            'rgba(0, 0, 191, 1)',
            'rgba(0, 0, 159, 1)',
            'rgba(0, 0, 127, 1)',
            'rgba(63, 0, 91, 1)',
            'rgba(127, 0, 63, 1)',
            'rgba(191, 0, 31, 1)',
            'rgba(255, 0, 0, 1)'
        ]
    });
}
function displayRoute() {
    if (routeMode) {
        heatmap.setMap(null);
        for (i = 0; i < line.length; i++) {
            line[i].setMap(map);
        }
    } else {
        for (i = 0; i < line.length; i++) {
            line[i].setMap(null);
        }
        heatmap.setMap(map);
    }
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