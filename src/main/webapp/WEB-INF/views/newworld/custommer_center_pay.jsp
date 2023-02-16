<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/custommercenter_pay.css">
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
                <li><a href="/views/newworld/custommer_center_pay">결제방법 안내</a></li>
            </ul>
        </div>  

<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>
    

    <!-- 공지사항 메인 -->
<div class="notepage">
    <h1 class="bigtitle">결제방법 안내</h1><br>
	
	<img src="/resources/images/payinfo.png" alt="" style="width: 910px;">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

function getBoardNote(){
	fetch('/newworlds-note?bnCategory=&bnTitle=&bnContent=')
		.then(function(res){
			return res.json();
		})

		.then(function(list) {
			let html = '';
			for (let i = 0; i < list.length; i++) {
				const boardNote = list[i]
				html += '<tr>';
				html += '<th>' + boardNote.bnNum + '</th>';
				html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardnoticeview?bnNum=' + boardNote.bnNum + '\'">' + boardNote.bnTitle + '</td>';
				html += '<td>' + boardNote.bnWriter + '</td>';
				html += '<td>' + boardNote.bnCredat + '</td>';
				html += '</tr>';
			}
			document.querySelector('#tBody').innerHTML = html;
		
		})
	};
	

	window.onload = function() {
		getBoardNote();
	}
</script>
</body>
</html>