
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


<!--  CSS 넣을곳 -->
<style>
</style>

<!--  JavaScript 넣을곳 -->
<script type="text/javascript">


// ----- join 버튼 클릭 -----------
$(function(){

		$("#join").on("click", function() {
		 addUser();
		});
		
});
		
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
		
			$("form").attr("method", "POST").attr("action", "/user/addUser")
					.submit();
		}
		

	});

</script>



</head>
<!-- ---------head 끝 ------------->




<body>

<div class="container">
	<div class="row">
	<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>::: 회원가입</legend>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="userId">ID</label>
  <div class="controls">
    <input id="userId" name="userId" placeholder="ID를 입력하세요" class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- File Button --> 
<div class="control-group">
  <label class="control-label" for="profileImg">프로필 사진</label>
  <div class="controls">
    <input id="profileImg" name="profileImg" class="input-file" type="file">
  </div>
</div>


<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="name">이름</label>
  <div class="controls">
    <input id="name" name="name" placeholder="이름을 입력하세요." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="password">비밀번호</label>
  <div class="controls">
    <input id="password" name="password" placeholder="비밀번호를 입력하세요." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>



<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="password2">비밀번호 확인</label>
  <div class="controls">
    <input id="password2" name="password2" placeholder="비밀번호를 다시 입력하세요." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Text input-->
<div class="control-group">
  <label class="control-label" for="phone">핸드폰 번호</label>
  <div class="controls">
    <input id="phone" name="phone" placeholder="핸드폰번호를 입력하세요." class="input-xlarge" type="text">
    <p class="help-block">Error</p>
  </div>
</div>

<!-- Textarea -->
<div class="control-group">
  <label class="control-label" for="Address">주소</label>
  <div class="controls">                     
    <textarea id="Address" name="Address">주소를 입력하세요.</textarea>
  </div>
</div>

<!-- Appended Input-->
<div class="control-group">
  <label class="control-label" for="birthdate">생년월일</label>
  <div class="controls">
    <div class="input-append">
      <input id="birthdate" name="birthdate" class="input-large" placeholder="생년월일을 입력하세요." type="text">
      <span class="add-on">DOB</span>
    </div>
    <p class="help-block">Error</p>
  </div>
</div>


<!-- Multiple Radios (inline) -->
<div class="control-group">
  <label class="control-label" for="interest">관심사</label>
  <div class="controls">
    <label class="checkbox" for="interest-0">
      <input name="interest" id="interest-0" value="ok" type="checkbox">
    ok 
    </label>
    
  </div>
</div>

<!-- Select Basic -->
<div class="control-group">
  <label class="control-label" for="course">Apply For</label>
  <div class="controls">
    <select id="course" name="course" class="input-xlarge">
      <option>Select Course</option>
      <option>Computer Course</option>
      <option>University Course</option>
      <option>Other Course</option>
    </select>
  </div>
</div>



<!-- Button -->
<div class="control-group">
  <label class="control-label" for="submit"></label>
  <div class="controls">
    <button id="join" name="join" class="btn btn-primary">가입</button>
  </div>
</div>

</fieldset>
</form>

	</div>
</div>



</body>

</html>