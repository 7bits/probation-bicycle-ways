####Получить все маршруты

url: route/getRoute.  
Тип запроса: post.  
Тип данных: json 

Возвращает двумерный массив маршрутов.
Каждый маршрут есть массив точек.
Каждая точка есть пара double широта и долгота соответственно.

Пример преобразования результата в массив маршрутов, состоящих из точек гугл карт (LatLng).

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
                    taxiData.pus
                    h(googleMapPoint);
                    myRoute.push(googleMapPoint);
                });
                routeArray.push(myRoute);
            });
        },
        error: function (jqXHR) {
            data = jQuery.parseJSON(jqXHR.responseText);
        },
    });

####Загрузить маршрут

url: "route/loadFile"
type: "post"
dataType: "json"
В data лежит userFile, содержащий файл пользователя


