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
        if (rsp.success) {
            var msg = '결제가 완료되었습니다.';
            msg += '고유ID : ' + rsp.imp_uid;
            msg += '상점 거래ID : ' + rsp.merchant_uid;
            msg += '결제 금액 : ' + rsp.paid_amount;
            msg += '카드 승인번호 : ' + rsp.apply_num;
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
          
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        alert(msg);
        location.href="/views/newworld/main"
    });
}); 
	
	// server-side
	
app.use(bodyParser.json());
// "/pay"에 대한 POST 요청을 처리
app.post("/pay", async (req, res) => {
try {
  const { impUid, merchantUid } = req.body; // req의 body에서 imp_uid, merchant_uid 추출

  // 액세스 토큰(access token) 발급 받기
  const getToken = await axios({
    url: "https://api.iamport.kr/users/getToken",
    method: "post", // POST method
    headers: { "Content-Type": "application/json" }, // "Content-Type": "application/json"
    data: {
      imp_key: ${imp_key}, // REST API 키
      imp_secret: ${imp_secret} // REST API Secret
    }
  });
  const { access_token } = getToken.data.response; // 인증 토큰

  // imp_uid로 아임포트 서버에서 결제 정보 조회
  const getPaymentData = await axios({
    url: "https://api.iamport.kr/payments/${imp_uid}" // imp_uid 전달
    method: "get", // GET method
    headers: { "Authorization": access_token } // 인증 토큰 Authorization header에 추가
  });
  const paymentData = getPaymentData.data.response; // 조회한 결제 정보
 
// DB에서 결제되어야 하는 금액 조회
  const order = await Orders.findById(paymentData.merchantUid);
  const amountToBePaid = order.amount; // 결제 되어야 하는 금액

  // 결제 검증하기
  const { amount, status } = paymentData;
  if (amount === amountToBePaid) { // 결제금액 일치. 결제 된 금액 === 결제 되어야 하는 금액
    await Orders.findByIdAndUpdate(merchantUid, { $set: paymentData }); // DB에 결제 정보 저장
    
  } else { // 결제금액 불일치. 위/변조 된 결제



} catch (e) {
  res.status(400).send(e);
}
});


	
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
		fetch('/order/home/${param.giCode}')
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