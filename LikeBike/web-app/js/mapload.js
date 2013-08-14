var map;
var taxiData = [];

function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(54.988744, 73.369271),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
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
  }, {
    featureType: 'road',
    elementType: 'labels',
    stylers: [
      { saturation: -100 },
      { invert_lightness: true }
    ]
  }
  ]);
  $.ajax({
    url: "route/getRoute", 
    type: "post", 
    dataType: "json",
    success: function(data){
      $.each(data, function(route, valR) {
        var myRoute = [];
        $.each(valR, function(point, valP) {
          var Point = [];
          $.each(valP, function(coord, valC) {
            Point.push(valC);
          });
          var googleMapPoint = new google.maps.LatLng(Point[0], Point[1]); 
          taxiData.push(googleMapPoint);
          myRoute.push(googleMapPoint);
        });
        var flightPath = new google.maps.Polyline({
          path: myRoute,
          strokeColor: "#FF0000",
          strokeOpacity: 0.5,
          strokeWeight: 1,
        });
        flightPath.setMap(map);
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
      alert(data);
    }
  });//end ajax
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