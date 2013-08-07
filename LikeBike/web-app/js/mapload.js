var map, pointarray, heatmap;

var taxiData = [];

function initialize() {
  var mapOptions = {
    zoom: 12,
    center: new google.maps.LatLng(54.988744, 73.369271),
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  console.log("start adding points");
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
            //console.log(Point[0] + " " + Point[1]);
          })
        });
        var pointArray = new google.maps.MVCArray(taxiData);

        heatmap = new google.maps.visualization.HeatmapLayer({
          data: pointArray, radius: 8, opacity: 0.5/*, gradient: [
    'rgba(0, 255, 255, 0)',
    'rgba(255, 0, 51, 1)',
    'rgba(0, 204, 255, 1)',
    /*'rgba(0, 204, 255, 1)',
    'rgba(0, 204, 255, 1)',
    'rgba(0, 204, 255, 1)',
    'rgba(0, 204, 255, 1)',
    'rgba(0, 204, 255, 1)',
    'rgba(0, 204, 255, 1)',
    'rgba(0, 0, 127, 1)',
    'rgba(63, 0, 91, 1)',
    'rgba(127, 0, 63, 1)',
    'rgba(191, 0, 31, 1)',
    'rgba(255, 102, 0, 1)'
  ]*/
        });
        heatmap.setMap(map);
      },
    
      error: function(jqXHR){
          data = jQuery.parseJSON( jqXHR.responseText );
          alert(data);
      }
  })//end ajax

  console.log("end adding points");
}

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