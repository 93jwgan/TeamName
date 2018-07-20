<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script type="text/javascript">



</script>
</head>
<body>

<body>

<div class="container">


		<div class="page-header text-center">
			<h3 class=" text-info">게시글 상세보기</h3>
		</div>

<form class="form-horizontal" name="detailForm">
	<div>
		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">게시글 제목</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="title" name="title" value="${board.title }" readonly>
			</div>
		</div>

		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">게시글 유형</label>
			<div class="col-sm-4 form-inline">
				<c:if test="${board.stateCode.trim() == '0'}">
					<input type="text" class="form-control" id="title" name="title" value="모임홍보/자랑" readonly>
				</c:if>
				<c:if test="${board.stateCode.trim() == '1'}">
					<input type="text" class="form-control" id="title" name="title" value="자유게시판" readonly>
				</c:if>
				<c:if test="${board.stateCode.trim() == '2'}">
					<input type="text" class="form-control" id="title" name="title" value="모임인원모집" readonly>
				</c:if>
			</div>
		</div>
	</div>
</form>
	

	${board.contents }
	


</body>
</html>