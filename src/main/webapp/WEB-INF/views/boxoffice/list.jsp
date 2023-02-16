<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
   <tr>
      <th data-col="rank">순위</th>
      <th data-col="movieNm">이름</th>
      <th data-col="openDt">개봉일</th>
      <th data-col="showCnt">하루 관람 수</th>
      <th data-col="scrnCnt">하루 스크린 수</th>
   </tr>
   <tbody id="tBody"></tbody>
</table>

<script>
   function getMovies() {
      const infos = document.querySelectorAll('th[data-col]');
      fetch('/boxoffices')
      .then(function(res) {
         return res.json();
      })
      .then(function(data) {
         let html='';
         for(let i = 0; i < data.length; i++) {
            const movies = data[i];
            html += '<tr>';
            for(const info of infos) {
               html += '<td>' + movies[info.getAttribute('data-col')] + '</td>';
            }
            html += '</tr>';
         }
         document.querySelector('#tBody').innerHTML = html;
      })
   }
   window.onload = function() {
      getMovies();
   }
</script>
</body>
</html>