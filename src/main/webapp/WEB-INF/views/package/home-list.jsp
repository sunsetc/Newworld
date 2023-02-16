<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1>
	<tr>
		<th data-col="giName">패키지명</th>
		<th data-col="giPeriod">기간</th>
		<th data-col="giPriceAdult">가격</th>
		<th data-col="fiStart">출발일</th>
		<th data-col="fiArr">도착일</th>
		<th data-col="fiPlane">항공사</th>
		<th data-col="giMax">정원</th>
	</tr>
	<tbody id=tBody></tbody>
</table>

<script>
	function getGoodsInfos() {
		const infos = document.querySelectorAll('th[data-col]');
		fetch('/homeGoods')
		.then(function(res) {
			return res.json();
		})
		.then(function(data) {
			console.log(data);
			let html = '';
			for(let i = 0; i < data.length; i++) {
				const goodsInfos = data[i];
				html += '<tr style="cursor:pointer" onclick="location.href=\'/views/package/home-view?giNum=' + goodsInfos.giNum + '&giCode=' + goodsInfos.giCode + '\'">';
				for(const info of infos) {
					html += '<td>' + goodsInfos[info.getAttribute('data-col')] + '</td>';
				}
				html += '</tr>';
			}
			document.querySelector('#tBody').innerHTML = html;
		})
	}
	window.onload = function() {
		getGoodsInfos();
	}
</script>
</body>
</html>