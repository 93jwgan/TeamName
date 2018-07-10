
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



</style>

<!--------------  JavaScript ------------>
<script type="text/javascript">



/* //파일 업로드 확장자 체크
function FileType(){

	  if( !event.srcElement.value.match(/(.jpg|.jpeg|.gif|.png)/)) { 
	      swal("그림파일만 업로드 가능합니다.");
	  } 
	} */
	
	//이미지 미리보기
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result);
        };

        reader.readAsDataURL(input.files[0]);
    }
}


var maxChecked = 3;
var totalChecked = 0;

var interest_no1;
var interest_no2;
var interest_no3;

<!---- 카테고리 3개까지 체크----->
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


$(function() {

	// ----- join 버튼 클릭 -----------
	
	$("#join").bind("click", function() {
		 	 
		addUser();
	});
	
	
	$("#findAddress").bind("click", function() {
	 	 
		goPopup();
	});
	
	
	//------------- ID 중복확인---------------------
	
	
	 $("#userId").bind("keyup", function() {
			
		if($("#userId").val().length == 0){
			$("#checkId").text("");
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




// ------ join 클릭 시 유효성검사 로직 ------
	function addUser() {

			 var id = $("input[name='userId']").val();
			var pw = $("input[name='password']").val();
			var pw_confirm = $("input[name='password2']").val();
			var name = $("input[name='name']").val();
			var chk_name=/^[가-힣]*$/;
			
			if( !chk_name.test(name) )
			{
				swal("이름은 한글만 입력해주세요.");
				return false;
			} 
			
			if (id == null || id.length < 1) {
				swal("아이디를 입력해주세요.");
				return;
			}
			if (pw == null || pw.length < 1) {
				swal("비밀번호를 입력해주세요.");
				return;
			}
			if (pw_confirm == null || pw_confirm.length < 1) {
				swal("비밀번호 확인은 반드시 입력해야 합니다.");
				return;
			}
			if (name == null || name.length < 1) {
				swal("이름을 입력해주세요.");
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
			 if(pw.search(id)>-1) 
		 {
		 	swal("ID가 포함된 비밀번호는 사용하실 수 없습니다.");
		 	return false; 
		 	} 
					
		//비밀번호는 영문, 숫자 혼용
			
			var chk = 0; 
			if(pw.search(/[0-9]/g) != -1 ) chk ++; 
			if(pw.search(/[a-z]/ig) != -1 ) chk ++; 
			if(chk < 2) 
			{
				swal("비밀번호는 영문, 숫자를 혼용해야 합니다.");
			return false;  
			}
			 
			
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
			
			$("input:hidden[name='phone']").val(value);
	
			
		//생년월일
	//		var birth = $(#birthYear).val() + $(#birthMonth).val() + $(#birthDay).val(); 
		
			
			var b1 = $("#birthYear").val();
			var b2 = $("#birthMonth").val();
			var b3 = $("#birthDay").val();
			var birth = b1 + b2 + b3;
			
			$("input:hidden[name='birth']").val(birth);
			
			
			swal("회원가입이 완료되었습니다.","success"); 
			
			$("#form").attr("method", "POST").attr("action", "/user/addUser").submit();
			
	};

	
	
	
	
	<!---- 주소찾기------>
	function goPopup(){
	    var pop = window.open("/common/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
			, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
		$("#address").val(roadFullAddr);
		$("#address_hidden").val(roadFullAddr);
	}
	
	
</script>



</head>
<!-- ---------head 끝 ------------->




<body>

<div class="container">
	<div class="form-group">
<form id="form" class="form-horizontal" enctype="multipart/form-data" >
 <fieldset>
<legend>::: 회원가입</legend>

<div class="form-group">
<label class="col-md-4 control-label" for="profileImg">프로필 사진</label>
  <div class="col-xs-12 col-sm-6 col-md-6">
  <img id="blah" src="http://placehold.it/180" alt="your image" class="img-thumbnail">

  
<div>
 <input id="profileImg" name="profileImg" class="form-control-file" type="file" onchange="readURL(this);">
 </div>  
  </div>
     </div>

<div class="form-group">
  <label class="col-md-4 control-label" for="userId">ID</label>
  <div class="col-md-4">
    <input id="userId" name="userId" class="form-control input-md" type="text">
    </div>
     <strong class="text-danger" id="checkId"></strong>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="name">이름</label>
  <div class="col-md-4">
    <input id="name" name="name" class="form-control input-md" type="text" maxlength="10">
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="password">비밀번호</label>
  <div class="col-md-4">
    <input id="password" name="password" class="form-control input-md" type="password">
 
  </div>
</div>




<div class="form-group">
  <label class="col-md-4 control-label" for="password2">비밀번호 확인</label>
  <div class="col-md-4">
    <input id="password2" name="password2" class="form-control input-md" type="password">
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="phone">핸드폰 번호</label>
  <div class="col-md-4">
010-
    <input id="phone1" name="phone1"  class="form-control input-md" type="text">
    -
    <input id="phone2" name="phone2"  class="form-control input-md" type="text">
  </div>    
    
     <button id="confirmPhone" name="confirmPhone" class="btn btn-default">인증</button>
    <input type="hidden" name="phone"/>
     <strong class="text-danger" id="checkPhone">checkPhone</strong>

</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="address">주소</label>
  <div class="col-md-3">              
  
     <input id="address" name="address" placeholder="주소를 검색하세요." class="form-control input-md" type="text" readonly> 
     </div>
    <input id="findAddress" name="findAddress" class="btn btn-default" type="button" value="검색">
          
      
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="birthdate">생년월일</label>
  <div class="col-md-4">

  <input type="hidden" id="birth" name="birth" value=""/>
    <select id="birthYear" name="birthYear" class="form-control input-md" >
		 <c:forEach var="i" begin="1918" end="2018" step="1">
					<option value="${i}">${i}</option>
		</c:forEach>
    </select>년
    
    
    <select id="birthMonth" name="birthMonth" class="form-control input-md">
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
    
    월
    
    
    <select id="birthDay" name="birthDay" class="form-control input-md">
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
    
    일

  </div>
    </div>
  


<div class="form-group">
  <label class="col-md-4 control-label" for="interest">관심사</label>

  <div class="col-md-6" class="form-check form-check-inline">
 
    <input type="checkbox"  class="form-check-input" value="스포츠" onClick=CountChecked(this)> 스포츠 
 	<input type="checkbox" class="form-check-input" value="친목" onClick=CountChecked(this)> 친목 
	<input type="checkbox" class="form-check-input"  value="스터디" onClick=CountChecked(this)> 스터디
	<input type="checkbox" class="form-check-input"  value="예술" onClick=CountChecked(this)> 예술
 	<input type="checkbox" class="form-check-input"  value="게임" onClick=CountChecked(this)> 게임 
	<input type="checkbox" class="form-check-input"  value="여행" onClick=CountChecked(this)> 여행
	<input type="checkbox" class="form-check-input"  value="건강" onClick=CountChecked(this)> 건강 
 	<input type="checkbox" class="form-check-input"  value="음식" onClick=CountChecked(this)> 음식 
	<input type="checkbox" class="form-check-input"  value="고민" onClick=CountChecked(this)> 고민
	<input type="checkbox" class="form-check-input"  value="자유주제" onClick=CountChecked(this)> 자유주제
	
	
	<input type="hidden" id="address_hidden" name="address" value=""/>
	<input type="hidden" id="interest_no1" name="interestNo1" value=""/>
	<input type="hidden" id="interest_no2" name="interestNo2" value=""/>
	<input type="hidden" id="interest_no3" name="interestNo3" value=""/>
	
  </div>
</div>



<div class="form-group">
<label class="col-md-4 control-label" for="address"></label>
  <div class="col-md-4"> 
    <input id="join" name="join" class="btn btn-default" type="button" value="가입">
  </div> 
  </div>


 </fieldset> 
</form>

</div>
</div>


</body>

</html>