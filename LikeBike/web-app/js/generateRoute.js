//generate routes
function generateRoute(countRoute) {
  const MIN_LAT = 54.8
  const MAX_LAT = 55.1
  const MIN_LONG = 73.15
  const MAX_LONG = 73.6
  const MAX_DIST = 30
  
  for (var i = 0; i < countRoute; i++) {  
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
                }
              } else {
                  genRoute.push(point_start);
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
        var points = [];
        console.log(genRoute.length);
        for (var i = 0; i < genRoute.length; i++) {
          //points.push({"x" : genRoute[i].mb, "y" : genRoute[i].nb});
          points.push(genRoute[i].mb);
          points.push(genRoute[i].nb);
        }
        //console.log(genRoute[0].mb);
        //console.log(genRoute[0].nb);
        $.ajax({
          url: "genRoute",
          type: "POST",
          dataType: "json",
          data: {array : points},
          
          success: function(data){
            //debugger
            console.log("OK");
            console.log(data);
            
          },
          error: function(data){
            //debugger
            console.log("fail");
            console.log(data);
          }
        });


        }
    });

    //console.log("Lat: " + Latitude + "Long: " + Longitude);
  }
}