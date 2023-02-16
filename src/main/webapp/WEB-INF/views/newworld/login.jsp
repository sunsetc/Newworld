<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/login.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<!-- 로그인 입력폼 -->
<div class="loginpage">
    <div id="userlogin">
            <input type="text" id="uiId" placeholder="아이디를 입력해주세요." required style="text-indent:20px"><br>
            <input type="password" id="uiPwd" placeholder="비밀번호를 입력해 주세요." required style="text-indent:20px" onkeyup="enterKey()"> <br>
    </div>
    
            <button id="login_btn" onclick="signIn()">로그인</button><br>
                <ul class="smallmenuall">
                    <li class="smallmenu1"><a href="/views/newworld/idfind">아이디 찾기</a></li>
                    <li class="smallmenu1"><a href="/views/newworld/pwdfind">비밀번호 찾기</a></li>
                    <li class="smallmenu1"><a href="/views/newworld/join">회원가입</a></li>
                </ul>
    </div>

<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
//키업

function enterKey() {
	if(window.event.keyCode == 13) {
		signIn();
	}
}

//로그인
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