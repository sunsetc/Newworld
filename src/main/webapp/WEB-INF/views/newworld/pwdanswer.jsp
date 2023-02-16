<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/pwdanswer.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<!--  입력페이지 -->
<div class="findpage">
    <div id="userfind">
    		<h3 class="pwdtext">비밀번호를 변경해주세요.</h3>
    		<input id="pwdCheck1" class="uiPwd2" type="password" placeholder="새로운 비밀번호를 입력하세요."><br>
            <input id="pwdCheck2" class="uiPwdCheck" type="password" placeholder="비밀번호 확인을 위해 한번 더 입력하세요."><br>
            <button class="pwdbtn" onclick="updatePwd()">변경하기</button><br>
            <!-- <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다</div> -->
	</div>
</div>

<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
function signIn() {
	let param = {
		uiId : document.querySelector('#uiId').value,
		uiPwd : document.querySelector('#uiPwd').value
	}
	
	fetch('/login', {
		method:'POST',
		headers:{
			'Content-Type':'application/json'
		},
		body:JSON.stringify(param)
	})
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		if(data) {
			data = JSON.parse(data);
			if(data.uiName) {
				alert(data.uiName + '님 로그인 완료!');
				location.href='/views/newworld/main';
				return;
			}	
		}
		
		alert('아이디와 비밀번호를 확인해주세요');
	})
}
</script>
</body>
</html>