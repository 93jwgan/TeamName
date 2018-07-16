<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>길찾기 결과 지도에 표출하기</title>
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
    
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&callback=initMap"
    async defer></script>   
    
    

</head>
<body>
<div id="map" style="width:100%;height:400px;"></div>

<script>
 
var sx = 126.93737555322481;
var sy = 37.55525165729346;
var ex = 126.88265238619182;
var ey = 37.481440035175375;

var map;



function initMap(){
	var myOptions = {
				      zoom: 15,
				      center: new google.maps.LatLng(37.502508, 127.030576)
				    },
	map = new google.maps.Map(document.getElementById('map'), myOptions);
	
	searchPubTransPathAJAX();

}


	function searchPubTransPathAJAX() {
		var xhr = new XMLHttpRequest();
		//ODsay apiKey 입력
		var url = "https://api.odsay.com/v1/api/searchPubTransPath?lang=0&SX=126.93737555322481&SY=37.55525165729346&EX=126.88265238619182&EY=37.481440035175375&OPT=1&apiKey=vVLh2Qab+D5tBHbHGawxEw";
		var res = encodeURI(url);
		alert("res : "+res);
		xhr.open("GET", res, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
			console.log( JSON.parse(xhr.responseText) ); // <- xhr.responseText 로 결과를 가져올 수 있음
			//노선그래픽 데이터 호출
			alert("JSON.stringify(xhr.responseText) : "+JSON.stringify(xhr.responseText));
			callMapObjApiAJAX((JSON.parse(xhr.responseText))["result"]["path"][0].info.mapObj);
			}
		}
	}
	

	
	function callMapObjApiAJAX(mabObj){
		var xhr = new XMLHttpRequest();
		//ODsay apiKey 입력
		var url = "https://api.odsay.com/v1/api/searchPubTransPath?lang=0&SX=126.93737555322481&SY=37.55525165729346&EX=126.88265238619182&EY=37.481440035175375&OPT=1&apiKey=vVLh2Qab+D5tBHbHGawxEw";
		var res = encodeURI(url);
		xhr.open("GET", res, true);
		xhr.send();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var resultJsonData = JSON.parse(xhr.responseText);
				var start = new google.maps.LatLng(sx,sy);
				var end = new google.maps.LatLng(ex,ey);
				drawMarker(start);					// 출발지 마커 표시
				drawMarker(end);					// 도착지 마커 표시
				drawNaverPolyLine(resultJsonData);		// 노선그래픽데이터 지도위 표시
				// boundary 데이터가 있을경우, 해당 boundary로 지도이동

			}
		}
	}
	
	// 지도위 마커 표시해주는 함수
	function drawMarker(latlng){
		marker = new google.maps.Marker({
			position: latlng,
			map: map
		})
	}
	
	// 노선그래픽 데이터를 이용하여 지도위 폴리라인 그려주는 함수
	function drawNaverPolyLine(data){
		var lineArray;
		
		for(var i = 0 ; i < data.result.lane.length; i++){
			for(var j=0 ; j <data.result.lane[i].section.length; j++){
				lineArray = null;
				lineArray = new Array();
				for(var k=0 ; k < data.result.lane[i].section[j].graphPos.length; k++){
					lineArray.push(new naver.maps.LatLng(data.result.lane[i].section[j].graphPos[k].y, data.result.lane[i].section[j].graphPos[k].x));
				}
				
			//지하철결과의 경우 노선에 따른 라인색상 지정하는 부분 (1,2호선의 경우만 예로 들음)
				if(data.result.lane[i].type == 1){
					var polyline = new google.maps.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 3,
					    strokeColor: '#003499'
					});
				}else if(data.result.lane[i].type == 2){
					var polyline = new google.maps.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 3,
					    strokeColor: '#37b42d'
					});
				}else{
					var polyline = new google.maps.Polyline({
					    map: map,
					    path: lineArray,
					    strokeWeight: 3
					});
				}
			}
		}
	}
</script>
</body>
</html>








