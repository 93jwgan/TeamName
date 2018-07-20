
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css">


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
	 
body{padding-top:50px;}


.list-content{
 min-height:100px;
}
.list-content .list-group .title{
  background:#110175;
  border:0px solid #DDDDDD;
  font-weight:bold;
  color:#FFFFFF;
}
.list-group-item img {
    height:40px; 
    width:40px;
}

.jumbotron .btn {
    padding: 3px 3px !important;
    font-size: 14px !important;
}
.prj-name {
    color:#000000;    
}
.break{
    width:100%;
    margin:0px;
}
.name {
    color:#000000;    
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

<div class="container bootstrap snippet">

  <div class="header">
    
  </div>


  <div class="jumbotron list-content">
    <ul class="list-group">
      <li href="#" class="list-group-item title">
     내 친구목록
      </li>
      
        <li href="#" class="list-group-item">
        <a class="btn btn-block btn-primary">
            ON
        </a>
      </li>
      
      
      <li href="#" class="list-group-item text-left">
        <img class="img-thumbnail" src="https://bootdey.com/img/Content/User_for_snippets.png">
        <label class="name">
            Juan guillermo cuadrado<br>
        </label>
        <label class="pull-right">
            <a  class="btn btn-success btn-xs glyphicon glyphicon-ok" href="#" title="View"></a>
            <a  class="btn btn-danger  btn-xs glyphicon glyphicon-trash" href="#" title="Delete"></a>
            <a  class="btn btn-info  btn-xs glyphicon glyphicon glyphicon-comment" href="#" title="Send message"></a>
        </label>
        <div class="break"></div>
      </li>
      <li href="#" class="list-group-item text-left">
          <img class="img-thumbnail"  src="https://bootdey.com/img/Content/user_1.jpg">
        <label class="name">
          James Rodriguez (10)
        </label>
        <label class="pull-right">
            <a  class="btn btn-success btn-xs glyphicon glyphicon-ok" href="#" title="View"></a>
            <a  class="btn btn-danger  btn-xs glyphicon glyphicon-trash" href="#" title="Delete"></a>
            <a  class="btn btn-info  btn-xs glyphicon glyphicon glyphicon-comment" href="#" title="Send message"></a>
        </label>
        <div class="break"></div>
      </li>
      <li href="#" class="list-group-item text-left">
          <img class="img-thumbnail"  src="https://bootdey.com/img/Content/user_2.jpg">
          <label class="name">
            Mariana pajon
          </label>
        <label class="pull-right">
            <a  class="btn btn-success btn-xs glyphicon glyphicon-ok" href="#" title="View"></a>
            <a  class="btn btn-danger  btn-xs glyphicon glyphicon-trash" href="#" title="Delete"></a>
            <a  class="btn btn-info  btn-xs glyphicon glyphicon glyphicon-comment" href="#" title="Send message"></a>
        </label>
        <div class="break"></div>
      </li>
      <li href="#" class="list-group-item text-left">
        <a class="btn btn-block btn-primary">
            OFF
        </a>
      </li>
    </ul>
  </div>
  </div>
</div>                                                                                

</body>


