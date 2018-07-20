
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

/* 해시태그 css */

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
	 
img{
  max-width:100px;
  height:100px;
  margin-top:20px;
}

body{padding-top:50px;}

</style>

<!--------------  JavaScript ------------>
<script type="text/javascript">

function fncGetList(currentPage){
	
	$("#currentPage").val(currentPage);
	$("form").attr("action" , "/group/listGroup").attr("method" , "POST").submit();
}

$(document).ready(function() {
	
	var page = $("#currentPage").val()+1;

    $(window).scroll(function(){
    	
          if ($(window).scrollTop() + $(window).height() == $(document).height()){
				
				page++;
				 $.ajax({
	                		type:"GET",
	                		dataType:"json",
	                		url:"/group/json/listGroup",
	                		data:{"currentPage" : page,
	                			  "pageSize" : 13
	                			  },
	                		success:function(result){

								var list = result.list;

								var html = 	"<tr>";
	                			
	                			 for(var i=1;i<list.length;i++){
	                				
	                				html = html + "<td class='text-center' id='image'><div id='image'>" 
	                				
	                				+ "<img src='/images/group/"+list[i].mainImg+"' alt='"+ list[i].groupNo +"' width='500px' height='500px' class='img-thumbnail'>" +			
	                				
	                				"</div></td>";
	                				if(i%4==0){
	                					html = html + "</tr><tr>"
	                				}
	                				
	                			} 	
	                			html = html + "</tr>";
     							
		                		$("tbody").append(html);

	                		}	                				
	                	 }) 
             }
     }); 
	
	$("button").bind("click",function(){
		var id = $(this).attr('id');
		if(id=="search"){
			fncGetList(1);
		}
		else{
			var value = $(this).attr('value');
			$("#condition").val(1);
			$("#interest").val(value);
			$("#currentPage").val(1);
			$("form").attr("action" , "/group/listGroup").attr("method" , "POST").submit();
		}
	});
	
	$(document).on("click","img",function(){ 

		var groupNo = $(this).attr("alt");
		var url = '/group/getGroup?groupNo='+groupNo;
		window.open(url,'moimMain','width=800, height=800, status=1, scrollbars=1, location=1, toolbar=1');return false
	
	});
	
	$(document).on("mouseover","img",function(){ 

		$(this).animate({opacity: '0.5'});
		
	});
	
	$(document).on("mouseout","img",function(){ 

		$(this).animate({opacity: '1'});
		
	});
	
});
 

</script>

</head>
<!-- ---------head 끝 ------------->

<body>

	<div class="container">
	
		<div class="page-header text-info">
	       <h3>모임찾기</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>모임명</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>카테고리</option>
						<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>유저ID</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="search">검색</button>
				  
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  <input type="hidden" id="interest" name="interest" value=""/>
				  <input type="hidden" id="condition" name="condition" value=""/>
				  
				</form>
				<div class="form-group" style="padding:10px 10px 0px 10px;">
				<button type="button" class="btn btn-default" id="interest1" value="스포츠">스포츠</button>
				<button type="button" class="btn btn-default" id="interest2" value="친목">친목</button>
				<button type="button" class="btn btn-default" id="interest3" value="스터디">스터디</button>
				<button type="button" class="btn btn-default" id="interest4" value="예술">예술</button>
				<button type="button" class="btn btn-default" id="interest5" value="게임">게임</button>
				 </div>
				 <div class="form-group" style="padding:0px 10px 10px 1px;">
				<button type="button" class="btn btn-default" id="interest6" value="여행">여행</button>
				<button type="button" class="btn btn-default" id="interest7" value="건강">건강</button>
				<button type="button" class="btn btn-default" id="interest8" value="음식">음식</button>
				<button type="button" class="btn btn-default" id="interest9" value="고민">고민</button>
				<button type="button" class="btn btn-default" id="interest10" value="자유주제">자유주제</button>
				</div>
				
				</div>
	    	</div>
	    	
		</div>

<div class="container">
	<div class="row">
		
        <div class="col-md-12">
            
        <div class="table-responsive">
        
    <table id="mytable" class="table table-bordred table-striped">     
                   
    <tbody>
    <tr>
    <c:set var="i" value="0" />
	<c:forEach var="group" items="${list}">
		<c:set var="i" value="${i+1}" />
   	 	<td class="text-center" id="image">
				<div id="image">
					<img src="/images/group/${group.mainImg}" alt="${group.groupNo}" width="500px" height="500px" class="img-thumbnail" >
					<input type="text" id="groupName" value="${group.groupName}"/>
					<input type="text" id="groupInfo" value="${group.groupInfo}"/>
				</div>
				
		</td>	
		<c:choose>		
			<c:when test="${i%4==0}"></tr><tr></c:when>
		</c:choose>
	</c:forEach>
	</tr>
    </tbody>
        
</table>

</div>
            
        </div>
	</div>
</div>
    
</body>

</html>

