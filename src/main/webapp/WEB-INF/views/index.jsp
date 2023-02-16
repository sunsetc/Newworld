<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table class="table table-borderless w-100">
		<tbody style="text-align: left; font-size:14px;" id="tBody_Review">
<!-- 			<tr><th rowspan="5" style="width:120px"><img src="/resources/images/icon/reviewmain.png" alt="" width="100px"></th></tr>
			<tr><td>⭐⭐⭐⭐⭐</td></tr>
			<tr><td style="color:gray;">TEST &nbsp;&nbsp;&nbsp;&nbsp;2022.01.30</td></tr>
			<tr><td style="color:gray;">하와이 한달 여행</td></tr>
			<tr><td>
			빠른응대가 마음에 들었어요.<br>
			숙소 위치가 좋습니다.<br>
			조식은 패키지에 포함되어있습니다.<br>
			가성비가 좋습니다.
			</td></tr>
			<tr><th rowspan="5" style="width:120px"><img src="/resources/images/icon/reviewmain.png" alt="" width="100px"></th></tr>
			<tr><td>⭐⭐⭐⭐⭐</td></tr>
			<tr><td style="color:gray;">TEST &nbsp;&nbsp;&nbsp;&nbsp;2022.01.30</td></tr>
			<tr><td style="color:gray;">하와이 한달 여행</td></tr>
			<tr><td>
			빠른응대가 마음에 들었어요.<br>
			숙소 위치가 좋습니다.<br>
			조식은 패키지에 포함되어있습니다.<br>
			가성비가 좋습니다.
			</td></tr> -->
		</tbody>
	</table>
<script>
function review() {
	fetch('/get-review/TA01')
	.then(function (res) {
		return res.json();
	})
	.then(function (data) {
		console.log(data);
		console.log(data[0].uiName);
		let html = '';
		for(let i = 0; i < data.length; i++) {
			const reviews = data[i];
 			
			html += '<tr>'
			if(reviews.brStar === 1) {
				html += '<td>' + '<img src="/resources/images/icon/star1.png" alt="" width="100px">' + '</td></tr>'
			}else if(reviews.brStar === 2) {
				html += '<td>' + '<img src="/resources/images/icon/star2.png" alt="" width="100px">' + '</td></tr>'
			}else if(reviews.brStar === 3) {
				html += '<td>' + '<img src="/resources/images/icon/star3.png" alt="" width="100px">' + '</td></tr>'
			}else if(reviews.brStar === 4) {
				html += '<td>' + '<img src="/resources/images/icon/star4.png" alt="" width="100px">' + '</td></tr>'
			}else if(reviews.brStar === 5) {
				html += '<td>' + '<img src="/resources/images/icon/star5.png" alt="" width="100px">' + '</td></tr>'
			}
			console.log(reviews.uiName);
			if(reviews.uiName.length < 3) {
				let maskingName = reviews.uiName.replace(/(?<=.{1})./gi, "*");
				html += '<tr><td style="color:gray;">' + maskingName + '&nbsp;&nbsp;&nbsp;&nbsp;' + reviews.brData + '</td></tr>'
			}else {
				maskingName = reviews.uiName.replace(/(?<=.{2})./gi, "*");
				html += '<tr><td style="color:gray;">' + maskingName + '&nbsp;&nbsp;&nbsp;&nbsp;' + reviews.brData + '</td></tr>'
			}
			console.log(maskingName);
			html += '<tr><td style="color:gray;">' + reviews.giName + '</td></tr>'
			html += '<tr><td>' + reviews.brContent + '</td></tr>'
		}
		document.querySelector('#tBody_Review').innerHTML = html;
	})
}
window.onload = function() {
	review();
}
</script>
</body>
</html>