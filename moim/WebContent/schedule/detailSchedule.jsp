<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품등록</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
html,
body {
  height: 100%;
}
#map {
  height: 50%;
  width: 50%;
}
</style> 
   
     <script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" crossorigin="anonymous"></script>
    
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
    async defer></script>
<script type="text/javascript">
var map;
var address = new Array();
var Locations=[
		{
			lat	: ${list[0].lat},
			lng : ${list[0].lng},
			title : ${list[0].address}
		},
		{
			lat : ${users.myLat},
			lng : ${users.myLng},
			title : ${users.address}
		}
	];
	
$(function(){
		
		for(var i=0;i<Locations.length;i++){
			var geocoder = new google.maps.Geocoder();
	
			var latlng = new google.maps.LatLng(Locations[i].lat, Locations[i].lng);
			
			geocoder.geocode({'latLng' : latlng}, function(results, status){
				
				if (status == google.maps.GeocoderStatus.OK) {
			
					if (results[1]) {
	
// 						alert("주소 : "+results[3].formatted_address);
						address.push(results[0].formatted_address);
	
					}else {
						alert("Geocoder failed due to: " + status);
					}
	
				
				}
			});
		}
	})
	

	function initMap() {
	
var directionsDisplay = new google.maps.DirectionsRenderer;
var directionsService = new google.maps.DirectionsService;
	
	
	  var myOptions = {
	      zoom: 15,
	      center: new google.maps.LatLng(37.502508, 127.030576)
	    },
	    map = new google.maps.Map(document.getElementById('map'), myOptions);
	   
directionsDisplay.setMap(map);
calculateAndDisplayRoute(directionsService, directionsDisplay,Locations);


	  	var infowindow =  new google.maps.InfoWindow({
	        content: ''
	    });
	  
	  for(var i=0;i<Locations.length;i++){

		  
		  var marker = new google.maps.Marker({
		    	position: new google.maps.LatLng(Locations[i].lat, Locations[i].lng), 
		    	map: map,
		    	title: Locations[i].title
		    });
		  
		  bindInfoWindow(marker, map, infowindow, "<p>" + Locations[i].title+"</p>"); 
	  }
	}
	
	function bindInfoWindow(marker, map, infowindow, html, Ltitle) {
	    google.maps.event.addListener(marker, 'mouseover', function() {
	            infowindow.setContent(html); 
	            infowindow.open(map, marker); 

	    });
	    google.maps.event.addListener(marker, 'mouseout', function() {

	        infowindow.close();

	    }); 
	}
	
    function calculateAndDisplayRoute(directionsService, directionsDisplay,Locations) {

      var selectedMode = 'TRANSIT';
      directionsService.route({
        origin: {lat: Locations[0].lat, lng: Locations[0].lng},  // Haight.
        destination: {lat: Locations[1].lat, lng: Locations[1].lng},  // Ocean Beach.
        // Note that Javascript allows us to access the constant
        // using square brackets and a string value as its
        // "property."
        travelMode: google.maps.TravelMode[selectedMode]
      }, function(response, status) {
        if (status == 'OK') {
          directionsDisplay.setDirections(response);
        } else {
          window.alert('Directions request failed due to ' + status);
        }
      });
    }
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div class="container">

	<div class="page-header text-center">
		<h3 class=" text-info">일정자세히보기</h3>
	</div>


	<form class="form-horizontal" name="detailForm" >

		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">title</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="title" name="title" value="${list[0].title}">
			</div>
		</div>
						
		<div class="form-group">
			<label for="startDay" class="col-sm-offset-1 col-sm-3 control-label">Start Day</label>
			<div class="col-sm-4 form-inline">
				<input type="text" id="startDay" name="startDay" value="${list[0].startDay}">
			</div>
			
		</div>
		
		<div class="form-group">
			<label for="endDay" class="col-sm-offset-1 col-sm-3 control-label">End Day</label>
			<div class="col-sm-4 form-inline">
				<input type="text" id="endDay" name="endDay" value="${list[0].endDay}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxMember" class="col-sm-offset-1 col-sm-3 control-label">총원</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="maxMember" name="maxMember" value="${list[0].maxMember}">
			</div>
		</div>

		<div class="form-group">
			<label for="fee" class="col-sm-offset-1 col-sm-3 control-label">회비</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="fee" name="fee" value="${list[0].fee}">
			</div>
		</div>
		
		<div class="form-group">
			<label for="contents" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
			<div class="col-sm-4">
			<textarea name=contents cols=50 rows=10>${list[0].contents}</textarea>
			</div>
		</div>

	</form>
</div>


    <div id="map"></div>










</body>
</html>
