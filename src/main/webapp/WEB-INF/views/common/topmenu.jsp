<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link rel="stylesheet" href="/resources/css/topmenu.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style>
 a {
    text-decoration: none;
    outline: none;
    color: #000;
    font-family: 'NanumSquareNeo';
    }
</style>
<div id="topmenu">

<!-- 로그인 로그아웃 메뉴 -->
 <div class="smallmenu">
	<ul style="list-style: none;">
		 <c:if test="${userInfo eq null}">
        	<li><a href="/views/newworld/login">&nbsp;&nbsp;로그인&nbsp;&nbsp;</a></li>
            <li><a href="/views/newworld/join">&nbsp;회원가입&nbsp;</a></li>
            <li><a href="/views/newworld/custommer_center">고객센터</a></li>
		</c:if>
        <c:if test="${userInfo ne null}">
           	<li><a href="#" onclick="logout();">로그아웃</a></li>
           	<li><a href="/views/newworld/mypage">마이페이지</a></li>
			<li><a href="/views/newworld/custommer_center">고객센터</a></li>
		</c:if>                 
	</ul>
</div>

<!-- 로고칸 -->
<div id="seconde">
	<div class="logo">
	<a href="/views/newworld/main"><img src="/resources/images/logo.png" alt="" style="width: 200px"></a>
	</div>
	
	<div class="seach">
	<input type="search" maxlength='18' id="searchbig" name="searchBig" placeholder="검색어를 입력해주세요." onkeyup="enterKey1()" style="font-family: 'NanumSquareNeo'; text-indent:30px">
	<button type="submit" id="searchbtn" onclick="packageSearch()">
	<img src="/resources/images/searchbtn.png" style="width:32px">
	</button>
	</div>
	
	
<div class="coloricon">
	<button><a href="/views/newworld/mypage"><img src="/resources/images/icon/mymenublue.png" width="35px"><br>마이메뉴</a></button>
	<button><a href="/views/newworld/reservationlist"><img src="/resources/images/icon/reservationblue.png" width="35px"><br>예약내역</a></button>
	<button><a href="/views/newworld/collectlist"><img src="/resources/images/icon/hartred.png" width="35px"><br>찜목록</a></button>

	<div class="iconmenu">
		<button><a href="/views/newworld/mypage"><img src="/resources/images/icon/mymenu.png" width="35px"><br>마이메뉴</a></button>
		<button><a href="/views/newworld/reservationlist"><img src="/resources/images/icon/reservation.png" width="35px"><br>예약내역</a></button>
		<button class="hart"><a href="/views/newworld/collectlist"><img src="/resources/images/icon/hart.png" width="35px"><br>찜목록</a></button>

	</div>
</div>
</div>

<!-- 메인 메뉴 창 드랍메뉴는 아직 미구현 -->
<div class="menuline">
	<nav class="navbar navbar-expand-xl">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-auto mb-lg-0">
					<li class="nav-item dropdown">
                        <a class="nav-link dropdown-item" href="/views/newworld/packagecountry" aria-expanded="false">
                          해외패키지
                        </a>
               			<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="/views/newworld/packagecountry_us">미국</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="/views/newworld/packagecountry_eu">유럽</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="/views/newworld/packagecountry_as">아시아</a></li>
						</ul>
					</li>
                      
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-item" href="/views/newworld/packagekorea" aria-expanded="false">
                          국내패키지
                        </a>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="/views/newworld/packagekorea_jeju">제주도</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="/views/newworld/packagekorea_gangwon">강원도</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="/views/newworld/packagekorea_gyeongsang">경상도</a></li>
                          <li><hr class="dropdown-divider"></li>
                          <li><a class="dropdown-item" href="/views/newworld/packagekorea_seoul">서울</a></li>
                          <li><hr class="dropdown-divider"></li>
                        </ul>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/views/newworld/boardqnacheck">문의게시판</a>
                      </li>

                      <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/views/newworld/eventlist">이벤트</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</div>
</div>
<script>

function enterKey1() {
	if(window.event.keyCode == 13) {
		packageSearch();
	}
}

function packageSearch() {
	const searchTxt = document.querySelector('#searchbig').value;
	if(searchTxt != ''){
		fetch('/goods-Search?giName=' + document.querySelector('#searchbig').value)

		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			location.href='/views/newworld/packagesearch?giName=' + document.querySelector('#searchbig').value;
		})
	}else{
		alert('검색어를 입력해주세요.');
	}
	
}

function logout() {
	fetch('/logout')
	.then(function(data) {
		if(data) {
			console.log(data);
			alert('로그아웃 되었습니다.')
			location.href="/views/newworld/main";
		}
	})
}
</script>