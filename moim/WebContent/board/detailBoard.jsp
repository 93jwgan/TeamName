<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<body>

<div class="container">

	<div class="page-header text-center">
		<h3 class=" text-info">�Խñ� ���</h3>
	</div>
	
	<form class="form-horizontal" name="detailForm" >
	
		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">�Խñ� ����</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="title" name="title" >${board.title }
			</div>
		</div>	

		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">�Խñ� ����</label>
			<div class="col-sm-4">
				<select class="form-control" id="stateCode" name="stateCode">
					<option value="0" >�����Ű�</option>
					<option value="1" >���ӽŰ��</option>
					<option value="2" >�����Ű�</option>
				</select>		
			</div>
		</div>

	<textarea id="contents" name="contents">${board.contents }</textarea>


</body>
</html>