
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

	<div class="container" align="right">
    <div class="input-group  col-md-3">
    <div class="input-group-btn search-panel">
		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
		<span id="search_concept">검색</span> <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#id"><i class="fa fa-angle-double-right"></i> ID</a></li>
			<li><a href="#name"><i class="fa fa-angle-double-right"></i>이름</a></li>
			<li><a href="#description"><i class="fa fa-angle-double-right"></i> 핸드폰번호</a></li>
			<li><a href="#description"><i class="fa fa-angle-double-right"></i> 생년월일</a></li>
			<li><a href="#description"><i class="fa fa-angle-double-right"></i> 주소</a></li>
			<li><a href="#description"><i class="fa fa-angle-double-right"></i> 관심사</a></li>
			<li><a href="#description"><i class="fa fa-angle-double-right"></i> 가입날짜</a></li>
		</ul>
	</div>
	<input type="hidden" name="search_param" value="name" id="search_param">		 
	<input type="text" class="form-control" name="q" placeholder="검색" id="search_key" value="">
	<span class="input-group-btn">
			<a class="btn btn-default text-muted" href="http://adminlte.dev/user/item" title="Clear"><i class="glyphicon glyphicon-remove"></i> </a>
			<button class="btn btn-info" type="submit"> 검색  </button>
	</span>
</div>
</div>


<div class="container">
	<div class="row">
		
        <div class="col-md-12">
        <h3>::: 회원정보보기</h3>
            
        <div class="table-responsive">
        
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
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
                   </thead>
    <tbody>
    
    <tr>
    <td class="text-center"> user07 </td>
    <td class="text-center"> 신유진 </td>
    <td class="text-center">01063387328</td>
    <td class="text-center">1990-08-25</td>
    <td class="text-center">서울시 동작구 사당로</td>
    <td class="text-center">음식,예술,자유주제</td>
    <td class="text-center">2018-07-12</td>
    <td class="text-center">ON</td>
    <td class="text-center">3개</td>
    
    <td  class="text-center"><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td  class="text-center"><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-remove-sign"></span></button></p></td>
    </tr>
    

   
    
    </tbody>
        
</table>
</div>

 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator.jsp"/>
	<!-- PageNavigation End... -->
            
        </div>
	</div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">회원정보 수정</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
        <input class="form-control " type="text" placeholder="Mohsin">
        </div>
        <div class="form-group">
        
        <input class="form-control " type="text" placeholder="Irshad">
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
    
        
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">회원탈퇴</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> [user07, 신유진] 회원을 탈퇴시키겠습니까?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> 네</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 아니요</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    

</body>


</html>

