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
	
<!--  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge"> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> 


 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

	<!--  ///////////////////////// CSS ////////////////////////// -->
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


	</style>
   	
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
		$("a[href='#' ]:contains('로그인')").bind("click" , function() {
			self.location = "/user/login"
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('로그아웃')").bind("click" , function() {
			self.location = "/user/logout"
		});
	});

	$( function() {
		$("a[href='#' ]:contains('ID찾기')").bind("click" , function() {
			self.location = "/user/searchId"
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('비밀번호 찾기')").bind("click" , function() {
			self.location = "/user/searchPw"
		});
	});
	
	
 	$( function() {
		$("a[href='#' ]:contains('내정보보기')").bind("click" , function() {
			var userId = $("#userId").val();
			 self.location = "/user/getMyInfo?userId="+userId
		});
	});
 	
 	$( function() {
		$("a[href='#' ]:contains('내모임보기')").bind("click" , function() {
			self.location = "/user/getMyGroup?"
		});
	});
 	
 	
 	$( function() {
		$("a[href='#' ]:contains('회원정보보기')").bind("click" , function() {
			self.location = "/user/listUserAdmin"
		});
	});
	
	
	$( function() {
		$("a[href='#' ]:contains('내정보수정')").bind("click" , function() {
			var userId = $("#userId").val();
			self.location = "/user/updateUser?userId="+userId
		});
	});
	
	$( function() {
		$("a[href='#' ]:contains('친구목록')").bind("click" , function() {
			self.location = "/friend/listFriend"
		});
	});
	
	
	//============= 회원원가입 화면이동 =============
	$( function() {
		$("a[href='#' ]:contains('모임생성')").bind("click" , function() {
			self.location = "/group/addGroupView"
		});
	});
	 
	$( function() {
		$("a[href='#' ]:contains('모임검색')").bind("click" , function() {
			self.location = "/group/listGroupAdmin"
		});
	});
	$( function() {
		$("a[href='#' ]:contains('모임검색(유저)')").bind("click" , function() {
			self.location = "/group/listGroup"
		});
	});

	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
	
</script>	

</head>

<body>

	  		<div class="text-center">
	  					<h3>회원관리<p></h3>
			  			<a class="btn btn-warning btn-lg" href="#" type="button" data-toggle="tooltip" data-placement="top" title="">회원가입</a>
			  			<a class="btn btn-warning btn-lg" href="#" type="button">로그인</a>
			  			<a class="btn btn-warning btn-lg" href="#" type="button">로그아웃</a>
			  			<a class="btn btn-warning btn-lg" href="#" type="button">ID찾기</a>
			  			<a class="btn btn-success btn-lg" href="#" type="button">비밀번호 찾기</a>
			  			<a class="btn btn-warning btn-lg" href="#" type="button">내정보보기</a>
			  			<a class="btn btn-warning btn-lg" href="#" type="button">내정보수정</a>
			  			<a class="btn btn-success btn-lg" href="#" type="button">회원정보보기(관리자)</a>
			  			<a class="btn btn-default btn-lg" href="#" type="button">회원정보수정(관리자)</a>
			  			<a class="btn btn-default btn-lg" href="#" type="button">내모임보기</a><p>
			  			
			  				<h3>친구관리<p></h3>
			  			<a class="btn btn-success btn-lg" href="#" type="button">친구목록</a>
			  			<a class="btn btn-default btn-lg" href="#" type="button">친구추가</a>
			  			<a class="btn btn-default btn-lg" href="#" type="button">친구프로필보기</a>
			  			<a class="btn btn-default btn-lg" href="#" type="button">친구신청목록보기</a><p>
			  			
			  				<h3>모임관리<p></h3>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">모임생성</a>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">모임검색</a>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">모임검색(유저)</a>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">가입신청</a>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">가입신청취소</a>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">가입신청내역</a>
			  			
			  			<input type="hidden" name="userId" id="userId" value="${user.userId }"/><p><p>
			  			
			  			[로그인상태] <br>
			  			이름 : ${user.name}
			  			
	
			  		</div>

</body>

</html>