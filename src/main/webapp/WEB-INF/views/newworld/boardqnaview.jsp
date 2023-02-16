<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/qnaview.css">
</head>
<body>

<div id="container">
<div id="cell">

<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
        <!-- 작은글씨 바로가기 -->
        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈</a>></li>
                <li><a href="/views/newworld/custommer_center">고객센터</a>></li>
                <li><a href="/views/newworld/boardqnacheck">1:1문의게시판</a>></li>
                <li><a href="/views/newworld/boardqnalist">1:1문의내역</a></li>
            </ul>
        </div>
        
<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>

    <!-- 공지사항 메인 -->
<div class="qnapage">
    <h1 class="bigtitle">나의 1:1문의</h1><br>
 
    <!-- 테이블 -->
    <table class="table table-light">
        <tbody id="tBody">
		</tbody>
	</table>
	<div id="comment"></div>
    <button class="qnainsert" onclick="location.href='/views/newworld/boardqnalist'">목록</button>
    <button class="qnaupdate" onclick="location.href='/views/newworld/boardqnaupdate?bqNum=${param.bqNum}'">수정</button>
    <button class="qnadelete" onclick="deleteQna()">삭제</button>
    
    <div id="prevQna"></div>
	<div id="nextQna"></div>
</div>



</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
function getBoardQna() {
	const infos = document.querySelectorAll('th[data-col]');
	fetch('/newworlds-qna/${param.bqNum}')
	.then(function(res) {
		return res.json();
	})
		.then(function(getBoardQna) {
			let html = '';
			const str1 = getBoardQna.bqContent.replace(/\r\n|\n|\r/gm,"<br>");
			html += '<tr>' + '<th>'+ '휴대폰 번호' + '</th>' + '<td>' + getBoardQna.uiPhone + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ '이메일 주소' + '</th>' + '<td>' + getBoardQna.uiEmail + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ '문의 유형' + '</th>' + '<td>' + getBoardQna.bqCategory + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ '예약번호' + '</th>' + '<td>' + getBoardQna.riCode + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ '제목' + '</th>' + '<td>' + getBoardQna.bqTitle + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ '내용' + '</th>' + '<td>' + str1 + '</td>' + '</tr>';
			document.querySelector('#tBody').innerHTML = html;
			if(getBoardQna.bqComment != null){
				const str2 = getBoardQna.bqComment.replace(/\r\n|\n|\r/gm,"<br>");
				document.querySelector('#comment').innerHTML = '<p style="">└ ' + str2 	+ '<p>';	
			}else{
				document.querySelector('#comment').innerHTML = '<p>답변 대기중입니다.</p>';
			}
			
	})
}
window.onload = function() {
	getBoardQna(),getPrevQna(),getNextQna();
}

function getPrevQna(){
	fetch('/prev-qna?bqNum=${param.bqNum}&uiNum=${userInfo.uiNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#prevQna').innerHTML = '<a href="/views/newworld/boardqnaview?bqNum=' + data.bqNum + '">이전글  |  ' + data.bqTitle + '</p>';
	})
	.catch(function(err){
		document.querySelector('#prevQna').innerHTML = '<p>이전글  |  이전 게시글이 없습니다.</p>';
	});
}

function getNextQna(){
	fetch('/next-qna?bqNum=${param.bqNum}&uiNum=${userInfo.uiNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#nextQna').innerHTML = '<a href="/views/newworld/boardqnaview?bqNum=' + data.bqNum + '">다음글  |  ' + data.bqTitle + '</a>';	
	})
	.catch(function(err){
		document.querySelector('#nextQna').innerHTML = '<p>다음글  |  다음 게시글이 없습니다.</p>';
	});
}

function deleteQna(){
	fetch('/newworlds-qna/${param.bqNum}',{
		method:'DELETE'
		})
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		if(data==1){
			alert('정상적으로 삭제되었습니다.');
			location.href="/views/newworld/boardqnalist";
		}else{
			alert('오류')
			location.href="/views/newworld/boardqnalist";
		}
	})
}
</script>
</body>
</html>