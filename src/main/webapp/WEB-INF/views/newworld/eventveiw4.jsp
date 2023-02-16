<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/eventveiw4.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
	<!-- 바로가기 -->
	<div class="smallnav">
		<ul>
			<li><a href="/views/newworld/main">홈</a>></li>
			<li><a href="/views/newworld/eventlist">진행중인 이벤트</a>></li>
			<li><a href="/views/newworld/eventveiw4">이벤트</a></li>
		</ul>
	</div>
<!-- 이벤트 메인 -->
<div class="packagepage">
    <h1 class="bigtitle">진행중인 이벤트</h1><br>
    <div class="eventpage">
	<img src="/resources/images/event4.png" alt="" width="">
	</div>
	<button class="listbtn" onclick="location.href='/views/newworld/eventlist'">목록</button>
</div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
</body>
</html>