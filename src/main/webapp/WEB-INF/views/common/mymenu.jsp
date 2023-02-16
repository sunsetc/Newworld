<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<link rel="stylesheet" href="/resources/css/sidemenu_mypage.css">
<style>
 a {
    text-decoration: none;
    outline: none;
    color: #000;
    }
</style>
<!-- 마이페이지 사이드메뉴 -->
<div class="leftmenu">
<div class="sidemeun">
	<h2 class="cusstmenu">마이페이지</h2>
   
   			<!-- 아코디언 시작 -->
            <div class="accordion accordion-flush" id="accordionFlushExample">
            <!-- 개인정보 -->
 			<div class="accordion-item">
    		<h2 class="accordion-header" id="flush-headingOne">
      		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
      		개인정보</button></h2>
    		<div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne">
    		<div class="accordion-body">
      		<a href="/views/newworld/updatecheck">개인정보수정</a><br>
      		<a href="/views/newworld/deleteuserinfo">회원탈퇴</a>
      		</div>
    		</div>
  			</div>
  			
  			<!-- 예약내역 조회  -->
  			<div class="accordion-item">
    		<h2 class="accordion-header" id="flush-headingTwo">
      		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
      		예약</button></h2>
    		<div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo">
      		<div class="accordion-body">
      		<a href="/views/newworld/reservationlist">예약조회</a>
      		</div>
    		</div>
  			</div>
  			
  			<!-- 리뷰 -->
  			<div class="accordion-item">
    		<h2 class="accordion-header" id="flush-headingThree">
      		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
      		리뷰</button></h2>
    		<div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree">
      		<div class="accordion-body">
			<a href="/views/newworld/reviewinsert_list">리뷰쓰기</a><br>
			<a href="/views/newworld/reviewview_list">나의 리뷰보기</a>
			</div>
    		</div>
  			</div>
  			
  			<!-- 찜목록  -->
  			<div class="accordion-item">
    		<h2 class="accordion-header" id="flush-headingFour">
      		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
      		찜</button></h2>
    		<div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour">
      		<div class="accordion-body">
      		<a href="/views/newworld/collectlist">찜목록</a>
      		</div>
    		</div>
  			</div>
			</div>
</div>
</div>