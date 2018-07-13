<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$.getJSON( "https://maps.googleapis.com/maps/api/directions/json?origin=Disneyland&destination=Universal+Studios+Hollywood4&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY", function( data ) {
		 alert(JSON.stringify(data));
		});

	
})

</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>