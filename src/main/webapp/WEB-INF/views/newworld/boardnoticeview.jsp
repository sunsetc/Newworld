<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/noticeview.css">
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
                <li><a href="/views/newworld/boardnotice">공지사항</a></li>
            </ul>
        </div>      
    
    
<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>
    

    <!-- 공지사항 메인 -->
<div class="qnapage">
    <h1 class="bigtitle">공지사항</h1><br>
 
    <!-- 테이블 -->
    <table class="table table-light">
        <tbody id="tBody">
		</tbody>
	</table>
    
	<div id="prevNote"></div>
	<div id="nextNote"></div>
	
	<button class="notelist" onclick="location.href='/views/newworld/boardnotice'">목록</button>
</div>

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
function getBoardNote() {
	const infos = document.querySelectorAll('th[data-col]');
	fetch('/newworlds/note/${param.bnNum}')
	.then(function(res) {
		return res.json();
	})
		.then(function(getBoardNote) {
			let html = '';
			const str = getBoardNote.bnContent.replace(/\\r\\n|\\n|\\r/gm,"<br>");
			html += '<tr>' + '<th>'+ '</th>' + '<td>' + getBoardNote.bnTitle + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ '</th>' + '<td>' + str + '</td>' + '</tr>';
			document.querySelector('#tBody').innerHTML = html;
	})
}
window.onload = function() {
	getBoardNote(), getPrevNote(), getNextNote();
}

function getPrevNote(){
	fetch('/prev-note/${param.bnNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#prevNote').innerHTML = '<a href="/views/newworld/boardnoticeview?bnNum=' + data.bnNum + '">이전글  |  ' + data.bnTitle + '</p>';
	})
	.catch(function(err){
		document.querySelector('#prevNote').innerHTML = '<p>이전글  |  이전 게시글이 없습니다.</p>';
	});
}

function getNextNote(){
	fetch('/next-note/${param.bnNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#nextNote').innerHTML = '<a href="/views/newworld/boardnoticeview?bnNum=' + data.bnNum + '">다음글  |  ' + data.bnTitle + '</a>';	
	})
	.catch(function(err){
		document.querySelector('#nextNote').innerHTML = '<p>다음글  |  다음 게시글이 없습니다.</p>';
	});
}
</script>
</body>
</html>