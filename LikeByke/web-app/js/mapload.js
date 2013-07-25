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
            alert(Point);
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
          //document.getElementById('msgform').style.display = 'none';
          //var divpop = document.getElementById('form');
          //var p = document.createElement('msg');    
          //p.innerHTML = 'Ваше сообщение отправлено.';   
          //p.style.color = "#0a0";
          //divpop.appendChild(p);
      },
    
      error: function(jqXHR){
          data = jQuery.parseJSON( jqXHR.responseText );
          alert(data);
      }
    })

    myMap.controls.add('zoomControl');
    myMap.controls.add('typeSelector');
    myMap.geoObjects.add(myPlacemark);
}