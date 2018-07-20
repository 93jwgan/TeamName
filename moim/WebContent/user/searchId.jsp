
<!-- ---------- page 지시문 --------- -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">

<!------------ head 시작 ---------------->
<head>

<meta charset="UTF-8">

<link rel="stylesheet" href="common.css">


<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!---------------  CSS  --------------->
<style>


@font-face { 
	font-family: 'Godo'; 
	font-style: normal; 
	font-weight: 400; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff2') format('woff2'), 
	url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoM.woff') format('woff'); } 

@font-face {
	font-family: 'Godo'; 
	font-style: normal; 
	font-weight: 700; 
	src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff2') format('woff2'), 
	url('//cdn.jsdelivr.net/korean-webfonts/1/corps/godo/Godo/GodoB.woff') format('woff'); } 
	
	 * { font-family: 'Godo', sans-serif; } 
	 
body{padding-top:200px;}


</style>

<!--------------  JavaScript ------------>
<script type="text/javascript">


$(function() {
	
	$("#search").on("click" , function() {
	
	$.post(  "/user/json/searchId/" , 
			{
		name : $("#name").val(),
		phone : $("#phone").val()
	   },
	   function(JSONData , status) {
		   var display = "요청하신 ID는 [ "+ JSONData + " ]입니다.";
		   
		   $("span").text(display);
				}
		);});

 });




</script>

</head>
<!-- ---------head 끝 ------------->

<body>


<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">아이디 찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" id="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="이름" name="name" id="name" type="text">
			    		</div>

			    		<div class="form-group">
			    			<input class="form-control" placeholder="핸드폰번호" name="phone" id="phone"  type="text" value="">
			    		</div>
			    		
			    		<div class="form-group">
			    		<span> </span>
			    		</div>
			    		
			    		
			    		
			    		<input class="btn btn-lg btn-danger btn-block" type="button" value="찾기" id="search">
			    		
			    		
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>


</body>

</html>