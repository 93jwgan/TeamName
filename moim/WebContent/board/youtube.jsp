<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta charset="UTF-8">
	<title>유튜브 등록하기</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	
	<link rel="stylesheet" href="http://nstatic.dcinside.com/dgn/gallery/css/gall_popup_1.css" type="text/css"  charset="utf-8"/>
	<style type="text/css">
	#loading { display:none; position:absolute; width:66px; height:66px; top:50%; left:50%; margin-top:-31px; margin-left:-31px; z-index:999999; background-repeat:no-repeat; background-size: 62px 62px; }
	#youtube-items li { cursor:pointer; }
	</style>
	<script type="text/javascript" src="http://nstatic.dcinside.com/dgn/gallery/js/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="http://nstatic.dcinside.com/dgn/gallery/js/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="http://nstatic.dcinside.com/dgn/gallery/js/ctr_cookie.min.js"></script>
	
	<script type="text/javascript">
	var nextPageToken="";
	var i = 0;
	
	function addlink(videoId){
		alert("videoId : "+videoId);
		
		var tempImg = "<p style='text-align: left;''><iframe src='//www.youtube.com/embed/"+videoId+"' width='560' height='314' allowfullscreen='allowfullscreen'></iframe></p>";
					  
		
		
		
		opener.tinymce.activeEditor.execCommand("mceInsertContent",'true',tempImg);
		
		
		self.close();
	}
	
	$(function(){
		var html="";
		$('.btn_search').on('click',function(){			
// 			$('#contents').empty();
			$('#before_text').hide();
			html="";

			$.ajax({
				url : "https://www.googleapis.com/youtube/v3/search?q="+$('#keyword').val()+"&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&part=snippet&order=viewCount&regionCode=KR&type=video", 
				method : "GET",
				data : "json",
				success : function(Data,status){
					for(var i=0;i<Data.items.length;i++){
						nextPageToken = Data.nextPageToken; 
						html += "<div class='form-group'>"+
									"<img src="+Data.items[i].snippet.thumbnails.medium.url+" alt='이미지' onClick=javasciprt:addlink('"+Data.items[i].id.videoId+"')>"+
									"<div class='col-sm-4'>"+
										"<h5>"+Data.items[i].snippet.title+"</h5>"+
										"<div>"+Data.items[i].snippet.channelTitle+"</div>"+
										"<div>"+Data.items[i].snippet.publishedAt+"</div>"+
									"</div>"+
								"</div>";
					
					$('#youtube_box').html(html);
					}
					
				}
			})			
		})
		
		
		$('#contents').scroll(function(){
		
			console.log("$('#contents').scrollTop():" + $('#contents').scrollTop() + " | $('#youtube_box').height():" +$('#youtube_box').height() + " | $('#contents').height(): " + $('#contents').height() + " | $('#youtube_box').scrollTop(): "+$('#youtube_box').scrollTop() );
			
			var scrollTop = $('#contents').scrollTop();
			var contHeight = $('#youtube_box').height() - $('#contents').height();
			
			
			if (($('#contents').scrollTop() + $('#contents').height()-15) == $('#youtube_box').height()){
				
				$.ajax({
					url : "https://www.googleapis.com/youtube/v3/search?q="+$('#keyword').val()+"&key=AIzaSyAfkFqWArB8a77fiEJuJN80OW9TFtfoJhY&part=snippet&order=viewCount&regionCode=KR&pageToken="+nextPageToken+"&type=video", 
					method : "GET",
					data : "json",
					success : function(Data,status){
						for(var i=0;i<Data.items.length;i++){
							nextPageToken = Data.nextPageToken; 
							html += "<div class='form-group'>"+
										"<img src="+Data.items[i].snippet.thumbnails.medium.url+" alt='이미지' onClick=javasciprt:addlink('"+Data.items[i].id.videoId+"')>"+
										"<div class='col-sm-4'>"+
											"<h5>"+Data.items[i].snippet.title+"</h5>"+
											"<div>"+Data.items[i].snippet.channelTitle+"</div>"+
											"<div>"+Data.items[i].snippet.publishedAt+"</div>"+
										"</div>"+
									"</div>";
							
							$('#youtube_box').html(html);
						}
						
					}
				})
				
				
			}				
		})
		
		
		

		
		
		
		
		
	})
	
	</script>
  <title>Youtube Project</title>
  
  
</head>


<body>
	<div class="pop_youtube">
		<form name="f_search" method="get" onsubmit="return false;">
			<div class="top-area">
				<h3 class="tit">유튜브 등록하기</h3>
				<div class="ipt_box">
					<div class="inner">
						<input type="text" id="keyword" name="keyword" placeholder="유튜브 동영상 검색" value="">
						<button class="btn_search"><span>검색</span></button>
					</div>
				</div>
			</div>
		</form>
		
		
	<div id="contents" class="btm-area">
		<p id="before_text" class="notice">유튜브 동영상을 검색해서 등록하세요</p>
		<div id="youtube_box">
		
		
		</div>

		

	</div>
		<div class="btm-box fix">
			<div class="btn-alg-right">
				<a href="javascript:;" onclick="window.close();" class="btn-close">닫기</a>
			</div>
		</div>		
		
		
	</div>

</body>

</html>