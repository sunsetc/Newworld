<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<script src="https://kit.fontawesome.com/4efa714ed8.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/resources/css/packageview.css">
</head>
<body>
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 100,
  'GRAD' 200,
  'opsz' 48;
}
</style>
    
<div id="container">
<div id="cell">
<!-- 탑메뉴  -->
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
	<div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈</a>></li>
                <li><a href="/views/newworld/packagecountry">해외패키지</a>></li>
                <li><a href="/views/newworld/packageview?giCode=${param.giCode}">패키지 상세조회</a></li>
            </ul>
   </div>
    

    <!-- 패키지상세 메인 -->
<div class="resurpage">
    <h1 class="bigtitle">해외패키지</h1><br>

       <!-- 상단 좌측 패키지 정보 테이블 -->
       <div class="packinfo">
       
       <!-- 캐러셀 -->
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active" id="imageslide1">
           
          </div>
          <div class="carousel-item" id="imageslide2">
           
          </div>
          <div class="carousel-item" id="imageslide3">
            
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      
      
      
<!-- 찜목록, 리뷰 -->
	<div id="heart_review" class="collectbtn">
		<div id="heart">
			<i class="fa-regular fa-heart fa-lg" style="color:red; cursor:pointer;" onclick="toggleHeart('${param.giCode}',this)">
			<span style="color: black; font-size: 15px; cursor: pointer;">찜하기</span>
			</i>
		</div>
		<span class="material-symbols-outlined">rate_review</span><spna class="reviewCount"></spna>
	</div>
		
		
		
<!-- 상단 우측 패키지 정보 테이블-->
	        <table class="table table-borderless w-50" id="packtable">
	            <thead>
	                <tr>
	                  <th scope="col"></th>
	                </tr>
	              </thead>
	              <tbody id="tBody">
	              </tbody>
		</table>
	</div>


<!-- 오른쪽 인원선택 창 -->
<div class="rightmenu">
<div class="resurchoice">
	<div class="resurtext">
		<p style="font-size:20px"><b>인원선택</b></p>
		<br>
		<p>성인<br>
			<span style="font-weight: bold;"  id="giPriceAdult"></span>원</p>
            	<br>
            <p>아동<br>
            <span style="font-weight: bold;"  id="giPriceKid"></span>원</p>
            	<br>
            <p>유아<br>
            <span style="font-weight: bold;"  id="giPriceBaby"></span>원</p>
		<div class="peoplenumber">
			<div class="btngroup">
            	<button onclick="count('minus1')"><img src="/resources/images/icon/minus.png" width="24px"></button>
 					<input type=text id="riAdultCount" class="num_sum" maxlength='2' style="text-indent:3px">
 				<button onclick="count('plus1')"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
			</div>
 				
			<div class="btngroup">
				<button onclick="count('minus2')"><img src="/resources/images/icon/minus.png" width="24px"></button>
					<input type=text id="riKidsCount" class="num_sum" maxlength='2' style="text-indent:3px">
				<button onclick="count('plus2')"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
			</div>
 				
			<div class="btngroup">
				<button onclick="count('minus3')"><img src="/resources/images/icon/minus.png" width="24px"></button>
					<input type=text id="riBabyCount" class="num_sum" maxlength='2' style="text-indent:3px">
				<button onclick="count('plus3')"><img src="/resources/images/icon/plus.png" width="24px"></button><br>
			</div>
		</div>
<!-- 총금액 버튼 -->
		<div class="summoney">
		<p class="summoneytext">
		<b>총금액</b></p><br><p style="text-align: right; font-size:30px; color:#3162C7" ><span style="font-weight: bold;"  id="riTgiPrice"></span>원</p>
		<center><button class="resurbtn" style="width:250px; height: 50px;" onclick="foreignReserv()">예약하기</button></center> 
		</div>
</div>
</div>	
</div>
<!-- 왼쪽 본문1 -->
<div class="tourinfo">
            <p style="font-size: 24px; font-weight: bold;">여행 주요일정</p>
            <dl>
            <dt>일정</dt>
            <dd>
            	<p><span id="giPeriod"></span> &nbsp;&nbsp;&nbsp;&nbsp;<span id="viName"></span><br>
            	출발: &nbsp;<span id="viStart"></span> &nbsp;/&nbsp;도착: &nbsp;<span id="viArr"></span></p>
            </dd>
            <dt>여행도시</dt>
            <dd>
            	<p><span id="viDeparture"></span> - <span id="viDestination"></span></p>
            </dd>
            <dt>예약현황</dt>
            <dd>
            	<p>정원: <span id="giMax"></span> 잔여: <span class="restSeat"></span></p>
            </dd>
            </dl>
</div>         
<!-- 테이블 -->
<div class="bumtable">
	<p style="font-size: 20px; font-weight: bold;">상품가격</p>
	<table class="table table-border w-100">
	<thead class="table-primary">
		<tr style="font-weight: bold; text-align: center; line-height: 60px;">
			<td>구분</td><td>성인</td><td>아동</td><td>유아</td>
		</tr>
	</thead>
	<tbody style="text-align: center; line-height: 60px;" id="tBody2">
<!-- 스크립트 확인 -->
	</tbody>
	</table>
</div>
            
            
<!-- 상세화면 사진 -->
<div class="viewphoto">

</div>
            
<!-- 아코디언 리뷰 -->
<div class="accordion accordion-flush" id="accordionFlushExample">
	<div class="accordion-item">
    <h2 class="accordion-header" id="flush-headingOne">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
       <a>리뷰<a></a><span class="allReview"></span>
      </button>
    </h2>
    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne">
     <div class="accordion-body">
		<!-- 테이블  -->
		<table class="table table-borderless w-100">
		<tbody style="text-align: left; font-size:14px;" id="tBody_Review">
			<!-- 스크립트 -->
		</tbody>
	</table>
	
	<nav aria-label="Page navigation example" id="pagenev">
	
  	<ul class="pagination">
      <!-- 스크립트 -->
    </ul>
	</nav>
	</div>
    </div>
  </div>
</div>         
</div>        


</div>
<!-- 푸터 -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
</div>
<script>

let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 5; //페이징에 나타낼 페이지 수
let globalCurrentPage = 1; //현재 페이지
let dataList; //표시하려하는 데이터 리스트

$(document).ready(function () {
	//dataPerPage 선택값 가져오기
	dataPerPage = 5;

	$.ajax({ // ajax로 데이터 가져오기
	method: "GET",
	url: "/get-review/${param.giCode}",
	dataType: "json",
	success: function (d) {
	
	dataList=d; //dataList에 결과 담음
	
	//totalData(총 데이터 수) 구하기
	totalData = d.length;
	
	//글 목록 표시 호출 (테이블 생성)
	displayData(1, dataPerPage);

	//페이징 표시 호출
	paging(totalData, dataPerPage, pageCount, 1); 

	}
  });
});


	//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	function displayData(currentPage, dataPerPage) {


		let html = "";
	
		//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림..
		currentPage = Number(currentPage);
		dataPerPage = Number(dataPerPage);
	
		let maxpnum=(currentPage - 1) * dataPerPage + dataPerPage; 
		if(maxpnum>totalData){maxpnum=totalData;} 
	
		for (
		var i = (currentPage - 1) * dataPerPage;
		i < maxpnum; //수정
		i++
		) {
	
			html += '<tr>'
				if(dataList[i].brStar === 1) {
					html += '<td>' + '<img src="/resources/images/icon/star1.png" alt="" width="100px">' + '</td></tr>'
				}else if(dataList[i].brStar === 2) {
					html += '<td>' + '<img src="/resources/images/icon/star2.png" alt="" width="100px">' + '</td></tr>'
				}else if(dataList[i].brStar === 3) {
					html += '<td>' + '<img src="/resources/images/icon/star3.png" alt="" width="100px">' + '</td></tr>'
				}else if(dataList[i].brStar === 4) {
					html += '<td>' + '<img src="/resources/images/icon/star4.png" alt="" width="100px">' + '</td></tr>'
				}else if(dataList[i].brStar === 5) {
					html += '<td>' + '<img src="/resources/images/icon/star5.png" alt="" width="100px">' + '</td></tr>'
				}
				if(dataList[i].uiName.length < 3) {
					let maskingName = dataList[i].uiName.replace(/(?<=.{1})./gi, "*");
					html += '<tr><td style="color:gray;">' + maskingName + '&nbsp;&nbsp;&nbsp;&nbsp;' + dataList[i].brData + '</td></tr>'
				}else {
					maskingName = dataList[i].uiName.replace(/(?<=.{2})./gi, "*");
					html += '<tr><td style="color:gray;">' + maskingName + '&nbsp;&nbsp;&nbsp;&nbsp;' + dataList[i].brData + '</td></tr>'
				}
				html += '<tr><td style="color:gray;">' + dataList[i].giName + '</td></tr>'
				html += '<tr><td>' + dataList[i].brContent + '</td></tr>'
				html+= '<hr>'
				html += '<tr></tr>'
		} 
		$("#tBody_Review").html(html);
	}
	
	function paging(totalData, dataPerPage, pageCount, currentPage) {
		  console.log("currentPage : " + currentPage);

		  totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
		  
		  if(totalPage<pageCount){
		    pageCount=totalPage;
		  }
		  
		  let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
		  let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
		  
		  console.log("pagGroup=" + pageGroup);
		  console.log("totalPage=" + totalPage);
		  
		  if (last > totalPage) {
		    last = totalPage;
		  }

		  let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
		  let next = last + 1;
		  let prev = first - 1;
		  console.log("pageCount=" + pageCount);
		  console.log("first=" + first);
		  console.log("last=" + last);
		  
		  let pageHtml = "";
		  console.log("prev=" + prev);
		  console.log("next=" + next);
		  
		    pageHtml += "<li class='page-item'>";
		    pageHtml += "<a class='page-link' id='prev' aria-label='Previous'>";
	        pageHtml += "<span aria-hidden='true'>&laquo;</span>";
	      	pageHtml += "</a></li>";
		  

		 //페이징 번호 표시 
		  for (var i = first; i <= last; i++) {
		    if (currentPage == i) {
		      pageHtml +=
		        "<li class='page-item'><a class='page-link'>" + i + "</a></li>";
		    } else {
		      pageHtml += "<li class='page-item'><a class='page-link'>" + i + "</a></li>";
		    }
		  }

		  
		    pageHtml += "<li class='page-item'>"
		    pageHtml += "<a class='page-link' id='next' aria-label='Next'>"
	        pageHtml += "<span aria-hidden='true'>&raquo;</span>"
	        pageHtml += "</a></li>"
		  

		  $(".pagination").html(pageHtml);
		  let displayCount = "";
		  displayCount = "전체 " + totalData + "건";
		  $(".allReview").html(displayCount); //전체 건수
		  
		  let reviewCount = "";
		  reviewCount = totalData
		  $(".reviewCount").html(reviewCount); //리뷰 아이콘


		  //페이징 번호 클릭 이벤트 
		  $(".pagination li a").click(function () {
		    let $id = $(this).attr("id");
		    selectedPage = $(this).text();
		    console.log("selectedPage=" + selectedPage);

		    if ($id == "next") {
		    	 console.log("selectedPage2=" + selectedPage);
		    	 console.log("totalPage2=" + totalPage);
		    	if((next - 1) === totalPage) {
		    		selectedPage = totalPage;
		    	}else {
		    		selectedPage = next;
		    	}
		    }
		    if ($id == "prev") {
		    	if(prev > 0) {
		    		selectedPage = prev;	
		    	}else if(prev == 0) {
		    		selectedPage = 1;
		    	}
		    	
		    }
		    
		    //전역변수에 선택한 페이지 번호를 담는다...
		    globalCurrentPage = selectedPage;
		    //페이징 표시 재호출
		    paging(totalData, dataPerPage, pageCount, selectedPage);
		    //글 목록 표시 재호출
		    displayData(selectedPage, dataPerPage);
		  });
		}


function hasLike(){
    fetch('/hasLikeCheck/${param.giCode}')
    .then(function(res) {
    	return res.text();
    })
    .then(function(data) {
    	console.log(data);
        if(data){
            document.getElementById("heart").innerHTML = "<i class='fa-solid fa-heart fa-lg' style='color:red; cursor:pointer;' onclick='toggleHeart(\"${param.giCode}\", this)'>" +
                "<span style='color: black; font-size: 15px; cursor: pointer;'>찜하기</span></i>";
        }else if(!data){
            document.getElementById("heart").innerHTML = "<i class='fa-regular fa-heart fa-lg' style='color:red; cursor:pointer;' onclick='toggleHeart(\"${param.giCode}\", this)'>" +
                "<span style='color: black; font-size: 15px; cursor: pointer;'>찜하기</span></i>";
        }
    })
}


function toggleHeart(giCode, obj) {
	  if('${empty userInfo}' === 'true') {
		  let confirmResult = confirm("찜하기는 회원만 가능합니다");
		  location.href="/views/newworld/login";
	  }else {
		  let val = (obj.classList.contains('fa-regular')) ? 'fa-solid' : 'fa-regular';
		  obj.classList.remove('fa-regular');
		  obj.classList.remove('fa-solid');
		  obj.classList.add(val);
		  let uiId = '${userInfo.uiId}'
		  let giCode = '${param.giCode}'
		  const param = {
				  isLiked:true,
		       	  giCode : giCode 	
		  }
		  
		  if (val === 'fa-solid') {
		    let confirmResult = confirm("정말 찜하겠습니까?");
		    if (confirmResult === true) {
		      fetch('/likeCheck', {
		        method: 'POST',
		        headers: {'Content-Type' : 'application/json'},
		        body: JSON.stringify(param)
		        
		      })
		        .then((response) => {
		          console.log('Like checked successfully');
		        })
		        .catch((error) => {
		          console.error('Error:', error);
		        });
		    } else {
		      toggleHeart(obj);
		    }
		  } else {
			  let confirmResult = confirm("정말 찜 목록에서 제외하시겠습니까?");
			
			  if(confirmResult === true){
				  fetch('/offLikeCheck/${userInfo.uiId}/${param.giCode}', 
						  {
				      method: 'DELETE'
						  })
				      .then((response) => {
				        console.log('찜하기 해제되었습니다');
				      })
				      .catch((error) => {
				        console.error('Error:', error);
				      }); 
			  }
		  }
	  }

}

function foreignReserv() {
	location.href='/views/newworld/reservationapply?giCode=${param.giCode}&riAdultCount=' + document.querySelector('#riAdultCount').value +
	'&riKidsCount=' + document.querySelector('#riKidsCount').value +
	'&riBabyCount=' + document.querySelector('#riBabyCount').value + 
	'&riTgiPrice=' + document.querySelector('span#riTgiPrice').innerHTML;
}

function rest() {
	fetch('/rest/${param.giCode}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data.rest);
  		document.querySelector('span.restSeat').innerHTML = data.rest;
	})
}

function getGoodsInfos() {
	fetch('/getGoods/${param.giCode}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		if(data.giEtc == 'home') {
			document.querySelector('h1.bigtitle').innerHTML = '국내패키지';
		}
		var num1 = data.giPriceAdult;
		var num2 = data.giPriceKid;
		var num3 = data.giPriceBaby;
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		num1 = num1.toString().replace(regexp, ',');
		num2 = num2.toString().replace(regexp, ',');
		num3 = num3.toString().replace(regexp, ',');
		let html = '';
		html += '<tr><td style="font-size:30px"><b>' + data.giName + '</b></td></tr>';
		html += '<tr><td>' + data.giHashtag + '</td></tr>';
		html += '<tr><td>' + '기간: ' + data.giPeriodAbout + '</td></tr>';
		html += '<tr><td>' + data.giPeriod + '</td></tr>';
		html += '<tr><td>' + '정원: ' + data.giMax + '</td></tr>';
 		html += '<tr style="text-align: right;"><td style="font-size: 13px">' + '성인1인기준' + '</td></tr>';
		html += '<tr style="text-align: right;"><td style="font-size: 30px"><b>' + num1 + '원' + '</b></td></tr>';
		document.querySelector('#tBody').innerHTML = html;
		
		
		/* 이미지 슬라이드 */
		let slide1 = '';
		slide1 += '<img src="'+ data.giImage1 + '"class="d-block w-100" alt="">';
		document.querySelector('div#imageslide1').innerHTML = slide1;
		
		let slide2 = '';
		slide2 += '<img src="'+ data.giImage2 + '"class="d-block w-100" alt="">';
		document.querySelector('div#imageslide2').innerHTML = slide2;
		
		let slide3 = '';
		slide3 += '<img src="'+ data.giImage3 + '"class="d-block w-100" alt="">';
		document.querySelector('div#imageslide3').innerHTML = slide3;
		
		
		/* 상세페이지 사진 */
		let adpoto = '';
		adpoto  += '<img src="'+ data.giImage4 + '" style="width:800px; margin-left:20px;"\'">';
		document.querySelector('div.viewphoto').innerHTML = adpoto;
		
		let body = '';
		body += '<tr>'
		body += '<td>' + '기본상품' + '</td>'
		body += '<td style="font-size: 24px; font-weight: bold;">' + num1 + '원' + '</td>'
		body += '<td style="font-size: 24px; font-weight: bold;">' + num2 + '원' + '</td>'
		body += '<td style="font-size: 24px; font-weight: bold;">' + num3 + '원' + '</td>'
		body += '</tr>'
		document.querySelector('#tBody2').innerHTML = body;
		const infos = document.querySelectorAll('span[id]');
		for(const info of infos) {
			info.innerHTML = data[info.getAttribute('id')];
			
			var num4 = document.querySelector('span#giPriceAdult').innerHTML;
			num4 = num4.toString().replace(regexp, ',');
			document.querySelector('span#giPriceAdult').innerHTML = num4;
			var num5 = document.querySelector('span#giPriceKid').innerHTML;
			num5 = num5.toString().replace(regexp, ',');
			document.querySelector('span#giPriceKid').innerHTML = num5;
			var num6 = document.querySelector('span#giPriceBaby').innerHTML;
			num6 = num6.toString().replace(regexp, ',');
			document.querySelector('span#giPriceBaby').innerHTML = num6;
			
			document.querySelector('span#riTgiPrice').innerHTML = document.querySelector('span#giPriceAdult').innerHTML;
			document.querySelector('#riAdultCount').value = 1;
			document.querySelector('#riKidsCount').value = 0;
			document.querySelector('#riBabyCount').value = 0;
		}
		
	})
}

window.onload = function() {
	getGoodsInfos(), rest(), hasLike();
}



function count(type)  {
	  
	  // 현재 화면에 표시된 값
	  let number1 = document.querySelector('#riAdultCount').value;
	  let number2 = document.querySelector('#riKidsCount').value;
	  let number3 = document.querySelector('#riBabyCount').value;
	  let sum1 = document.querySelector('span#giPriceAdult').innerText;
	  sum1 = sum1.replace(/,/g, "");
	  let sum2 = document.querySelector('span#giPriceKid').innerText;
	  sum2 = sum2.replace(/,/g, "");
	  let sum3 = document.querySelector('span#giPriceBaby').innerText;
	  sum3 = sum3.replace(/,/g, "");
	  let price;
	  let price1;
	  let price2;
	  let price3;
	  
	  // 더하기/빼기
	  if(type === 'plus1' && parseInt(number1) + parseInt(number2) + parseInt(number3) <= 4  ) {
	    number1 = parseInt(number1) + 1;
	    
	  }else if(type === 'minus1'&& parseInt(number1) >= 2)  {
	    number1 = parseInt(number1) - 1;
	  }else if(type === 'plus2' && parseInt(number1) + parseInt(number2) + parseInt(number3) <= 4  ){
		  number2 = parseInt(number2) + 1;
	  }else if(type === 'minus2'&& parseInt(number2) >= 1) {
		  number2 = parseInt(number2) - 1;
	  }else if(type === 'plus3' && parseInt(number1) + parseInt(number2) + parseInt(number3) <= 4  ) {
		  number3 = parseInt(number3) + 1;
	  }else if(type === 'minus3'&& parseInt(number3) >= 1) {
		  number3 = parseInt(number3) - 1;
	  }else if(parseInt(number1) + parseInt(number2) + parseInt(number3) <= 5 ) {
		  alert('한 패키지당 구매 인원은 총 5명 입니다.')
	  }
	  
	  // 결과 출력
	  document.querySelector('#riAdultCount').value = number1;
	  document.querySelector('#riKidsCount').value = number2;
	  document.querySelector('#riBabyCount').value = number3;
	  
	  price1 = number1 * sum1;
	  price2 = number2 * sum2;
	  price3 = number3 * sum3;
	  price = (price1 + price2 + price3);
	  console.log(price);
	  document.querySelector('span#riTgiPrice').innerText = price;
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  document.querySelector('span#riTgiPrice').innerText = (document.querySelector('span#riTgiPrice').innerText).toString().replace(regexp, ',');
	}
</script>
</body>
</html>