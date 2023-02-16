<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/idfind.css">
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
            <input type="text" id="uiName" placeholder="이름" required style="text-indent:30px"><br>
            <input type="text" id="uiEmail" placeholder="이메일주소" required style="text-indent:30px"><button onclick="checkEmail()" class="emailbtn">인증</button><br>           
            <input type="text" id="emailCode" placeholder="인증번호" required style="text-indent:30px"><button onclick="checkEmailCode()" class="emailCheckbtn">인증확인</button><br>
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
var code = "";
function checkEmail() {
	const uiName = document.querySelector('#uiName').value;
	const email = document.querySelector('#uiEmail').value;
	var str_space = /\s/;
	var checkEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	if(str_space.exec(uiName) || str_space.exec(email)){
		alert('공백은 사용할 수 없습니다.');
		return;
	}
	if(uiName == '' || email == ''){
		alert('정보를 입력해주세요.');
		return;
	}
	if(!checkEmail.test(email)) {
		alert('잘못된 이메일 형식입니다.');
		return;
	}
	fetch('/find-id?uiEmail=' + email)
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		if(data.length > 0){
			fetch('/userinfos/email?email=' + email)
			.then(function(res) {
				return res.text();
			})
			.then(function(data) {
				console.log(data);
				code += data;
				alert('입력하신 이메일 주소로 인증번호를 발송했습니다.');
			})
		}else{
			alert('등록된 이메일 정보가 아닙니다.');
		}
	})
	
	
	/* fetch('/checkEmail-name/' + uiName)
	.then(function(res){
		return res.json();
	})
	.then(function(data){
		console.log(data);
		let eData = '';
		if(data.length == 1){
			for(let i=0; i<data.length; i++){
				eData = data[i].uiEmail;
				console.log(eData);
			}
			if(eData == email){ 
				fetch('/userinfos/email?email=' + email)
				.then(function(res) {
					return res.text();
				})
				.then(function(data) {
					console.log(data);
					code += data;
					alert('인증 번호가 발송 되었습니다.');
				})
			 }
		}else if(data.length>1){
		console.log(data.uiEmail);
			const selEmail = document.querySelector('#uiEmail').value;
			for(let i=0; i<data.length; i++){
				eData = data[i].uiEmail;
				console.log(eData);
				if(selEmail != null && selEmail == eData){
					fetch('/userinfos/email?email=' + selEmail)
					.then(function(res) {
						return res.text();
					})
					.then(function(data) {
						console.log(data);
						code += data;
						alert('인증 번호가 발송 되었습니다.');
					})
				}else{
					alert('등록된 이메일이 아닙니다.');
				}
			}			
				
			
			
		}else{
			alert('해당 이름으로 가입된 계정의 이메일 정보와 일치하지 않습니다.');
		}
	}).catch(() => {
	  	alert('잘못된 정보입니다.');
	  })  */
}

//이메일 인증 번호 일치 확인
let isCheckedEmail = false;
function checkEmailCode() {
	const checkCode = document.querySelector('#emailCode').value;
	if(code === checkCode) {
		alert('인증 번호가 일치합니다.');
		isCheckedEmail = true;
		location.href='/views/newworld/idanswer?uiName=' + document.querySelector('#uiName').value + '&uiEmail=' + document.querySelector('#uiEmail').value;
	}else {
		alert('인증 번호가 일치하지 않습니다.');
		isCheckedEmail = false;
	}
}
</script>
</body>
</html>