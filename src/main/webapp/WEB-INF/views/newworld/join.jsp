<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/join.css"></head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

    <!-- 회원가입 입력폼 -->
<div id="userjoin">
    <!-- div 수정 금지 -->
        
        
            <input type="text" id="uiId" placeholder="아이디" required style="text-indent:30px" onkeyup="enterKey()"> <button onclick="checkId()" class="idBtn">중복확인</button><br>
            <input type="text" id="uiName" placeholder="이름" required style="text-indent:30px" onkeyup="enterKey()">
            <input type="radio" id="uiGenderw" class="uiGender" name="gender" value="여">여성
			<input type="radio" id="uiGenderm" class="uiGender" name="gender" value="남">남성<br>
			<div id="result"></div>

            <input type="password" id="uiPwd" placeholder="비밀번호(대소문자,숫자,특수문자를 모두 포함해야 합니다)" required style="text-indent:30px" onkeyup="enterKey()"><br>
            <input type="password" id="uiPwdCheck" placeholder="비밀번호 확인" required style="text-indent:30px" onkeyup="enterKey()"><br>
            <input type="email" id="uiEmail" placeholder="이메일주소" required style="text-indent:30px"> <button onclick="checkEmail()" class="emailbtn">인증</button><br>           
            <input type="text" id="emailCode" placeholder="인증번호" required style="text-indent:30px"> <button onclick="checkEmailCode()" class="emailCheckbtn">인증확인</button><br>
            <input type="number" id="uiZip" placeholder="우편번호" required style="text-indent:30px"> <button onclick="searchAddr()" class="addrBtn">주소검색</button><br>
            <input type="text" id="uiAddr1"  placeholder="주소1" required style="text-indent:30px" onkeyup="enterKey()"><br>
            <input type="text" id="uiAddr2"   placeholder="주소2" required style="text-indent:30px" onkeyup="enterKey()"><br>
            <input type="text" id="uiPhone"   placeholder="휴대전화 번호" required style="text-indent:30px" onkeyup="enterKey()"><br>
            <input type="text" id="uiBirth" name="uiBirth" placeholder="   생년월일 ex)19930615" required style="text-indent:15px; word-spacing:5;" onkeyup="enterKey()"><br>
            <div class="check_font" id="birth_check"></div>
            
            <button id="join_btn" onclick="signUp()">회원가입</button><br>
    </div>

<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<!-- 다음 우편번호 api 호출 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
//키업
function enterKey() {
	if(window.event.keyCode == 13) {
		signUp();
	}
}
//code 빈문자열로 초기화
var code = "";
//이메일 인증 번호 발송
function checkEmail() {
	const email = document.querySelector('#uiEmail').value;
	var checkEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(!checkEmail.test(email)) {
		alert('잘못된 이메일 형식입니다.');
	}else {
		fetch('/userinfos/email?email=' + email)
		.then(function(res) {
			return res.text();
		})
		.then(function(data) {
			console.log(data);
			code = data;
			alert('인증 번호가 발송 되었습니다.');
		})
	}
}

//이메일 인증 번호 일치 확인
let isCheckedEmail = false;
function checkEmailCode() {
	const checkCode = document.querySelector('#emailCode').value;
	if(code === checkCode) {
		alert('인증 번호가 일치합니다.');
		isCheckedEmail = true;
	}else {
		alert('인증 번호가 일치하지 않습니다.');
		isCheckedEmail = false;
	}
}

//주소 검색 기능
function searchAddr(){
	const daumWin = new daum.Postcode({
		oncomplete:function(data){
	    	document.querySelector('#uiZip').value = data.zonecode;
	    	document.querySelector('#uiAddr1').value = data.address;
		}
	});
	daumWin.open();
}


/* function searchAddr(){
	const daum = new daum.Postcode({
		oncomplete: function(data){
			document.querySelector('#uiZip').value = data.zonecode;
	    	document.querySelector('#uiAddr1').value = data.address;
		}
	})
	daum.open();
} */

//아이디 입력 및 중복 체크
let isCheckedId = false;
function checkId(){
	const uiId = document.querySelector('#uiId').value;
	var checkId = /^[a-zA-Z0-9]{4,12}$/;
	if(!checkId.test(uiId) || uiId == null || uiId == ""){
		alert('아이디는 4~12자 영문 대소문자, 숫자만 입력하세요.');
		uiId.focus();
		return;
	}
	
	fetch('/userinfos/check/' + uiId)
	.then(function(data){
		return data.json();
	})
	.then(function(res){
		if(res===false){
			alert('사용 가능한 아이디 입니다.');
			isCheckedId = true;
		}else{
			alert('이미 등록되어 있는 아이디 입니다.');
			isCheckedId = false;
		}
	});
}

//회원 가입 버튼 실행 & 중복확인 버튼 실행 요청
function signUp(){
	if(!isCheckedId){
		alert('아이디 중복확인 해주세요.');
		return false;
	}
	//아이디 입력
	const uiId = document.querySelector('#uiId');
	var checkId = /^[a-zA-Z0-9]{4,12}$/;
	if(!checkId.test(uiId.value) || uiId == null || uiId == ""){
		alert('아이디는 4~12자 영문 대소문자, 숫자만 입력하세요.');
		uiId.value='';
		uiId.focus();
		return;
	}
	//이름 입력	
	const uiName = document.querySelector('#uiName');
	var checkName = /^[가-힣a-zA-Z]{2,15}$/;
	if(!checkName.test(uiName.value)){
		alert('이름을 입력해주세요.\n(2글자 이상 15글자 이하, 한글과 영어만 입력)');
		uiName.value='';
		uiName.focus();
		return;
	}
	
/* 	
	function getGender(event) {
		  document.getElementById('result').innerText = event.target.value;
		}
	 */
	
	//비밀번호 입력
	const uiPwd = document.querySelector('#uiPwd');
	 var checkPwd = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{8,16}/;
	if(!checkPwd.test(uiPwd.value)){
		alert('비밀번호는 영문과 숫자를 합쳐 8글자 이상 16글자 이하입니다.');
		uiPwd.value='';
		uiPwd.focus();
		return;
	}
	//비밀번호 더블 체크
	const uiPwdCheck = document.querySelector('#uiPwdCheck');
	if(uiPwd.value != uiPwdCheck.value){
		alert('비밀번호가 일치하지 않습니다.');
		uiPwdCheck.value='';
		uiPwdCheck.focus();
		return;
	}
/* 	
	// 생일 유효성 검사
	var birthJ = false;
	
	// 생년월일	birthJ 유효성 검사
	$('#user_birth').blur(function(){
		var dateStr = $(this).val();		
	    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
	    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
	    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
	    var today = new Date(); // 날짜 변수 선언
	    var yearNow = today.getFullYear(); // 올해 연도 가져옴
		
	    if (dateStr.length <=8) {
			// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환합니다.
		    if (1900 > year || year > yearNow){
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');
		    	
		    }else if (month < 1 || month > 12) {
		    		
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    
		    }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 :)');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');  
			}
		}); //End of method /*
	
	 */
	
	//이메일 입력
	const uiEmail = document.querySelector('#uiEmail');
	var checkEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;	
	if(!checkEmail.test(uiEmail.value)){
		alert('올바른 이메일 양식으로 입력해주세요.');
		uiEmail.value='';
		uiEmail.focus();
		return;
	}
	if(!isCheckedEmail) {
		alert('이메일 인증해주세요.');
		return false;
	}
	//주소 입력
	const uiZip = document.querySelector('#uiZip');
	if(uiZip.value.trim().length<1){
		alert('주소를 입력해주세요.');
		uiZip.value='';
		uiZip.focus();
		return;
	}
	//주소2 입력	
	const uiAddr2 = document.querySelector('#uiAddr2');
	if(uiAddr2.value.trim().length<1){
		alert('추가주소를 입력해주세요.');
		uiAddr2.value='';
		uiAddr2.focus();
		return;
	}
	//핸드폰 번호 입력
	const uiPhone = document.querySelector('#uiPhone');
	var checkPhone = /^[0-9]{10,11}$/;
	if(!checkPhone.test(uiPhone.value)){
		alert("'-' 제외 번호만 입력해주세요.");
		uiPhone.value='';
		uiPhone.focus();
		return;
	}
	//생년월일 입력
	const uiBirth = document.querySelector('#uiBirth');
	var checkBirth = /^[0-9]{8}$/;
	if(!checkBirth.test(uiBirth.value)){
		alert('생년월일을 입력해주세요. \n(8자리)');
		uiBirth.value='';
		uiBirth.focus();
		return;
	}
	//성별 체크	
	const uiGender = document.querySelector('.uiGender:checked');
	if(uiGender === null) {
		alert('성별을 체크해주세요.');
		uiGender.value='';
		uiGender.focus();
		return;
	}
	
	const param = {
			uiId : document.querySelector('#uiId').value,
			uiName : document.querySelector('#uiName').value,
			uiPwd : document.querySelector('#uiPwd').value,
			uiEmail : document.querySelector('#uiEmail').value,
			uiZip : document.querySelector('#uiZip').value,
			uiAddr1 : document.querySelector('#uiAddr1').value,
			uiAddr2 : document.querySelector('#uiAddr2').value,
			uiPhone : document.querySelector('#uiPhone').value,
			uiBirth : document.querySelector('#uiBirth').value,
			uiGender : document.querySelector('.uiGender:checked').value
	}
	fetch('/userinfos',{
		method : 'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(function(res) {
		return res.json();
	})
	.then(function(data){
		if(data==1) {
			alert('정상적으로 회원가입 되었습니다.');
			location.href='/views/newworld/login'
		}
		else {
			alert('회원가입에 실패했습니다.\n 다시 시도해주세요.');
			location.href='/views/newworld/join'
		}
	});
}
//로그아웃
function logout() {
	fetch('/logout')
	.then(function(data) {
		if(data) {
			console.log(data);
			alert('로그아웃 되었습니다.')
			location.href="/views/newworld/main";
		}
	})
}
</script>
</body>
</html>