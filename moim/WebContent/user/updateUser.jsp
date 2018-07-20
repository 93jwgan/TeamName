
<!------------- page 지시문 ------------>
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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.min.css">
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

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




.col-md-4 control-label {
 vertical-align: middle;
}

.input {
display : inline-block; 
}



</style>


<!--------------  JavaScript ------------>
<script type="text/javascript">


//----- join 버튼 클릭 -----------


//-----관심사 체크박스---------

var maxChecked = 3;
var totalChecked = 0;

$(function(){	

var interestNo1 =	'<c:out value="${user.interestNo1}"/>';
var interestNo2 ='<c:out value="${user.interestNo2}"/>';
var interestNo3 ='<c:out value="${user.interestNo3}"/>';

if(interestNo3==""){
	if(interestNo2==""){
		totalChecked +=1;

	}
	else{
		totalChecked +=2;
	}
}
else{
	totalChecked +=3;
}

$("input:checkbox[value='"+interestNo1+"']").prop("checked", true);
$("input:checkbox[value='"+interestNo2+"']").prop("checked", true);
$("input:checkbox[value='"+interestNo3+"']").prop("checked", true);


$('#profileImgName').change(function(){			
	readImgUrlAndPreview(this);
	function readImgUrlAndPreview(input){
		 if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function (e) {			            	
	                $('#proImg').attr('src', e.target.result);
					}
	          };
	          reader.readAsDataURL(input.files[0]);
	     }	
});


$('#delete').click(function(){
    $('.profileImgName').val("");
     $('#proImg').attr('src', "/images/user/${user.profileImg}");  
    
  

}); 


});	


function CountChecked(field) {
	
    if (field.checked){
    	totalChecked += 1;

    	if(totalChecked==1){
        	$("#interest_no1").val(field.value);
        }
    	else if(totalChecked==2){
    	   	$("#interest_no2").val(field.value);
    	}
    	else if(totalChecked==3){
    	   	$("#interest_no3").val(field.value);
    	}
    }
    else{
    	totalChecked -= 1;

    	if(totalChecked==2){
        	$("#interest_no3").val("");
        }
    	else if(totalChecked==1){
    	   	$("#interest_no2").val("");
    	}
    	else if(totalChecked==0){
    	   	$("#interest_no1").val("");
    	}
    }
    
    if (totalChecked > maxChecked) {
        swal ("관심사는 최대 3개까지 선택 가능합니다.");
    field.checked = false;
    totalChecked -= 1;
    }
    
}






//도로명주소
 $(function() {
	 

	 $("#postcodify_search_button").postcodifyPopUp(); 
	 
 }); 
	 

	

	
	
	//------- 프로필 이미지만, 용량 1MB까지----------
/* 	
	 $("#profileImg").change(function(){
		if($(this).val() != ""){
			var ext = $(this).val().split(".").pop().toLowerCase();
			if($.inArray(ext, ["jpg","gif","jpeg","png"]) == -1){
				alert("gif, jpg, jpeg, png 파일만 업로드 해주세요.");
				$(this).val("");
				return;
			}
			
			var fileSize = this.files[0].size;
			var maxSize = 1024 * 1024;
			if(fileSize > maxSize){
				alert("파일용량이 1MB를 초과할 수 없습니다.");
				$(this).val("");
			}

		}
	});
	 */
	
	//--자르기---
/* 	
	function right(str,n){
	    if (n <= 0){
	       return "";
	    }else if (n > String(str).length){
	       return str;
	    }else{
	       var iLen = String(str).length;
	       return String(str).substring(iLen, iLen - n);
	    }
	} */
	
	
// ------ join 클릭 시 유효성검사 로직 ------


//------birth 잘라옴----------

$(function(){
	

	var birth= $("#birth").val();
	
	var birthYear = birth.substr(0, 4);
	var birthMonth = birth.substr(4, 2);
	var birthDay = birth.substr(6, 2);
	
	$("#birthYear").val(birthYear).prop("selected", true);
	$("#birthMonth").val(birthMonth).prop("selected", true);
	$("#birthDay").val(birthDay).prop("selected", true);
	

}); 




//----------phone 잘라옴

$(function(){
	

	
	
	var phone = '<c:out value="${user.phone}"/>';
	
	 $("#phone1").val(phone.substr(3,4));
	$("#phone2").val(phone.substr(7,4));
	

	
	$("#update").bind("click", function() {

	 updateUser();
	});	
	
	
}); 


	function updateUser() {


		
			var pw = $("input[name='password']").val();
			var pw_confirm = $("input[name='password2']").val();
			

			if (pw == null || pw.length < 1) {
				swal("비밀번호를 입력해주세요.");
				return;
			}
			
			if (pw_confirm == null || pw_confirm.length < 1) {
				swal("비밀번호 확인은 반드시 입력해야 합니다.");
				return;
			}

			if (pw != pw_confirm) {
				swal("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				return;
			}

			if(!pw.length >= 6){
				swal("비밀번호는 최소 6자리 이상이어야 합니다.");
				return false;
			}
			
			
			var check = $("#interest_no1").val();
			
			if(check==""){
				swal("관심사는 반드시 1개이상 선택해야 합니다.");
				return;
			}
			
			//동일 숫자 3자리 이상, 동일 문자 3자리 이상 안됨
			
			var SamePass_0 = 0; 
			var SamePass_1 = 0;
			
			var chr_pass_0; 
			var chr_pass_1; 
			
			for(var i=0; i < pw.length; i++) 
			{
				chr_pass_0 = pw.charAt(i); 
				chr_pass_1 = pw.charAt(i+1); 
				
				if(!isNaN(chr_pass_0)){
					 if(chr_pass_0 == chr_pass_1) 
					 {
						 SamePass_0 = SamePass_0 + 1; 
						 }
					 }else{
						 if(chr_pass_0 == chr_pass_1) {
							 SamePass_1 = SamePass_1 + 1; 
							 }
						 }
				}
			if(SamePass_0 >= 2)
			{
				swal("비밀번호에 동일숫자를 연속으로 3번 이상 사용할 수 없습니다."); 
				return false; 
				}
			if(SamePass_1 >= 2) 
			{ 
				swal("비밀번호에 동일문자를 연속으로 3번 이상 사용할 수 없습니다."); 
				return false;
				}  
			
		 	// 사용자 계정과 동일한 암호는 사용 불가능
		/* 	 if(pw.search(id)>-1) 
		 {
		 	swal("ID가 포함된 비밀번호는 사용하실 수 없습니다.");
		 	return false; 
		 	} */
	
		//비밀번호는 영문, 숫자 혼용
			
			var chk = 0; 
			if(pw.search(/[0-9]/g) != -1 ) chk ++; 
			if(pw.search(/[a-z]/ig) != -1 ) chk ++; 
			if(chk < 2) 
			{
				swal("비밀번호는 영문, 숫자를 혼용해야 합니다.");
			return false;  
			}
			 
			
/* 			var chk_pw = /^[a-z0-9_]{4,20}$/; 
			
			if( !chk_pw.test(password) )
			{
				swal("비밀번호는 영문, 숫자 4~20자리만 가능합니다.");
				return false;
			} 
		 */
			//핸드폰 번호 합치기
			
			
			var value = "";
			var phone1 = $("input:text[name='phone1']").val() ;
			var phone2 = $("input:text[name='phone2']").val();
			
			if(phone1.length >=5 || phone2.length >=5 )
				{
					swal("핸드폰번호를 올바르게 입력해주세요. ");
					return;
				} 
			
			if (phone1 != ""&& phone2 != "")
			{
				var value = "010"+ phone1 + phone2;
			}
		
			chk_phone =  /^[0-9]+$/; 
			
			$("input:hidden[name='phone']").val(value);
	
		 	if( !chk_phone.test(value) )
			{
				swal("핸드폰번호는 숫자만 입력해주세요.");
				return false;
			} 
		 	
		//생년월일
			
			var b1 = $("#birthYear").val();
			var b2 = $("#birthMonth").val();
			var b3 = $("#birthDay").val();
			var birth = b1 + b2 + b3;
			
			$("input:hidden[name='birth']").val(birth);
			


			
		 $("#form").attr("method", "POST").attr("action", "/user/updateUser").submit();
			
	};

	

	
</script>



</head>
<!-- ---------head 끝 ------------->




<body>

<div class="container">
<div class="form-group">
<form id="form" class="form-horizontal"  enctype="multipart/form-data">
 <fieldset>
<legend>::: 내정보수정</legend>


  
<div class="form-group">
  <label class="col-md-4 control-label" ></label>
  <div class="col-md-4">
  
    <img id="proImg" src="/images/user/${user.profileImg}" alt="your image" class="img-circle">
  </div>
</div>


 <div class="form-group">
<label class="col-md-4 control-label" >프로필 사진</label>
  <div class="col-xs-12 col-sm-6 col-md-6">
  
 <input id="profileImgName" name="profileImgName"  accept="image/png, image/jpeg, image/gif"  class="hide" type="file" />
 <label for="profileImgName" class="btn-danger btn-sm"> 등록</label>
 <label  class="btn-danger btn-sm" id="delete"> 삭제</label>

 </div>
</div>     
 
 

<div class="form-group">
  <label class="col-md-4 control-label" for="userId">ID</label>
  <div class="col-md-4">
<input type="hidden" id="userId"  name="userId" value="${user.userId}">
 ${user.userId}
</div>
</div>



<div class="form-group">
  <label class="col-md-4 control-label" for="name">이름</label>
  <div class="col-md-4">
  <input type="hidden" id="name"  name="name" value="${user.name}">
${user.name}
  </div>
</div>



<div class="form-group">
  <label class="col-md-4 control-label" for="password">비밀번호</label>
  <div class="col-md-4">
    <input id="password" name="password" class="form-control input-md" type="password" maxlength="10">
 
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="password2">비밀번호 확인</label>
  <div class="col-md-4">
    <input id="password2" name="password2" class="form-control input-md" type="password" maxlength="10">
  </div>
</div>




<div class="form-group">
  <label class="col-md-4 control-label" for="phone">핸드폰 번호</label>
  <div class="col-md-1">
 <label class="col-md-1" >  010-</label>
</div>
  <div class="col-md-1">
    <input id="phone1" name="phone1"  class="form-control input-md" type="text"  maxlength="4">
    </div>



  <div class="col-md-1">
    <input id="phone2" name="phone2"  class="form-control input-md" type="text"" maxlength="4">
  </div>    
    
     <button id="confirmPhone" name="confirmPhone" class="btn btn-default">인증</button>
    <input type="hidden" name="phone"/>
     <strong class="text-danger" id="checkPhone">checkPhone</strong>

</div>



<div class="form-group">
  <label class="col-md-4 control-label" for="address">주소</label>
  <div class="col-md-3">              
  
     <input id="address" name="address"  class="postcodify_address form-control input-md" value="${user.address}" type="text" readonly> 
  <!--    <input type="hidden" id="address" name="address" value=""/>
      -->
     </div>
    <input id="postcodify_search_button" name="postcodify_search_button" class="btn btn-default" type="button" value="검색">
          
      
</div>


<div class="form-inline form-group form-horizontal">

  <label class="col-md-4 control-label" for="birthdate">생년월일</label>
  <div class="col-md-1">

  <input type="hidden" id="birth" name="birth" value="${user.birth}"/>
    <select id="birthYear" name="birthYear" class="form-control input-md" >
		 <c:forEach var="i" begin="1918" end="2018" step="1">
					<option value="${i}">${i}</option>
		</c:forEach>
    </select>
     <strong class="text">년</strong>
    
</div>
    
   <div class="col-md-1">
    <select id="birthMonth" name="birthMonth" class="form-control input-md">
   
    <c:forEach var="i" begin="1" end="9" step="1">
	<option value="0${i}">0${i}</option>    </c:forEach>
	
	  <c:forEach var="i" begin="10" end="31" step="1">
	<option value="${i}">${i}</option>    </c:forEach>
	
	    </select>
    월
    </div>
    
      <div class="col-md-1">
    <select id="birthDay" name="birthDay" class="form-control input-md">
    
    
    <c:forEach var="i" begin="1" end="9" step="1">
	<option value="0${i}">0${i}</option>    </c:forEach>
	
	  <c:forEach var="i" begin="10" end="12" step="1">
	<option value="${i}">${i}</option>    </c:forEach>
	

    </select>
    일
</div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="interest">관심사</label>

  <div class="col-md-4" >
 
    <input type="checkbox"  class="checkbox checkbox-inline"  value="스포츠" onClick=CountChecked(this)> 스포츠 
 	<input type="checkbox" class="checkbox checkbox-inline"  value="친목" onClick=CountChecked(this)> 친목 
	<input type="checkbox" class="checkbox checkbox-inline"   value="스터디" onClick=CountChecked(this)> 스터디
	<input type="checkbox" class="checkbox checkbox-inline"   value="예술" onClick=CountChecked(this)> 예술
 	<input type="checkbox" class="checkbox checkbox-inline"  value="게임" onClick=CountChecked(this)> 게임 
	<input type="checkbox" class="checkbox checkbox-inline"  value="여행" onClick=CountChecked(this)> 여행
	<input type="checkbox" class="checkbox checkbox-inline"   value="건강" onClick=CountChecked(this)> 건강 
 	<input type="checkbox" class="checkbox checkbox-inline"   value="음식" onClick=CountChecked(this)> 음식 
	<input type="checkbox" class="checkbox checkbox-inline"   value="고민" onClick=CountChecked(this)> 고민
	<input type="checkbox" class="checkbox checkbox-inline"   value="자유주제" onClick=CountChecked(this)>자유주제 

	
	<input type="hidden" id="interest_no1" name="interestNo1" value="${user.interestNo1}"/>
	<input type="hidden" id="interest_no2" name="interestNo2" value="${user.interestNo2}"/>
	<input type="hidden" id="interest_no3" name="interestNo3" value="${user.interestNo3}"/>
	
  </div>
</div>



<div class="form-group">
<label class="col-md-4 control-label" ></label>
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