<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/fnaview.css">
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
                <li><a href="/views/newworld/boardfna">자주찾는 질문</a></li>
            </ul>
        </div>

<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>
    

    <!-- 공지사항 메인 -->
<div class="qnapage">
    <h1 class="bigtitle">자주찾는 질문</h1><br>
 
    <!-- 테이블 -->
    <table class="table table-light">
        <tbody id="tBody">
		</tbody>
	</table>
    
    <div id="prevFna"></div>
	<div id="nextFna"></div>
	<button class="fnalist" onclick="location.href='/views/newworld/boardfna'">목록</button>
</div>

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
function getBoardFna() {
	const infos = document.querySelectorAll('th[data-col]');
	fetch('/newworlds/fna/${param.bfNum}')
	.then(function(res) {
		return res.json();
	})
		.then(function(getBoardFna) {
			let html = '';
			const str = getBoardFna.bfContent.replace(/\\r\\n|\\n|\\r/gm,"<br>");
			html += '<tr>' + '<th>'+ 'F' + '</th>' + '<td>' + getBoardFna.bfTitle + '</td>' + '</tr>';
			html += '<tr>' + '<th>'+ 'A' + '</th>' + '<td>' + str + '</td>' + '</tr>';
			document.querySelector('#tBody').innerHTML = html;
	})
}
window.onload = function() {
	getBoardFna(),getPrevFna(),getNextFna();
}

function getPrevFna(){
	fetch('/prev-fna/${param.bfNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#prevFna').innerHTML = '<a href="/views/newworld/boardfnaview?bfNum=' + data.bfNum + '">이전글  |  ' + data.bfTitle + '</p>';
	})
	.catch(function(err){
		document.querySelector('#prevFna').innerHTML = '<p>이전글  |  이전 게시글이 없습니다.</p>';
	});
}

function getNextFna(){
	fetch('/next-fna/${param.bfNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#nextFna').innerHTML = '<a href="/views/newworld/boardfnaview?bfNum=' + data.bfNum + '">다음글  |  ' + data.bfTitle + '</a>';	
	})
	.catch(function(err){
		document.querySelector('#nextFna').innerHTML = '<p>다음글  |  다음 게시글이 없습니다.</p>';
	});
}

</script>
</body>
</html>