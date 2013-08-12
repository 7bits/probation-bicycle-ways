const MIN_LAT = 54.8
const MAX_LAT = 55.1
const MIN_LONG = 73.15
const MAX_LONG = 73.6
const MAX_DIST = 10

var map, pointarray, heatmap;
var taxiData = [];

function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(54.988744, 73.369271),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  map.set('styles', [
  {
    featureType: 'road',
    elementType: 'geometry',
    stylers: [
      { color: '#AAAAAA' },
      { weight: 0.8 }
    ]
  }, {
    featureType: 'road',
    elementType: 'labels',
    stylers: [
      { saturation: -100 },
      { invert_lightness: true }
    ]
  }
  ]);

  //generate routes
    
  for (var i = 0; i < 100; i++) {  
    var directionsService = new google.maps.DirectionsService();

    start  = new google.maps.LatLng(
      Math.random() * (MAX_LAT - MIN_LAT) + MIN_LAT,
      Math.random() * (MAX_LONG - MIN_LONG) + MIN_LONG
    );
    end = new google.maps.LatLng(
      Math.random() * (MAX_LAT - MIN_LAT) + MIN_LAT,
      Math.random() * (MAX_LONG - MIN_LONG) + MIN_LONG
    );
    var request = {
        origin: start,
        destination: end,
        optimizeWaypoints: true,
        travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            var genRoute = [];
            var route = response.routes[0];
            //console.log("route is get");
            $.each(route.legs[0].steps, function(step, val_s) {
             // console.log("start Lat: " + val_s.start_location.lat() + " Long: " + val_s.start_location.lng());
              //console.log("stop  Lat: " + val_s.end_location.lat() + " Long: " + val_s.end_location.lng());
              var point_start = new google.maps.LatLng(val_s.start_location.lat(), val_s.start_location.lng());
              var point_end = new google.maps.LatLng(val_s.end_location.lat(), val_s.end_location.lng());
              
              var distance = google.maps.geometry.spherical.computeDistanceBetween(
                point_start,
                point_end
              );
              if (distance > MAX_DIST) {
                var numStep =  Math.ceil(distance/MAX_DIST);
                var latStep = (point_end.lat() - point_start.lat())/numStep; 
                var lngStep = (point_end.lng() - point_start.lng())/numStep;
                for(var j = 0; j < numStep; j++) {
                  genRoute.push(new google.maps.LatLng(point_start.lat() + latStep * j, point_start.lng() + lngStep * j ));
                  taxiData.push(new google.maps.LatLng(point_start.lat() + latStep * j, point_start.lng() + lngStep * j ));
                }
              } else {
                genRoute.push(point_start);
                taxiData.push(point_start);  
              } 
              //var flightPath = new google.maps.Polyline({
              //  path: genRoute,
              //  strokeColor: "#FF0000",
              //  strokeOpacity: 0.5,
              //  strokeWeight: 5,
              //});
              //flightPath.setMap(map);  
              //send route to DB         
            });

        } else{
            //console.log("route not geting");
        }
    });

    //console.log("Lat: " + Latitude + "Long: " + Longitude);
  }
  $.ajax({
      url: "route/get_route", 
      type: "get", 
      dataType: "json",
    
      success: function(data){
        $.each(data, function(route, val_r) {
          var myRoute = [];
          $.each(val_r, function(point, val_p) {
            var Point = [];
            $.each(val_p, function(coord, val_c) {
              Point.push(val_c);
            })
            taxiData.push(new google.maps.LatLng(Point[0], Point[1]));
            myRoute.push(new google.maps.LatLng(Point[0], Point[1]));
          })
          //var flightPath = new google.maps.Polyline({
          //  path: myRoute,
          //  strokeColor: "#FF0000",
          //  strokeOpacity: 0.5,
          //  strokeWeight: 5,
          //});
          //flightPath.setMap(map);
        });
        var pointArray = new google.maps.MVCArray(taxiData);

        heatmap = new google.maps.visualization.HeatmapLayer({
          data: pointArray, opacity: 1.0, gradient: [
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
        heatmap.setMap(map);
      },
    
      error: function(jqXHR){
          data = jQuery.parseJSON( jqXHR.responseText );
          //alert(data);
      }
  })//end ajax
}//end init

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
  ]
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