<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">

<head>

<meta charset="UTF-8">

<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<style>
</style>

<script type="text/javascript">

</script>
</head>

<body>

	<div class="container">
	<div class="row">
	<form class="form-horizontal" id="form" enctype="multipart/form-data">
		<fieldset>

			<legend>::: 모임관리(관리자)</legend>
	
		<div class="col-md-3 text-left">
		  	<p class="text-primary">
		  		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		   	</p>
		</div>
		    
		<div class="col-md-9 text-right">
		<div class="form-group">
			<select class="form-control" name="searchCondition" >
			<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }> 모임명</option>
			<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}> 카테고리</option>
			<option value="2"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }> 생성일</option>
			</select>
			
			<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
			
			<button type="button" class="btn btn-default" id="search">검색</button>
		</div>
				    
		<input type="hidden" id="currentPage" name="currentPage" value=""/>
		<input type="hidden"  name="menu" value="${menu}"/>
			
	    </div>
	    	
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="center">모임등급</th>
            <th align="center" >모임명</th>
            <th align="center">모임장ID</th>
            <th align="center">카테고리</th>
            <th align="center">모임원 수</th>
            <th align="center">모임생성일</th>
            <th align="center">모임포인트</th>
		  </tr>
        </thead>
       
		<tbody>
		
		<c:set var="i" value="0" />
		<c:forEach var="grouup" items="${list}">
		<c:set var="i" value="${ i+1 }" />
		<tr>
			<td align="center" class ="ct_btn01">${ i }</td>
   
			  <td class = "ct_btn01" align="left" name="prodName" id="prodName">	${product.prodName}
			  <input type="hidden" name="prodNo" value="${product.prodNo}"/>
			  </td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left">
			  
			  		<c:choose>		
			<c:when test = "${product.proTranCode.trim() ==null}"> 판매중 </c:when> 
			<c:when test = "${product.proTranCode.trim() >0 && (user==null || user.role=='user')}"> 재고없음 </c:when> 	
			<c:when test = "${product.proTranCode.trim() ==1}">구매완료
		배송하기
			 </c:when>
			<c:when test = "${product.proTranCode.trim() ==2}">배송중 </c:when>
			<c:when test = "${product.proTranCode.trim() ==3}">배송완료 </c:when>
			
		</c:choose>
			  
			  
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      </table>
      	</form>
	  <!--  table End /////////////////////////////////////-->
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
	<!-- 판매중/재고없음/구매완료 -->			
	
				


 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	


 	<!-- PageNavigation Start... -->
 
	<!--
	 PageNavigation End... -->
	
	


</body>

</html>