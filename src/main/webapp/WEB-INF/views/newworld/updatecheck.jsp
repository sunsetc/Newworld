<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/updatecheck.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈</a>></li>
                <li><a href="/views/newworld/mypage">마이페이지</a>></a></li>
                <li><a href="/views/newworld/updatecheck">비밀번호 인증</a></li>
            </ul>
        </div>
        
        
<!-- 마이페이지 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>
	
	
	
    <!-- 업데이트 메인 -->
<div class="updatecheckpage">
    <h1 class="bigtitle">비밀번호 인증</h1><br>
    <center>
            <img src="https://cafeptthumb-phinf.pstatic.net/MjAyMzAxMTZfMTMg/MDAxNjczNzk5MDg5ODU4.QOhdimrBCPY8fil7lgvBdaa1Y32u42VckJvqDYGPOJEg.CiPsb4MfEVU2kVQMjcWAzvsFstSG4rYPY4Gq9DdW2qwg.PNG/8687518_ic_fluent_lock_closed_regular_icon.png?type=w1600" alt="" style="width: 150px">
            <br>
            <p style="font-size: 20px;">개인정보를 수정하시려면 고객님의 소중한 정보보호를 위해 <b>비밀번호를 확인</b>합니다.</p><br>
            <input class="pwdcheack" type="password" id="pwdcheck" placeholder="비밀번호를 입력하세요." onkeyup="enterKey()">
            <button class="updatebtn" type="button" onclick="passwordConfirm()">확인</button>
    </center>




    </div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</div>
</div>
<script>
//키업
function enterKey() {
	if(window.event.keyCode == 13) {
		passwordConfirm();
	}
}
//비밀번호 확인
function passwordConfirm() {
	const param = {
			uiPwd : document.querySelector('#pwdcheck').value
	}
	fetch('/userinfos/${userInfo.uiId}', {
		method : 'POST',
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
			alert('확인 되었습니다.');
			location.href='/views/newworld/updateuserinfo'
		}
		else {
			alert('비밀번호가 일치하지 않습니다.');
			location.href='/views/newworld/updatecheck'
		}
	})
}
</script>
</body>
</html>