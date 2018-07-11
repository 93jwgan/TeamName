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
	<script type="text/javascript" src="../javascript/calendar.js"></script>
	

    <link href="../css/datetimepicker.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="../javascript/datetimepicker.js"></script>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
    async defer></script>
<script type="text/javascript">

	var map;
	var latLng = {lat : ${list[0].lat}, lng : ${list[0].lng}};
	function initMap() {
	  var myOptions = {
	      zoom: 15,
	      center: new google.maps.LatLng(37.502508, 127.030576)
	    },
	    map = new google.maps.Map(document.getElementById('map'), myOptions);
	  
	  
	    var marker = new google.maps.Marker({
	    	position: latLng, 
	    	map: map,
	    	title : 'Hello'
	    });
	}
	
	$(function(){
		
		getLocation();
		
	})
	
			function getLocation() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(showPosition);
		    } else { 
		        alert("Geolocation is not supported by this browser.");
		    }
		}

		function showPosition(position) {
		    alert(position.coords.latitude); 
		    alert(position.coords.longitude);
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