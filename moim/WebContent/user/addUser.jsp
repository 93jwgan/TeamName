
<!-- ---------- page 지시문 --------- -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>

<html lang="ko">

<!------------ head 시작 ---------------->
<head>

<meta charset="UTF-8">

<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet"> 

<!--  CSS 넣을곳 -->
<style>
*{font-family: 'Nanum Gothic', sans-serif;}
</style>

<!--  JavaScript 넣을곳 -->
<script type="text/javascript">



// ------ join 클릭 시 유효성검사 로직 ------
	function addUser() {

			 var id = $("input[name='userId']").val();
			var pw = $("input[name='password']").val();
			var pw_confirm = $("input[name='password2']").val();
			var name = $("input[name='name']").val();
			
			if (id == null || id.length < 1) {
				alert("아이디를 입력해주세요.");
				return;
			}
			if (pw == null || pw.length < 1) {
				alert("비밀번호를 입력해주세요.");
				return;
			}
			if (pw_confirm == null || pw_confirm.length < 1) {
				alert("비밀번호 확인은 반드시 입력해야 합니다.");
				return;
			}
			if (name == null || name.length < 1) {
				alert("이름을 입력해주세요.");
				return;
			}
	
			if (pw != pw_confirm) {
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}
		
			//핸드폰 번호 합치기
			

			var value = "";
			
			if ($("input:text[name='phone1']").val() != ""
					&& $("input:text[name='phone2']").val() != "") {
			
				var value = "010"
						+ $("input[name='phone1']").val()
						+ $("input[name='phone2']").val();
			}
			
			$("input:hidden[name='phone']").val(value);

			$("#form").attr("method", "POST").attr("action", "/user/addUser").submit();
			
	};
	
				
	$(function() {

		// ----- join 버튼 클릭 -----------
		
		$("#join").bind("click", function() {
			 	 
			addUser();
		});
		

		
		//------------- ID 중복확인---------------------
		
		
		 $("#userId").bind("keyup", function() {
				
			if($("#userId").val().length == 0){
				$("#checkId").text("ID를 입력하세요.");
			}
		else  if ($("#userId").val().length > 6) {
						$.post("/user/json/checkId/", {
							userId : $("#userId").val(),
						},
		
						function(JSONData, status) {
							if (JSONData == "") {
								$("#checkId").text("사용할 수 있는 ID 입니다.");
		
							} else {
								$("#checkId").text("이미 존재하는 ID 입니다.");
		
							}
						});
		
					}
						else  {
							$("#checkId").text("ID는 6글자 이상으로 입력해주세요.");
						}
			
		}); 
	});
	
	
</script>



</head>
<!-- ---------head 끝 ------------->




<body>

<div class="container">
	<div class="row">
	
	<form id="form" class="form-horizontal" >
 <fieldset>


<h1><legend>::: 회원가입</legend></h1>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="userId">ID</label>
  <div class="controls">
    <input id="userId" name="userId" placeholder="ID를 입력하세요" class="input-xlarge" type="text">
     <p class="help-block" id="checkId">ID를 입력하세요.</p>
  </div>
</div>


<div class="control-group">
  <label class="control-label" for="profileImg">프로필 사진</label>
  <div class="controls">
    <input id="profileImg" name="profileImg" class="input-file" type="file">
  </div>
</div>



<div class="control-group">
  <label class="control-label" for="name">이름</label>
  <div class="controls">
    <input id="name" name="name" placeholder="이름을 입력하세요." class="input-xlarge" type="text">
  </div>
</div>


<div class="control-group">
  <label class="control-label" for="password">비밀번호</label>
  <div class="controls">
    <input id="password" name="password" placeholder="비밀번호를 입력하세요." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>




<div class="control-group">
  <label class="control-label" for="password2">비밀번호 확인</label>
  <div class="controls">
    <input id="password2" name="password2" placeholder="비밀번호를 다시 입력하세요." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>


<div class="control-group">
  <label class="control-label" for="phone">핸드폰 번호</label>
  <div class="controls">
010-
    <input id="phone1" name="phone1"  class="input-small" type="text">
    -
    <input id="phone2" name="phone2"  class="input-small" type="text">
     <button id="confirmPhone" name="confirmPhone" class="btn btn-default">인증</button>
    <input type="hidden" name="phone"/>
    
    <p class="help-block">Error</p>
  </div>
</div>


<div class="control-group">
  <label class="control-label" for="address">주소</label>
  <div class="controls">              
  
      <input id="address" name="address" placeholder="주소를 입력하세요." class="input-xlarge" type="text"> 
          <button id="findAddress" name="findAddress" class="btn btn-default">찾기</button>
          
      </div>
</div>


<div class="control-group">
  <label class="control-label" for="birthdate">생년월일</label>
  <div class="controls">
    <div class="input-append">
  
    <input id="birth" name="birth" class="input-small" placeholder="년도" type="text">
    
    <select id="birthMonth" name="birthMonth" class="input-small">
      <option>01</option>
      <option>02</option>
      <option>03</option>
      <option>04</option>
      <option>05</option>
      <option>06</option>
      <option>07</option>
      <option>08</option>
      <option>09</option>
      <option>10</option>
      <option>11</option>
      <option>12</option>
    </select>
    
    
    
    <select id="birthDay" name="birthDay" class="input-small">
      <option>01</option>
      <option>02</option>
      <option>03</option>
      <option>04</option>
      <option>05</option>
      <option>06</option>
      <option>07</option>
      <option>08</option>
      <option>09</option>
      <option>10</option>
      <option>11</option>
      <option>12</option>
      <option>13</option>
      <option>14</option>
      <option>15</option>
      <option>16</option>
      <option>17</option>
      <option>18</option>
      <option>19</option>
      <option>20</option>
      <option>21</option>
      <option>22</option>
      <option>23</option>
      <option>24</option>
      <option>25</option>
      <option>26</option>
      <option>27</option>
      <option>28</option>
      <option>29</option>
      <option>30</option>
      <option>31</option>
    </select>

    
    </div>
  </div>
</div>



<div class="control-group">
  <label class="control-label" for="interest">관심사</label>
  <div class="controls">
    <label class="checkbox" for="interestNo1">
      <input name="interestNo1" id="interestNo1" value="ok" type="checkbox">
    ok 
    </label>    
  </div>
</div>




  <div class="controls"> 
    <input id="join" name="join" class="btn btn-default" type="button" value="가입">
  </div> 


 </fieldset> 
</form>

</div>
</div>



</body>

</html>