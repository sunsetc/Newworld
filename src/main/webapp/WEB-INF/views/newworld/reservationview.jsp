<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/reservationview.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈 </a>></li>
                <li><a href="/views/newworld/packagecountry">해외패키지</a>></li>
                <li><a href="/views/newworld/reservationview">예약조회</a></li>
            </ul>
        </div>
    

    <!-- 패키지상세 메인 -->
<div class="resurpage">
<!-- 큰 글씨 -->
    <h1 class="bigtitle">예약조회</h1><br>
           
           
           
            <div class="resurchoice">  <!-- 페이지 전체 -->
			<div class="rightmenu">
			<div class="resurtext"> <!-- 오른쪽 부분 -->
            <p style="font-size:20px"><b>결제 상세내역</b></p><br>
            <small><center><p>최종결제금액</center>
            <ul><li>성인 <span id="riAdultCount"></span></li><li> 아동 <span id="riKidsCount"></span></li><li> 유아 <span id="riBabyCount"></span></li></ul></p></small>
            </div>
            <div class="summoney">
            <p class="summoneytext" style="text-align: right; font-size:26px; color:#3162C7" ><span id="riTgiPrice" style="font-weight: bold;">${param.riTgiPrice}</span>원</p><br>
            <center><button id="orderCancel" class="resurbtn" style="width:240px; height: 50px; display: none">예약취소</button></center>
            <center><button id="reservPay" class="resurbtn" style="width:240px; height: 50px; display: none">결제하기</button></center>
            </div>
            </div> 
            </div>
            
            
            
<!-- 왼쪽 부분  -->
<div class="resurtable">

		
  		<!-- 첫번째 테이블 -->
  		<div class="resurtable">
		<p style="font-size:24px">여행정보</p>
		<table class="table table-border w-75">
              <tbody id="tBody_reserv">
              </tbody>
            </table>

            <!-- 두번째 테이블 -->
   		<p class="tabletext" style="font-size:24px">예약자정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">이름</th>
				<td data-id="uiName"></td>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">성별</th>
				<td data-id="uiName"></td>
				<th class="table-primary">생년월일</th>
				<td data-id="uiBirth"></td>
				</tr>
				<tr>
				<th class="table-primary">이메일</th>
				<td data-id="uiEmail"></td>
				<th class="table-primary">휴대폰번호</th>
				<td data-id="uiPhone"></td>
				</tr>
              </tbody>
            </table>
            <input type="hidden" id="uiId"><br>

		<!-- 세번째 테이블 -->
   		<p class="tabletext" style="font-size:24px">여행자 정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td data-col="coName"></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td data-col="coBirth"></td>
				<th class="table-primary">성별</th>
				<td data-col="coGender"></td>
				</tr>
				<tr>
				<th class="table-primary">영문 성</th>
				<td data-col="coEngFirst"></td>
				<th class="table-primary">영문 이름</th>
				<td data-col="coEngName"></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td data-col="coPhone"></td>
				<th class="table-primary">이메일</th>
				<td data-col="coEmail"></td>
				</tr>
              </tbody>
            </table>
            
            <table class="table table-border w-75" id="companion2" style="display:none">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td data-col="coName2"></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td data-col="coBirth2"></td>
				<th class="table-primary">성별</th>
				<td data-col="coGender2"></td>
				</tr>
				<tr>
				<th class="table-primary">영문 성</th>
				<td data-col="coEngFirst2"></td>
				<th class="table-primary">영문 이름</th>
				<td data-col="coEngName2"></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td data-col="coPhone2"></td>
				<th class="table-primary">이메일</th>
				<td data-col="coEmail2"></td>
				</tr>
              </tbody>
            </table>
            
            <table class="table table-border w-75" id="companion3" style="display:none">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td data-col="coName3"></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td data-col="coBirth3"></td>
				<th class="table-primary">성별</th>
				<td data-col="coGender3"></td>
				</tr>
				<tr>
				<th class="table-primary">영문 성</th>
				<td data-col="coEngFirst3"></td>
				<th class="table-primary">영문 이름</th>
				<td data-col="coEngName3"></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td data-col="coPhone3"></td>
				<th class="table-primary">이메일</th>
				<td data-col="coEmail3"></td>
				</tr>
              </tbody>
            </table>
            
            <table class="table table-border w-75" id="companion4" style="display:none">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td data-col="coName4"></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td data-col="coBirth4"></td>
				<th class="table-primary">성별</th>
				<td data-col="coGender4"></td>
				</tr>
				<tr>
				<th class="table-primary">영문 성</th>
				<td data-col="coEngFirst4"></td>
				<th class="table-primary">영문 이름</th>
				<td data-col="coEngName4"></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td data-col="coPhone4"></td>
				<th class="table-primary">이메일</th>
				<td data-col="coEmail4"></td>
				</tr>
              </tbody>
            </table>
            
            <table class="table table-border w-75" id="companion5" style="display:none">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td data-col="coName5"></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td data-col="coBirth5"></td>
				<th class="table-primary">성별</th>
				<td data-col="coGender5"></td>
				</tr>
				<tr>
				<th class="table-primary">영문 성</th>
				<td data-col="coEngFirst5"></td>
				<th class="table-primary">영문 이름</th>
				<td data-col="coEngName5"></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td data-col="coPhone5"></td>
				<th class="table-primary">이메일</th>
				<td data-col="coEmail5"></td>
				</tr>
              </tbody>
            </table>
		</div>
		
		
		<div class="paytable" style="display: none">
		<!-- 네번째 테이블 결제정보 -->
   		<p class="tabletext" style="font-size:24px">결제정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody_pay">
				<!-- 스크립트 확인 -->
              </tbody>
            </table>
		</div>

</div>
</div>      

</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

function getgoods() {  //상품정보, 회원정보, 항공편정보, 인원수에 따른 여행자 정보
	fetch('/reserv-view/${param.riCode}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		 
		let html = '';
		html += '<tr>'
		html += '<th class="table-primary">' + '예약번호' + '</th>'
		html += '<td data-col="riCode">' + data.riCode + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '패키지명' + '</th>'
		html += '<td data-col="giName">' + data.giName + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '여행기간' + '</th>'
		html += '<td>' + data.giPeriodAbout + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '예약 인원' + '</th>'
		html += '<td>' + '성인: ' + data.riAdultCount + ' &nbsp;&nbsp;&nbsp;아동: ' + data.riKidsCount + '&nbsp;&nbsp;&nbsp; 유아: ' + data.riBabyCount + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '항공편' + '</th>'
		html += '<td>' + data.viDeparture + ' ↔ ' + data.viDestination + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' + data.viName + '<br>'
		html += '출발일: ' + data.viStart + '<br>'
		html += '도착일: ' + data.viArr + '</td>'
		html += '</tr>'
		html += '<th class="table-primary">' + '결제상태' + '</th>'
		if(data.riCheck == "0" && data.riActive == "1") {
			html += '<td>' + '예약 취소' + '</td>'
		}else if(data.riCheck == "0" && data.riActive == "0") {
			html += '<td>' + '결제 대기' + '</td>'
		}else if(data.riCheck == "1" && data.riActive == "0") {
			html += '<td>' + '결제 완료' + '</td>'
		}
		html += '</tr>'
		document.querySelector('#tBody_reserv').innerHTML = html;
		
		const infos = document.querySelectorAll('td[data-id]');	//예약자 정보 불러옴
		for(const info of infos) {
			info.innerHTML = data[info.getAttribute('data-id')];
		}
		
		const reservs = document.querySelectorAll('span[id]');	//예약 인원, 총 합 불러옴
		for(const reserv of reservs) {
			reserv.innerHTML = data[reserv.getAttribute('id')];
			
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			let price = document.querySelector('span#riTgiPrice').innerHTML;
			price = price.toString().replace(regexp, ',');
			document.querySelector('span#riTgiPrice').innerHTML = price;
		}
	})
}



function getCompanion(){	//동행인 불러오기
	fetch('/reserv-Companion/${param.riCode}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		console.log(data.length);
		
		document.querySelector('td[data-col=coName]').innerHTML = data[0].coName;
		document.querySelector('td[data-col=coBirth]').innerHTML = data[0].coBirth;
		document.querySelector('td[data-col=coGender]').innerHTML = data[0].coGender;
		document.querySelector('td[data-col=coEngFirst]').innerHTML = data[0].coEngFirst;
		document.querySelector('td[data-col=coEngName]').innerHTML = data[0].coEngName;
		document.querySelector('td[data-col=coPhone]').innerHTML = data[0].coPhone;
		document.querySelector('td[data-col=coEmail]').innerHTML = data[0].coEmail;
		
		if(data.length==2) {
			document.querySelector('table#companion2').style.display = '';
			document.querySelector('td[data-col=coName2]').innerHTML = data[1].coName;
			document.querySelector('td[data-col=coBirth2]').innerHTML = data[1].coBirth;
			document.querySelector('td[data-col=coGender2]').innerHTML = data[1].coGender;
			document.querySelector('td[data-col=coEngFirst2]').innerHTML = data[1].coEngFirst;
			document.querySelector('td[data-col=coEngName2]').innerHTML = data[1].coEngName;
			document.querySelector('td[data-col=coPhone2]').innerHTML = data[1].coPhone;
			document.querySelector('td[data-col=coEmail2]').innerHTML = data[1].coEmail;
		}else if(data.length==3) {
			document.querySelector('table#companion2').style.display = '';
			document.querySelector('table#companion3').style.display = '';
			document.querySelector('td[data-col=coName2]').innerHTML = data[1].coName;
			document.querySelector('td[data-col=coBirth2]').innerHTML = data[1].coBirth;
			document.querySelector('td[data-col=coGender2]').innerHTML = data[1].coGender;
			document.querySelector('td[data-col=coEngFirst2]').innerHTML = data[1].coEngFirst;
			document.querySelector('td[data-col=coEngName2]').innerHTML = data[1].coEngName;
			document.querySelector('td[data-col=coPhone2]').innerHTML = data[1].coPhone;
			document.querySelector('td[data-col=coEmail2]').innerHTML = data[1].coEmail;
			document.querySelector('td[data-col=coName3]').innerHTML = data[2].coName;
			document.querySelector('td[data-col=coBirth3]').innerHTML = data[2].coBirth;
			document.querySelector('td[data-col=coGender3]').innerHTML = data[2].coGender;
			document.querySelector('td[data-col=coEngFirst3]').innerHTML = data[2].coEngFirst;
			document.querySelector('td[data-col=coEngName3]').innerHTML = data[2].coEngName;
			document.querySelector('td[data-col=coPhone3]').innerHTML = data[2].coPhone;
			document.querySelector('td[data-col=coEmail3]').innerHTML = data[2].coEmail;
		}else if(data.length==4) {
			document.querySelector('table#companion2').style.display = '';
			document.querySelector('table#companion3').style.display = '';
			document.querySelector('table#companion4').style.display = '';
			document.querySelector('td[data-col=coName2]').innerHTML = data[1].coName;
			document.querySelector('td[data-col=coBirth2]').innerHTML = data[1].coBirth;
			document.querySelector('td[data-col=coGender2]').innerHTML = data[1].coGender;
			document.querySelector('td[data-col=coEngFirst2]').innerHTML = data[1].coEngFirst;
			document.querySelector('td[data-col=coEngName2]').innerHTML = data[1].coEngName;
			document.querySelector('td[data-col=coPhone2]').innerHTML = data[1].coPhone;
			document.querySelector('td[data-col=coEmail2]').innerHTML = data[1].coEmail;
			document.querySelector('td[data-col=coName3]').innerHTML = data[2].coName;
			document.querySelector('td[data-col=coBirth3]').innerHTML = data[2].coBirth;
			document.querySelector('td[data-col=coGender3]').innerHTML = data[2].coGender;
			document.querySelector('td[data-col=coEngFirst3]').innerHTML = data[2].coEngFirst;
			document.querySelector('td[data-col=coEngName3]').innerHTML = data[2].coEngName;
			document.querySelector('td[data-col=coPhone3]').innerHTML = data[2].coPhone;
			document.querySelector('td[data-col=coEmail3]').innerHTML = data[2].coEmail;
			document.querySelector('td[data-col=coName4]').innerHTML = data[3].coName;
			document.querySelector('td[data-col=coBirth4]').innerHTML = data[3].coBirth;
			document.querySelector('td[data-col=coGender4]').innerHTML = data[3].coGender;
			document.querySelector('td[data-col=coEngFirst4]').innerHTML = data[3].coEngFirst;
			document.querySelector('td[data-col=coEngName4]').innerHTML = data[3].coEngName;
			document.querySelector('td[data-col=coPhone4]').innerHTML = data[3].coPhone;
			document.querySelector('td[data-col=coEmail4]').innerHTML = data[3].coEmail;
		}else if(data.length==5) {
			document.querySelector('table#companion2').style.display = '';
			document.querySelector('table#companion3').style.display = '';
			document.querySelector('table#companion4').style.display = '';
			document.querySelector('table#companion5').style.display = '';
			document.querySelector('td[data-col=coName2]').innerHTML = data[1].coName;
			document.querySelector('td[data-col=coBirth2]').innerHTML = data[1].coBirth;
			document.querySelector('td[data-col=coGender2]').innerHTML = data[1].coGender;
			document.querySelector('td[data-col=coEngFirst2]').innerHTML = data[1].coEngFirst;
			document.querySelector('td[data-col=coEngName2]').innerHTML = data[1].coEngName;
			document.querySelector('td[data-col=coPhone2]').innerHTML = data[1].coPhone;
			document.querySelector('td[data-col=coEmail2]').innerHTML = data[1].coEmail;
			document.querySelector('td[data-col=coName3]').innerHTML = data[2].coName;
			document.querySelector('td[data-col=coBirth3]').innerHTML = data[2].coBirth;
			document.querySelector('td[data-col=coGender3]').innerHTML = data[2].coGender;
			document.querySelector('td[data-col=coEngFirst3]').innerHTML = data[2].coEngFirst;
			document.querySelector('td[data-col=coEngName3]').innerHTML = data[2].coEngName;
			document.querySelector('td[data-col=coPhone3]').innerHTML = data[2].coPhone;
			document.querySelector('td[data-col=coEmail3]').innerHTML = data[2].coEmail;
			document.querySelector('td[data-col=coName4]').innerHTML = data[3].coName;
			document.querySelector('td[data-col=coBirth4]').innerHTML = data[3].coBirth;
			document.querySelector('td[data-col=coGender4]').innerHTML = data[3].coGender;
			document.querySelector('td[data-col=coEngFirst4]').innerHTML = data[3].coEngFirst;
			document.querySelector('td[data-col=coEngName4]').innerHTML = data[3].coEngName;
			document.querySelector('td[data-col=coPhone4]').innerHTML = data[3].coPhone;
			document.querySelector('td[data-col=coEmail4]').innerHTML = data[3].coEmail;
			document.querySelector('td[data-col=coName5]').innerHTML = data[4].coName;
			document.querySelector('td[data-col=coBirth5]').innerHTML = data[4].coBirth;
			document.querySelector('td[data-col=coGender5]').innerHTML = data[4].coGender;
			document.querySelector('td[data-col=coEngFirst5]').innerHTML = data[4].coEngFirst;
			document.querySelector('td[data-col=coEngName5]').innerHTML = data[4].coEngName;
			document.querySelector('td[data-col=coPhone5]').innerHTML = data[4].coPhone;
			document.querySelector('td[data-col=coEmail5]').innerHTML = data[4].coEmail;
		}
	})
}


//예약 상세 페이지에서 결제 정보가 있을 경우 결제내역보기 뜨게함
function reservCheck() {
	fetch('/pay-info/${param.riCode}')
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		console.log(data);
		
		if(data) {
			data = JSON.parse(data);
			document.querySelector('div.paytable').style.display = '';
			document.querySelector('#orderCancel').style.display = '';
			let html = '';
			html += '<tr>'
			html += '<th class="table-primary">' + '승인번호' + '</th>'
			html += '<td>' + data.applyNum + '</td>'
			html += '<th class="table-primary">' + '금액' + '</th>'
			html += '<td>' + data.amount + '원' + '</td>'
			html += '</tr>'
			html += '<tr>'
			html += '<th class="table-primary">' + '카드명' + '</th>'
			html += '<td>' + data.cardName + '</td>'
			html += '<th class="table-primary">' + '할부' + '</th>'
			if(data.cardQuota == 0) {
				html += '<td>' + '일시불' + '</td>'
			}else {
				html += '<td>' + data.cardQuota + '개월' + '</td>'
			}
			html += '</tr>'
			document.querySelector('#tBody_pay').innerHTML = html;
		}
	})
}

//예약 상세 페이지에서 결제 정보가 없을 경우 결제하기 뜨게함
function reservOrder() {
	fetch('/reserv-order/${userInfo.uiId}/${param.riCode}')
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		console.log(data);
		if(data) {
			document.querySelector('#reservPay').style.display = '';
			document.querySelector('#orderCancel').style.display = '';
			document.querySelector('div.paytable').style.display = 'none';
		}
	})
}

function reservCancel() {
	fetch('/reserv-cancel/${userInfo.uiId}/${param.riCode}')
	.then(function(res) {
		return res.text();
	})
	.then(function(data) {
		if(data) {
			document.querySelector('#reservPay').style.display = 'none';
			document.querySelector('#orderCancel').style.display = 'none';
			document.querySelector('div.paytable').style.display = 'none';
		}
	})
}


//결제
$('#reservPay').click(function () {
    // getter
    var IMP = window.IMP; //생략가능
    IMP.init('imp68257437'); //가맹점 식별코드
    //var money = $('input[name="cp_item"]:checked').val();
    //console.log(돈);

    IMP.request_pay({ //IMP.request_pay(parpam,callback)
        pg: 'html5_inicis', //PG사 선택
        merchant_uid: document.querySelector('td[data-col=riCode]').innerHTML, //가맹점에서 구별할 수 있는 고유한id(예약번호)
        name: document.querySelector('td[data-col=giName]').innerHTML, //상품명
        amount: parseInt((document.querySelector('span#riTgiPrice').innerHTML).replace(/,/g, "")), //가격
        buyer_email: document.querySelector('td[data-id=uiEmail]').innerHTML,
        buyer_name: document.querySelector('td[data-id=uiName]').innerHTML,
        buyer_tel: document.querySelector('td[data-id=uiPhone]').innerHTML,
    }, function (rsp) { //callback 결제 완료 후 실행되는 함수
        console.log(rsp);
        $.ajax({
				type : 'POST',
				url : '/verifyIamport/' + rsp.imp_uid
	})
    .done(function(data) {
    	console.log(data);
    	if(rsp.paid_amount == data.response.amount){
    		alert('결제 되었습니다.');
	        $.ajax('/pay', { //서버의 결제 정보를 받는 endpoint
            	method: 'POST',
            	dataType: 'json',
            	contentType:'application/json',
            	data: JSON.stringify({
            		impUid: rsp.imp_uid,
            		merchantUid: rsp.merchant_uid,
            		payMethod: rsp.pay_method,
            		pgProvider: rsp.pg_provider,
            		pgTid: rsp.pg_tid,
            		applyNum: rsp.apply_num,
            		cardName: rsp.card_name,
            		cardQuota: rsp.card_quota,
            		name: rsp.name,
            		amount: rsp.paid_amount,
            		buyerName: rsp.buyer_name,
            		status: rsp.status,
            		failReason: rsp.fail_reason,
            		refund: 'pay'
            	})
            }) 
            location.href="/views/newworld/reservationview?riCode=${param.riCode}";
    	}else {
    		alert('결제 실패');
    	}
    });
	});
})

$('#orderCancel').click(function () {
	var check = confirm("정말 결제 취소하시겠습니까?")
	if(check == true) {
		fetch('/pay-info/${param.riCode}')
		.then(function(res) {
			return res.text();
		})
		.then(function(data) {
			console.log(data);
			
			if(data) {
				data = JSON.parse(data);
				if(check) {
					$.ajax({
						"url": "/verifyIamport/" + data.impUid,
						"type": "POST",
						"contentType": "application/json",
						"data": JSON.stringify({
							merchantUid: data.merchantUid,
							cancelAmount: data.amount,
							cancelReason: "테스트 환불"
						}),
						"dataType": "json"
					})
					.done(function(result) {
						$.ajax({
							url: "/verifyIamport/cancel",
							type: "POST",
							headers: {
								contentType: "application/x-www-form-urlencoded"
							},
							data: {
								impUid: data.impUid,
								merchantUid: data.merchantUid,
								cancelAmount: data.amount,
								cancelReason: "테스트 환불"
							}
						})
					})
					.done(function(first_data) {
						console.log("환불 성공");
						$.ajax({
							url: "/reserve-cancel-check/${param.riCode}",
							type: "PATCH",
							headers: {
								contentType: "application/json"
							}
						})
					})
					.done(function(second_data) {
						$.ajax({
							url: "/pay-cancel/${param.riCode}",
							type: "PATCH",
							headers: {
								contentType: "application/json"
							}
						})
					})
					.done(function(final_data) {
						fetch('/cancel-companion/${param.riCode}', {
		 					method: 'PATCH'
		 				})
		 				.then(function(data) {
		 					alert('예약취소 되었습니다.');
		 	 				location.href="/views/newworld/reservationlist";
		 				})
					})
					}else {
						alert('결제 취소가 취소되었습니다.');
					}
			}else if(!data) {
		 		fetch('/reserve-cancel/${param.riCode}',{
		 			method:'PATCH'
		 		})
		 		.then(function(res){
		 			return res.json();
		 		})
		 		.then(function(data){
		 			if(data){
		 				fetch('/cancel-companion/${param.riCode}', {
		 					method: 'PATCH'
		 				})
		 				.then(function(data) {
		 					alert('예약취소 되었습니다.');
		 	 				location.href="/views/newworld/reservationlist";
		 				})
		 			}
		 		})
			}
		})
	}else if(check == false) {
		alert('예약 취소를 취소하였습니다.');
	}

})

window.onload = function() { 
		getgoods(), getCompanion(), reservOrder(), reservCheck(), reservCancel();
}
</script>
</body>
</html>