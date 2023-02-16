<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>    
    <link rel="stylesheet" href="/resources/css/pwdfind.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<!--  입력페이지 -->
<div class="findpage">
    <div id="userfind">
    		<button class="idfbtn"><a href="/views/newworld/idfind"><h3 style="font-size:24px;">아이디 찾기</h3></a></button><button class="pwdfbtn"><a href="/views/newworld/pwdfind"><h3 style="font-size:24px;">비밀번호 찾기</h3></a></button>
    		<br>
            <input type="text" id="uiId" placeholder=" 아이디" required style="text-indent:30px"><br>
            <input type="text" id="uiEmail" placeholder="이메일주소" required style="text-indent:30px"><button onclick="sendPwd()" class="emailbtn">인증</button><br>           
	</div>
</div>

<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
//이메일 인증 번호 발송
/* const uiId = document.querySelector('#uiId').value
var regExp = /\s/g;
if(uiId.search(/\s/) == 1){
	alert('공백은 사용할 수 없습니다.');
	return false;
}else{
	return true;
} */

var code = "";
function sendPwd() {
	const uiId = document.querySelector('#uiId').value
	const email = document.querySelector('#uiEmail').value
	var str_space = /\s/;
	if(str_space.exec(uiId) || str_space.exec(email)){
		alert('공백은 사용할 수 없습니다.');
		return;
	}
	if(uiId == '' || email == ''){
		alert('정보를 입력해주세요.');
		return;
	}
	fetch('/checkEmail-id/' + uiId)
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		if(data.uiEmail == email){
			fetch('/userinfos/pwd?email=' + email + '&uiId=' + uiId)
			.then(function(res) {
				return res.text();
			})
			.then(function(data) {
				console.log(data);
				code += data;
				alert('임시 비밀번호가 발송 되었습니다.');
				location.href='/views/newworld/login';
			})
	}else{
		alert('해당 아이디로 가입된 계정의 이메일 정보와 일치하지 않습니다.')
	} 
	}).catch(() => {
	  	alert('잘못된 정보입니다.')
	  })
}
	
</script>
</body>
</html>