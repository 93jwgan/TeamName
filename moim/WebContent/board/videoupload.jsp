<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>사진 첨부하기 ::</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
	<style type="text/css">

		body,h1{font-family:'돋움',Dotum,Helvetica,sans-serif;font-size:12px; margin: 0; padding: 0;}
		h1{color:#333;font-size:14px;letter-spacing:-1px}
		button{width: 70px; height: 25px; font-weight: bold; cursor: pointer;}

		#pop_wrap{width:383px}
		#pop_header{height:26px;padding:14px 0 0 20px;border-bottom:1px solid #ededeb;background:#f4f4f3}
		.pop_container{padding:11px 20px 0}
		#pop_footer{margin:21px 20px 0;padding:10px 0 16px;border-top:1px solid #e5e5e5;text-align:center}
		.btn_area{word-spacing:2px}
		.pop_container2{padding:46px 60px 20px}
		.pop_container2 .dsc{margin-top:10px;color:#666;line-height:18px}
		.pop_container2 .dsc strong{color:#13b72a}
		.upload{margin:0 4px 0 0;_margin:0;padding:6px 0 4px 6px;border:solid 1px #d5d5d5;color:#a1a1a1;font-size:12px;border-right-color:#efefef;border-bottom-color:#efefef;length:300px;}

	</style>
<script type="text/javascript">
function submit_to()
{
	
// 	if($('#uploadInputBox').val() != ""){
		
// 		var ext = $('#uploadInputBox').val().split(".").pop().toLowerCase();
// 		if($.inArray(ext, ["jpg","gif","jpeg","png"]) == -1){
	
// 			alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
// 			$(this).val("");
// 			$('#uploadInputBox').val("");
// 			return;
// 		}
// 	}
	
	var tempImg;
	var data = new FormData();
	$.each($('#uploadInputBox')[0].files, function(i,file){
		data.append('file-' + i, file);
	})
	
	alert("data : "+data);
	
	$.ajax({
		url : "/board/json/mediaUpLoad/",
		method : "POST",
		processData : false,
		contentType : false,
		dataType : "text",
		data : data,
		async: false,
		success : function(JSONData,status){
			tempImg="<p style='text-align: left;''><iframe src='C:/MainProject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/moim/media/"+JSON.stringify(JSONData).slice(1,21)+"' width='560' height='314' allowfullscreen='allowfullscreen'></iframe></p>";
		}
	})
		
	opener.tinymce.activeEditor.execCommand("mceInsertContent",'true',tempImg);
	var frm = document.editor_upimage;
	
	if(frm.uploadInputBox.value =="")
	{
		alert("파일을 추가해주세요.");
		return false;	
	}
	
	self.close();
	
}

function pop_close(){
	
	self.close();	
}
</script>
</head>
<body>
<div id="pop_wrap">
	<!-- header -->
    <div id="pop_header">
        <h1>사진 첨부하기</h1>
    </div>
    <!-- //header -->

    <!-- container -->
	<div id="pop_container2" class="pop_container2">
		<form id="editor_upimage" name="editor_upimage" method="post" enctype="multipart/form-data">
        <div id="pop_content2">
			<input type="file" class="upload" id="uploadInputBox" name="uploadInputBox">            
        </div>
		</form>
    </div>
    <!-- //container -->

    <!-- footer -->
    <div id="pop_footer">
	    <div class="btn_area">
	    	<button type="button" onClick="submit_to();">확인</button>
	    	&nbsp;
	    	<button type="button" onClick="pop_close();">취소</button>
        </div>
    </div>
    <!-- //footer -->
</div>
</body>
</html>