<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	<link rel="stylesheet" href="/resources/css/main.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>


    <!-- 메인 페이지 첫번째 섹션 -->
    <!-- 상세 조회 검색창 -->
    <div id="main_page_1">
    
    
    <!-- 모달창 -->
    <div id="pop">
    <iframe src="/views/newworld/popup" id="modal_iframe"></iframe>  
	</div>

    <div id="selectAll">
    <div id="question">
    	<c:if test="${userInfo eq null}">
    	<p style="font-family: 'NanumSquareNeoHeavy'; font-size:30px">고객님,<br>
    	어떤 여행을 꿈꾸시나요?</p>
    	</c:if>
    	<c:if test="${userInfo ne null}">
        <p style="font-family: 'NanumSquareNeoHeavy'; font-size:30px">${userInfo.uiName}님,<br>
        어떤 여행을 꿈꾸시나요?</p>
        </c:if>
        <div class="form-check">
        <input type="radio" class="btn-check" name="options" id="option1" value="foreign" autocomplete="off" checked>
		<label class="btn btn-outline-secondary" for="option1" style="font-family: 'NanumSquareNeo'; width:165px;">해외</label>

		<input type="radio" class="btn-check" name="options" id="option2" value="home" autocomplete="off">
		<label class="btn btn-outline-secondary" for="option2" style="font-family: 'NanumSquareNeo'; width:165px;">국내</label><br>
		</div>
		<input type="text" class="searchtrip" placeholder="어디로 떠나세요?" onkeyup="enterKey2()" style="font-family: 'NanumSquareNeoLight';  text-indent:10px"><br>
        <button type="text" class="packagesc" onclick="packageSearchByEtc()">패키지 검색</button>
    </div>
    </div>




<!-- 이미지 슬라이드 -->
     <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1" ></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2" ></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3" ></button>
        </div>
        <div class="carousel-inner" >
          <div class="carousel-item active" >
            <img src="/resources/images/banner1.png" class="d-block w-100" alt="">
          </div>
          <div class="carousel-item">
            <a href="/views/newworld/eventveiw4"><img src="/resources/images/banner2.png" class="d-block w-100" alt=""></a>
          </div>
          <div class="carousel-item">
             <a href="/views/newworld/eventveiw3"><img src="/resources/images/banner3.png" class="d-block w-100" alt=""></a>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev" onclick="colorChange()">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next" onclick="colorChange()">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
</div>

<!-- 메인 페이지 두번째 섹션 -->

<div id="main_page_2">
<b><p class="pick1">고객님을 위한 추천 패키지</p></b>
    <div id="city_choice">
    <div class="goods1"></div>

    <div class="goods2"></div>

    <div class="goods3"></div>

    <div class="goods4"></div>
    </div>
        
<b><p class="pick2">내가 가고싶은 나라를 한 눈에 보고 싶다면?</p></b>
<div class="country_choice">
    <a href="/views/newworld/packagecountry_us"><img src="/resources/images/america.png" alt="" class="america"></a>
    <a href="/views/newworld/packagecountry_eu"><img src="/resources/images/europe.png" alt="" class="europe"></a>
    <a href="/views/newworld/packagecountry_as"><img src="/resources/images/asia.png" alt="" class="asia"></a>
    <a href="/views/newworld/packagekorea"><img src="/resources/images/kor.png" alt="" class="kor"></a>
</div>
</div>


<!-- 메인 페이지 세번째 섹션 / 여행후기 / 고객센터 등 메뉴들로 구성할 것 아직 보류 -->
<div id="main_page_3">
	
	<div class="innerpage">
	<div class="innertext">
	<p class="youtube">동영상</p>
	<p class="utitle">떠나자, 모든 여행 하나만 믿고 🗽</p>
	<p class="ucontent">더 프라이빗하게, 더 여유롭게, 더 안전하게<br>여행의 처음부터 끝까지 개런티 할게 🤝<br>항공도 ✈ 호텔도 🛌 액티비티도 🎈<br>모든 여행 신나라만 믿고 가면 돼!</p>
	<a class="ulink" href="/views/newworld/eventlist">신년 해외여행 준비도 신나라만 믿고 ></a><br>
	<p class="getabout">Get About</p>
	<p class="newstitle">스페인 세비야에서 놓치지 말아야 할 일곱 가지</p>
	<p class="newscontent">사랑과 정열의 나라, 스페인하면 자연스럽게 떠올리는 수식어다.<br>스페인 남부, 세비아가 주목을 받기 시작했다.<br>사랑과 정열은 물론, 전통과 역사까지<br>스페인의 모든 것이 집약된 가장 스페인스러운 여행지<br>세비야에 대해 알아보자<br></p>
	<a class="newslink" href="http://getabout.hanatour.com/archives/897513">신년 해외여행 준비도 신나라만 믿고 ></a><br>
	<p class="event">이벤트</p>
	<p class="eventtitle">떠나자, 모든 여행 신나라만 믿고 🗽 </p>
	<p class="eventcontent">뜻밖의 행운을 잡아보세요🥠<br>참여만 해도 100% 당첨!<br>든든한 신나라투어와 함께 하세요<br><br></p>
	<a class="eventlink" href="/views/newworld/eventveiw1">신나라에서 주는 행운의 선물 ></a><br>
	</div>
	<div class="utube">
	<iframe width="388" height="218" src="https://www.youtube.com/embed/qcqT9kqgi-k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
	</div>
	<div class="sabiya">
	<img src="/resources/images/sebiya2.jpg" alt="" style="width: 446px; height: 517px;">
	</div>
	<a href="/views/newworld/eventveiw1">
	<div class="fortune">
	<img src="/resources/images/event.png" alt="">
	</a>
	</div>
    </div>
	</div>
	


<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>
function enterKey2() {
	if(window.event.keyCode == 13) {
		packageSearchByEtc();
	}
}

function colorChange() {
	const mainColor = document.querySelector('#main_page_1');
	const prev = document.querySelector('.carousel-control-prev');
	const next = document.querySelector('.carousel-control-next');
	const colors = ['#ebbe68', '#f7bfd3', '#acaaff','#c5e48e', '#c7eafa', '#B2CCFF', '#e5d3b9']
	
	const colorIndex = parseInt(Math.random()*colors.length);
	console.log(colors[1]);
	document.querySelector('#main_page_1').style.backgroundColor = colors[colorIndex];
	
}

function packageSearchByEtc(){
	if(document.querySelector('.searchtrip').value == ''){
		alert('검색어를 입력해주세요.');
		return;
	}
	fetch('/goods-serch-etc?giName=' + document.querySelector('.searchtrip').value + '&giEtc=' + document.querySelector('.btn-check:checked').value)
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		if(document.querySelector('.btn-check:checked').value == 'foreign'){
			location.href='/views/newworld/packagesearch_con?giName=' + document.querySelector('.searchtrip').value + '&giEtc=' + document.querySelector('.btn-check:checked').value	
		}else{
			location.href='/views/newworld/packagesearch_kor?giName=' + document.querySelector('.searchtrip').value + '&giEtc=' + document.querySelector('.btn-check:checked').value
		}
		
	})
}

function mainGoods() {
	fetch('/main-goods')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		price1 = data[0].giPriceAdult.toString().replace(regexp, ',');
		price2 = data[1].giPriceAdult.toString().replace(regexp, ',');
		price3 = data[2].giPriceAdult.toString().replace(regexp, ',');
		price4 = data[3].giPriceAdult.toString().replace(regexp, ',');
		
		let goods1 = '';
		goods1 += '<a href="/views/newworld/packageview?giCode=HW01">';
		goods1 += '<img src="' + data[0].giImage1 + '" alt="" width="280px"></a><br>';
		goods1 += '<a class="text1" href="/views/newworld/packageview?giCode=HW01">' + '알로하 모히또! 하와이!' + '</a><br>';
		goods1 += '<small><a href="/views/newworld/packageview?giCode=HW01">' + data[0].giHashtag + '</a></small><br>';
		goods1 += '<b><a href="/views/newworld/packageview?giCode=HW01">' + price1 + '</b>원</a>';
		document.querySelector('div.goods1').innerHTML = goods1;
		
		let goods2 = '';
		goods2 += '<a href="/views/newworld/packageview?giCode=FR01">';
		goods2 += '<img src="' + data[1].giImage1 + '" alt="" width="280px"></a><br>';
		goods2 += '<a class="text1" href="/views/newworld/packageview?giCode=FR01">' + '오감이 행복한 프랑스' + '</a><br>';
		goods2 += '<small><a href="/views/newworld/packageview?giCode=FR01">' + data[1].giHashtag + '</a></small><br>';
		goods2 += '<b><a href="/views/newworld/packageview?giCode=FR01">' + price2 + '</b>원</a>';
		document.querySelector('div.goods2').innerHTML = goods2;
		
		let goods3 = '';
		goods3 += '<a href="/views/newworld/packageview?giCode=BU01">';
		goods3 += '<img src="' + data[2].giImage1 + '" alt="" width="280px"></a><br>';
		goods3 += '<a class="text1" href="/views/newworld/packageview?giCode=BU01">' + '파란 수도 부산으로 떠나요!' + '</a><br>';
		goods3 += '<small><a href="/views/newworld/packageview?giCode=BU01">' + data[2].giHashtag + '</a></small><br>';
		goods3 += '<b><a href="/views/newworld/packageview?giCode=BU01">' + price3 + '</b>원</a>';
		document.querySelector('div.goods3').innerHTML = goods3;
		
		let goods4 = '';
		goods4 += '<a href="/views/newworld/packageview?giCode=JE01">';
		goods4 += '<img src="' + data[3].giImage1 + '" alt="" width="280px"></a><br>';
		goods4 += '<a class="text1" href="/views/newworld/packageview?giCode=JE01">' + '혼자옵서예 제주' + '</a><br>';
		goods4 += '<small><a href="/views/newworld/packageview?giCode=JE01">' + data[3].giHashtag + '</a></small><br>';
		goods4 += '<b><a href="/views/newworld/packageview?giCode=JE01">' + price4 + '</b>원</a>';
		document.querySelector('div.goods4').innerHTML = goods4;
	})
}

window.onload = function() {
	mainGoods();
	pop();
}


/* 팝업창 스크립트 */
/* var popupX = (document.body.offsetWidth / 2) - (350 / 2);
var popupY= (window.screen.height / 2) - (300 / 2);

window.onload = function pop() { 
	window.open("/views/newworld/popup", "pop", "width=350, height=300 left=popupX, top=popupY")
}
 */
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>