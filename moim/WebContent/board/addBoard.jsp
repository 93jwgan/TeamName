<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<!--tiny 게시판 api-->
	<script src="https://cloud.tinymce.com/stable/tinymce.min.js?apiKey=lwlzcplt13lg117gocmfjrdnz4ifgdesm61gzcl6slodbja6"></script>
	
<title>hi</title>

    <script type="text/javascript">
    
    $(function(){
    	$( "button.btn.btn-info:contains('등록하기')" ).on("click" , function() {
    		
			
    		$('#contents').val(tinyMCE.activeEditor.getContent());
    		
    		$("form").attr("method","POST").attr("action","/board/addBoard").submit();
    	})	
    })
    
    
    
    
    
        tinymce.init({
            selector: "#contents",
            theme: "modern",
            language: "ko",
            height:500,
            min_height: 300,
            menubar:false,
            plugins: "autolink autosave code link media image table textcolor autoresize",
            toolbar: "undo redo | styleselect | forecolor bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | table link youtube custom_media custom_image code ",
            setup: function(editor) {
	            editor.addButton('custom_image', {
	                    title: '이미지삽입',
	                    icon: 'image',
	                    onclick: function() {
	                        window.open("./photoupload.jsp","tinymcePop","width=400,height=350");
	                    }
	                })
	            editor.addButton('youtube', {
	                title: 'YouTube',
	                icon: 'media',
	                onclick: function() {
	                    window.open("./youtube.jsp","tinymcePop","width=550,height=800");
	                }
	            })
   	            editor.addButton('custom_media', {
	                title: '동영상삽입',
	                icon: 'media',
	                onclick: function() {
	                    window.open("./videoupload.jsp","tinymcePop","width=400,height=350");
	                }
	            })
            }

        });

    </script>

	
</head>
<body>

<div class="container">

	<div class="page-header text-center">
		<h3 class=" text-info">게시글 등록</h3>
	</div>
	
	<form class="form-horizontal" name="detailForm" >
	
		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">게시글 제목</label>
			<div class="col-sm-4">
			<input type="text" class="form-control" id="title" name="title" >
			</div>
		</div>	

		<div class="form-group">
			<label for="title" class="col-sm-offset-1 col-sm-3 control-label">게시글 유형</label>
			<div class="col-sm-4">
				<select class="form-control" id="stateCode" name="stateCode">
					<option value="0" >모임홍보/자랑</option>
					<option value="1" >자유게시판</option>
					<option value="2" >모임인원모집</option>
				</select>		
			</div>
		</div>

	<textarea id="contents" name="contents">Next, get a free Tiny Cloud API key!</textarea>
	

	
		
	<button type="button" class="btn btn-info">등록하기</button>
			
	
	</form>
	
	
	
	
	
	
	
</div>


</body>
</html>