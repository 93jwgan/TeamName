
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
	$("form").attr("action" , "/group/listGroupAdmin").attr("method" , "POST").submit();
}

function deleteShow(groupName, groupNo){
	
	var html1 = "<span class='glyphicon glyphicon-warning-sign'></span>  " + groupName + "을 탈퇴시키겠습니까?"; 
	var html2 = "<input type='hidden' id='selectGroupNo' value="+ groupNo +">";
	
	$("#content").html(html1+html2);
	$("#myModal").modal('show');
	
}

function updateShow(groupNo){
	$("form").attr("action" , "/group/updateGroupAdmin?groupNo="+groupNo).attr("method" , "POST").submit();
} 



$(function() {
	 
	$( "#search" ).bind("click" , function() {
		fncGetList(1);
	});
		
		
	$( "#group_delete" ).bind("click" , function() {
	
		$.ajax({
			url : "/group/json/deleteGroupAdmin/",
			method : "POST" ,
			data : { 	
					groupNo : $("#selectGroupNo").val(),
						} ,	
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			dataType : "json" ,
			success : function(JSONData, status) {
				alert("모임이 삭제되었습니다.");
				fncGetList(1);
			}
		});
		
	}); 
	
	 
});


</script>

</head>
<!-- ---------head 끝 ------------->

<body>

	<div class="container">
	
		<div class="page-header text-info">
	       <h3>모임목록조회</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount} 개,   현재 ${resultPage.currentPage} 페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
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
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>

<div class="container">
	<div class="row">
		
        <div class="col-md-12">
            
        <div class="table-responsive">
        
              <table id="mytable" class="table table-bordred table-striped">     
                   <thead>
                   <tr>
                   	<th class="text-center">번호</th>
                   	<th class="text-center">모임명</th>
                   	<th class="text-center">모임장ID</th>
                  	<th class="text-center">모임원 수</th>
                  	<th class="text-center">등급</th>
                    <th class="text-center">포인트</th>
                    <th class="text-center">카테고리</th>
                    <th class="text-center">모임생성일</th>
                    
                    <th class="text-center">수정</th>
                    <th class="text-center">삭제</th>
                   </tr>
                   </thead>
    <tbody>
    
    <c:set var="i" value="0" />
	<c:forEach var="group" items="${list}">
		<c:set var="i" value="${i+1}" />
    	<tr>
   	 	<td class="text-center"> ${i} </td>
     	<td class="text-center">
     		<a href="#" onClick="window.open('/group/getGroup?groupNo=${group.groupNo}','moimMain','width=800, height=700, status=1, scrollbars=1, location=1, toolbar=1');return false;">${group.groupName}</a>   
     	</td>
   	

     	<td class="text-center">
     		<a href="/user/getMyInfo?userId=${group.groupMaster}">${group.groupMaster}</a>   
     	</td>
    	<td class="text-center"> ${group.count} </td>
    	<td class="text-center"> ${group.rank} </td>
    	<td class="text-center"> ${group.point} </td>
    	
	
    	<c:choose>		
			<c:when test="${group.interestNo2==null}">
				<td class="text-center"> ${group.interestNo1}</td>
			</c:when> 
			<c:when test="${group.interestNo3==null}">
				<td class="text-center"> ${group.interestNo1}, ${group.interestNo2}</td>
			</c:when> 
			<c:otherwise>
				<td class="text-center"> ${group.interestNo1}, ${group.interestNo2}, ${group.interestNo3}</td>
			</c:otherwise>
		</c:choose> 
    	<td class="text-center"> ${group.birthDate}</td>
    	<td  class="text-center"><button class="btn btn-primary btn-xs" onclick="updateShow('${group.groupNo}')"><span class="glyphicon glyphicon-pencil"></span></button></td>
    	<td  class="text-center"><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" onclick="deleteShow('${group.groupName}','${group.groupNo}')"><span class="glyphicon glyphicon-remove-sign"></span></button></p></td>
    </tr>
	</c:forEach>
    </tbody>
        
</table>

</div>

 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	<!-- PageNavigation End... -->
            
        </div>
	</div>
</div>

    <div class="modal fade" id="delete" role="dialog" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">

    <div class="modal-dialog">

      <div class="modal-content">

        <div class="modal-header">
		
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        
         <h4 class="modal-title custom_align" id="Heading">모임삭제</h4>

        </div>

        <div class="modal-body">

		  <div class="alert alert-danger" id="content"></div>

        </div>

        <div class="modal-footer">

          <button type="button" class="btn btn-success" id="group_delete" ><span class="glyphicon glyphicon-ok-sign"></span> 네</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 아니요</button>

        </div>

      </div>   

    </div>

  </div>   
    
</body>


</html>

