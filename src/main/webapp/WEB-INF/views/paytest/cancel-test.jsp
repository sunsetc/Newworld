<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<td data-col="riCode" data-id="merchantUid"></td>
		</tr>
		<tr>
			<th>성함</th>
			<td data-col="uiName" data-id="buyerName"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td data-col="uiPhone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td data-col="uiEmail"></td>
		</tr>
	</table>
	<hr>
	<h2>상품 정보</h2>
	<table>
	<tr>
		<th>패키지명</th>
		<td data-col="tgiName" data-id="name"></td>
	</tr>
	<tr>
		<th>출발지</th>
		<td data-col="taStart"></td>
	</tr>
	<tr>
		<th>도착지</th>
		<td data-col="taArr"></td>
	</tr>
	<tr>
		<th>출발일</th>
		<td data-col="taStday"></td>
	</tr>
	<tr>
		<th>도착일</th>
		<td data-col="taArrdat"></td>
	</tr>
	</table>
	<hr>
	<h2>여행자 정보</h2>
	<table border=1>
		<tr>
			<th data-col="toName">이름</th>
			<th data-col="toPhone">전화번호</th>
			<th data-col="toEmail">이메일</th>
		</tr>
		<tbody id=tBody></tbody>
	</table>
	<hr>
	<h2>결제 금액</h2>
	<table>
		<tr>
			<td data-col="tgiPrice" data-id="amount"></td>
		</tr>
	</table>
	<button id="paycancel">결제취소</button>
<script>


	
	function getReservation() {				//예약자 정보, 상품 정보 가져오기
		fetch('/getReservation/${param.uiId}/${param.riCode}')
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
		fetch('/getCompanion/${param.uiId}/${param.riCode}')
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
		getReservation(), getCompanion();
	}
</script>
</body>
</html>