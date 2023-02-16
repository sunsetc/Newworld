<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
<input type="hidden" id="gi1max">
<input type="hidden" id="giCode">
<table border=1 class="sum_table">
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
	<tr>
		<th>정원</th>
		<td data-col="giMax"></td>
	</tr>
	<tr>
		<th>잔여</th>
		<td data-id="restSeat"></td>
	</tr>
	
	<tr>
		<th>성인가격</th>
		<td><input type="text" id="giPriceAdult" class="num_sum" readonly></td>
	</tr>
	<tr>
		<th>아동가격</th>
		<td><input type="text" id="giPriceKid" class="num_sum" readonly></td>
	</tr>
	<tr>
		<th>유아가격</th>
		<td><input type="text" id="giPriceBaby" class="num_sum" readonly></td>
	</tr>
	<tr>
		<th>성인 예약 인원</th>
		<td><input type="text" id="riAdultCount" class="num_sum"></td>
	</tr>
	<tr>
		<th>아동 예약 인원</th>
		<td><input type="text" id="riKidsCount" class="num_sum"></td>
	</tr>
	<tr>
		<th>유아 예약 인원</th>
		<td><input type="text" id="riBabyCount" class="num_sum"></td>
	</tr>
	<tr>
		<th>합계</th>
		<td><input type="text" id="riTgiPrice" class="num_sum"></td>
	</tr>

</table>
<button onclick="homeinsert()">예약하기</button>

<script>

	$(function(){ //제이쿼리 라이브러리 꼭 삽입할 것 8행 참조
	
		$('input.num_sum').on('keyup',function(){
		          var cnt = $(".sum_table input.num_sum").length;     
		          console.log(cnt);
		          
		  for( var i=1; i< cnt; i++){
		     var sum = parseInt($(this).val() || 0 );
		     sum++
		    console.log(sum);
		  }
		  
		            var sum1 = parseInt($("#giPriceAdult").val() || 0); // input 값을 가져오며 계산하지만 값이 없을경우 0이 대입된다  뒷부분에 ( || 0 ) 없을경우 합계에 오류가 생겨 NaN 값이 떨어진다
		            var sum2 = parseInt($("#giPriceKid").val() || 1);
		            var sum3 = parseInt($("#giPriceBaby").val() || 1);
		            var sum4 = parseInt($("#riAdultCount").val() || 1);
		            var sum5 = parseInt($("#riKidsCount").val() || 1);
		            var sum6 = parseInt($("#riBabyCount").val() || 1);
		            
		            var sum = (sum1 * sum4) + (sum2 * sum5) + (sum3 * sum6)
		            
		            console.log(sum);
		            $("#riTgiPrice").val(sum);
		        });
		});
	
	function homeinsert() {
		var msg = '1인당 구매 인원은 ' + document.querySelector('#gi1max').value + '명 입니다. 예약 시 확인 부탁드립니다.'
		alert(msg);
		location.href='/views/package/home-insert?giNum=${param.giNum}&riAdultCount=' + document.querySelector('#riAdultCount').value +
				'&riKidsCount=' + document.querySelector('#riKidsCount').value +
				'&riBabyCount=' + document.querySelector('#riBabyCount').value + 
				'&riTgiPrice=' + document.querySelector('#riTgiPrice').value;
	}
	//여기서 구매 인원 비교해서 제한 걸려고 했으나 다른 여행사 사이트들도 남은 인원 비교해서 예약이 막히거나 그러지는 않음
	//그래서 그냥 바로 인원수랑 총 가격을 예약 사이트로 넘김
	
	function rest() {
		fetch('/rest/home/${param.giCode}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data.rest);
			document.querySelector('td[data-id=restSeat]').innerHTML = data.rest;
		})
	}

	function getGoodsInfos() {
		fetch('/homeGoods/${param.giCode}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			const infos = document.querySelectorAll('td[data-col], input[id]');
			for(const info of infos) {
				info.innerHTML = data[info.getAttribute('data-col')];
				info.value = data[info.getAttribute('id')];
				document.querySelector('#riTgiPrice').value = document.querySelector('#giPriceAdult').value;
				document.querySelector('#riAdultCount').value = 1;
				document.querySelector('#riKidsCount').value = 0;
				document.querySelector('#riBabyCount').value = 0;
			}
		})
	}
	window.onload = function() {
		getGoodsInfos(), rest();
	}
</script>
</body>
</html>