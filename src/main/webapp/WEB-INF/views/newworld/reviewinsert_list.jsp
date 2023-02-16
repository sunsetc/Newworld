<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/reviewinsert_list.css">
</head>
<body>
<div id="container">
<div id="cell">
<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">

	<!-- 바로가기 -->
	<div class="smallnav">
		<ul>
			<li><a href="/views/newworld/main">홈</a>></li>
			<li><a href="/views/newworld/mypage">마이페이지</a>></li>
			<li><a href="/views/newworld/reviewinsert_list">작성가능한 리뷰내역</a></li>
		</ul>
	</div>
        
        
<!-- 마이페이지 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>
	
	
	
    <!-- 리뷰내역 메인 -->
<div class="packagepage">
    <h1 class="bigtitle">작성가능한 리뷰내역</h1><br>
    <span class="allReview"></span> <!-- 전체 건수 -->

    <!-- 테이블 -->
   <table class="table table-borderless">
		<tbody id="tBody">
		</tbody>
	</table>
	
	<nav aria-label="Page navigation example" id="pagenev">
					
				  	<ul class="pagination">
				      <!-- 스크립트 -->
				    </ul>
					</nav>
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
	url: "/review-possible/${userInfo.uiId}",
	dataType: "json",
	success: function (d) {
	
	dataList=d; //dataList에 결과 담음
	
	//totalData(총 데이터 수) 구하기
	totalData = d.length;
	console.log(totalData);
	
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

	if(dataList.length > 0) {
		for (
				var i = (currentPage - 1) * dataPerPage;
				i < maxpnum; //수정
				i++
				) {
					const infos = document.querySelectorAll('th[data-col]')
					
							const reviews = dataList[i];
							num = reviews.giPriceAdult;
							var regexp = /\B(?=(\d{3})+(?!\d))/g;
							num = num.toString().replace(regexp, ',');
							console.log(num);
							html += '<tr>' + '<td rowspan="4" style="width:300px;">' + '<a href="#">' + '<img src="' + reviews.giImage1 + '"width="300px" onclick="location.href=\'/views/newworld/packageview?giCode=' + reviews.giCode + '\'">' + '</a>' + '</td>';
							html += '<td onclick="location.href=\'/views/newworld/packageview?giCode=' + reviews.giCode + '\'" style="font-size:24px; font-weight:bold;">' + '<a href="#">' + reviews.giName + '</td>';
							html +=	'<td rowspan="4" style="width:100px;">' + '<button class="reviewbtn" onclick="window.open(\'/views/newworld/reviewinsert?giCode=' + reviews.giCode + '\', \'\', \'status=no,  width=450, height=500, left=\'+ popupX + \', top=\'+ popupY)">리뷰쓰기</button>' + '</td>' +'</tr>';
							html += '<tr>' + '<td>' + reviews.giHashtag + '</td>' + '</tr>';
							html += '<tr>' + '<td>' + '기간: ' + reviews.giPeriodAbout + '</td></tr>';
							html += '<tr>' + '<td>' + reviews.giPeriod + '</td></tr>';
							for(const info of infos) {
								html += '<td>' + reviews[info.getAttribute('data-col')] + '</td>';
							};
						$("#tBody").html(html);
				}
	}else if(dataList.length === 0) {
		html += '<tr>'
			html += '<td style="color: gray; text-align: center;">' + '작성 가능한 리뷰가 없습니다.' + '</td>'
			html += '</tr>'
			html += '<tr><td><button class="resurbtn" onclick="location.href=\'/views/newworld/packagecountry\'">예약하러 가기</button></td></tr>'
			$("#tBody").html(html);
	}

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
	        
	        const reviews = document.querySelector('#tBody').innerText;
	        if(reviews == '작성 가능한 리뷰가 없습니다.\n\n예약하러 가기'){
	        	$(".pagination").html = '';
	        }else{
	          $(".pagination").html(pageHtml);
	  		  let displayCount = "";
	  		  displayCount = "전체 " + totalData + "건";
	  		  $(".allReview").html(displayCount); //전체 건수
	        }
		  

		  
		  
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


/* function ReviewPossible() {
	const infos = document.querySelectorAll('th[data-col]');
	fetch('/review-possible/${userInfo.uiId}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		console.log(data.length);
		if(data.length > 0) {
			let html = '';
			for(let i = 0; i < data.length; i++) {
				const reviews = data[i];
				num = reviews.giPriceAdult;
				var regexp = /\B(?=(\d{3})+(?!\d))/g;
				num = num.toString().replace(regexp, ',');
				console.log(num);
				html += '<tr>' + '<td rowspan="4" style="width:300px;">' + '<a href="#">' + '<img src="' + reviews.giImage1 + '"width="300px" onclick="location.href=\'/views/newworld/packageview?giCode=' + reviews.giCode + '\'">' + '</a>' + '</td>';
				html += '<td onclick="location.href=\'/views/newworld/packageview?giCode=' + reviews.giCode + '\'" style="font-size:24px; font-weight:bold;">' + '<a href="#">' + reviews.giName + '</td>';
				html +=	'<td rowspan="4" style="width:100px;">' + '<button class="reviewbtn" onclick="window.open(\'/views/newworld/reviewinsert?giCode=' + reviews.giCode + '\', \'\', \'status=no,  width=450, height=500, left=\'+ popupX + \', top=\'+ popupY)">리뷰쓰기</button>' + '</td>' +'</tr>';
				html += '<tr>' + '<td>' + reviews.giHashtag + '</td>' + '</tr>';
				html += '<tr>' + '<td>' + '기간: ' + reviews.giPeriodAbout + '</td></tr>';
				html += '<tr>' + '<td>' + reviews.giPeriod + '</td></tr>';
				for(const info of infos) {
					html += '<td>' + reviews[info.getAttribute('data-col')] + '</td>';
				};
			}
			document.querySelector('#tBody').innerHTML = html;
		}else if(data.length == 0) {
			let html = '';
			html += '<tr>'
			html += '<td style="color: gray; text-align: center;">' + '작성 가능한 리뷰가 없습니다.' + '</td>'
			html += '</tr>'
			html += '<tr><td><button class="resurbtn" onclick="location.href=\'/views/newworld/packagecountry\'">예약하러 가기</button></td></tr>'
			document.querySelector('#tBody').innerHTML = html;
		}
	})
}

window.onload = function() {
	ReviewPossible(); 
} */

var popupX = (document.body.offsetWidth / 2) - (450 / 2);
var popupY= (window.screen.height / 2) - (500 / 2);
</script>
</body>
</html>