<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
    async defer></script>
    
    <style>
html,
body {
  height: 100%;
}
#map {
  height: 100%;
  width: 100%;
}
</style> 
    
<script type="text/javascript">

var map;
var direction =JSON.parse(JSON.stringify(${direction}));
var poly;
function initMap() {		
		  var myOptions = {
		      zoom: 15,
		      center: new google.maps.LatLng(37.502508, 127.030576)
		    },
		    map = new google.maps.Map(document.getElementById('map'), myOptions);

		 	poly = null;
		 	poly = new Array();
		  
		  for(var i=0;i<direction.routes[0].legs[0].steps.length;i++){
			  if(direction.routes[0].legs[0].steps[i].travel_mode == "WALKING"){
				  if(i == 0){
					  alert("aaaaa");
				 	  poly.push(new google.maps.LatLng(direction.routes[0].legs[0].steps[i].start_location.lat,direction.routes[0].legs[0].steps[i].start_location.lng));
				 	  poly.push(new google.maps.LatLng(direction.routes[0].legs[0].steps[i].end_location.lat,direction.routes[0].legs[0].steps[i].end_location.lng));
				  }else{
					  alert("bbbbb");
					  poly.push(new google.maps.LatLng(direction.routes[0].legs[0].steps[i].end_location.lat,direction.routes[0].legs[0].steps[i].end_location.lng));
				  }
			  }else if(direction.routes[0].legs[0].steps[i].travel_mode == "TRANSIT"){
				  alert("ccccc");
				  poly.push(new google.maps.LatLng(direction.routes[0].legs[0].steps[i].transit_details.arrival_stop.location.lat,direction.routes[0].legs[0].steps[i].transit_details.arrival_stop.location.lng));
			  }
		  }
			  var flightPath = new google.maps.Polyline({
		          path: poly,
		          geodesic: true,
		          strokeColor: '#FF0000',
		          strokeOpacity: 1.0,
		          strokeWeight: 2
		        });
			  
			  
			  flightPath.setMap(map);
			  
		  
		}


$(function(){
	
	direction =JSON.parse(JSON.stringify(${direction}));

	
	
	alert("���� �� stpes : "+direction.routes[0].legs[0].steps.length);
	
	alert("1 steps �� mode : "+direction.routes[0].legs[0].steps[0].travel_mode);
	alert("2 steps �� mode : "+direction.routes[0].legs[0].steps[1].travel_mode);
	alert("3 steps �� mode : "+direction.routes[0].legs[0].steps[2].travel_mode);
	
	
	
// 	for(var i=0;i>3;i++){
// 		alert("aaaa");
// 	}
	
// 	for(var i=0 ; i>direction.routes[0].legs[0].steps.length ; i++){
// 		alert("aaa");
// 		alert(i+"��° ���� mode : "+direction.routes[0].legs[0].steps[i].travel_mode);
// 	}
	
	
	
// 	alert(direction.geocoded_waypoints[0].geocoder_status);
	
	
	//��߽ð�,�����ð�,���������� �ɸ��� �ð�
// 	alert(direction.routes[0].legs[0].departure_time.text);
// 	alert(direction.routes[0].legs[0].arrival_time.text);
// 	alert(direction.routes[0].legs[0].duration.text);
	
	//���������� �Ÿ�
// 	alert(direction.routes[0].legs[0].distance.text);
	
	
	//���±� : 1��° ���������� �ɸ��� �Ÿ�,�ð�,��������ġ,�������̸�,polyline,mode
// 	alert(direction.routes[0].legs[0].steps[0].distance.text);
// 	alert(direction.routes[0].legs[0].steps[0].duration.text);
// 	alert(direction.routes[0].legs[0].steps[0].end_location.lat+" , "+direction.routes[0].legs[0].steps[0].end_location.lng);
// 	alert(direction.routes[0].legs[0].steps[0].html_instructions);
// 	alert(direction.routes[0].legs[0].steps[0].polyline.points);
// 	alert(direction.routes[0].legs[0].steps[0].travel_mode);
	
	
	
	//���±� : 2��° ���������� �ɸ��� �Ÿ�,�ð�,��������ġ,�������̸�,polyline
// 	alert(direction.routes[0].legs[0].steps[1].distance.text);
// 	alert(direction.routes[0].legs[0].steps[1].duration.text);
// 	alert(direction.routes[0].legs[0].steps[1].end_location.lat+" , "+direction.routes[0].legs[0].steps[0].end_location.lng);
// 	alert(direction.routes[0].legs[0].steps[1].html_instructions);
// 	alert(direction.routes[0].legs[0].steps[1].polyline.points);

	//������ transit_details : ���� ������ ,������ ���� �ð�
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.arrival_stop.name);
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.arrival_time.text);
	
	//������ transit_details : Ÿ���ϴ� ��������ġ,�̸�,Ÿ���ϴ½ð�,�����̸�,������ȣ
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.departure_stop.location.lat+" , "+direction.routes[0].legs[0].steps[1].transit_details.departure_stop.location.lng);
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.departure_stop.name);
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.departure_time.text);
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.headsign);
// 	alert(direction.routes[0].legs[0].steps[1].transit_details.line.short_name);
// 	alert(direction.routes[0].legs[0].steps[1].travel_mode);
	
	
	//���±� : 3��° ���������� �ɸ��� �Ÿ�,�ð�,��������ġ,�������̸�,polyline
// 	alert(direction.routes[0].legs[0].steps[2].distance.text);
// 	alert(direction.routes[0].legs[0].steps[2].duration.text);
// 	alert(direction.routes[0].legs[0].steps[2].end_location.lat+" , "+direction.routes[0].legs[0].steps[0].end_location.lng);
// 	alert(direction.routes[0].legs[0].steps[2].html_instructions);
// 	alert(direction.routes[0].legs[0].steps[2].polyline.points);	
// 	alert(direction.routes[0].legs[0].steps[2].travel_mode);
	
	
	
	
	
	
	
})




</script>

</head>
<body>

<div id="map"></div>





</body>
</html>