
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
	 
img{
  max-width:100px;
  height:100px;
  margin-top:20px;
}

body{padding-top:50px;}

</style>

<!--------------  JavaScript ------------>
<script type="text/javascript">

$("#join").bind("click", function() 
		{
		self.location = "/user/updateUser.jsp"
      });




</script>



</head>
<!-- ---------head 끝 ------------->

<body>
<!-- -검색 -->
<body>

	<div class="container">
	
		<div class="page-header text-info">
	       <h3>회원정보보기</h3>
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
                  <th class="text-center">ID</th>
                  <th class="text-center">이름</th>
                     <th class="text-center">핸드폰번호</th>
                     <th class="text-center">생년월일</th>
                     <th class="text-center">주소</th>
                      <th class="text-center">관심사</th>
                      <th class="text-center">가입날짜</th>
                      <th class="text-center">접속상태</th>
                      <th class="text-center">가입모임갯수</th>                     
                       <th class="text-center">수정</th>
                       <th class="text-center">탈퇴</th>
                       </tr>
                   </thead>
    <tbody>
    
    <c:set var="i" value="0" />
	<c:forEach var="group" items="${list}">
		<c:set var="i" value="${i+1}" />
    	<tr>
   	 	<td class="text-center"> ${i}1 </td>
     	<td class="text-center">222
     	</td>
     	<td class="text-center">
     		<a href="/user/getMyInfo?groupMaster=${group.groupMaster}">${group.groupMaster}</a>
     	</td>
    	<td class="text-center"> ${group.count}2 </td>
    	<td class="text-center"> ${group.rank} 3</td>
    	<td class="text-center"> ${group.point}4 </td>
    	
	
    	<c:choose>		
			<c:when test="${group.interestNo2==null}">
				<td class="text-center"> ${group.interestNo1}5</td>
			</c:when> 
			<c:when test="${group.interestNo3==null}">
				<td class="text-center">6 ${group.interestNo1}, ${group.interestNo2}</td>
			</c:when> 
			<c:otherwise>
				<td class="text-center"> 7${group.interestNo1}, ${group.interestNo2}, ${group.interestNo3}</td>
			</c:otherwise>
		</c:choose> 
    	<td class="text-center"> 8</td>
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

