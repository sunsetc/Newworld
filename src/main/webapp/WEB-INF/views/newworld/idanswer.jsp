<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/idanswer.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<!-- 본문시작 -->
<div class="findpage">
    <div id="userfind">
           <h4>회원님의 이메일로 가입된 아이디가 있습니다.</h4>
           <br>
           <div id="idInfos"></div>
           <button id="findbtn" onclick="location.href='/views/newworld/pwdfind'">비밀번호 찾기</button><br>
	</div>
</div>

<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
window.onload = function getId(){
	fetch('/find-id?&uiEmail=${param.uiEmail}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		let html = '';
		for(let i=0; i<data.length; i++){
			const info = data[i];
			html += '<h5>' + info.uiId + '</h5>'
		}
		document.querySelector('#idInfos').innerHTML = html;
	})
} 
</script>
</body>
</html>