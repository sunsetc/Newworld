<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
	<%@ include file="/WEB-INF/views/common/header_code.jsp" %>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
</head>
<body>
<style>
.container {
position: absolute;
width:500px;
}

.cell{
position: relative;
width:500px;
}


.deletebtn {
	position: absolute;
	padding: 5px;
	width:100px;
	height: 50px;
	margin-top:50px;
	left:170px;
	border:0;
	background-color: #9acbe2;
	color: #000;
}

.deletebtn:hover {
	background-color: #74add7;
}

#select_star{
width:50px;
}
</style>

<div id="container">
<div id="cell">

	<table class="table table-borderless w-100">
		<tbody style="text-align: left; font-size:14px;" id="tBody2">
			<tr>
			<td>
				여행은 어떠셨나요? 
				<!-- 이미지 파일로 -->
			</td>
			</tr>
			<tr><td style="color:gray;" data-col="riCode"></td></tr>
			<tr><td style="color:gray;" data-col="brStar"></td></tr>
			<tr><td style="color:gray;">${userInfo.uiId} &nbsp;&nbsp;&nbsp;&nbsp;<span id="today"></span></td></tr>
			<tr><td style="color:gray;" data-col="giName"></td></tr>
			<tr><td data-col="brContent"></td></tr>
			<tr><td><center><button class="deletebtn" onclick="reviewDelete()">삭제</button></center></td></tr>
		</tbody>
	</table>
	<input type="hidden" id="giEtc">
</div>
</div>

<script>

async function getReview() {
	const reviewRes = await fetch('/reviewdelete/${param.brNum}');
	const review = await reviewRes.json();
	console.log(review);
	
	 if (review.brStar === 1) {
		document.querySelector("[data-col='brStar']").innerHTML = '<img src="/resources/images/icon/star1.png" alt="" width="100px">';
	} else if (review.brStar === 2) {
		document.querySelector("[data-col='brStar']").innerHTML = '<img src="/resources/images/icon/star2.png" alt="" width="100px">';
	} else if (review.brStar === 3) {
		document.querySelector("[data-col='brStar']").innerHTML = '<img src="/resources/images/icon/star3.png" alt="" width="100px">';
	} else if (review.brStar === 4) {
		document.querySelector("[data-col='brStar']").innerHTML = '<img src="/resources/images/icon/star4.png" alt="" width="100px">';
	} else if (review.brStar === 5) {
		document.querySelector("[data-col='brStar']").innerHTML = '<img src="/resources/images/icon/star5.png" alt="" width="100px">';
	}
	console.log(review.brStar);
	document.querySelector("[data-col='riCode']").innerText = review.riCode;
	document.querySelector("[data-col='giName']").innerText = review.giName;
	document.querySelector("[data-col='brContent']").innerText = review.brContent; 
}

window.onload = getReview;


function reviewDelete() {
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
						self.close();
					}
				})
			
		})
	}else if(check == false) {
		alert('삭제가 취소되었습니다.');
	}
	//괄호 지우지마세요!!!!!!!!!!!!!!!!!!
}



</script>
</body>
</html>