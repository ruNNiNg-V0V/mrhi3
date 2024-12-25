<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>미래시네마</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="resources/js/getTrailer.js?v=<%=System.currentTimeMillis()%>"></script>
<script src="resources/js/getPosters.js?v=<%=System.currentTimeMillis()%>"></script>
<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css">
<link rel="stylesheet" href="resources/css/index.css">
</head>
<body>
	<div id="trailer">
		<p>!포스터에 마우스를 올려 예고편 확인!</p>
	</div>
	<h1>영화 선택</h1>
	<div class="swiper-container">
		<div class="swiper-wrapper"></div>
	</div>
	<!-- Add Arrows -->
	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div>
	<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	<script>
		
	</script>
	<script src="resources/js/getBoxOffice.js?v=<%=System.currentTimeMillis()%>"></script>
	<script>
	// 포스터 슬라이드 js
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 4,
		loop: true,
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		}
	});
	</script>
</body>
</html>