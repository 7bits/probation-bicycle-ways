ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map("map", {
        center: [55.04835, 73.364996],
        zoom: 12
    });
    var myPlacemark = new ymaps.Placemark([54.94835, 73.364996], {
        content: 'Омск!',
        balloonContent: 'Это наш город!!!'
    });

    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////

    //window.onload = function(){
      //alert('hello');
      //alert(myMap.converter.clientPixelsToCoordinates(new YMaps.point(200, 300)));
      


      var xx = h337.create({"element":document.getElementById("map"), "radius": 10, "visible":true});
      //var pixelsCoords = myMap.coordSystem.fromCoordPoint(myMap.getCenter());
      var mainCanvas = xx.get('canvas');
      //mainCanvas.getContext('2d').fillRect(0,0,mainCanvas.width,mainCanvas.height);
    //};
    mainCanvas.width = 800;
    mainCanvas.height = 600;
    mainCanvas.style.left = "-400px";
    mainCanvas.style.top = "-300px";
    mainCanvas.style.position = "absolute";

    

      var projection = myMap.options.get('projection');
    //xx.store.addDataPoint(pixelsCoords.x, pixelsCoords.y);


    /*document.getElementById("map").onclick = function(ev){
        var pos = h337.util.mousePosition(ev);
        //console.log(pos[0]);
        //xx.store.addDataPoint(pos[0], pos[1]);
    };*/
    var pointsArray = [];
    //document.getElementById("map").onclick
    myMap.events.add('boundschange', function(ev){
        mainCanvas.getContext('2d').clearRect(0, 0, mainCanvas.width, mainCanvas.height);
        xx.clear();
        //alert(point[0] + " " + point[1]);
        //mainCanvas.getContext('2d').fillRect(0,0,mainCanvas.width,mainCanvas.height);
        pointsArray.forEach(function(point){
            var p = myMap.converter.globalToPage(
            projection.toGlobalPixels(
              // географические координаты
              [point[0], point[1]],
              myMap.getZoom()
            )
            );
            xx.store.addDataPoint(p[0], p[1]);
        });
        //xx.store.addDataPoint(point[0], point[1]);

    });

    //var managerLayers = myMap.panes.get('layers');
    //managerLayers.add(xx.get("canvas"));
    myMap.panes.get('layers').getElement().appendChild(xx.get('canvas'));

    ///////////////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////////////
    
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
            myRoute.push(Point);
            pointsArray.push(Point);
            ////////////////////////////////////////////////////////
            var point = myMap.converter.globalToPage(
            projection.toGlobalPixels(
              // географические координаты
              [Point[0], Point[1]],
              myMap.getZoom()
            )
            );
            xx.store.addDataPoint(point[0], point[1]);
            ///////////////////////////////////////////////////////
          })
          var myGeoObject = new ymaps.GeoObject({
            geometry: {  
                type: "LineString",
                coordinates: myRoute
            },
            properties:{
                hintContent: "маршрут",
                balloonContent: "тут кто-то проехал"
            }
          },{
            draggable: false,
            strokeColor: "#FF0000",
            strokeWidth: 5,
            strokeOpacity: 0.5
          });

    myMap.geoObjects.add(myGeoObject);  
        });
      },
    
      error: function(jqXHR){
          data = jQuery.parseJSON( jqXHR.responseText );
          alert(data);
      }
    })

    myMap.controls.add('zoomControl');
    myMap.controls.add('typeSelector');
    //xx.store.addDataPoint(54.94835, 73.364996);
    //myMap.geoObjects.add(myPlacemark);
}
