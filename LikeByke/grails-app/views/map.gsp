<!DOCTYPE html>

<html>

<head>
    <title>LikeByke</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="//api-maps.yandex.ru/2.0/?load=package.standard,package.geoObjects&lang=ru-RU" type="text/javascript"></script>
    <script src="http://yandex.st/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>

<script type="text/javascript">
ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map("map", {
        center: [54.94835, 73.364996],
        zoom: 12
    });
    var myPlacemark = new ymaps.Placemark([54.94835, 73.364996], {
        content: 'Омск',
        balloonContent: 'Омск'
    });
    
    var myRoute = [
        [54.974562, 73.401431],
        [54.975935, 73.404521],
        [54.976155, 73.408362],
        [54.975436, 73.407396]
    ];
    
    $.ajax({
  		url: "${likeByke(controller: 'route', action: 'get_route')}", 
  		type: "post", 
  		dataType: "json",
	
  		success: function(data){
    		//document.getElementById('msgform').style.display = 'none';
    		//var divpop = document.getElementById('form');
    		//var p = document.createElement('msg');	
    		//p.innerHTML = 'Ваше сообщение отправлено.';	
    		//p.style.color = "#0a0";
    		//divpop.appendChild(p);
  		},
	
  		error: function(jqXHR){
    		data = jQuery.parseJSON( jqXHR.responseText );
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
</script>
</head>

<body>
    <div id="map" style="width:500px; height:400px"></div>
    <div id="list"></div>
</body>

</html>