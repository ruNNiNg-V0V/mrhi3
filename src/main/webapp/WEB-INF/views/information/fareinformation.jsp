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

#tit{
margin-top: 150px;
}

table{
width: 100%
}

hr {
	width: 100%;
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

.aa{
margin: 20px;
text-align: 30px;
font-size: 30px;
text-align: center;
}

img{
width:400px;
height:250px;
margin: 20px;
}

.a1{
text-align: center;
color:#4682B4;
padding-top: 30px;
font-family: 'Sunflower', sans-serif;
font-size: 60px;
}

#cc{
color: red;
}

.text1{
text-align: center;
padding-bottom: 80px;
padding-top: 40PX;
font-size: 25px;
font-family: 'Yeon Sung', cursive;
}
</style>

</head>

<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<div id="op">
	<b id="title">시설안내</b>
	</div>
	<table id="tit">
	<tr>
		<td><h1 class="a1">Guest Room</h1></td>
	</tr>
	<tr>
		<td class="aa"><img src="resources/img/fareinformation/room1.PNG"><img src="resources/img/fareinformation/room2.PNG"><img src="resources/img/fareinformation/room3.PNG"></td>
	</tr>
	<tr>
		<td class="text1"><p>별빛 가득한 MIRAE SURF 에서 즐기는 특별한 하룻밤!<br>
		이국적이고 편안한 밤을 경험할 수 있는 럭셔리 숙소부터 별빛 가득한 밤을 보낼수 있는 오션뷰,<br>
		미래비치 트립의 마지막 대미를 채워줄 그리움 가득한 감성공간.</p>
		</td>
	</tr>
</table>

<table>
<tr>
	<td><h1 class="a1">Beach</h1></td>
</tr>
<tr>
	<td class="aa"><img src="resources/img/fareinformation/beach1.PNG"><img src="resources/img/fareinformation/beach2.PNG"><img src="resources/img/fareinformation/beach3.PNG"></td>
</tr>
<tr>
	<td class="text1">MIRAE SURF 프라이빗 비치에서 즐기는 일상의 여유로움<br>
		1km 구간에 걸쳐 펼쳐진 서핑전용 해변과 <br>
		스위밍존, 빈백존, 해먹존, 칠링존 등 온전한 휴식을 즐길 수 있는<br>
		공간으로 구성된 서피비치는 일상에 지친 자유로운 영혼을 온전히 방목할 수 있는 이국적인 풍광의<br>
		릴렉스 비치이자 에너지 가득한 자유를 만끽할 수 있는 열정 플랫폼으로 무엇이든 주저없이 즐기시면 됩니다.<br>
	</td>
</tr>
</table>

<table>
<tr>
	<td><h1 class="a1">Pub & Lounge</h1></td>
</tr>
<tr>
	<td class="aa"><img src="resources/img/fareinformation/pub1.PNG"><img src="resources/img/fareinformation/pub2.PNG"><img src="resources/img/fareinformation/pub3.PNG"></td>
</tr>
<tr>
	<td class="text1">MIRAE SURF SUNSETS BAR 미래비치 펍&라운지<br> 
		트로피컬 음악이 흐르는 서피비치 선셋바에서 즐기는 힐링타임.<br>
		라임을 곁들인 코로나 맥주 부터 모히또, 칵테일, 샴페인, 비프&씨푸드 BBQ, 피자, 육즙 가득한 수제버거 까지!<br>
		일몰 후엔 감성 충만한 선셋까지 경험할 수 있는 로맨틱 라운지.<br>
	</td>
</tr>
</table>

<table>
<tr>
	<td><h1 class="a1">MUSIC & PARTY </h1></td>
</tr>
<tr>
	<td class="aa"><img src="resources/img/fareinformation/party1.PNG"><img src="resources/img/fareinformation/party2.PNG"><img src="resources/img/fareinformation/party3.PNG"></td>
</tr>
<tr>
	<td class="text1">매일밤, 노을이 해변을 붉게 물들이면 시작되는 한 여름 밤의 비치파티!<br> 
		MIRAE SURF의 열기를 더욱 뜨겁게 달궈줄 스페셜 게스트와DJ, 서퍼, 방문객 모두가 함께 만들어 나가는 특별한 애프터 파티!<br><br>
		<b id="cc">애프터 파티 일정 등은 미래비치 홈페이지 및 SNS계정을 통해 별도 확인 바랍니다.</b><br>
	</td>
</tr>
</table>

<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</body>
</html>