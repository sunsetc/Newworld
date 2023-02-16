<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>여행 일정</h2>
<input type="text" class="giCode">
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
<h4>예약자 정보</h4>
<!-- <input type="hidden" data-col="tgiCode" id="tgiCode"> -->   <!-- 상품코드 값 자동으로 불러오게 수정 -->
<input type="text" id="uiName" placeholder="성명" readonly><br>
<input type="text" id="uiPhone" placeholder="연락처" readonly><br>
"-"를 빼고 입력해주세요. ex)0101112222<br>
<input type="email" id="uiEmail" placeholder="이메일" ><br>	<!-- 이메일은 readonly안줄게요 변경 가능하게 하겠음 -->
<input type="text" id="uiId"><br>
<hr>
<h4>여행인원</h4>	
<table>
	<tr>
		<th>성인</th>
		<td data-id="riAdultCount">${param.riAdultCount}</td>
	</tr>
	<tr>
		<th>아동</th>
		<td data-id="riKidsCount">${param.riKidsCount}</td>
	</tr>
	<tr>
		<th>유아</th>
		<td data-id="riBabyCount">${param.riBabyCount}</td>
	</tr>
</table>
<br>
<hr>
<h4>여행자 정보</h4>
<h5>여행자1 (예약자와 동일<input type="checkbox" id="infoCheckBox" onclick="isChecked(this)">)</h5>
<table>
	<tr>
		<td>성명</td>
 		<td><input type="text" id="coName"></td>
 	</tr>
 	<tr>
		<td>번호</td>
 		<td><input type="text" id="coPhone"></td>
 	</tr>
 	<tr>
		<td>이메일</td>
 		<td><input type="text" id="coEmail"></td>
 	</tr>
</table>
<div id="info2">
<h5>여행자2</h5>
<table>
	<tr>
		<td>성명</td>
 		<td><input type="text" id="coName2"></td>
 	</tr>
 	<tr>
		<td>번호</td>
 		<td><input type="text" id="coPhone2"></td>
 	</tr>
 	<tr>
		<td>이메일</td>
 		<td><input type="text" id="coEmail2"></td>
 	</tr>
</table>
</div>
<div id="info3">
<h5>여행자3</h5>
<table>
	<tr>
		<td>성명</td>
 		<td><input type="text" id="coName3"></td>
 	</tr>
 	<tr>
		<td>번호</td>
 		<td><input type="text" id="coPhone3"></td>
 	</tr>
 	<tr>
		<td>이메일</td>
 		<td><input type="text" id="coEmail3"></td>
 	</tr>
</table>
</div>
<div id="info4">
<h5>여행자4</h5>
<table>
	<tr>
		<td>성명</td>
 		<td><input type="text" id="coName4"></td>
 	</tr>
 	<tr>
		<td>번호</td>
 		<td><input type="text" id="coPhone4"></td>
 	</tr>
 	<tr>
		<td>이메일</td>
 		<td><input type="text" id="coEmail4"></td>
 	</tr>
</table>
</div>
<div id="info5">
<h5>여행자5</h5>
<table>
	<tr>
		<td>성명</td>
 		<td><input type="text" id="coName5"></td>
 	</tr>
 	<tr>
		<td>번호</td>
 		<td><input type="text" id="coPhone5"></td>
 	</tr>
 	<tr>
		<td>이메일</td>
 		<td><input type="text" id="coEmail5"></td>
 	</tr>
</table>
</div>
<h5>총 가격</h5>
<table>
	<tr>
		<td data-id="riTgiPrice">${param.riTgiPrice}</td>
	</tr>
</table>
<hr>
<button onclick="reservation()">예약하기</button>
<script>
	function reservation() {
		const param = {};
		const infos = document.querySelectorAll('td[data-id], input[id], input[class]');
		for(const info of infos) {
			param[info.getAttribute('data-id')] = info.innerHTML
			param[info.getAttribute('id')] = info.value
			param[info.getAttribute('class')] = info.value
		}
		
		fetch('/reservation', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(param)
		})
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			if(data == 1) {
			fetch('/reservation/companion', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(param)
			})
			.then(function(res) {
				return res.json();
			})
			.then(function(data) {
				fetch('/companion/update', {
					method: 'PATCH',
					headers: {
						'Content-Type': 'application/json'
					},
					body: JSON.stringify(param)
				})
				.then(function(res) {
					return res.json();
				})
				.then(function(data) {
					console.log(data);
				})
			}) 
			} //if문 종료
			console.log(data);
			if(data == 1) {
				alert('예약 되었습니다.');
				location.href="/views/package/foreign-insert-view?uiId=${userInfo.uiId}&giCode=" + document.querySelector('.giCode').value;
			}else {
				alert('구매 정원이 초과하였습니다.');
			}
		})
	}
	window.addEventListener('load',function showInput(){  //인원수에 따라 여행자 정보 입력란 추가
		const divObjs = document.querySelectorAll('div');
		for(const divObj of divObjs){
			divObj.style.display = 'none'
		}
		const count = Number(document.querySelector('td[data-id=riAdultCount]').innerText)
		+ Number(document.querySelector('td[data-id=riKidsCount]').innerText)
		+ Number(document.querySelector('td[data-id=riBabyCount]').innerText);
		console.log(count);
		if(count==2){
			divObjs[0].style.display = ''
		}else if(count==3){
			divObjs[0].style.display = ''
			divObjs[1].style.display = ''
		}else if(count==4){
			divObjs[0].style.display = ''
			divObjs[1].style.display = ''
			divObjs[2].style.display = ''
		}else if(count==5){
			divObjs[0].style.display = ''
			divObjs[1].style.display = ''
			divObjs[2].style.display = ''
			divObjs[3].style.display = ''
		}
	})
	function isChecked(obj){  //예약자와 동일 체크버튼 누르면 여행자1 정보입력란에 예약자정보가 자동 입력되고 disabled됨
		const inputObj = document.querySelectorAll('input');
		if(obj.checked){
			inputObj[6].value = inputObj[1].value;  //inputObj[4]:userName, inputObj[0]:uiName
			inputObj[6].disabled = true
			inputObj[7].value = inputObj[2].value;  //inputObj[5]:userPhone, inputObj[1]:uiPhone
			inputObj[7].disabled = true
			inputObj[8].value = inputObj[3].value;  //inputObj[6]:userEmail, inputObj[2]:uiEmail
			inputObj[8].disabled = true
		}else{
			inputObj[6].value =''
			inputObj[6].disabled = false
			inputObj[7].value = ''
			inputObj[7].disabled = false
			inputObj[8].value = ''
			inputObj[8].disabled = false
		}
	}
	function getgoods() { 
		fetch('/reservation/${param.giNum}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			const infos = document.querySelectorAll('td[data-col], input[class]');
			for(const info of infos) {
				info.innerHTML = data[info.getAttribute('data-col')];
				info.value = data[info.getAttribute('class')];
			}
		})
	}
	
	function getUserInfo() {
		fetch('/userinfo/${userInfo.uiNum}')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			document.querySelector('#uiName').value = data.uiName;
			console.log(document.querySelector('#uiName').value);
			document.querySelector('#uiPhone').value = data.uiPhone;
			document.querySelector('#uiEmail').value = data.uiEmail;
			document.querySelector('#uiId').value = data.uiId;
		})
	}
	
	window.onload = function() { 
			getgoods(), getUserInfo()
	}
</script>
</body>
</html>