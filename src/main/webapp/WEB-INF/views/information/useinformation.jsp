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
#op{
background-image:url("resources/img/op.jpg");
height:200px;
padding-top:80px;
padding-left:10px;
opacity:0.8;
}
h2, th {
	color: #4682B4;
	font-family: 'Sunflower', sans-serif;
}

h1 {
	text-align: center;
	font-size: 70px;
}

table {
	width: 100%;
	height: 300px;
}

#flo1 {
	float: left;
}

#flo2 {
	float: right;
}

#radius1 {
	width: 400px;
	height: 400px;
	background-image: url("resources/img/useinformation/suf1.jpg");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
}

#radius2 {
	width: 400px;
	height: 400px;
	background-image: url("resources/img/useinformation/suf2.jpg");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
}

#radius3 {
	width: 400px;
	height: 400px;
	background-image: url("resources/img/useinformation/suf3.jpg");
	border-radius: 200px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	font-weight: bold;
	text-align: center;
}

td {
	padding-left: 70px;
	padding-right: 70px;
	padding-bottom: 20px;
	padding-top: 20px;
}

.text {
	padding-left: 20px;
}

.text2 {
	text-align: right;
	padding-right: 20px;
}

hr {
	width: 400px;
}

#flo4 {
	width: 100%;
	text-align: center;
}

h2 {
	font-size: 34px;
}

th {
	font-size: 35px;
}

hr {
	width: 100%;
}

#title {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}

#tit {
	margin-top: 250px;
}

#nav {
	margin-top: 200px;
}

#nav1 {
	padding-bottom: 80px;
}

table {
	margin-bottom: 150px;
}
.prompt{
font-family: 'Yeon Sung', cursive;
font-size:25px;
padding : 5px;
}
</style>

</head>

<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<div id="op">
	<b id="title">이용안내</b>
	</div>
	<table id="tit">
		<tr>
			<td id="flo1"><img onclick="marqee" id="radius1" ></td>
			
			<td><h2 class="text">Meet with waves</h2> <span class="prompt">서핑은 고도의 수영능력과
				평형감각을 요구하는 격렬한 스포츠이기 때문에 자신의 건강 상태에 대하여 의사의 정확한 진단을 받은 후에 입</span><span class="prompt">문하는 것이 좋
				다.서핑 방식은 나무나 폴리우레탄폼제로 만든 서프보드(surf board) 위에 타고 양손으로 균형을 잡으며 파도를 타는
				것이</span> <span class="prompt"> 일반적이다. 서프보드는 일반적 으로 길이 1.5∼2.7m, 너비 50∼60㎝, 두께 7∼10㎝이다. 이밖에 약
				1.3m의 짧은 보드에 엎드리거나 정좌</span><span class="prompt">하여 타는 벨리보드(belly board) 서핑, 니보드 (knee board)
				서핑, 보드를 쓰지 않고 손바닥을 사용하여 몸으로 타는 보디서핑이 있다. 주요</span> <span class="prompt">기술은 해안에서 판자 위에 엎드려 팔로
				저어나가든지 판자 위 에 앉아 노를 저어 파도가 일어나는 바다로 200∼400m 나간 다음, 밀려드는</span><span class="prompt"> 파도를 골라타고
				몸에 균형을 잘 유지하면서 파도와 파도 사이를 뚫고 나오는 정 확한 타이밍이 중요하다. 파도의 아래 부분에서 돌아서
				파</span><span class="prompt">도의 꼭대기로 올라갔다가 다시 무너지는 파도를 타고 내려오는 롤러코스터 등의 기술이 있다. </span>
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td>
				<h2 class="text2">Know history</h2> <span class="prompt">서핑의 기원은 선사시대에 까지 거슬러
					올라가는데 태평양 섬나라들에서 처음 행해진 것으로 알려져 있다. 그러므로 하와이가 서핑의 발상지로 여겨진다. 서핑이
					근대적인 스포츠로 자리를 잡게 된 것은 1920년대 파오아 듀크 카하나모크의 노력에 의해서이다. 그는 당시 하와이에
					서핑클럽을 열고 서핑을 보급해 나가기 시작했기 때문이다. 1956년 호주에서 제1회 국제 서핑 축제가 열렸는데 많은
					나라에서 참가하여 성황을 이루었으며 1960년대 초부터는 세계 선수권 대회가 열리기 시작했다. 1974년 국제 서핑
					협회가 창립되었으며 현재는 많은 나라에서 대중적인 인기를 얻는 스포츠로 성장하였다. 우리나라에는 1990년대
					들어서면서부터 일반에 소개되었으나 파도가 크게 치는 곳이 별로 없어서 크게 활성화되지는 못하였다. 그러나 서핑을 좋아하는
					동호인들의 숫자가 계속 증가하고 있으며 윈드서핑과 같은 유사 종목에 대한 발전이 이루어지면서 점차 보급이 확대되고 있는
					상황이다.</span>
			</td>
			
			<td id="flo2">
				<img id="radius2">
			</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td id="flo1"><img id="radius3"></td>
			<td><h2 class="text">Enjoy together</h2> <span class="prompt">보드에 돛을 달고 바람을
				이용하여 달리는 윈드서핑이나 길이 3m의 보드를 타고 카누와 같은 노(paddle)로 젓는 서핑스키는 서핑과 별도의
				종목으로 구별된다. 한국에는 1990년대부터 본격적으로 소개되어 1995년 제주도 중문해수욕장에서 첫 서핑 클럽이 탄생한
				뒤로 여러 동호회가 결성되었고, 동호인의 숫자는 해마다 늘고 있다 </span>
			</td>
		</tr>
	</table>
	
	<table id="nav">
		<tr>
			<th id="nav1">이용시 준비물</th>
		</tr>
		<tr>
			<td id="flo4"><img src="resources/img/useinformation/suf4.jpg" width="1000"></td>
		</tr>
	</table>

	<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
	<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</body>
</html>