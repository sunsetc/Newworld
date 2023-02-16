<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/qnainsert.css">
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
                <li><a href="/views/newworld/boardqnacheck">1:1문의게시판</a>></li>
                <li><a href="/views/newworld/boardqnainsert">1:1문의 등록</a></li>
            </ul>
        </div> 
        
<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>

    <!-- 공지사항 메인 -->
<div class="qnapage">
    <h1 class="bigtitle">1:1문의 내역</h1><br>
 
    <!-- 부트스트랩 -->
    <table class="table table table-border w-100">
        <tbody>
          <tr>
            <th class="table-primary">휴대폰 번호</th>
            <td><input type="text" readonly value="${userInfo.uiPhone}"></td>
          </tr>
          <tr>
            <th class="table-primary">이메일</th>
            <td><input type="text" readonly value="${userInfo.uiEmail}" style="width: 740px;"></td>
          </tr>
          <tr>
            <th class="table-primary">문의 유형</th>
            <td><select><option value="resurl" selected>예약</option><option value="air">항공</option><option value="pay">결제</option></td>
          </tr>
          <tr>
            <th class="table-primary">예약번호</th>
            <td><select id="selectCode" onchange="selectWriteCode()"><input type="text" id="inputCode"><button class="reviewbtn" onclick="window.open('/views/newworld/reservCodeList', '', 'left='+ popupX + ', top='+ popupY + ' width=400, height=550, status=no')">예약번호 조회</button></td>
          </tr>
      <th class="table-primary">제목</th>
      <td><input type="text" id="bqTitle" style="width: 740px;"></td>
     </tr>
    <th class="table-primary">내용</th>
    <td><textarea cols="80" id="bqContent" rows="10"></textarea></td>
    </tr>
        </tbody>
      </table>
    <button class="qnainsert" onclick="insertBoardInfo()">등록</button>
</div>

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

var popupX = (document.body.offsetWidth / 2) - (400 / 2);
var popupY= (window.screen.height / 2) - (550 / 2);

window.onload = function getReservCode(){  //1:1문의 예약번호 최신순으로 5개 불러오기
	fetch('/newworlds-code/${userInfo.uiNum}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		document.querySelector('#inputCode').style.display = 'none';
		let html = '';
		for(let i=0; i<data.length; i++){
			const info = data[i]
			html += '<option>' + info.riCode + '</option>'
		}
		html += '<option value="writeCode">직접입력</option>'
		document.querySelector('#selectCode').innerHTML = html;
		
	})
}

function selectWriteCode(){
	const sel = document.querySelector('#selectCode');
	if(sel.value == 'writeCode'){
		document.querySelector('#inputCode').style.display = '';
	}else{
		document.querySelector('#inputCode').style.display = 'none';
	}
}

function insertBoardInfo() {
	const inputObj = document.querySelector('#inputCode');
	let riCode = '';
	if(document.querySelector('#selectCode').options[document.querySelector('#selectCode').selectedIndex].innerHTML == '직접입력'){
		riCode += document.querySelector('#inputCode').value;
	}else{
		riCode += document.querySelector('#selectCode').options[document.querySelector('#selectCode').selectedIndex].innerHTML
	}
	const param = {
			bqTitle: document.querySelector('#bqTitle').value,
			bqContent: document.querySelector('#bqContent').value,
			bqCategory : document.querySelector('select').options[document.querySelector('select').selectedIndex].innerHTML,
			uiNum : ${userInfo.uiNum},
			riCode : riCode
	}
	fetch('/newworlds-qna',{
		method:'POST',
		headers : {
			'Content-Type' : 'application/json'
		},
		body : JSON.stringify(param)
	})
	.then(async function(res){
		if(res.ok){
			return res.json();
		}else{
			const err = await res.text();
			throw new Error(err);
		}
	})
	.then(function(data){
		if(data===1){
			alert('정상적으로 등록되었습니다.');
			location.href='/views/newworld/boardqnalist';
		}
		
	})
	.catch(function(err){
		alert('올바르지 않은 형식입니다.');
	});
}



</script>
</body>
</html>