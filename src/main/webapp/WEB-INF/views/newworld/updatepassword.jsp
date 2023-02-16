<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
     <!-- jQuery -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" href="/resources/css/updatepassword.css">
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
			<li><a href="/views/newworld/updateuserinfo">개인정보 수정</a>></li>
            <li><a href="/views/newworld/updatepassword">비밀번호 변경</li>
		</ul>
	</div>
        
        
<!-- 마이페이지 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>
	
	
	
    <!-- 업데이트 메인 -->
<div class="updatecheckpage">
    <h1 class="bigtitle">비밀번호 변경</h1><br>
    <center>
            <input id="pwdCheck1" class="uiPwd2" type="password" placeholder="새로운 비밀번호를 입력하세요."><br>
            <input id="pwdCheck2" class="uiPwdCheck" type="password" placeholder="비밀번호 확인을 위해 한번 더 입력하세요." onkeyup="enterKey()"><br><br><br>
            <button class="updatebtn" onclick="updatePwd()">변경하기</button><br><br><br><br><br><br>
            <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
            <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다</div>
    </center>
    

    
    </div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
//비밀번호 일치 확인
$(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function(){
		var pwd1=$(".uiPwd2").val();
		var pwd2=$(".uiPwdCheck").val();
		if(pwd1 !=""||pwd2 !=""){
			if(pwd1 == pwd2){
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			}else{
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled","disabled");
				
				
			}
		}
	});
	
});
//키업
function enterKey() {
	if(window.event.keyCode == 13) {
		updatePwd();
	}
}

//비밀번호 업데이트
function updatePwd(){
		const pwdCheck1 = document.querySelector('#pwdCheck1');
		const pwdCheck2 = document.querySelector('#pwdCheck2');
		//비밀번호 정규식
		var checkPwd = /^[a-zA-Z0-9]{8,16}$/;
		if(!checkPwd.test(pwdCheck1.value)){
			alert('비밀번호는 영문과 숫자를 합쳐 8글자 이상 16글자 이하입니다.');
			pwdCheck1.value='';
			pwdCheck1.focus();
			pwdCheck2.value='';
			return;
		}
		//비밀번호 & 비밀번호 확인 불일치
		if(pwdCheck1.value != pwdCheck2.value) {
			alert('비밀번호가 일치하지 않습니다. 확인해주세요.');
			pwdCheck2.focus();
			return;
		}
		//비밀번호 일치
		if(pwdCheck1.value === pwdCheck2.value) {
			const param = {
					uiPwd : document.querySelector('#pwdCheck1').value
			}
			fetch('/update-pwd/${userInfo.uiNum}',{
				method:'PATCH',
				headers:{
					'Content-Type':'application/json'
				},
				body:JSON.stringify(param)
			})
			.then(function(res){
				return res.json()
			})
			.then(function(data){
				if(data===1){
					alert('비밀번호가 변경되었습니다.')
					location.href='/views/newworld/main';
				}
			})
			.catch(function(err){
				alert('오류가 발생했습니다.')
				location.repalce();
			})
		}

	}
</script>
</body>
</html>