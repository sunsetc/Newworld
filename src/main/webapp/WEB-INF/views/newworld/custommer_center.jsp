<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/custommercenter.css">
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
                <li><a href="/views/newworld/custommer_center">고객센터</a></li>
            </ul>
        </div>  

<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>
    

    <!-- 공지사항 메인 -->
<div class="notepage">
    <h1 class="bigtitle">고객센터</h1><br>
    <div class="icons">
    <center>
        <button class="qnabtn">
            <a href="/views/newworld/boardqnacheck">
            <img src="/resources/images/icon/qna.png" alt="" style="width: 100px">
            <br>1:1문의</a></button>
         <span class="line1"></span>
         
         <button class="paybtn">
            <a href="/views/newworld/custommer_center_pay">
            <img src="/resources/images/icon/pay.png" alt="" style="width: 90px">
                <br>결제방법</a></button>
            <span class="line2"></span>

            <button class="fnabtn">
            <a href="/views/newworld/boardfna">
                <img src="/resources/images/icon/fna.png" alt="" style="width: 90px">
                <br>자주찾는 질문</a></button>
    </center>
	</div>
	
	    <div class="coloricons">
    <center>
        <button class="qnabtn">
            <a href="/views/newworld/boardqnacheck">
            <img src="/resources/images/icon/qnablue.png" alt="" style="width: 100px">
            <br>1:1문의</a></button>
         <span class="line3"></span>
         
         <button class="paybtn">
            <a href="#">
            <img src="/resources/images/icon/payblue.png" alt="" style="width: 90px">
                <br>결제방법</a></button>
            <span class="line4"></span>

            <button class="fnabtn">
            <a href="/views/newworld/boardfna">
                <img src="/resources/images/icon/fnablue.png" alt="" style="width: 90px">
                <br>자주찾는 질문</a></button>
    </center>
	</div>

    <!-- 부트스트랩 -->
    <p class="sammllnote">공지사항</p>
    <button class="more" onclick="location.href='/views/newworld/boardnotice'"><img src="https://cdn4.iconfinder.com/data/icons/fluent-outline-20px-vol-1/20/ic_fluent_add_20_regular-256.png" alt="" style="width: 30px"></button>
    <table class="table table-striped">
         <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">등록일</th>
          </tr>
        </thead>
        <tbody id="tBody">
        </tbody>
      </table>
</div>
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
			let num = 0;
			for (let i = 0; i < 5; i++) {
				num += 1;
				const boardNote = list[i]
				html += '<tr>';
				html += '<th>' + num + '</th>';
				html += '<td style="text-align: left; cursor:pointer;" onclick="location.href=\'/views/newworld/boardnoticeview?bnNum=' + boardNote.bnNum + '\'">' + boardNote.bnTitle + '</td>';
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