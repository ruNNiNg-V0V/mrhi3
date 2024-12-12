<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/049a2474af.js"
	crossorigin="anonymous"></script>

<style>
body,html {
line-height:3em;
 height: 100%;
 margin: 0;
}
#title {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}
#op{
background-image:url("resources/img/op.jpg");
height:200px;
padding-top:80px;
padding-left:10px;
opacity:0.8;
}
#facility{
margin-top:100px;
text-align:center;
width:100% auto;
padding:60px;
font-family: 'Yeon Sung', cursive;
}
h1{
font-size:70px;
font-family: 'Sunflower', sans-serif;
color:#4682B4;
}
table{
align:center;
width:1000px;
font-size:40px;
border-spacing: 0 100px;

}
table td{
font-size:25px;
}
#radius-image1{
width: 400px;
	height: 400px;
	background-image: url("resources/img/facilityinformation/bord.png");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
	margin-left:50px;
}
#radius-image2{
width: 400px;
	height: 400px;
	background-image: url("resources/img/facilityinformation/suit.jpg");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
	margin-left:50px;
}
#radius-image3{
width: 400px;
	height: 400px;
	background-image: url("resources/img/facilityinformation/shower.jpg");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
	margin-left:50px;
}
#radius-image4{
width: 400px;
	height: 400px;
	background-image: url("resources/img/facilityinformation/sleep.jpg");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
	margin-left:50px;
}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
    <div id="op">
	<b id="title">요금안내</b>
	</div>
	<div id="facility">
	<h1>강습요금</h1>
	
	<table  align="center">
    <thead>
    	<tr>
        	<th style="background: linear-gradient(to right, #74ebd5, #acb6e5);">초급강습</th>
            <th style="background: linear-gradient(to right, #654ea3, #eaafc8);">중급강습</th>
            <th style="  background: linear-gradient(to right, #00f260, #0575e6);">포인트강습</th>
        </tr>
    </thead>
    <tbody>
   
    	<tr>
        	<td>5만원</td>
            <td>8만원</td>
            <td>25만원</td>
            
        </tr>
        <tr>
        	<td>+ 1시간 50분 강습<br><br>+ 프리라이딩 종일<br><br>+ 강습시간:9시,13시,15시</td>
            <td>+ 라인업 웨이브 캐치방법<br><br>+ 사이드 라이딩 강습</td>
            <td>+강습자 수준별 맞춤 강습<br><br>+ 일일 종일 포인트 강습</td>
            
        </tr>
    </tbody>
</table><br><br><br>


<h1>렌탈요금</h1>

<table  align="center">
    <thead>
    	<tr>
        	<th style="background: linear-gradient(to right, #f7971e, #ffd200);">보드</th>
            <th style="background: linear-gradient(to right, #ffd89b, #19547b);">슈트</th>
        </tr>
    </thead>
    <tbody>
    <tr>
    		<td><img id="radius-image1"></td>
    		<td><img id="radius-image2"></td>
    	</tr>
    	<tr>
        	<td>1.5만원</td>
            <td>2.5만원</td>
        </tr>
        <tr>
        	<td>일일기준요금</td>
        	<td>일일기준요금</td>
        </tr>
    </tbody>
</table><br><br><br>

<h1>기타요금</h1>

<table  align="center">
    <thead>
    	<tr>
        	<th style="background: linear-gradient(to right, #1d976c, #93f9b9);">샤워</th>
            <th style="background: linear-gradient(to right, #dd5e89, #f7bb97);">숙박</th>
        </tr>
    </thead>
    <tbody>
    	<tr>
    		<td><img id="radius-image3"></td>
    		<td><img id="radius-image4"></td>
    	</tr>
    	<tr>
        	<td>3천원</td>
            <td>2만원</td>
        </tr>
        <tr>
        	<td>+ 세면도구<br>+ 수  건</td>
        	<td>+ 조식제공</td>
        </tr>
       
    </tbody>
</table>
</div>
</body>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>