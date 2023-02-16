<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/updateuserinfo.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">

        <div class="smallnav">
            <ul>
			<li><a href="/views/newworld/main">홈</a>></li>
			<li><a href="/views/newworld/mypage">마이페이지</a>></li>
			<li><a href="/views/newworld/updatecheck">개인정보</a>></li>
			<li><a href="/views/newworld/updateuserinfo">개인정보 수정</a></li>
            </ul>
        </div>
        
        
<!-- 마이페이지 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>
	
	
	

    <!-- 업데이트 메인 -->
<div class="updatecheckpage">
    <h1 class="bigtitle">개인정보 수정</h1><br>

    <!-- 부트스트랩 -->
    <p class="userinformation">기본정보</p>
    <table class="table table-light">
        <tbody>
          <tr>
            <th>아이디</th>
            <td><input type="text" id="uiId" value="${userInfo.uiId}" readonly></td>
          </tr>
          <tr>
            <th>이메일</th>
            <td><input type="text" id="uiEmail" value="${userInfo.uiEmail}"><button onclick="sendEmail()" class="sendEmailBtn">인증하기</button></td>
          </tr>
          <tr id="chkEmail">
            <th>인증번호확인</th>
            <td><input type="text" id="checkEmail"><button onclick="checkEmailCode()" class="checkEmailBtn">인증번호확인</button></td>
          </tr>
          <tr>
            <th>비밀번호</th>
            <td><button onclick="location.href='/views/newworld/updatepassword'">비밀번호 변경</button></td>
          </tr>
          <tr>
            <th>이름</th>
            <td><input type="text" id="uiName" value="${userInfo.uiName}"></td>
          </tr>
          <tr>
            <th>성별</th>
            <td><input type="text" id="uiGender" value="${userInfo.uiGender}" readonly></td>
          </tr>
      <th>휴대폰번호</th>
      <td><input type="text" id="uiPhone" value="${userInfo.uiPhone}"></td>
     </tr>
    <th>생년월일</th>
    <td><input type="text" id="uiBirth" value="${userInfo.uiBirth}" readonly></td>
    </tr>
        </tbody>
      </table>
      <button class="cancel" onclick="location.href='/views/newworld/updatecheck'">취소</button>
      <button class="updatebtn" onclick="updateUserInfo()">확인</button>
</div>

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
// 인증번호 확인창 숨기기
document.getElementById('chkEmail').style.display = 'none';

//이메일코드 빈문자열로 초기화
var code = "";

//이메일 발송
function sendEmail() {
	const email = document.querySelector('#uiEmail').value;
	//이메일 정규식
	var sendEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(!sendEmail.test(email)) {
		alert('잘못된 이메일 형식입니다.');
		uiEmail.focus();
		return;
	}
	else {
		fetch('/userinfos/email?email=' + email)
		.then(function(res) {
			return res.text();
		})
		.then(function(data) {
			console.log(data);
			code = data;
			alert('인증 번호가 발송 되었습니다.');
			// 인증번호 발송 완료시 인증번호 확인창 보이기
			$('#chkEmail').show();
		});
	}
}

//인증번호 확인하기
function checkEmailCode() {
	const checkCode = document.querySelector('#checkEmail').value;
	//인증번호 확인 성공시 이메일 값 DB에서 업데이트
	if(code === checkCode) {
		const param = {
				uiEmail: document.querySelector('#uiEmail').value
		}
		fetch('/change-email/${userInfo.uiNum}',{
			method : 'PATCH',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(param)
		})
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			if(data === true) {
				alert('인증 확인되어 이메일이 변경되었습니다.');
				location.href='/views/newworld/updateuserinfo'
			}
		})
	}
	else {
		alert('인증번호를 다시 확인해주세요.');
	}

}

//이름, 전화번호 정보 수정
function updateUserInfo() {
	//이름 수정 정규식
	const uiName = document.querySelector('#uiName');
	var checkName = /^[가-힣a-zA-Z]{2,15}$/;
	if(!checkName.test(uiName.value)){
		alert('이름을 입력해주세요.\n(2글자 이상 15글자 이하, 한글과 영어만 입력)');
		uiName.value='';
		uiName.focus();
		return;
	}
// 번호 수정 정규식
	const uiPhone = document.querySelector('#uiPhone');
	var checkPhone = /^[0-9]{10,11}$/;
	if(!checkPhone.test(uiPhone.value)){
		alert("'-' 제외 번호만 입력해주세요.");
		uiPhone.value='';
		uiPhone.focus();
		return;
	}
// 이메일 변경시 이메일 인증요구
	const uiEmail = document.querySelector('#uiEmail').value;
	const sendEmailBtn = document.querySelector('.sendEmailBtn');
	if(uiEmail != '${userInfo.uiEmail}') {
		alert('이메일 인증해주세요.');
		sendEmailBtn.focus();
		return;
		
	}
// 개인정보수정(변경하지 않았을 시 인증 요구 pass)
	else if(uiEmail === '${userInfo.uiEmail}') {
		const param = {
				uiName : document.querySelector('#uiName').value,
				uiPhone : document.querySelector('#uiPhone').value,
		}
		fetch('/userinfos/${userInfo.uiNum}', {
			method : 'PATCH',
			headers : {
				'Content-Type' : 'application/json'
			},
			body : JSON.stringify(param)
		})
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			if(data === true) {
				alert('개인정보가 수정 되었습니다.')
				location.href='/views/newworld/mypage'
			}
		})
		.catch(function(err) {
			alert('오류 발생.')
			location.replace();
		})
	}
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