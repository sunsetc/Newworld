<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
<link rel="stylesheet" href="/resources/css/reviewview_list.css">
</head>
<body>
	<div id="container">
		<div id="cell">
			<%@ include file="/WEB-INF/views/common/topmenu.jsp"%>

			<div class="page1">
				<!-- 바로가기 -->
				<div class="smallnav">
					<ul>
						<li><a href="/views/newworld/main">홈</a>></li>
						<li><a href="/views/newworld/reviewview_list">나의 리뷰보기</a></li>
					</ul>
				</div>


				<!-- 마이페이지 사이드메뉴 -->
				<%@ include file="/WEB-INF/views/common/mymenu.jsp"%>



				<!-- 리뷰보기 메인 -->
				<div class="packagepage">
					<h1 class="bigtitle">나의 리뷰보기</h1>
					<br>

					<!-- 테이블  -->
					<table class="table table-borderless w-100">

						<tbody style="text-align: left; font-size: 14px; cursor: pointer;" id="tBody2" onclick="window.open('/views/newworld/reviewdelete','', 'left='+ popupX + ', top='+ popupY + ' width=450, height=500, status=no')"></tbody>
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
			<%@ include file="/WEB-INF/views/common/footer.jsp"%>
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
	url: "/review-list/${userInfo.uiId}",
	dataType: "json",
	success: function (d) {
		
	console.log(d);
	
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

	console.log("data=", dataList.length);
	if(dataList.length > 0) {
		for (
		var i = (currentPage - 1) * dataPerPage;
		i < maxpnum; //수정
		i++
		) {
			html += '<tbody style="text-align: left; font-size: 14px; cursor: pointer;" id="tBody2" onclick="window.open(\'/views/newworld/reviewdelete?brNum=' + dataList[i].brNum + '\', \'\', \'status=no,  width=450, height=500, left=\'+ popupX + \', top=\'+ popupY)">'
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
			html += '<tr><td style="color:gray;" data-col="riCode">' + dataList[i].riCode + '</td></tr>'
			   
			if(dataList[i].uiName.length < 3) {
				let maskingName = dataList[i].uiName.replace(/(?<=.{1})./gi, "*");
				html += '<tr><td style="color:gray;">' + maskingName + '&nbsp;&nbsp;&nbsp;&nbsp;' + dataList[i].brData + '</td></tr>'
			}else {
				maskingName = dataList[i].uiName.replace(/(?<=.{2})./gi, "*");
				html += '<tr><td style="color:gray;">' + maskingName + '&nbsp;&nbsp;&nbsp;&nbsp;' + dataList[i].brData + '</td></tr>'
			}
			html += '<tr><td style="color:gray;">' + dataList[i].giName + '</td></tr>'
			html += '<tr><td>' + dataList[i].brContent + '</td></tr>'
			html += '<hr>'
			html += '<tr></tr>'
			html += '</tbody>'
		} 
		$(".w-100").html(html);
	}else if(dataList.length == 0) {
			html += '<tbody  style="text-align: left; font-size: 14px; cursor: pointer;" id="tBody2">'
			html += '<tr>'
			html += '<td style="color: gray; text-align: center;">' + '작성한 리뷰가 없습니다.' + '</td>'
			html += '</tr>'
			html += '<tr><td><button class="resurbtn" onclick="location.href=\'/views/newworld/reviewinsert_list\'">작성 가능한 리뷰 보기</button></td></tr>'
			html += '</tbody>'
		$(".w-100").html(html);
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
	  
      const reviews = document.querySelector('.w-100').innerText;
        if(reviews == '작성한 리뷰가 없습니다.\n\n작성 가능한 리뷰 보기'){
        	$(".pagination").html = '';
        }else{
        	$(".pagination").html(pageHtml);
        }
	


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


function removeReview() {
	let check = confirm('정말 삭제하시겠습니까?');
	if(check == true) {
		fetch('/review-remove/${userInfo.uiId}/' + document.querySelector('td[data-col=riCode]').innerText, {
			method: 'DELETE'
		})
		.then(function(data) {
				console.log('리뷰 삭제 완료!');
				const param  = {
						riCode: document.querySelector('td[data-col=riCode]').innerText,
						uiId: '${userInfo.uiId}'
				}
				fetch('/review-remove-update/${userInfo.uiId}/' + document.querySelector('td[data-col=riCode]').innerText, {
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
					if(data == 1) {
						console.log('리뷰 삭제 업데이트까지 완료!');
						alert('리뷰 삭제가 되었습니다.');
						location.href = '/views/newworld/reviewview_list';
					}
				})
			
		})
	}else if(check == false) {
		alert('삭제가 취소되었습니다.');
	}
}


/* 수정버튼 없앰
<button class="updatebtn" onclick="window.open(\'/views/newworld/reviewupdate\', \'\', \'status=no,  width=450, height=500, left=\'+ popupX + \', top=\'+ popupY)">수정</button>*/
var popupX = (document.body.offsetWidth / 2) - (450 / 2);
var popupY= (window.screen.height / 2) - (500 / 2); 
</script>
</body>
</html>