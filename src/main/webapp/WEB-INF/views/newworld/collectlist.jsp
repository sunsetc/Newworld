<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/collectlist.css">
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
			<li><a href="/views/newworld/collectlist">찜목록</a></li>
		</ul>
	</div>
        
        
<!-- 마이페이지 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/mymenu.jsp" %>
	
	
	
    <!-- 찜목록 메인 -->
<div class="packagepage">
    <h1 class="bigtitle">찜목록</h1><br>

    <!-- 부트스트랩 -->
   <p class="sammllqna"></p>
        <table class="table table-borderless">
            <thead>
                <tr>
                  <th scope="col" style="width:350px"></th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody id="tBody">
              </tbody>
            </table>
            <nav aria-label="Page navigation example" id="pagenev">
	<span class="allReview"></span>
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
	dataPerPage = 6;

	$.ajax({ // ajax로 데이터 가져오기
	method: "GET",
	url: "/likelist/${userInfo.uiId}",
	dataType: "json",
	success: function (d) {
	
	console.log(d);
		
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

function displayData(currentPage, dataPerPage) {


	let html = "";

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림..
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);

	let maxpnum=(currentPage - 1) * dataPerPage + dataPerPage; 
	if(maxpnum>totalData){maxpnum=totalData;} 

	const infos = document.querySelectorAll('th[data-col]');
	
	for (
	var i = (currentPage - 1) * dataPerPage;
	i < maxpnum; //수정
	i++
	) {

		num = dataList[i].giPriceAdult;
		var regexp = /\B(?=(\d{3})+(?!\d))/g;
		num = num.toString().replace(regexp, ',');
		html += '<tr>';
		html += '<th scope="row" rowspan="6">' + '<a href="#">' + '<img src="' + dataList[i].giImage1 + '"width="300px" onclick="location.href=\'/views/newworld/packageview?giCode=' + dataList[i].giCode + '\'">' + '</a>' + '</th>';
		html += '<tr onclick="location.href=\'/views/newworld/packageview?giCode=' + dataList[i].giCode + '\'">' + '<td style="font-size:26px; font-weight:bold;">' + '<a href="#">' + dataList[i].giName + '</td>' + '</tr>';
		html += '<tr>' + '<td>' + dataList[i].giHashtag + '</td>' + '</tr>';
		html += '<tr>' + '<td>' + '기간: ' + dataList[i].giPeriodAbout + '</td></tr>';
		html += '<tr>' + '<td>' + dataList[i].giPeriod + '</td></tr>';
		html += '<tr style="text-align: right;">' + '<td onclick="location.href=\'/views/newworld/packageview?giCode=' + dataList[i].giCode + '\'">' + '<a href="#"  style="font-size:26px; font-weight:bold; color:#4374D9">' + num + '원' + '</a>' + '</td>';
		for(const info of infos) {
			html += '<td>' + dataList[i][info.getAttribute('data-col')] + '</td>';
		}
		html += '</tr>';
	} 
	$("#tBody").html(html);
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
	    pageHtml += "<a class='page-link' href='#' id='prev' aria-label='Previous'>";
      pageHtml += "<span aria-hidden='true'>&laquo;</span>";
    	pageHtml += "</a></li>";
	  

	 //페이징 번호 표시 
	  for (var i = first; i <= last; i++) {
	    if (currentPage == i) {
	      pageHtml +=
	        "<li class='page-item'><a class='page-link' href='#'>" + i + "</a></li>";
	    } else {
	      pageHtml += "<li class='page-item'><a class='page-link' href='#'>" + i + "</a></li>";
	    }
	  }

	  
	    pageHtml += "<li class='page-item'>"
	    pageHtml += "<a class='page-link' href='#' id='next' aria-label='Next'>"
      pageHtml += "<span aria-hidden='true'>&raquo;</span>"
      pageHtml += "</a></li>"
	  

	  $(".pagination").html(pageHtml);


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


</script>
</body>
</html>