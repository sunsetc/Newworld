<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link rel="stylesheet" href="/resources/css/qnalist.css">
</head>
<body>

<div id="container">
<div id="cell">

<%@ include file="/WEB-INF/views/common/topmenu.jsp" %>

<div class="page1">
        <!-- 작은글씨 바로가기 -->
        <div class="smallnav">
            <ul>
                <li><a href="/views/newworld/main">홈</a>></li>
                <li><a href="/views/newworld/custommer_center">고객센터</a>></li>
                <li><a href="/views/newworld/boardqnacheck">1:1문의게시판</a>></li>
                <li><a href="/views/newworld/boardqnalist">1:1문의내역</a></li>
            </ul>
        </div>  
        
        
<!-- 고객센터 사이드메뉴 -->
	<%@ include file="/WEB-INF/views/common/custommermenu.jsp" %>
    

    <!-- 공지사항 메인 -->
<div class="notepage">
    <h1 class="bigtitle">1:1문의 내역</h1><br>
    <center>
    <select class="qnaok">
        <option value="check" selected>답변여부 선택</option>
        <option value="0">미확인</option>
        <option value="1">답변완료</option>
    </select>
    <select class="qnatitle">
        <option value="allcheck" selected>전체</option>
        <option value="bqTitle">제목</option>
        <option value="bqContent">내용</option>
    </select>
    <input type="search" maxlength='20' class="qnasearch" name="qnaSearch" placeholder="검색어를 입력해주세요."  onkeyup="enterKey2()" style="text-indent:10px">
    <button class="qnabtn" onclick="getBoardQna()">검색</button>
    </center>


    <!-- 부트스트랩 -->

    <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">등록일</th>
          </tr>
        </thead>
		 <c:if test="${userInfo.uiNum eq null}">
		<tr>
        <td colspan=4>로그인을 해주세요.</td>
        </tr>
        </c:if>
        <c:if test="${userInfo.uiNum ne null}">
        <tbody id="tBody">
        </tbody>
        </c:if>
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
function enterKey2() {
	if(window.event.keyCode == 13) {
		getBoardQna();
	}
}


let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 5; //페이징에 나타낼 페이지 수
let globalCurrentPage = 1; //현재 페이지
let dataList; //표시하려하는 데이터 리스트
$(document).ready(function() {
		
	getBoardQna();
		
});

		function getBoardQna(){
			//dataPerPage 선택값 가져오기
			dataPerPage = 5;
			let url;
			const qnaok = document.querySelector('select.qnaok');
			const qnaokSel = qnaok.options[qnaok.selectedIndex].value;
			const qnatitle = document.querySelector('select.qnatitle');
			const qnatitleSel = qnatitle.options[qnatitle.selectedIndex].value;
			
				switch(qnaokSel){
				case 'check' :
					{
						switch(qnatitleSel){
						case 'allcheck':
							url = "/newworlds-qna?bqCmtCheck=&uiNum=${userInfo.uiNum}&bqTitle=" + document.querySelector('.qnasearch').value + "&bqContent=" + document.querySelector('.qnasearch').value;
						break;
						
						case 'bqTitle': 
							url = "/newworlds-qna?bqCmtCheck=&uiNum=${userInfo.uiNum}&bqTitle=" + document.querySelector('.qnasearch').value;
						break;
						
						case 'bqContent': 
							url = "/newworlds-qna?bqCmtCheck=&uiNum=${userInfo.uiNum}&bqContent=" + document.querySelector('.qnasearch').value;
						break;
						}
					} 
					break;
				default : 
					{
						switch(qnatitleSel){
						case 'allcheck':
							url = "/newworlds-qna?bqCmtCheck=" + qnaokSel + "&uiNum=${userInfo.uiNum}&bqTitle=" + document.querySelector('.qnasearch').value + "&bqContent=" + document.querySelector('.qnasearch').value;
						break;
						
						case 'bqTitle' : 
							url = "/newworlds-qna?bqCmtCheck=" + qnaokSel + "&uiNum=${userInfo.uiNum}&bqTitle=" + document.querySelector('.qnasearch').value;
						break;
						
						case 'bqContent' : 
							url = "/newworlds-qna?bqCmtCheck=" + qnaokSel + "&uiNum=${userInfo.uiNum}&bqContent=" + document.querySelector('.qnasearch').value;
						break;
						}
					}
					break;
				 } 
				
	
			console.log(url)
			$.ajax({ // ajax로 데이터 가져오기
			method: "GET",
			url: url,
			dataType: "json",
			success: function (d) {
			
			dataList=d; //dataList에 결과 담음
			console.log(d);
			
			//totalData(총 데이터 수) 구하기
			totalData = d.length;
			console.log(totalData);
			if(!totalData){
				$("#tBody").html('');
				return;
			}
			
			//글 목록 표시 호출 (테이블 생성)
			displayData(1, dataPerPage);

			//페이징 표시 호출
			paging(totalData, dataPerPage, pageCount, 1); 
			} 

		  });
		} 

 //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {


	let html = "";

	//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림..
	currentPage = Number(currentPage);
	dataPerPage = Number(dataPerPage);

	let maxpnum=(currentPage - 1) * dataPerPage + dataPerPage; 
	if(maxpnum>totalData){maxpnum=totalData;} 
	var nums = [];
	dataList.forEach((el,index)=>{nums[index] = index + 1});
	nums.reverse();
	console.log(nums);
	
	for (
	var i = (currentPage - 1) * dataPerPage;
	i < maxpnum; //수정
	i++
	) {
		const boardQna = dataList[i]
		html += '<tr>';
		html += '<th>' + nums[i] + '</th>';
		html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardqnaview?bqNum=' + boardQna.bqNum + '\'">' + boardQna.bqTitle + '</td>';
		html += '<td>' + boardQna.uiName + '</td>';
		html += '<td>' + boardQna.bqCredat + '</td>';
		html += '</tr>';
		$("#tBody").html(html);
	}
	if(dataList.length == 0) {
		html += '<tr>'
		html += '<td style="color: gray; text-align: center;">' + '작성한 문의 내역이 없습니다.' + '</td>'
		html += '</tr>'
		html += '<tr><td><button class="qnainsert" onclick="location.href=\'/views/newworld/boardqnainsert\'">등록</button></td></tr>'
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



/* function getBoardQna(){
	const qnaok = document.querySelector('select.qnaok');
	const qnaokSel = qnaok.options[qnaok.selectedIndex].value;
	const qnaTitle = document.querySelector('select.qnatitle');
	const qnaTitleSel = qnaTitle.options[qnaTitle.selectedIndex].value;
	if(qnaokSel == 'check' && qnaTitleSel == 'allcheck'){
		fetch('/newworlds-qna?bqCmtCheck=&uiNum=${userInfo.uiNum}&bqTitle=' + document.querySelector('.qnasearch').value + '&bqContent=' + document.querySelector('.qnasearch').value) 
		.then(function(res){
			return res.json();
		})
		.then(function(list) {
			console.log(list);
				let html = '';
				let num = 0;
				for (let i = 0; i < list.length; i++) {
					num += 1;
					const boardQna = list[i]
					html += '<tr>';
					html += '<th>' + num + '</th>';
					html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardqnaview?bqNum=' + boardQna.bqNum + '\'">' + boardQna.bqTitle + '</td>';
					html += '<td>' + boardQna.uiName + '</td>'; 
					html += '<td>' + boardQna.bqCredat + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
		})
	}else if(qnaokSel == 'check' && qnaTitleSel == 'bqTitle'){
		fetch('/newworlds-qna?bqCmtCheck=&uiNum=${userInfo.uiNum}&bqTitle=' + document.querySelector('.qnasearch').value) 
		.then(function(res){
			return res.json();
		})

		.then(function(list) {
			console.log(list);
				let html = '';
				let num = 0;
				for (let i = 0; i < list.length; i++) {
					num += 1;
					const boardQna = list[i]
					html += '<tr>';
					html += '<th>' + num + '</th>';
					html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardqnaview?bqNum=' + boardQna.bqNum + '\'">' + boardQna.bqTitle + '</td>';
					html += '<td>' + boardQna.uiName + '</td>'; 
					html += '<td>' + boardQna.bqCredat + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
		})
	}else if(qnaokSel == 'check' && qnaTitleSel == 'bqContent'){
		fetch('/newworlds-qna?bqCmtCheck=&uiNum=${userInfo.uiNum}&bqContent=' + document.querySelector('.qnasearch').value) 
		.then(function(res){
			return res.json();
		})

		.then(function(list) {
			console.log(list);
				let html = '';
				let num = 0;
				for (let i = 0; i < list.length; i++) {
					num += 1;
					const boardQna = list[i]
					html += '<tr>';
					html += '<th>' + num + '</th>';
					html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardqnaview?bqNum=' + boardQna.bqNum + '\'">' + boardQna.bqTitle + '</td>';
					html += '<td>' + boardQna.uiName + '</td>'; 
					html += '<td>' + boardQna.bqCredat + '</td>';
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
		})
	}else if(qnaokSel == 'check' && qnaTitleSel == 'allcheck')
	
	else{
		fetch('/newworlds-qna?bqCmtCheck=' + qnaokSel + '&uiNum=${userInfo.uiNum}&' + qnaTitleSel + '=' + document.querySelector('.qnasearch').value)
		.then(function(res){
			return res.json();
		})

		.then(function(list) {
			console.log(list);
				let html = '';
				let num = 0;
				for (let i = 0; i < list.length; i++) {
					const boardQna = list[i]
					num += 1;
					html += '<tr>';
					html += '<th>' + num + '</th>';
					html += '<td style="text-align: left; cursor:point;" onclick="location.href=\'/views/newworld/boardqnaview?bqNum=' + boardQna.bqNum + '\'">' + boardQna.bqTitle + '</td>';
					html += '<td>' + boardQna.uiName + '</td>'; 
					html += '</tr>';
				}
				document.querySelector('#tBody').innerHTML = html;
		})
	}
};
	

	window.onload = function() {
		getBoardQna();
	} */

	
	
	
	/* else if(data.length == 0) {
		let html = '';
		html += '<tr>'
		html += '<td style="color: gray; text-align: center;">' + '작성 가능한 리뷰가 없습니다.' + '</td>'
		html += '</tr>'
		html += '<tr><td><button class="resurbtn" onclick="location.href=\'/views/newworld/packagecountry\'">예약하러 가기</button></td></tr>'
		document.querySelector('#tBody').innerHTML = html;
	} */
	
</script>
</body>
</html>