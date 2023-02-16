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
body {
	width:390px;
	hieght:450px;
	padding-top:30px;
	padding-left:10px;
}
.table-border {
	font-family: 'NanumSquareNeo';
}

.bigtitle {
	line-height: 70px;
	border-bottom: 2px solid #6799FF;
	font-size:20px;
	font-weight: bold;
}
</style>
<div id="container">
<div id="cell">

    <h1 class="bigtitle">${userInfo.uiName}님의 예약번호</h1><br>
    <!-- 테이블 -->
	<table class="table table-border w-100" id="table">
		<thead class="table-primary">
		<tr><th>No</th><th style="line-height: 30px;">예약번호</th></tr>
		</thead>
		<tbody style="font-size:14px;" id="tBody">
		</tbody>
	</table>

</div>
</div>
<script>
window.onload = function getRiCodeList(){
	fetch('/reservCode-list/${userInfo.uiId}')
	.then(function(res){
		return res.json()
	})
	.then(function(data){
		console.log(data);
		let html = '';
		let num = 0;
		for(let i=0; i<data.length; i++){
			num += 1;
			const list = data[i]
			html += '<tr><td style="cursor: pointer;  line-height: 20px;">' + num + '</td><td style="cursor: pointer;  line-height: 20px;">' + list.riCode + '</td></tr>'
		}
		document.querySelector('#tBody').innerHTML = html;
		
		const obj = document.querySelector("#tBody").childNodes;
		obj.forEach((el, index) => {
		  el.onclick = () => {
		    console.log(el.childNodes[1].textContent);
		    opener.document.querySelector("#inputCode").value = el.childNodes[1].textContent;
		    window.close();
		  }
		});
	})
}

/* const boxs = document.querySelector("#tBody").childNodes;

boxs.forEach((el, index) => {
  el.onclick = () => {
    console.log(index);
  }
}); */
</script>
</body>
</html>