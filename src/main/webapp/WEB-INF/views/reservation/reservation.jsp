<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap"
	rel="stylesheet">
	<script src="https://kit.fontawesome.com/049a2474af.js"
	crossorigin="anonymous"></script>

<title>MIRAE SURF</title>

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

#title {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}

#top {
	margin-top: 150px;
	margin-bottom: 50px;
}
.goReservation{
font-size:40px;
}
.a1 {
	text-align: center;
	color: #4682B4;
	padding-top: 30px;
	font-family: 'Sunflower', sans-serif;
	font-size: 60px;
}

/* img {
	width: 400px;
	height: 400px;
	padding: 70px;
	padding-top: 30px;
} */
table {
	margin: auto;
	text-align: center;
	border-collapse: separate;
  	border-spacing: 60px 0px;
}

button {
	width: 110px;
	height: 35px;
	font-size: 17px;
	font-weight: bold;
}
/*이미지 폰트*/
figure.snip1200 {
	font-family: 'Sunflower', sans-serif;
	position: relative;
	overflow: hidden;
	margin: 10px;
	min-width: 220px;
	max-width: 400px;
	max-height: 400px;
	width: 100%;
	background: #000000;
	color: #ffffff;
	text-align: center;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
	font-size: 16px;
	border-radius:50px;
}

figure.snip1200 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

figure.snip1200 img {
	max-width: 100%;
	position: relative;
	opacity: 0.9;
}

figure.snip1200 figcaption {
	position: absolute;
	top: 45%;
	left: 7%;
	right: 7%;
	bottom: 45%;
	border: 1px solid white;
	border-width: 1px 1px 0;
}

figure.snip1200 .heading {
	overflow: hidden;
	-webkit-transform: translateY(50%);
	transform: translateY(50%);
	position: absolute;
	bottom: 0;
	width: 100%;
}

figure.snip1200 h2 {
	display: table;
	margin: 0 auto;
	padding: 0 10px;
	position: relative;
	text-align: center;
	width: auto;
	text-transform: uppercase;
	font-weight: 400;
}

figure.snip1200 h2 span {
	font-weight: 800;
}

figure.snip1200 h2:before, figure.snip1200 h2:after {
	position: absolute;
	display: block;
	width: 1000%;
	height: 1px;
	content: '';
	background: white;
	top: 50%;
}

figure.snip1200 h2:before {
	left: -1000%;
}

figure.snip1200 h2:after {
	right: -1000%;
}

figure.snip1200 p {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	position: absolute;
	width: 100%;
	padding: 0 20px;
	margin: 0;
	opacity: 0;
	line-height: 1.6em;
	font-size: 0.9em;
}

figure.snip1200 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

figure.snip1200:hover img, figure.snip1200.hover img {
	opacity: 0.25;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}

figure.snip1200:hover figcaption, figure.snip1200.hover figcaption {
	top: 7%;
	bottom: 7%;
}

figure.snip1200:hover p, figure.snip1200.hover p {
	opacity: 1;
	-webkit-transition-delay: 0.35s;
	transition-delay: 0.35s;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<div id="op">
	<b id="title">예 약</b>
	</div>
	<div>
		<h1 style="text-align: center;" class="a1">강 습 선 택</h1>
	</div>
	<table id="top">
		<!-- <tr id="title2">
			<td class="a1">초급강습</td>
			<td class="a1">중급강습</td>
			<td class="a1">포인트강습</td>
		</tr> -->
		<tr>
			<td>
				<figure class="snip1200" style="width: 600px; height: 400px;">
					<img src="resources/img/reservation/beginner.png"
						style="width: 600px; height: 400px;">
					<figcaption>
						<p class="goReservation">
							예약 click! <i class="fas fa-location-arrow"></i>
						</p>
						<div class="heading">
							<h2>
								초급<span> 강습</span>
							</h2>
						</div>
					</figcaption>
					<a onclick="location.href='beginnerclass'" style="cursor: pointer;"></a>
				</figure>
			</td>
			<td>
				<figure class="snip1200" style="width: 600px; height: 500px;">
					<img src="resources/img/reservation/inter.png"
						style="width: 600px; height: 500px;">
					<figcaption>
						<p class="goReservation">
							예약 click! <i class="fas fa-location-arrow"></i>
						</p>
						<div class="heading">
							<h2>
								중급<span> 강습</span>
							</h2>
						</div>
					</figcaption>
					<a onclick="location.href='intermediateclass'"
						style="cursor: pointer;"></a>
				</figure>
			</td>
			<td>
				<figure class="snip1200" style="width: 600px; height: 400px;">
					<img src="resources/img/reservation/point.png"
						style="width: 600px; height: 400px;">
					<figcaption>
						<p class="goReservation">
							예약 click! <i class="fas fa-location-arrow"></i>
						</p>
						<div class="heading">
							<h2>
								포인트<span> 강습</span>
							</h2>
						</div>
					</figcaption>
					<a onclick="location.href='pointclass'" style="cursor: pointer;"></a>
				</figure>
			</td>
		</tr>
	</table>
	<script>
		/* Demo purposes only */
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
	</script>
</body>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>