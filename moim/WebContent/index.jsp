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
	 
body{padding-top:10px;}
	
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
 	
 	/*
 	$( function() {
		$("a[href='#' ]:contains('회원정보보기')").bind("click" , function() {
			self.location = "/user/listUserAdmin"
		});
	});
*/ 	
	
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
	
	//============= 게시판,고객센터 =============
		
		$("a[href='#' ]:contains('게시판')").bind("click" , function() {
			self.location = "/board/listboardView"
		});		
		
		
	});
	
	
		
	
</script>	

</head>

<body>

	  		<div class="text-center">
	  					<h3>회원관리<p></h3>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">회원가입</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">로그인</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">로그아웃</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">ID찾기</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">비밀번호 찾기</a>
			  			<a class="btn btn-warning btn-lg" href="#" role="button">내정보보기</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">내정보수정</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">회원정보보기(관리자)</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">회원정보수정(관리자)</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">내모임보기</a><p>
			  			
			  				<h3>친구관리<p></h3>
			  			<a class="btn btn-default btn-lg" href="#" role="button">친구목록</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">친구추가</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">친구프로필보기</a>
			  			<a class="btn btn-default btn-lg" href="#" role="button">친구신청목록보기</a><p>
			  			
			  				<h3>모임관리<p></h3>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">모임생성</a>
			  			 <a class="btn btn-warning btn-lg" href="#" role="button">모임검색</a><p><p>
			  			
			  			<input type="hidden" name="userId" id="userId" value="${user.userId }"/>
			  				
			  				
			  				<h3>게시판,고객센터<p></h3>
						<a class="btn btn-warning btn-lg" href="#" role="button">게시판</a>
						<a class="btn btn-warning btn-lg" href="#" role="button">고객센터</a><p><p>			  				
			  			[로그인상태] <br>
			  			이름 : ${user.name}
			  			
			  		</div>

</body>

</html>