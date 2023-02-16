<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/reservationapply.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈 </a>></li>
                <li><a href="/views/newworld/packagecountry">해외패키지</a>></li>
                <li><a href="/views/newworld/reservationapply">예약하기</a></li>
            </ul>
        </div>
    

    <!-- 패키지상세 메인 -->
<div class="resurpage">
<!-- 큰 글씨 -->
    <h1 class="bigtitle">예약하기</h1><br>
           
           
           
            <div class="resurchoice">  <!-- 페이지 전체 -->
			<div class="rightmenu">
			<div class="resurtext"> <!-- 오른쪽 부분 -->
            <p style="font-size:20px"><b>결제 상세내역</b></p><br>
            <small><center><p>최종결제금액</center>
            <ul><li>성인 <span id="riAdultCount">${param.riAdultCount}</span></li><li> 아동 <span id="riKidsCount">${param.riKidsCount} </span></li><li> 유아 <span id="riBabyCount">${param.riBabyCount} </span></li></ul></p></small>
            </div>
            <div class="summoney">
            <p class="summoneytext" style="text-align: right; font-size:26px; color:#3162C7" ><span id="riTgiPrice" style="font-weight: bold;">${param.riTgiPrice}</span>원</p><br>
            <center><button class="resurbtn" style="width:240px; height: 50px;" onclick="reservation()">예약하기</button></center>
            </div>
            </div>  
            </div>
            
            
            <!-- 왼쪽 부분  -->
	<div class="resurtable">
	
	
	
   		<!-- 첫번째 테이블 -->
   		<p style="font-size:24px">여행정보</p>
   		<input type="hidden" id="giCode">
        <table class="table table-border w-75">
              <tbody id="tBody">
				<!-- 스크립트 확인 -->
              </tbody>
            </table>




            <!-- 두번째 테이블 -->
   		<p class="tabletext" style="font-size:24px">예약자정보</p>
        <table class="table table-border w-75">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">이름</th>
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
            <input type="hidden" id="giEtc"><br>
            
		
		
		<!-- 인원 입력버튼 -->
   		<p class="tabletext" style="font-size:24px">인원정보</p>
   		<div class="peoplecheck">
   		<div class="onecheck">
   		<p><a style="font-size:20px; font-weight: bold;">성인</a><small>&nbsp;&nbsp;&nbsp;&nbsp;만 12세 이상</small></p>
   		
   		<div class="btngroup">
 			<button onclick="count('minus1')"><img src="/resources/images/icon/minus.png" width="24px"></button>
 				<input type=text id="riAdultCount" maxlength='2' style="text-indent:3px" value="${param.riAdultCount}">
 			<button onclick="count('plus1')"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
            </div>
            
   		<p style="font-size:20px;"><b>&nbsp;&nbsp;<span class="giPriceAdult"></span></b>원</p>
   		</div>
   		
   		<div class="onecheck">
   		<p><a style="font-size:20px; font-weight: bold;">아동</a><small>&nbsp;&nbsp;&nbsp;&nbsp;만 12세 미만</small></p>
   		
   		<div class="btngroup">
 			<button onclick="count('minus2')"><img src="/resources/images/icon/minus.png" width="24px"></button>
 				<input type=text id="riKidsCount" maxlength='2' style="text-indent:3px" value="${param.riKidsCount}" >
 			<button onclick="count('plus2')"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
       </div>
            
   		<p style="font-size:20px;"><b>&nbsp;&nbsp;<span class="giPriceKid"></span></b>원</p>
   		</div>
   		
   		<div class="onecheck">
   		<p><a style="font-size:20px; font-weight: bold;">유아</a><small>&nbsp;&nbsp;&nbsp;&nbsp;만 2세 미만</small></p>
   		
   		<div class="btngroup">
 			<button onclick="count('minus3')"><img src="/resources/images/icon/minus.png" width="24px"></button>
 				<input type=text id="riBabyCount" maxlength='2' style="text-indent:3px" value="${param.riBabyCount}">
 			<button onclick="count('plus3')"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
        </div>
        
   		<p style="font-size:20px;"><b>&nbsp;&nbsp;<span class="giPriceBaby"></span></b>원</p>
   		</div>
   		</div>
		
		
		<!-- 이게 없으면 디자인이 깨집니다.  -->
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
   		<!-- 테이블 -->
   		<p class="tabletext" style="font-size:24px">여행자 정보</p>
   		
   		<!-- 체크박스 -->
   		<div class="form-check">
  			<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" onclick="isChecked(this)">
  			<label class="form-check-label" for="flexCheckDefault">
  			예약자와 동일
  			</label>
		</div>
		
		<!-- 세번째 테이블 -->
        <table class="table table-border w-75">
              <tbody id="tBody_companion">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td><input type="text" id="coName"><p style="display:none; color:red; font-size:13px;" id="error1">이름을 입력해주세요</p></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td><input type="text" id="coBirth"><p style="display:none; color:red; font-size:13px;" id="error1">법정생년월일을 입력해주세요</p></td>
				<th class="table-primary">성별</th>
				<td>
				<!-- 라디오 버튼 -->
				<div class="form-check">
  				<input type="radio" class="coGender" name="flexRadio1" id="flexCheckChecked1" value="남자" checked>
  				<label for="flexCheckChecked1">
    			남성
  				</label>
				</div>
				<div class="form-check">
  				<input type="radio" class="coGender" name="flexRadio1" id="flexCheckChecked2" value="여자" >
  				<label for="flexCheckChecked2">
    			여성
  				</label>
				</div>
				<p style="display:none; color:red; font-size:13px;" id="error1"></p>
				<p style="color:red; font-size:13px;" id="error1">성별을 확인해주세요</p>
				</td>
				</tr>
				<!-- 라디오 버튼 끝  -->
				<tr>
				<th class="table-primary">영문 성</th>
				<td><input type="text" id="coEngFirst"><p style="display:none; color:red; font-size:13px;" id="error1">여권상의 영문 성을 입력해주세요</p></td>
				<th class="table-primary" >영문 이름</th>
				<td><input type="text" id="coEngName"><p style="display:none; color:red; font-size:13px;" id="error1">여권상의 영문 이름을 입력해주세요</p></td>
				</tr>
				<tr>
				<th class="table-primary" >휴대폰 번호</th>
				<td><input type="text" id="coPhone"><p style="display:none; color:red; font-size:13px;" id="error1">휴대폰번호를 입력해주세요</p></td>
				<th class="table-primary" >이메일</th>
				<td><input type="text" id="coEmail"><p style="display:none; color:red; font-size:13px;" id="error1">이메일을 입력해주세요</p></td>
				</tr>
              </tbody>
            </table>
            
            <table class="table table-border w-75" id="companion1">
              <tbody id="tBody">
				<tr>
				<th class="table-primary" >성명(한글)</th>
				<td><input type="text" id="coName2"><p style="display:none; color:red; font-size:13px;" id="error2">이름을 입력해주세요</p></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td><input type="text" id="coBirth2"><p style="display:none; color:red; font-size:13px;" id="error2">법정생년월일을 입력해주세요</p></td>
				<th class="table-primary">성별</th>
				<td>
				<!-- 라디오 버튼 -->
				<div class="form-check">
  				<input type="radio" class="coGender2" name="flexRadio2" id="flexCheckChecked3" value="남자" checked>
  				<label for="flexCheckChecked3">
    			남성
  				</label>
				</div>
				<div class="form-check">
  				<input type="radio" class="coGender2" name="flexRadio2" id="flexCheckChecked4" value="여자" >
  				<label for="flexCheckChecked4">
    			여성
  				</label>
				</div>
				<p style="display:none; color:red; font-size:13px;" id="error2"></p>
				<p style="color:red; font-size:13px;" id="error2">성별을 확인해주세요</p>
				</td>
				</tr>
				<!-- 라디오 버튼 끝  -->
				<tr>
				<th class="table-primary">영문 성</th>
				<td><input type="text" id="coEngFirst2"><p style="display:none; color:red; font-size:13px;" id="error2">여권상의 영문 성을 입력해주세요</p></td>
				<th class="table-primary">영문 이름</th>
				<td><input type="text" id="coEngName2"><p style="display:none; color:red; font-size:13px;" id="error2">여권상의 영문 이름을 입력해주세요</p></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td><input type="text" id="coPhone2"><p style="display:none; color:red; font-size:13px;" id="error2">휴대폰번호를 입력해주세요</p></td>
				<th class="table-primary">이메일</th>
				<td><input type="text" id="coEmail2"><p style="display:none; color:red; font-size:13px;" id="error2">이메일을 입력해주세요</p></td>
				</tr>
              </tbody>
            </table>
            
                    <table class="table table-border w-75" id="companion2">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td><input type="text" id="coName3"><p style="display:none; color:red; font-size:13px;" id="error3">이름을 입력해주세요</p></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary" >생년월일</th>
				<td><input type="text" id="coBirth3"><p style="display:none; color:red; font-size:13px;" id="error3">법정생년월일을 입력해주세요</p></td>
				<th class="table-primary">성별</th>
				<td>
				<!-- 라디오 버튼 -->
				<div class="form-check">
  				<input type="radio" class="coGender3" name="flexRadio3" id="flexCheckChecked5" value="남자" checked>
  				<label for="flexCheckChecked5">
    			남성
  				</label>
				</div>
				<div class="form-check">
  				<input type="radio" class="coGender3" name="flexRadio3" id="flexCheckChecked6" value="여자" >
  				<label for="flexCheckChecked6">
    			여성
  				</label>
				</div>
				<p style="display:none; color:red; font-size:13px;" id="error3"></p>
				<p style="color:red; font-size:13px;" id="error3">성별을 확인해주세요</p>
				</td>
				</tr>
				<!-- 라디오 버튼 끝  -->
				<tr>
				<th class="table-primary">영문 성</th>
				<td><input type="text" id="coEngFirst3"><p style="display:none; color:red; font-size:13px;" id="error3">여권상의 영문 성을 입력해주세요</p></td>
				<th class="table-primary">영문 이름</th>
				<td><input type="text" id="coEngName3"><p style="display:none; color:red; font-size:13px;" id="error3">여권상의 영문 이름을 입력해주세요</p></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td><input type="text" id="coPhone3"><p style="display:none; color:red; font-size:13px;" id="error3">휴대폰번호를 입력해주세요</p></td>
				<th class="table-primary">이메일</th>
				<td><input type="text" id="coEmail3"><p style="display:none; color:red; font-size:13px;" id="error3">이메일을 입력해주세요</p></td>
				</tr>
              </tbody>
            </table>
            
                    <table class="table table-border w-75" id="companion3">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td><input type="text" id="coName4"><p style="display:none; color:red; font-size:13px;" id="error4">이름을 입력해주세요</p></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td><input type="text" id="coBirth4"><p style="display:none; color:red; font-size:13px;" id="error4">법정생년월일을 입력해주세요</p></td>
				<th class="table-primary">성별</th>
				<td>
				<!-- 라디오 버튼 -->
				<div class="form-check">
  				<input type="radio" class="coGender4" name="flexRadio4" id="flexCheckChecked7" value="남자" checked>
  				<label for="flexCheckChecked7">
    			남성
  				</label>
				</div>
				<div class="form-check">
  				<input type="radio" class="coGender4" name="flexRadio4" id="flexCheckChecked8" value="여자" >
  				<label for="flexCheckChecked8">
    			여성
  				</label>
				</div>
				<p style="display:none; color:red; font-size:13px;" id="error4"></p>
				<p style="color:red; font-size:13px;" id="error4">성별을 확인해주세요</p>
				</td>
				</tr>
				<!-- 라디오 버튼 끝  -->
				<tr>
				<th class="table-primary">영문 성</th>
				<td><input type="text" id="coEngFirst4"><p style="display:none; color:red; font-size:13px;" id="error4">여권상의 영문 성을 입력해주세요</p></td>
				<th class="table-primary">영문 이름</th>
				<td><input type="text" id="coEngName4"><p style="display:none; color:red; font-size:13px;" id="error4">여권상의 영문 이름을 입력해주세요</p></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td><input type="text" id="coPhone4"><p style="display:none; color:red; font-size:13px;" id="error4">휴대폰번호를 입력해주세요</p></td>
				<th class="table-primary">이메일</th>
				<td><input type="text" id="coEmail4"><p style="display:none; color:red; font-size:13px;" id="error4">이메일을 입력해주세요</p></td>
				</tr>
              </tbody>
            </table>
            
                    <table class="table table-border w-75" id="companion4">
              <tbody id="tBody">
				<tr>
				<th class="table-primary">성명(한글)</th>
				<td><input type="text" id="coName5"><p style="display:none; color:red; font-size:13px;" id="error5">이름을 입력해주세요</p></td>
				<th></th>
				<td></td>
				</tr>
				<tr>
				<th class="table-primary">생년월일</th>
				<td><input type="text" id="coBirth5"><p style="display:none; color:red; font-size:13px;" id="error5">법정생년월일을 입력해주세요</p></td>
				<th class="table-primary">성별</th>
				<td>
				<!-- 라디오 버튼 -->
				<div class="form-check">
  				<input type="radio" class="coGender5" name="flexRadio5" id="flexCheckChecked9" value="남자" checked>
  				<label for="flexCheckChecked9">
    			남성
  				</label>
				</div>
				<div class="form-check">
  				<input type="radio" class="coGender5" name="flexRadio5" id="flexCheckChecked10" value="여자" >
  				<label for="flexCheckChecked10">
    			여성
  				</label>
				</div>
				<p style="display:none; color:red; font-size:13px;" id="error5"></p>
				<p style="color:red; font-size:13px;" id="error5">성별을 확인해주세요</p>
				</td>
				</tr>
				<!-- 라디오 버튼 끝  -->
				<tr>
				<th class="table-primary">영문 성</th>
				<td><input type="text" id="coEngFirst5"><p style="display:none; color:red; font-size:13px;" id="error5">여권상의 영문 성을 입력해주세요</p></td>
				<th class="table-primary">영문 이름</th>
				<td><input type="text" id="coEngName5"><p style="display:none; color:red; font-size:13px;" id="error5">여권상의 영문 이름을 입력해주세요</p></td>
				</tr>
				<tr>
				<th class="table-primary">휴대폰 번호</th>
				<td><input type="text" id="coPhone5"><p style="display:none; color:red; font-size:13px;" id="error5">휴대폰번호를 입력해주세요</p></td>
				<th class="table-primary">이메일</th>
				<td><input type="text" id="coEmail5"><p style="display:none; color:red; font-size:13px;" id="error5">이메일을 입력해주세요</p></td>
				</tr>
              </tbody>
            </table>
</div> 
</div>      
<div class="been">
</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

function count(type)  {
	  
	  // 현재 화면에 표시된 값
	  let number1 = document.querySelector('input#riAdultCount').value;
	  let number2 = document.querySelector('input#riKidsCount').value;
	  let number3 = document.querySelector('input#riBabyCount').value;
	  let sum1 = document.querySelector('span.giPriceAdult').innerText;
	  sum1 = sum1.replace(/,/g, "");
	  let sum2 = document.querySelector('span.giPriceKid').innerText;
	  sum2 = sum2.replace(/,/g, "");
	  let sum3 = document.querySelector('span.giPriceBaby').innerText;
	  sum3 = sum3.replace(/,/g, "");
	  
	  // 더하기/빼기
	  if(type === 'plus1' && parseInt(number1) + parseInt(number2) + parseInt(number3) <= 4) {
	    number1 = parseInt(number1) + 1;
	  }else if(type === 'minus1' && parseInt(number1) >= 2)  {
	    number1 = parseInt(number1) - 1;
	  }else if(type === 'plus2' && parseInt(number1) + parseInt(number2) + parseInt(number3) <= 4 ){
		  number2 = parseInt(number2) + 1;
	  }else if(type === 'minus2' && parseInt(number2) >= 1) {
		  number2 = parseInt(number2) - 1;
	  }else if(type === 'plus3' && parseInt(number1) + parseInt(number2) + parseInt(number3) <= 4 ) {
		  number3 = parseInt(number3) + 1;
	  }else if(type === 'minus3' && parseInt(number3) >= 1) {
		  number3 = parseInt(number3) - 1;
	  }else if(parseInt(number1) + parseInt(number2) + parseInt(number3) <= 5) {
		  alert('한 패키지당 구매 인원은 총 5명 입니다.')
	  }
	  
	  // 결과 출력
	  document.querySelector('input#riAdultCount').value = number1;
	  document.querySelector('span#riAdultCount').innerText = number1;
	  document.querySelector('input#riKidsCount').value = number2;
	  document.querySelector('span#riKidsCount').innerText = number2;
	  document.querySelector('input#riBabyCount').value = number3;
	  document.querySelector('span#riBabyCount').innerText = number3;
	  
	  price1 = number1 * sum1;
	  price2 = number2 * sum2;
	  price3 = number3 * sum3;
	  price = (price1 + price2 + price3);
	  console.log(price);
	  document.querySelector('span#riTgiPrice').innerText = price;
	  
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  document.querySelector('span#riTgiPrice').innerText = (document.querySelector('span#riTgiPrice').innerText).toString().replace(regexp, ',');
	  
	   //플러스, 마이너스 버튼 누를 때마다 인원수에 맞춰서 동행인 정보 창이 생기고 없어지게함.
		const divObjs = document.querySelectorAll('table[id]');
		for(const divObj of divObjs){
			divObj.style.display = 'none'
		}
		const count = parseInt(number1) + parseInt(number2) + parseInt(number3);
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
	  
	}

function getgoods() { //상품 정보 가져오기
	fetch('/reservation/${param.giCode}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		
		let html = '';
		html += '<tr>'
		html += '<th class="table-primary">' + '패키지명' + '</th>'
		html += '<td>' + data.giName + '</td>'
		html += '</tr>'
		html += '<th class="table-primary">' + '여행기간' + '</th>'
		html += '<td>' + data.giPeriodAbout + '<br>'
		html += data.giPeriod + '</td>'
		html += '</tr>'
		html += '<tr>'
		html += '<th class="table-primary">' + '항공편' + '</th>'
		html += '<td>'+ data.viDeparture + ' ↔ ' + data.viDestination + '<br>'
		html += '출발: ' + data.viStart + '<br>'
		html += '도착: ' + data.viArr + '</td>'
		html += '</tr>'
		document.querySelector('#tBody').innerHTML = html;
		
		document.querySelector('#giCode').value = data.giCode;
		
		document.querySelector('#giEtc').value = data.giEtc;
		
		const infos = document.querySelectorAll('span[class]');
		for(const info of infos) {
			console.log(info);
			info.innerHTML = data[info.getAttribute('class')];
			
			var regexp = /\B(?=(\d{3})+(?!\d))/g;
			var num1 = document.querySelector('span.giPriceAdult').innerHTML;
			num1 = num1.toString().replace(regexp, ',');
			document.querySelector('span.giPriceAdult').innerHTML = num1;
			
			var num2 = document.querySelector('span.giPriceKid').innerHTML;
			num2 = num2.toString().replace(regexp, ',');
			document.querySelector('span.giPriceKid').innerHTML = num2;
			
			var num3 = document.querySelector('span.giPriceBaby').innerHTML;
			num3 = num3.toString().replace(regexp, ',');
			document.querySelector('span.giPriceBaby').innerHTML = num3;
		}
	})
}

function getUserInfo() {	//예약자 정보 가져오기
	fetch('/userinfo/${userInfo.uiNum}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		document.querySelector('td[data-id=uiName]').innerHTML = data.uiName;
		document.querySelector('td[data-id=uiPhone]').innerHTML = data.uiPhone;
		document.querySelector('td[data-id=uiEmail]').innerHTML = data.uiEmail;
		document.querySelector('td[data-id=uiBirth]').innerHTML = data.uiBirth;
		document.querySelector('#uiId').value = data.uiId;
	})
}

function showInput(){  //인원수에 따라 여행자 정보 입력란 추가
	const divObjs = document.querySelectorAll('table[id]');
	for(const divObj of divObjs){
		divObj.style.display = 'none'
	}
	const count = Number(document.querySelector('span#riAdultCount').innerText)
	+ Number(document.querySelector('span#riKidsCount').innerText)
	+ Number(document.querySelector('span#riBabyCount').innerText);
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
}

function isChecked(obj){  //예약자와 동일 체크버튼 누르면 여행자1 정보입력란에 예약자정보가 자동 입력되고 disabled됨
	const dataIdObj = document.querySelectorAll('td[data-id]');
	const inputObj = document.querySelectorAll('input');
	const pObj = document.querySelectorAll('p[id=error1]');
	console.log(dataIdObj);
	console.log(inputObj);
	console.log(pObj);
   	if(obj.checked){
 		inputObj[8].value = dataIdObj[0].innerHTML;
 		inputObj[8].disabled = true
 		inputObj[9].value = dataIdObj[1].innerHTML;
 		inputObj[9].disabled = true
 		inputObj[14].value = dataIdObj[3].innerHTML;
 		inputObj[14].disabled = true
 		inputObj[15].value = dataIdObj[2].innerHTML;
 		inputObj[15].disabled = true
 		pObj[3].style.display = '';
 		pObj[4].style.display = '';
 		pObj[5].style.display = '';
	}else{
		inputObj[8].value =''
		inputObj[8].disabled = false
		inputObj[9].value = ''
		inputObj[9].disabled = false
		inputObj[14].value = ''
		inputObj[14].disabled = false
		inputObj[15].value = ''
		inputObj[15].disabled = false
		pObj[3].style.display = 'none';
		pObj[4].style.display = 'none';
		pObj[5].style.display = 'none';
	}
}


function reservation() {
	const count = Number(document.querySelector('span#riAdultCount').innerText)  //동행인수
	+ Number(document.querySelector('span#riKidsCount').innerText)
	+ Number(document.querySelector('span#riBabyCount').innerText);
	console.log(count);
	
	const pObj1 = document.querySelectorAll('p[id=error1]');  //에러메세지
	const pObj2 = document.querySelectorAll('p[id=error2]');
	const pObj3 = document.querySelectorAll('p[id=error3]');
	const pObj4 = document.querySelectorAll('p[id=error4]');
	const pObj5 = document.querySelectorAll('p[id=error5]');
	
	
	const inputObj = document.querySelectorAll('tbody#tBody_companion input');  //동행인1(예약자) 모든입력창
	const inputObj1 = document.querySelectorAll('table#companion1 input');  //동행인2 모든입력창
	const inputObj2 = document.querySelectorAll('table#companion2 input');  //동행인3 모든입력창
	const inputObj3 = document.querySelectorAll('table#companion3 input');  //동행인4 모든입력창
	const inputObj4 = document.querySelectorAll('table#companion4 input');  //동행인5 모든입력창
	
	const param = {
			coGender: document.querySelector('input.coGender:checked').value,
			coGender2: document.querySelector('input.coGender2:checked').value,
			coGender3: document.querySelector('input.coGender3:checked').value,
			coGender4: document.querySelector('input.coGender4:checked').value,
			coGender5:  document.querySelector('input.coGender5:checked').value,
			riAdultCount: document.querySelector('span#riAdultCount').innerText,
			riKidsCount: document.querySelector('span#riKidsCount').innerText,
			riBabyCount: document.querySelector('span#riBabyCount').innerText,
			riTgiPrice: parseInt((document.querySelector('span#riTgiPrice').innerText).replace(/,/g, ""))
			};
	const infos = document.querySelectorAll('td[data-id], input[id]');
	for(const info of infos) {
		param[info.getAttribute('data-id')] = info.innerHTML
		param[info.getAttribute('id')] = info.value
	}
	
	console.log(param);
	
	let price = document.querySelector('span#riTgiPrice').innerText;
	price = price.replace(/,/g, "");
	document.querySelector('span#riTgiPrice').innerText = price;

		
		if(count == 1) {
			var a = 0;
			for(i = 0; i < inputObj.length; i++) {
				if(inputObj[i].value.trim().length<1) {
					pObj1[i].style.display = '';
				}else if(inputObj[i].value.trim().length>=1) {
					pObj1[i].style.display = 'none';
					a += 1;
				}
			}
			console.log(b);
			if(a == 8) {
				if(document.querySelector('#giEtc').value == 'home') {
					fetch('/reservation/home', {
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
						}  //if문 종료
						console.log(data);
						if(data == 1) {
							alert('예약 되었습니다.');
							location.href="/views/newworld/reservationlist";
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}else if(document.querySelector('#giEtc').value == 'foreign') {
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
							location.href="/views/newworld/reservationlist";
							
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}
			}
		}else if(count == 2) {
			var a = 0;
			var b = 0;
			for(i = 0; i < inputObj1.length; i++) {
				if(inputObj[i].value.trim().length<1) {  //동행인2 입력창 비어있으면
					pObj1[i].style.display = '';  //경고메세지 띄우기
				}else if(inputObj[i].value.trim().length>=1) {  //동행인2 입력창 채워져있으면
					pObj1[i].style.display = 'none';  //경고메세지 없애기
					a += 1;
				}	
				if(inputObj1[i].value.trim().length>=1) {  //여기까지 안감?
					pObj2[i].style.display = 'none';
					b += 1;
				}else if(inputObj1[i].value.trim().length<1) {
					pObj2[i].style.display = '';
				}
			}
			if(a == 8 && b == 8) {
				if(document.querySelector('#giEtc').value = 'home') {
					fetch('/reservation/home', {
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
						}  //if문 종료
						console.log(data);
						if(data == 1) {
							alert('예약 되었습니다.');
							location.href="/views/newworld/reservationlist";
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}else if(document.querySelector('#giEtc').value == 'foreign') {
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
							location.href="/views/newworld/reservationlist";
							
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}
			}
		    
		}else if(count == 3) {
			var a = 0;
			var b = 0;
			var c = 0;
			for(i = 0; i < inputObj2.length; i++) {
				if(inputObj[i].value.trim().length<1) {  //동행인2 입력창 비어있으면
					pObj1[i].style.display = '';  //경고메세지 띄우기
				}else if(inputObj[i].value.trim().length>=1) {  //동행인2 입력창 채워져있으면
					pObj1[i].style.display = 'none';  //경고메세지 없애기
					a += 1;
				}	
				if(inputObj1[i].value.trim().length>=1) {  //여기까지 안감?
					pObj2[i].style.display = 'none';
					b += 1;
				}else if(inputObj1[i].value.trim().length<1) {
					pObj2[i].style.display = '';
				}
				if(inputObj2[i].value.trim().length>=1) {  //여기까지 안감?
					pObj3[i].style.display = 'none';
					c += 1;
				}else if(inputObj2[i].value.trim().length<1) {
					pObj3[i].style.display = '';
				}
			}
			if(a == 8 && b == 8 && c == 8) {
				if(document.querySelector('#giEtc').value = 'home') {
					fetch('/reservation/home', {
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
						}  //if문 종료
						console.log(data);
						if(data == 1) {
							alert('예약 되었습니다.');
							location.href="/views/newworld/reservationlist";
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}else if(document.querySelector('#giEtc').value == 'foreign') {
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
							location.href="/views/newworld/reservationlist";
							
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}
			}
		}else if(count == 4) {
			var a = 0;
			var b = 0;
			var c = 0;
			var d = 0;
			for(i = 0; i < inputObj3.length; i++) {
				if(inputObj[i].value.trim().length<1) {  //동행인2 입력창 비어있으면
					pObj1[i].style.display = '';  //경고메세지 띄우기
				}else if(inputObj[i].value.trim().length>=1) {  //동행인2 입력창 채워져있으면
					pObj1[i].style.display = 'none';  //경고메세지 없애기
					a += 1;
				}	
				if(inputObj1[i].value.trim().length>=1) {  //여기까지 안감?
					pObj2[i].style.display = 'none';
					b += 1;
				}else if(inputObj1[i].value.trim().length<1) {
					pObj2[i].style.display = '';
				}
				if(inputObj2[i].value.trim().length>=1) {  //여기까지 안감?
					pObj3[i].style.display = 'none';
					c += 1;
				}else if(inputObj2[i].value.trim().length<1) {
					pObj3[i].style.display = '';
				}
				if(inputObj3[i].value.trim().length>=1) {  //여기까지 안감?
					pObj4[i].style.display = 'none';
					d += 1;
				}else if(inputObj3[i].value.trim().length<1) {
					pObj4[i].style.display = '';
				}
			}
			if(a == 8 && b == 8 && c == 8 && d == 8) {
				if(document.querySelector('#giEtc').value = 'home') {
					fetch('/reservation/home', {
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
						}  //if문 종료
						console.log(data);
						if(data == 1) {
							alert('예약 되었습니다.');
							location.href="/views/newworld/reservationlist";
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}else if(document.querySelector('#giEtc').value == 'foreign') {
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
							location.href="/views/newworld/reservationlist";
							
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}
			}
				
		}else if(count == 5) {
			var a = 0;
			var b = 0;
			var c = 0;
			var d = 0;
			var e = 0;
			for(i = 0; i < inputObj4.length; i++) {
				if(inputObj[i].value.trim().length<1) {  //동행인2 입력창 비어있으면
					pObj1[i].style.display = '';  //경고메세지 띄우기
				}else if(inputObj[i].value.trim().length>=1) {  //동행인2 입력창 채워져있으면
					pObj1[i].style.display = 'none';  //경고메세지 없애기
					a += 1;
				}	
				if(inputObj1[i].value.trim().length>=1) {  //여기까지 안감?
					pObj2[i].style.display = 'none';
					b += 1;
				}else if(inputObj1[i].value.trim().length<1) {
					pObj2[i].style.display = '';
				}
				if(inputObj2[i].value.trim().length>=1) {  //여기까지 안감?
					pObj3[i].style.display = 'none';
					c += 1;
				}else if(inputObj2[i].value.trim().length<1) {
					pObj3[i].style.display = '';
				}
				if(inputObj3[i].value.trim().length>=1) {  //여기까지 안감?
					pObj4[i].style.display = 'none';
					d += 1;
				}else if(inputObj3[i].value.trim().length<1) {
					pObj4[i].style.display = '';
				}
				if(inputObj4[i].value.trim().length>=1) {  //여기까지 안감?
					pObj5[i].style.display = 'none';
					e += 1;
				}else if(inputObj4[i].value.trim().length<1) {
					pObj5[i].style.display = '';
				}
			}
			if(a == 8 && b == 8 && c == 8 && d == 8 && e == 8) {
				if(document.querySelector('#giEtc').value = 'home') {
					fetch('/reservation/home', {
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
						}  //if문 종료
						console.log(data);
						if(data == 1) {
							alert('예약 되었습니다.');
							location.href="/views/newworld/reservationlist";
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}else if(document.querySelector('#giEtc').value == 'foreign') {
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
							location.href="/views/newworld/reservationlist";
							
						}else {
							alert('구매 정원이 초과하였습니다.');
						}
					})
				}
			}
		}
	
}



window.onload = function() { 
		getUserInfo(), getgoods(), showInput();
}
</script>
</body>
</html>