<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	//============= 회원원가입 화면이동 =============
	$( function() {
		$("a[href='#' ]:contains('회원가입')").bind("click" , function() {
			self.location = "/user/addUserView"
		});
	});
	
	//============= 로그인 화면이동 =============
	$( function() {
		//==> 추가된부분 : "addUser"  Event 연결
		$("a[href='#' ]:contains('로그인')").bind("click" , function() {
			self.location = "/user/login"
		});
	});
	
	
	//============= 회원원가입 화면이동 =============
	$( function() {
		$("a[href='#' ]:contains('모임생성')").bind("click" , function() {
			self.location = "/group/addGroup"
		});
	});
	
</script>	

</head>

<body>

	  		<div class="text-center">
			  			<a class="btn btn-info btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-info btn-lg" href="#" role="button">로그인</a>
			  			 <a class="btn btn-info btn-lg" href="#" role="button">모임생성</a>
			  			  			
			  		</div>

</body>

</html>