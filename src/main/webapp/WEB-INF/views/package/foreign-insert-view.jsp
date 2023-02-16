<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:eval expression="@envProperties['iamport.id']" var="imp_key"/>
<spring:eval expression="@envProperties['iamport.pwd']" var="imp_secret"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
	<table>
		<h2>예약자 정보</h2>
		<tr>
			<th>예약번호</th>
			<td data-id="riCode"></td>
		</tr>
		<tr>
			<th>성함</th>
			<td data-id="uiName"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td data-id="uiPhone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td data-id="uiEmail"></td>
		</tr>
	</table>

	<hr>
	<h2>상품 정보</h2>
	<table>
		<tr>
			<th>패키지명</th>
			<td data-col="giName"></td>
		</tr>
		<tr>
			<th>기간</th>
			<td data-col="giPeriod"></td>
		</tr>
		<tr>
			<th>항공사</th>
			<td data-col="fiPlane"></td>
		</tr>
		<tr>
			<th>출발지</th>
			<td data-col="fiDeparture"></td>
		</tr>
		<tr>
			<th>도착지</th>
			<td data-col="fiDestination"></td>
		</tr>
		<tr>
			<th>출발일</th>
			<td data-col="fiStart"></td>
		</tr>
		<tr>
			<th>도착일</th>
			<td data-col="fiArr"></td>
		</tr>
	</table>
	<hr>
	<h2>여행자 정보</h2>
	<table border=1>
		<tr>
			<th data-col="coName">이름</th>
			<th data-col="coPhone">전화번호</th>
			<th data-col="coEmail">이메일</th>
		</tr>
		<tbody id=tBody></tbody>
	</table>
	<hr>
	<h2>결제 금액</h2>
	<table>
		<tr>
			<td data-id="riTgiPrice"></td>
		</tr>
	</table>
	<button id="pay">결제하기</button>
	<button id="paycancel" onclick="paycancel()">(예약)결제취소</button>
	<script>
	
 	$('#pay').click(function () {
	    // getter
	    var IMP = window.IMP; //생략가능
	    IMP.init('imp68257437'); //가맹점 식별코드
	    //var money = $('input[name="cp_item"]:checked').val();
	    //console.log(돈);
	
	    IMP.request_pay({ //IMP.request_pay(parpam,callback)
	        pg: 'html5_inicis', //PG사 선택
	        merchant_uid: document.querySelector('td[data-id=riCode]').innerHTML, //가맹점에서 구별할 수 있는 고유한id(예약번호)
	
	        name: document.querySelector('td[data-col=giName]').innerHTML, //상품명
	        amount: document.querySelector('td[data-id=riTgiPrice]').innerHTML, //가격
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
	    		alert('결제 및 결제검증완료');
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
	            		failReason: rsp.fail_reason
	            	})
	            }) 
	    	}else {
	    		alert('결제 실패');
	    	}
	    });
		});
 	})


 	
 	//예약취소(결제취소)
 	
 	function paycancel(){
 		const riCode = document.querySelector('td[data-id=riCode]').innerHTML;
 		fetch('/reserve-cancel/' + riCode,{
 			method:'PATCH'
 		})
 		.then(function(res){
 			return res.json();
 		})
 		.then(function(data){
 			if(data===1){
 				alert('예약취소 성공');
 				location.href="/views/newworld/main";
 			}
 		})
 	}

	
	function getReservation() {				//예약자 정보, 상품 정보 가져오기
		fetch('/order/${param.uiId}/${param.giCode}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			const infos = document.querySelectorAll('td[data-id]');
			for(const info of infos) {
				info.innerHTML = data[info.getAttribute('data-id')];
			}
		})
	}
	
	function getGoodsForeign() {			//예약자 정보, 상품 정보 가져오기
		fetch('/order/foreign/${param.giCode}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			const infos = document.querySelectorAll('td[data-col]');
			for(const info of infos) {
				info.innerHTML = data[info.getAttribute('data-col')];
			}
		})
	}
	
	function getCompanion() {			//동행인 정보 가져오기
		const infos = document.querySelectorAll('th[data-col]');
		fetch('/orderCompanion/${param.uiId}/${param.giCode}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			let html = '';
			for(let i = 0; i < data.length; i++) {
				const companions = data[i];
				html += '<tr>'
				for(const info of infos) {
					html += '<td>' + companions[info.getAttribute('data-col')] + '</td>';
				}
				html += '</tr>';
			}
			document.querySelector('#tBody').innerHTML = html;
		})
	}
	window.onload = function() {
		getReservation(), getGoodsForeign(), getCompanion();
	}
</script>
</body>
</html>