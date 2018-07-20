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
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style></style>
   	
   	<!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
	$( function() {
		
		$("a[href='#' ]:contains('가입신청')").bind("click" , function() {
			var groupNo ='<c:out value="${group.groupNo}"/>';
			self.location = "../member/addMemberView?groupNo=" + groupNo
		});
		
		$("a[href='#' ]:contains('가입신청취소')").bind("click" , function() {
			var groupNo ='<c:out value="${group.groupNo}"/>';
			self.location = "../member/deleteMember?groupNo=" + groupNo
		});
		
		$("a[href='#' ]:contains('가입신청내역')").bind("click" , function() {
			self.location = "../member/acceptListMember"
		});
		
	});
	
	</script>	

</head>

<body>

	  		<div class="text-center">
			  			
			  	[모임상태] <br>
			  	모임이름 : ${group.groupName}<br>
			  			
			  	참여한모임원ID : ${member.userId}<br>
			  			
			  	닉네임 : ${member.nickName}<br>
			  			
			  			
				<div class="text-center">
					<a class="btn btn-warning btn-lg" href="#" role="button">가입신청</a>
					<a class="btn btn-warning btn-lg" href="#" role="button">가입신청취소</a>
					<a class="btn btn-warning btn-lg" href="#" role="button">가입신청내역</a>		  				
				</div>
			
			</div>

</body>

</html>