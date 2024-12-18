<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Title</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="resources/js/getPoster.js"></script>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-image: linear-gradient(to bottom, #010c16, #0c82f5);
	color: #D9D9D9;
	padding: 20px;
}

.swiper-slide {
	text-align: center;
}

img {
	width: 400px;
	height: 600px;
}

.swiper-button-next, .swiper-button-prev {
	color: #D9D9D9;
}
</style>
</head>
<body>
	<div id="trailer"></div>
	<h1>영화 선택</h1>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<script src="resources/js/getBoxOffice.js"></script>
		</div>
	</div>
	<!-- Add Arrows -->
	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		// 포스터 슬라이드 js
		var swiper = new Swiper('.swiper-container', {
			slidesPerView : 4,
			spaceBetween :80,
			loop:true,
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			}
		});
	</script>
</body>
</html>