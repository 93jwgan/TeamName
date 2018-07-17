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

	<script type="text/javascript" src="../javascript/datetimepicker.js"></script>
	<link href="../css/datetimepicker.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script>

	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>  
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
    async defer></script>
<script type="text/javascript">
var map;
var address = new Array();
var html = "";
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
	
	$( "button.btn.btn-info:contains('수정완료')" ).hide();
	
	$( "button.btn.btn-info:contains('뒤로가기')" ).on("click" , function() {
		 javascript:history.go(-1);
	})
	$( "button.btn.btn-info:contains('일정삭제')" ).on("click" , function() {
		 self.location = "/schedule/deleteSchedule/"+${list[0].scheduleNo};
	})
	
	$( "button.btn.btn-info:contains('수정하기')" ).on("click" , function() {
		$('input').prop('readonly',false);
		$('textarea').prop('readonly',false);
		$( "button.btn.btn-info:contains('수정완료')" ).show();
		
		$('#startDay').prop('type','hidden');
		$('#endDay').prop('type','hidden');
		
		$('#picker').dateTimePicker({
			selectData: moment($('#startDay').val(),'YYYY-MM-DD HH:mm')
		});
		$('#picker1').dateTimePicker({
			selectData: moment($('#endDay').val(),'YYYY-MM-DD HH:mm')
		});	
	})
	$( "button.btn.btn-info:contains('수정완료')" ).on("click" , function() {
		$("form").attr("method","POST").attr("action","/schedule/updateSchedule").submit();
	})
	
		for(var i=0;i<Locations.length;i++){
			var geocoder = new google.maps.Geocoder();
			var latlng = new google.maps.LatLng(Locations[i].lat, Locations[i].lng);
			
			geocoder.geocode({'latLng' : latlng}, function(results, status){			
				if (status == google.maps.GeocoderStatus.OK) {	
					if (results[1]) {
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
		
		
		
	    marker = new google.maps.Marker({
	        map: map,
	      }),
	    infowindow = new google.maps.InfoWindow;
	    map.addListener('rightclick', function(e) {
	        marker.setPosition(e.latLng);
	        
	        $('#lat').val(e.latLng.lat());
	        $('#lng').val(e.latLng.lng());
        
	    	var geocoder = new google.maps.Geocoder();
	    	var latlng = new google.maps.LatLng(e.latLng.lat(),e.latLng.lng());			
	    	geocoder.geocode({'latLng' : latlng}, function(results, status){
	    		if (status == google.maps.GeocoderStatus.OK) {
	    			if (results[1]) {
// 	    				alert("주소 : "+results[3].formatted_address);
	    				$('#address').val("'"+results[0].formatted_address+"'");
	    			}else {
	    				alert("Geocoder failed due to: " + status);
	    			}	
	    		}
	    	});	
	        
	        
	        infowindow.setContent("Latitude: " + e.latLng.lat() +
	          "<br>" + "Longitude: " + e.latLng.lng());
	        infowindow.open(map, marker);
	      });
		
	    
	    
	    
			  
		directionsDisplay.setMap(map);
		calculateAndDisplayRoute(directionsService, directionsDisplay,Locations);
	
	    function calculateAndDisplayRoute(directionsService, directionsDisplay,Locations) {
	
	      var selectedMode = 'TRANSIT';
	      directionsService.route({
	        origin: {lat: Locations[1].lat, lng: Locations[1].lng},  
	        destination: {lat: Locations[0].lat, lng: Locations[0].lng},  
	        
	        // Note that Javascript allows us to access the constant
	        // using square brackets and a string value as its
	        // "property."
	        travelMode: google.maps.TravelMode[selectedMode]
	      }, function(response, status) {
	        if (status == 'OK') {
	        	for(var i=0;i<response.routes[0].legs[0].steps.length;i++){
	         		if(response.routes[0].legs[0].steps[i].travel_mode == "WALKING"){	
	         			html += "<div>이동거리 : "+response.routes[0].legs[0].steps[i].distance.text+", 걸리는시간 : "+response.routes[0].legs[0].steps[i].duration.text+", 이동수단 : "+response.routes[0].legs[0].steps[i].travel_mode+
	         					", 도착지 : "+response.routes[0].legs[0].steps[i].instructions+"</div>";	
	         		}else if(response.routes[0].legs[0].steps[i].travel_mode == "TRANSIT"){
	        			
	         			if(response.routes[0].legs[0].steps[i].transit.line.vehicle.type =="SUBWAY"){
		         			html += "<div>이동거리 : "+response.routes[0].legs[0].steps[i].distance.text+", 걸리는시간 : "+response.routes[0].legs[0].steps[i].duration.text+
		         					", 이동수단 : "+response.routes[0].legs[0].steps[i].travel_mode+", 지하철 방향 : "+response.routes[0].legs[0].steps[i].transit.headsign+
		         					", 호선 : "+response.routes[0].legs[0].steps[i].transit.line.short_name+", 타는곳 : "+response.routes[0].legs[0].steps[i].transit.departure_stop.name+
		         					", 탑승 시간 : "+response.routes[0].legs[0].steps[i].transit.departure_time.text+", 도착역 : "+response.routes[0].legs[0].steps[i].transit.arrival_stop.name+
		         					", 도착 시간 : "+response.routes[0].legs[0].steps[i].transit.arrival_time.text+"</div>";
	        			}else if(response.routes[0].legs[0].steps[i].transit.line.vehicle.type =="BUS"){
	         				if(response.routes[0].legs[0].steps[i].transit.line.short_name == null){
		             			html += "<div>이동거리 : "+response.routes[0].legs[0].steps[i].distance.text+", 걸리는시간 : "+response.routes[0].legs[0].steps[i].duration.text+
				     					", 버스 방향 : "+response.routes[0].legs[0].steps[i].transit.headsign+", 타는곳 : "+response.routes[0].legs[0].steps[i].transit.departure_stop.name+
				     					", 탑승 시간 : "+response.routes[0].legs[0].steps[i].transit.departure_time.text+", 도착역 : "+response.routes[0].legs[0].steps[i].transit.arrival_stop.name+
				     					", 도착 시간 : "+response.routes[0].legs[0].steps[i].transit.arrival_time.text+"</div>";
	         				}else{
	         					html += "<div>이동거리 : "+response.routes[0].legs[0].steps[i].distance.text+", 걸리는시간 : "+response.routes[0].legs[0].steps[i].duration.text+
				     					", 버스 방향 : "+response.routes[0].legs[0].steps[i].transit.headsign+", 버스 번호 : "+response.routes[0].legs[0].steps[i].transit.line.short_name+
				     					", 타는곳 : "+response.routes[0].legs[0].steps[i].transit.departure_stop.name+", 탑승 시간 : "+response.routes[0].legs[0].steps[i].transit.departure_time.text+
				     					", 도착역 : "+response.routes[0].legs[0].steps[i].transit.arrival_stop.name+", 도착 시간 : "+response.routes[0].legs[0].steps[i].transit.arrival_time.text+"</div>";
	         				}
	        			}else if(response.routes[0].legs[0].steps[i].transit.line.vehicle.type == "HEAVY_RAIL"){
	        					html += "<div>이동거리 : "+response.routes[0].legs[0].steps[i].distance.text+", 걸리는시간 : "+response.routes[0].legs[0].steps[i].duration.text+	
				     					", 기차 방향 : "+response.routes[0].legs[0].steps[i].transit.headsign+", 기차 이름 : "+response.routes[0].legs[0].steps[i].transit.line.name+
				     					", 타는곳 : "+response.routes[0].legs[0].steps[i].transit.departure_stop.name+", 탑승 시간 : "+response.routes[0].legs[0].steps[i].transit.departure_time.text+
				     					", 도착역 : "+response.routes[0].legs[0].steps[i].transit.arrival_stop.name+", 도착 시간 : "+response.routes[0].legs[0].steps[i].transit.arrival_time.text+"</div>";
	        			}	
	         		}//end for
	        	}//end if
	         	$('#direction').html(html);   	
	          directionsDisplay.setDirections(response);
	        } else {
	          window.alert('Directions request failed due to ' + status);
	        }
	      });//end directionsService.route()
	    }//end calculateAndDisplayRoute()
	}//end initMap()
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div class="container">

	<div class="page-header text-center">
		<h3 class=" text-info">일정자세히보기</h3>
	</div>


	<form class="form-horizontal" name="detailForm">

		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">title</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="title" name="title" value="${list[0].title}" readonly>
			</div>
		</div>
						
		<div class="form-group">
			<label for="startDay" class="col-sm-offset-1 col-sm-3 control-label">Start Day</label>
			<div class="col-sm-4 form-inline">
				<div id ="picker"> </div>
				<input type="text" id="startDay" name="startDay" value="${list[0].startDay}" readonly>
			</div>
			
		</div>
		
		<div class="form-group">
			<label for="endDay" class="col-sm-offset-1 col-sm-3 control-label">End Day</label>
			<div class="col-sm-4 form-inline">
				<div id ="picker1"> </div>
				<input type="text" id="endDay" name="endDay" value="${list[0].endDay}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxMember" class="col-sm-offset-1 col-sm-3 control-label">총원</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="maxMember" name="maxMember" value="${list[0].maxMember}" readonly> 
			</div>
		</div>

		<div class="form-group">
			<label for="fee" class="col-sm-offset-1 col-sm-3 control-label">회비</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="fee" name="fee" value="${list[0].fee}" readonly>
			</div>
		</div>
		
		<div class="form-group">
			<label for="contents" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
			<div class="col-sm-4">
			<textarea name=contents cols=50 rows=10 readonly>${list[0].contents}</textarea>
			</div>
		</div>
	<input type="hidden" id="lng" name="lng" value="">
	<input type="hidden" id="lat" name="lat" value="">
	<input type="hidden" id="address" name="address" value="">
	<input type="hidden" id="scheduleNo" name="scheduleNo" value='${list[0].scheduleNo}'/>
	</form>
</div>
	
	<button type="button" class="btn btn-info">수정하기</button>
	<button type="button" class="btn btn-info">수정완료</button>
	<button type="button" class="btn btn-info">뒤로가기</button>
	<button type="button" class="btn btn-info">일정삭제</button>

    <div id="map"></div>
    
    <div class="container" id ="direction">
    	
    
    
    </div>










</body>
</html>
