<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
html,
body {
  height: 100%;
}
#map {
  height: 30%;
  width: 30%;
}
    </style>
  </head>
  <body>
  <input type="text" value="aaaaaaaaaaaaaaa">

    <div id="map"></div>
    <script>
      var map;
      function initMap() {
    	  var myOptions = {
    	      zoom: 15,
    	      center: new google.maps.LatLng(37.502508, 127.030576)
    	    },
    	    map = new google.maps.Map(document.getElementById('map'), myOptions),
    	    marker = new google.maps.Marker({
    	      map: map,
    	    }),
    	    infowindow = new google.maps.InfoWindow;
    	  
    	    map.addListener('rightclick', function(e) {
    	    map.setCenter(e.latLng);
    	    marker.setPosition(e.latLng);
    	    infowindow.setContent("Latitude: " + e.latLng.lat() +
    	      "<br>" + "Longitude: " + e.latLng.lng());
    	    infowindow.open(map, marker);
    	  });
    	}
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
    async defer></script>
  </body>
</html>