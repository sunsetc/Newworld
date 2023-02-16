<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/deleteuserinfo.css">
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
			<li><a href="/views/newworld/deleteuserinfo">회원탈퇴</a></li>
		</ul>
	</div>

<!-- 마이페이지 사이드메뉴 -->
<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>


<!-- 회원탈퇴 메인 -->
<div class="deletepage">
    <h1 class="bigtitle">회원탈퇴</h1><br>

    <p>회원탈퇴 전에 안내사항을 꼭 확인해주세요.</p>
    <br>
    <h3 style="color:#4093d0;"><img alt="" src="/resources/images/icon/delete.png" width="50px;">그동안 보내주신 성원에 감사드립니다.</h3><br>
	<p style="line-height:30px;">개인정보 취급방침에 의거하여 모든 개인정보가 삭제됩니다.<br>
	고객게시판, 리뷰 등의 게시물도 즉시 삭제됩니다.<br>
	<b>※여행도착일자가 도래하지 않았거나 결제가 취소되지 않은 예약건이 있는 경우 회원탈퇴가 진행되지 않습니다.</b></p>


      <button class="cancel" onclick="location.href='/views/newworld/mypage'">취소</button>
      <button class="deletebtn" onclick="deleteUserInfo()">탈퇴하기</button>
</div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
//회원 탈퇴
/* function deleteUserInfo() {
	fetch('/userinfos/${userInfo.uiNum}', {
		method : 'DELETE'
	})
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		if(data==1) {
			alert("회원 탈퇴 처리되었습니다.");
			location.href='/views/newworld/main';
		}
		else {
			alert('오류 발생');
			location.href='/views/newworld/deleteuserinfo';
		}
	})
} */

function deleteUserInfo(){
	fetch('/check/possible/${userInfo.uiNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		if(data.length > 0){
			alert('회원탈퇴가 불가능합니다.');
			location.href='/views/newworld/deleteuserinfo';
		}else{
			fetch('/userinfos/${userInfo.uiNum}', {
				method : 'DELETE'
			})
			.then(function(res) {
				return res.json();
			})
			.then(function(data) {
				if(data==1) {
					alert("회원 탈퇴 처리되었습니다.");
					location.href='/views/newworld/main';
				}
				else {
					alert('오류 발생');
					location.href='/views/newworld/deleteuserinfo';
				}
			})
		}
	})
}
</script>
</body>
</html>