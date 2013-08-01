const  MIN_LAT = 54;
const  MAX_LAT = 55;
const  MIN_LONG = 74;
const  MAX_LONG = 76;


ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map("map", {
        center: [54.94835, 73.364996],
        zoom: 12
    });
    var myPlacemark = new ymaps.Placemark([54.94835, 73.364996], {
        content: 'Омск!',
        balloonContent: 'Это наш город!!!'
    });
    for (var i = 0; i < 100; i++) {
      ymaps.route([
        [Math.random() * (MAX_LAT - MIN_LAT) + MIN_LAT, Math.random() * (MAX_LONG - MIN_LONG) + MIN_LONG],
        [Math.random() * (MAX_LAT - MIN_LAT) + MIN_LAT, Math.random() * (MAX_LONG - MIN_LONG) + MIN_LONG]
      ]).then(function (route) {
        myMap.geoObjects.add(route);
      })
    }

    $.ajax({
      url: "route/get_route", 
      type: "post", 
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
    //myMap.geoObjects.add(myPlacemark);
}