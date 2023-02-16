<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/mypage.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
	<!-- 바로가기 -->
	<div class="smallnav">
		<ul>
			<li><a href="/views/newworld/main">홈 > </a></li>
			<li><a href="/views/newworld/mypage">마이페이지</a></li>
		</ul>
	</div>
           
<!-- 마이페이지 사이드메뉴 -->
<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>

<!-- 공지사항 메인 -->
<div class="notepage">
    <h1 class="bigtitle">마이페이지</h1><br>
    <div class="btnicons">
    <center>
    		<button class="qnabtn">
       		 <a href="/views/newworld/updatecheck">
            <img src="/resources/images/icon/setuserinfo.png" alt="" style="width: 100px">
            <br>개인정보</a></button>
         	<span class="line1"></span>
         	
         	<button class="reserlist">
         	<a href="/views/newworld/reservationlist">
            <img src="/resources/images/icon/reservation.png" alt="" style="width: 90px">
            <br>예약내역</a></button>
            <span class="line2"></span>

			<button class="review">
            <a href="/views/newworld/reviewview_list">
            <img src="/resources/images/icon/review.png" alt="" style="width: 90px">
            <br>리뷰</a></button>
            <span class="line3"></span>

            <button class="collect">
            <a href="/views/newworld/collectlist">
            <img src="/resources/images/icon/hart.png" alt="" style="width: 90px">
            <br>찜목록</a></button>
    </center>
	</div>
	
	<div class="coloricons">
	<center>
            <button class="qnabtnblue">
       		 <a href="/views/newworld/updatecheck">
            <img src="/resources/images/icon/setuserinfoblue.png" alt="" style="width: 100px">
            <br>개인정보</a></button>
         	<span class="line4"></span>

			<button class="reserlistblue">
         	<a href="/views/newworld/reservationlist">
            <img src="/resources/images/icon/reservationblue.png" alt="" style="width: 90px">
            <br>예약내역</a></button>
            <span class="line5"></span>
			
			<button class="reviewblue">
            <a href="#">
            <img src="/resources/images/icon/reviewblue.png" alt="" style="width: 90px">
            <br>리뷰</a></button>          
            <span class="line6"></span>
            
            <button class="collect">
            <a href="/views/newworld/collectlist">
            <img src="/resources/images/icon/hartred.png" alt="" style="width: 90px">
            <br>찜목록</a></button>
	</center>
	</div>	
                         
           	


    <!-- 테이블 -->
    <p class="sammllreser">예약내역</p>
    <button class="more1" type="button" onclick="location.href='/views/newworld/reservationlist'"><img src="/resources/images/icon/more.png" alt="" style="width: 30px"></button>
    <table class="table table-striped">
        <thead>
            <tr>
              <th scope="col">예약번호</th>
              <th scope="col">패키지</th>
              <th scope="col">예약자</th>
              <th scope="col">예약일</th>
            </tr>
          </thead>
          <tbody id="tBody"></tbody>
          	<c:if test="${userInfo.uiNum eq null}">
          <tbody>
          </tbody>
          	</c:if>
        </table>


        <p class="sammllqna">문의내역</p>
        <button class="more2" type="button" onclick="location.href='/views/newworld/boardqnalist'"><img src="/resources/images/icon/more.png" alt="" style="width: 30px"></button>
        <table class="table table-striped">
            <thead>
                <tr>
                  <th scope="col">번호</th>
                  <th scope="col">제목</th>
                  <th scope="col">작성자</th>
                  <th scope="col">등록일</th>
                </tr>
              </thead>
               <tbody id="tBody2"></tbody>
              	<c:if test="${userInfo.uiNum eq null}">
              <tbody id="tBody2">
              </tbody>
              	</c:if>
            </table>
</div>
</div>
<!-- 푸터 -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"></jsp:include>
</div>
</div>

<script>
window.onload  = function getReservList(){
	fetch('/reserv-list-my/${userInfo.uiId}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		let html = '';
			for(let i=0; i<data.length; i++){
				const info = data[i]
				html += '<tr style="cursor:pointer" onclick="location.href=\'/views/newworld/reservationlist?riCode=' + info.riCode + '\'">';
				html += '<td>' + info.riCode + '</td>';
				html += '<td>' + info.giName + '</td>';
				html += '<td>' + info.uiName + '</td>';
				html += '<td>' + info.riDate + '</td>';
				html += '</tr>'
			}
		document.querySelector('#tBody').innerHTML = html;
	})
}

window.addEventListener('load',function getQnaList(){
	fetch('/newworlds-qna?uiNum=${userInfo.uiNum}&bqTitle=&bqContent=&bqCmtCheck=') 
	.then(function(res){
		return res.json();
	})

	.then(function(list) {
		let html = '';
		let num = 0;
		for (let i = 0; i < list.length; i++) {
			num += 1;
			const boardQna = list[i]
			html += '<tr>';
			html += '<th>' + num + '</th>';
			html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardqnaview?bqNum=' + boardQna.bqNum + '\'">' + boardQna.bqTitle + '</td>';
			html += '<td>' + boardQna.uiName + '</td>'; 
			html += '<td>' + boardQna.bqCredat + '</td>';
			html += '</tr>';
		}
		document.querySelector('#tBody2').innerHTML = html;
	
	})
})
</script>
</body>
</html>