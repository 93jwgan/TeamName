<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8">

<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>



<style>

/* bootstrap-tagsinput.css file - add in local */

.bootstrap-tagsinput {
  background-color: #fff;
  border: 1px solid #ccc;
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
  display: inline-block;
  padding: 4px 6px;
  color: #555;
  vertical-align: middle;
  border-radius: 4px;
  max-width: 500px;
  line-height: 30px;
  cursor: text;
}
.bootstrap-tagsinput input {
  border: none;
  box-shadow: none;
  outline: none;
  background-color: transparent;
  padding: 0 6px;
  margin: 0;
  width: auto;
  max-width: inherit;
}
.bootstrap-tagsinput.form-control input::-moz-placeholder {
  color: #777;
  opacity: 1;
}
.bootstrap-tagsinput.form-control input:-ms-input-placeholder {
  color: #777;
}
.bootstrap-tagsinput.form-control input::-webkit-input-placeholder {
  color: #777;
}
.bootstrap-tagsinput input:focus {
  border: none;
  box-shadow: none;
}
.bootstrap-tagsinput .tag {
  margin-right: 2px;
  color: white;
}
.bootstrap-tagsinput .tag [data-role="remove"] {
  margin-left: 8px;
  cursor: pointer;
}
.bootstrap-tagsinput .tag [data-role="remove"]:after {
  content: "x";
  padding: 0px 2px;
}
.bootstrap-tagsinput .tag [data-role="remove"]:hover {
  box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05);
}
.bootstrap-tagsinput .tag [data-role="remove"]:hover:active {
  box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
}

</style>

<script type="text/javascript">
$(function(){
	
	function fncAddMember(){
		
		var regName = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		var nickName = $("#nickName").val();
		var nameCheck = $("#nameCheck").val();
		
		if(nameCheck == "1"){
			alert("이미존재하는 닉네임입니다.");
			$("#groupName").focus();
			return;
		}
		
	    if(regName.test(nickName)){
	    	alert("닉네임에는 특수문자를 입력하실수 없습니다.");
	        $("#groupName").val("");
	        $("#groupName").focus();
	        return;
	    }
		
		if(nickName==""){
			alert("닉네임은 반드시 입력하셔야합니다.");
			return;
		}
		alert("가입신청이 완료되었습니다.");
		$("#form").attr("method" , "POST").attr("action" , "/member/addMember").submit();
	}
	
	
	$("#nickName").bind("keyup", function() {
		if ($("#nickName").val().length == 0) {
			$("#nickName").text("닉네임을 입력해주세요.");
			
		}
		else{
			$.ajax({
				url : "/member/json/checkedMemberName/",
				method : "POST" ,
				data : { 	
							nickName : $("#nickName").val(),	
							} ,	
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				dataType : "json" ,
				success : function(JSONData, status) {
					if (JSONData == "1") {
						$("#checkNickName").text("사용할 수 있는 닉네임입니다.");
						$("#nameCheck").val("0");
					} else {				
						$("#checkNickName").text("이미 존재하는 닉네임입니다.");
						$("#nameCheck").val("1");
					} 
				}
		});		
		}
	});
	
	$("#add").bind("click", function() {
		fncAddMember();
	});
	
	$("#mainImg").change(function(){
		if($(this).val() != ""){
			var ext = $(this).val().split(".").pop().toLowerCase();
			if($.inArray(ext, ["jpg","gif","jpeg","png"]) == -1){
				alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
				$(this).val("");
				return;
			}
			
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024;
			if(fileSize > maxSize){
				alert("파일용량이 1MB를 초과했습니다.");
				$(this).val("");
			}

		}
	});
	
});


</script>

</head>

<body>

<div class="container">
	<div class="row">
	<form class="form-horizontal" id="form" enctype="multipart/form-data">
<fieldset>

<legend>::: 가입신청</legend>

<div class="control-group">
  <label class="control-label">닉네임</label>
  <div class="controls">
    <input id="nickName" name="nickName" class="input-xlarge" type="text" maxlength="10">
    <strong class="text-danger"	id="checkNickName">닉네임을 입력해주세요.</strong>
  </div>
</div> 

<div class="control-group">
	<label class="control-label">미리보기</label>
	<img id="blah" class="img-thumbnail">
</div>

<div class="control-group">
  <label class="control-label">프로필사진</label>
  <div class="controls">
    <input id="mainImg" name="ImgFile" class="input-file" type="file">
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="groupInfo">하고싶은말</label>
  <div class="controls">
    <textArea id="comments" name="comment" style="width:500px; height:200px;" maxlength="150"></textArea>
  </div>
</div>

<div class="control-group">
  <label class="control-label" for="submit"></label>
  <div class="controls">
    <input id="add" class="btn btn-primary" type="button" value="신청하기">
    <input type="hidden" id="nameCheck" value="0"/>
    <input type="hidden" id="groupNo" name="groupNo" value="${groupNo}"/>
  </div>
</div>

</fieldset>
</form>

	</div>
</div>


<script type="text/javascript" src="./js/hashTag.js"></script>
</body>

</html>