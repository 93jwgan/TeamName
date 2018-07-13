
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
	
	$("#login").bind("click", function()
	{
		
				$.post( "/user/json/login/", 
				{
						userId :  $("input[name='userId']").val(),
						password : $("input[name='password']").val()  
				},
					
					function(JSONData, status) 
					{
					
						 	if(JSONData=="0")
					 		{
								 swal("일치하는 ID가 없습니다.");
					 		}
					 
						 	if(JSONData=="1")
					 		{
								 swal("비밀번호가 틀렸습니다.");
					 		}
					 		
						 	if(JSONData=="2")
					 		{
							 		self.location = "/index.jsp"
					 		}				 
				}); 
});
	

		
		   
	/* 	   
		   
		var id = $("input[name='userId']").val();
		var pw = $("input[name='password']").val();
		
		swal($("input[name='userId']").val());
		
		if(id == null || id.length <1) 
		{
			swal('ID 를 입력하지 않았습니다.');
			$("#userId").focus();
			return;
		}
		
		if(pw == null || pw.length <1) 
		{
			swal('비밀번호를 입력하지 않았습니다.');
			$("#password").focus();
			return;
		}
		
		$("#form").attr("method","POST").attr("action","/user/login").submit();
		
 	}); */
});	




/* $(function() {
	
	$("#find").on("click" , function() {
	
	$.post(  "/user/json/findId/" , 
			{
		userName : $("#userName").val(),
		phone : $("#phone").val()
	   },
	   function(JSONData , status) {
		   var display = "요청하신 ID는 "+ JSONData + "입니다.";
		   
		   $("#showId").text(display);
				}
		);});

 });
 */



	

//$("form").attr("method","POST").attr("action","/user/login").attr("target","_parent").submit();

/* //============= 회원원가입화면이동 =============
$( function() {
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	$("a[href='#' ]:contains('회 &nbsp;원 &nbsp;가 &nbsp;입')").on("click" , function() {
		self.location = "/user/addUser"
	});
	
	$("a[href='#' ]:contains('아이디')").on("click" , function() {

			popWin = window.open("/user/findId.jsp",
					"popWin",
					"left=800, top=100, width=400, height=350, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		
	});
	
	$("a[href='#' ]:contains('비밀번호')").on("click" , function() {

			popWin = window.open("/user/findPassword.jsp",
					"popWin",
					"left=800, top=100, width=400, height=600, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		
	});
	
});

 */


</script>

</head>
<!-- ---------head 끝 ------------->

<body>


<div class="container">
    <div class="row">
		<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">비밀번호찾기</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form" id="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="ID" name="userId" id="userId" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="비밀번호" name="password" id="password"  type="password" value="">
			    		</div>
			    		<input class="btn btn-lg btn-success btn-block" type="button" value="로그인" id="login">
			    		
			    		
			    	</fieldset>
			      	</form>
			    </div>
			</div>
		</div>
	</div>
</div>


</body>

</html>