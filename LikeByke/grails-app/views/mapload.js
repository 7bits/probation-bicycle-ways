<script src="//api-maps.yandex.ru/2.0/?load=package.standard,package.geoObjects&lang=ru-RU" type="text/ javascript"></script>  
 <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
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
    
    var myRoute = [
        [54.974562, 73.401431],
        [54.975935, 73.404521],
        [54.976155, 73.408362],
        [54.975436, 73.407396]
    ];

    $.ajax({
      url: "${createLink(controller: 'Route', action: 'get_route')}", 
      type: "get", 
      dataType: "json",
    
      success: function(data){
        alert(data.testdata);
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
     // Создаем ломаную, используя класс GeoObject.
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
            strokeColor: "#FFFF00",
            strokeWidth: 5,
            strokeOpacity: 0.5
        });

    myMap.geoObjects.add(myGeoObject);

    myMap.controls.add('zoomControl');
    myMap.controls.add('typeSelector');
    myMap.geoObjects.add(myPlacemark);

}