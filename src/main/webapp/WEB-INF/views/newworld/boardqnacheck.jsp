<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/qnacheck.css">
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
                <li><a href="/views/newworld/boardqnacheck">1:1문의게시판</a></li>
            </ul>
        </div>  

<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>

    <!-- 문의하기 메인 -->
<div class="qnapage">
    <h1 class="bigtitle">1:1문의</h1><br>
    <center>
    <img src="https://cafeptthumb-phinf.pstatic.net/MjAyMzAxMTZfNzEg/MDAxNjczNzk5MDg5NDE4.xYlbT2sPUG_lbDr7NX9Nv1UJXbE1vhYKlw3ht5pheccg.dS6P9TyRAmQ5PpLtZm1ZlbI-JCauLn8h-Dfj7XsVCYEg.PNG/8686870_ic_fluent_chat_bubbles_question_icon.png?type=w1600" alt="" style="width: 200px">
    <p><b>1:1문의</b>입니다.<br>
    고객님의 문의사항에 대한 신속한 해결을 위하여 최선을 다하겠습니다.</p>
    <button class="qnabtn1" onclick="location.href='/views/newworld/boardqnainsert'">문의하기</button>
    <button class="qnabtn2" onclick="location.href='/views/newworld/boardqnalist'">문의내역</button>
    </center>
</div>

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
</body>
</html>