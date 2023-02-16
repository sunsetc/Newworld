<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="UTF-8">
<title>New World Tour</title>
<%@ include file="/WEB-INF/views/common/header_code.jsp" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
</head>
<body>
	<style>
.no-js { 
display:none; 
}
body {
	width: 350px;
	heigth: 350px;
}

#carouselExampleCaptions {
	width: 350px;
	heigth: 350px;
}

.todayBtn, .closeBtn {
	background-color: #4093d0;
	font-size: 14px;
	border: none;
	padding: 5px;
	width: 175px;
	height: 50px;
	color: #fff;
}

.todayBtn:hover .closeBtn:hover {
	cursor: pointer;
	background-color: #0e74be;
}
</style>

	<div id="carouselExampleCaptions" class="carousel slide"
		data-bs-ride="false">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/images/thumbnail2.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/resources/images/thumbnail3.jpg" class="d-block w-100"
					alt="...">
			</div>
			<div class="carousel-item">
				<img src="/resources/images/thumbnail4.jpg" class="d-block w-100"
					alt="...">
			</div>
		</div>
	</div>
	<div id="popup">
		<button type="button" class="todayBtn">오늘은 그만 보기</button><button type="button" class="closeBtn" onclick="window.close()">닫기</button>
	</div>
	<script>
		$(function() {
			if ($.cookie("name") == "value") {
				$("html, body").hide();
			}
			var $expChk = $(".todayBtn");
			$(".closeBtn").on("click", closePop);
			$(".todayBtn").on("click", closePop);
			
			function closePop(event) {
				if ($expChk.is(event.target)) {
					$.cookie("name", "value", {
						expires : 1,
						path : "/"
					});
				}
				$("html, body").fadeOut("fast");
			}
		});
	


		$(function(){

		$('html').removeClass('no-js');

		});
	</script>
</body>
</html>