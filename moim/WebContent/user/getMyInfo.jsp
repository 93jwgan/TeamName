
<!-- ---------- page 지시문 --------- -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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

td {

 vertical-align: middle;

}


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

<div class="container">
	<div class="form-group">
<form id="form" class="form-horizontal"  >
 <fieldset>
<legend>::: 내정보보기</legend>


<div class="form-group">
  <label class="col-md-4 control-label" ></label>
  <div class="col-md-4">
  
  		<c:if test="${user.profileImg}!=null">
  	<img src = "/images/user/${user.profileImg}" class="img-circle">
  	</c:if>
 
  		<c:if test="${user.profileImg}==null">
  	<img src = "/images/user/user.png" class="img-circle">
  	</c:if>
 
  	
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="userId">ID</label>
  <div class="col-md-4">
 ${user.userId}
     </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="name">이름</label>
  <div class="col-md-4">
${user.name}
  </div>
</div>



<div class="form-group">
  <label class="col-md-4 control-label" for="phone">핸드폰 번호</label>
  <div class="col-md-4">
${user.phone}
</div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="address">주소</label>
  <div class="col-md-4">              
  ${user.address}
  </div>    
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="birthdate">생년월일</label>
  <div class="col-md-4">
 <%-- <fmt:formatDate value="${user.birth}" type="both" dateStyle="short" />  
  --%>
  
   <fmt:parseDate value="${user.birth}" pattern="yyyyMMdd" var="testDt"/> 
   <fmt:formatDate value="${testDt}" type="time" pattern="yyyy.MM.dd"/>


  </div>
    </div>
  


<div class="form-group">
  <label class="col-md-4 control-label" for="interest">관심사</label>
 <div class="col-md-4">
${user.interestNo1}

<c:if test="${user.interestNo2 != null}"> 
, ${user.interestNo2}
</c:if>
<c:if test="${user.interestNo3 != null}"> 
, ${user.interestNo3}
</c:if>
  </div>
    </div>
  
  
<div class="form-group">
<label class="col-md-4 control-label" for="address"></label>
  <div class="col-md-4"> 
    <input id="update" name="update" class="btn btn-default" type="button" value="수정">
  </div> 
  </div>


 </fieldset> 
</form>

</div>
</div>


</body>

</html>