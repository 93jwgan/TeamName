<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>상품등록</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">    
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
	

    <link href="../css/datetimepicker.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="../javascript/datetimepicker.js"></script>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    
       
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
  type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
	$('#picker').dateTimePicker({

		
	});
	$('#picker1').dateTimePicker({
		
	});

	$( "button.btn.btn-info:contains('취소하기')" ).on("click" , function() {
		 $("form")[0].reset();
	})
	$( "button.btn.btn-info:contains('뒤로가기')" ).on("click" , function() {
		 javascript:history.go(-1);
	})
	
	$( "button.btn.btn-info:contains('등록하기')" ).on("click" , function() {

		$("form").attr("method","POST").attr("action","/schedule/addSchedule").submit();
	})	
})



 var map;
 var lat;
 var lng;
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
    
    $('#lat').val(e.latLng.lat());
    $('#lng').val(e.latLng.lng());
    
    lat = e.latLng.lat();
    lng = e.latLng.lng();
    
    
	var geocoder = new google.maps.Geocoder();
	var latlng = new google.maps.LatLng(lat,lng);			
	geocoder.geocode({'latLng' : latlng}, function(results, status){
		
		if (status == google.maps.GeocoderStatus.OK) {
			if (results[1]) {
// 				alert("주소 : "+results[3].formatted_address);
				$('#address').val("'"+results[0].formatted_address+"'");
			}else {
				alert("22222");
				alert("Geocoder failed due to: " + status);
			}	
		}
	});	
    
    
    infowindow.setContent("Latitude: " + e.latLng.lat() +
      "<br>" + "Longitude: " + e.latLng.lng());
    infowindow.open(map, marker);
  });
}
 

		 



 
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div class="container">

	<div class="page-header text-center">
		<h3 class=" text-info">일정등록</h3>
	</div>


	<form class="form-horizontal" name="detailForm" >

		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">일정제목</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="title" name="title" >
			</div>
		</div>
						
		<div class="form-group">
			<label for="startDay" class="col-sm-offset-1 col-sm-3 control-label">Start Day</label>
			<div class="col-sm-4 form-inline">
				<div id="picker"> </div>
				<input type="hidden" id="startDay" name="startDay" value="">
			</div>
			
		</div>
		
		<div class="form-group">
			<label for="endDay" class="col-sm-offset-1 col-sm-3 control-label">End Day</label>
			<div class="col-sm-4 form-inline">
				<div id="picker1"> </div>
				<input type="hidden" id="endDay" name="endDay" value="">
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxMember" class="col-sm-offset-1 col-sm-3 control-label">총원</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="maxMember" name="maxMember" >
			</div>
		</div>

		<div class="form-group">
			<label for="fee" class="col-sm-offset-1 col-sm-3 control-label">회비</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="fee" name="fee" >
			</div>
		</div>
		
		<div class="form-group">
			<label for="contents" class="col-sm-offset-1 col-sm-3 control-label">내용</label>
			<div class="col-sm-4">
			<textarea name=contents cols=50 rows=10></textarea>
			</div>
		</div>
	<input type="hidden" id="calendarId" name="calendarId" value="">
	<input type="hidden" id="lng" name="lng" value="">
	<input type="hidden" id="lat" name="lat" value="">
	<input type="hidden" id="address" name="address" value="">

	</form>


	<button type="button" class="btn btn-info">등록하기</button>
	<button type="button" class="btn btn-info">취소하기</button>
	<button type="button" class="btn btn-info">뒤로가기</button>
	



</div>
<div id="map"></div>
</body>
</html>