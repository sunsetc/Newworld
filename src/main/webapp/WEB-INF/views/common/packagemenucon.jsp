<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
    <title>New World Tour</title>
    <link rel="stylesheet" href="/resources/css/sidemenu_con.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
</head>
<body>
<style>
 a {
    text-decoration: none;
    outline: none;
    color: #000;
    }
</style>  
<!-- 패키지 사이드메뉴 -->
    <div class="sidemeun">
            <h2 class="cusstmenu">해외패키지</h2>
            <ul class="submenu">
            <li class="notemenu"><a href="/views/newworld/packagecountry">전체보기</a></li>
            <li class="qnamenu"><a href="/views/newworld/packagecountry_us">미국</a></li>
            <li class="faqmenu"><a href="/views/newworld/packagecountry_eu">유럽</a></li>
            <li class="faqmenu"><a href="/views/newworld/packagecountry_as">아시아</a></li>
            </ul>
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>