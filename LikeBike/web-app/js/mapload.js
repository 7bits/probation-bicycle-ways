var map;
var taxiData = [];
var routeArray = [];
var routeMode = 0;
var line = [];
var heatmap = 0;
$("document").ready(function(){ 
  $("#userfile").change(function() {
    document.getElementById("importP").innerHTML = document.getElementById('userfile').value;
  });   
});
 
function initialize() {
  document.getElementById('close_reg').onclick = function(){
    document.getElementById('parent_reg').style.display='none';
  }
   document.getElementById('p_reg').onclick = function(){
    document.getElementById('parent_reg').style.display='block';
  }
  var mapOptions = {
    zoom: 10,
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

  
  var loader = document.createElement("div");
  loader.style.width = "126px";
  loader.style.height = "22px";
  loader.style.backgroundImage = "url(images/loader.gif)";
  map.controls[google.maps.ControlPosition.TOP].push(loader);
  
  var mode = document.createElement("input");
  mode.style.width = "50px";
  mode.style.height = "22px";
  mode.style.marginRight = "5px";
  mode.type = "button";
  mode.value = "hm\\fp";
  mode.style.backgroundImage = "#000000";
  mode.onclick = function(){
    if(!routeMode){
      routeMode = 1;
    } else{
      routeMode = 0;
    }
    displayRoute();
  }
  
  map.controls[google.maps.ControlPosition.RIGHT_TOP].push(mode);

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
        routeArray.push(myRoute);
      });
      createRoute();
      displayRoute();
      map.controls[google.maps.ControlPosition.TOP].clear(loader);
    },  
    error: function(jqXHR){
      data = jQuery.parseJSON( jqXHR.responseText );
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
function createRoute() {
  $.each(routeArray, function(route, valR) {
      var flightPath = new google.maps.Polyline({
      path: valR,
      strokeColor: "#FF0000",
      strokeOpacity: 0.5,
      strokeWeight: 1,
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
  if(routeMode){
    heatmap.setMap(null);
    for (i=0; i<line.length; i++) 
    {                           
      line[i].setMap(map);
    }
  } else {
    for (i=0; i<line.length; i++) 
    {                           
      line[i].setMap(null);
    }
    heatmap.setMap(map);
  }
}