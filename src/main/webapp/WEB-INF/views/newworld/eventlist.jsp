<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/eventlist.css">
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
			<li><a href="/views/newworld/eventlist">진행중인 이벤트</a></li>
		</ul>
	</div>
	
    <!-- 마이페이지 사이드메뉴 -->
    <div class="sidemeun">
            <h2 class="cusstmenu">이벤트</h2>
            <ul class="submenu">
            <li class="faqmenu"><a href="/views/newworld/eventlist">진행중인이벤트</a></li>
            </ul>
    </div>

    <!-- 이벤트 메인 -->
<div class="packagepage">
    <h1 class="bigtitle">진행중인 이벤트</h1><br>
    
<!-- 카드  --> 
<div class="row row-cols-1 row-cols-md-3 g-4">
  <div class="col">
    <div class="card h-100">
    <a href="/views/newworld/eventveiw1">
      <img src="/resources/images/thumbnail1.jpg" class="card-img-top" alt="">
      <div class="card-body">
        <h5 class="card-title">행운을 뽑아라! 포츈쿠키 이벤트!</h5>
        <p class="card-text">2023.02.01~2023.06.30</p>
        </a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
    <a href="/views/newworld/eventveiw2">
      <img src="/resources/images/thumbnail2.jpg" class="card-img-top" alt="">
      <div class="card-body">
        <h5 class="card-title">신나라 면세점 단독 혜택!</h5>
        <p class="card-text">2023.02.01~2023.06.30</p>
        </a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
    <a href="/views/newworld/eventveiw3">
      <img src="/resources/images/thumbnail3.jpg" class="card-img-top" alt="">
      <div class="card-body">
        <h5 class="card-title">신나라와 함께 새학기 졸업 이벤트!</h5>
        <p class="card-text">2023.02.01~2023.06.30</p>
        </a>
      </div>
    </div>
  </div>
  <div class="col">
    <div class="card h-100">
    <a href="/views/newworld/eventveiw4">
      <img src="/resources/images/thumbnail4.jpg" class="card-img-top" alt="">
      <div class="card-body">
        <h5 class="card-title">신나라 포켓 와이파이 증정 이벤트!</h5>
        <p class="card-text">2023.02.01~2023.06.30</p>
        </a>
      </div>
    </div>
  </div>
</div>

</div>
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

</script>
</body>
</html>