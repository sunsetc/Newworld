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

.insertbtn {
	position: absolute;
	padding: 5px;
	width:100px;
	height: 50px;
	left:170px;
	border:0;
	background-color: #9acbe2;
	color: #000;
}

.insertbtn:hover {
	background-color: #74add7;
}

#select_star{
width:50px;
}
</style>
<div id="container">
<div id="cell">

	<table class="table table-borderless w-25">
		<tbody style="text-align: left; font-size:14px;" id="tBody2">
			<tr>
			<td>
				여행은 어떠셨나요? 
				<select id="select_star">
					<option value="5">5</option>
					<option value="4">4</option>
					<option value="3">3</option>
					<option value="2">2</option>
					<option value="1">1</option>
				</select>
			</td>
			</tr>
			<tr><td style="color:gray;" data-col="riCode"></td></tr>
			<tr><td style="color:gray;">${userInfo.uiId} &nbsp;&nbsp;&nbsp;&nbsp;<span id="today"></span></td></tr>
			<tr><td style="color:gray;" data-col="giName"></td></tr>
			<tr><td><textarea data-col="brContent" cols="58" rows="10"></textarea></td></tr>
			<tr><td><button class="insertbtn" onclick="reviewInsert()">등록</button></td></tr>
		</tbody>
	</table>
	<input type="hidden" id="giEtc">
</div>
</div>

<script>
let today = new Date();   

let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let date = today.getDate();  // 날짜
let day = today.getDay();  // 요일



  function reviewInsert() {
	 const param = {
				brContent: document.querySelector('textarea[data-col=brContent]').value,
				uiId: '${userInfo.uiId}',
				brStar: parseInt(document.querySelector('#select_star').value),
				giCode: '${param.giCode}',
				riCode: document.querySelector('td[data-col=riCode]').innerHTML
		}
	if(document.querySelector('#giEtc').value == 'foreign') {
		fetch('/foreign-insert/${param.giCode}', {
			method: 'POST',
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify(param)
		})
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(param);
			console.log('해외 패키지 리뷰 등록 완료!')
			if(data==1) {
				 fetch('/check-review', {
						method: 'PATCH',
						headers: {
								'Content-Type' : 'application/json'
						},
						body: JSON.stringify(param)
					 })
					 .then(function(res) {
						 return res.json();
					 })
					 .then(function(data) {
						 alert('등록 되었습니다.');
						 opener.location.href="/views/newworld/reviewview_list";
						 self.close();
					 })
			}
		})
	}else if(document.querySelector('#giEtc').value == 'home') {
		fetch('/home-insert/${param.giCode}', {
			method: 'POST',
			headers: {
				'Content-Type' : 'application/json'
			},
			body: JSON.stringify(param)
		})
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log('국내 패키지 리뷰 등록 완료!');
			if(data==1) {
				 fetch('/check-review', {
						method: 'PATCH',
						headers: {
								'Content-Type' : 'application/json'
						},
						body: JSON.stringify(param)
					 })
					 .then(function(res) {
						 return res.json();
					 })
					 .then(function(data) {
						 alert('등록 되었습니다.');
						 opener.location.href="/views/newworld/reviewinsert_list";
						 self.close();
					 })
			}
		})
	}
	
	
}

function reviewInformation() {
	fetch('/review-get/${param.giCode}/${userInfo.uiId}')
	.then(function(res) {
		return res.json();
	})
	.then(function(data) {
		console.log(data);
		document.querySelector('td[data-col=giName]').innerHTML = data.giName;
		document.querySelector('span#today').innerText = year + '.' + month + '.' + date;
		document.querySelector('#giEtc').value = data.giEtc;
		document.querySelector('td[data-col=riCode]').innerHTML = data.riCode;
	});

}

window.onload = function() {
	reviewInformation();
}
</script>
</body>
</html>