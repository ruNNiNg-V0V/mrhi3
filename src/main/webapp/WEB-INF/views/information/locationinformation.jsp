<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#title {
font-size: 50px;
font-family: 'Sunflower', sans-serif;
color: #4682B4;
}
#location{
margin-top:150px;
text-align: center;
width:100%;
display: block;
}
#image2{
width: 700px;
height: 400px;
}
#subtitle{
margin-top: 100px;
font-size:55px;
font-family: 'Sunflower', sans-serif;
color:#4682B4;
}
.image4{
width: 450px;
height: 40px;
}
.location-info{
font-family: 'Yeon Sung', cursive;
font-size:30px;
}
#size2{
font-family: 'Yeon Sung', cursive;
font-size:20px;
}
#border1{
border: 2px solid #4682B4;
padding:2px;
} 
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<div id="op">
	<b id="title">위치안내</b>
	</div>
<div id="location">
<div id="map" style="width:40%;height:450px; display:inline-block;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f3632efaba69c6fee2d521094c4d7bc"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.562140, 127.035208), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

//지도에 교통정보를 표시하도록 지도타입을 추가합니다
map.addOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);    

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.562140, 127.035208); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var iwContent = '<div style="padding:5px;">MIRAE SURF<br><a href="https://map.kakao.com/link/map/MIRAE SURF,37.562140,127.035208" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/MIRAE SURF,37.562140,127.035208" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.562140, 127.035208); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script> 
<h1 id="subtitle"><i class="fas fa-car"></i> 자가용이용시</h1>
<span class="location-info">서울특별시 성동구 무학로2길 54<br></span>
<span class="location-info"><b id="border1">지번</b> 서울특별시 성동구 도선동 39-1</span><br><br><br>
<h1 id="subtitle"><i class="fas fa-bus"></i> 버스이용시</h1>
<b id="size2">성동구청(04-112) | 성동구청(04-671) | 왕십리역(04-135) | 성동구청(04-111)</b> <br><br>
<span class="location-info">버스 내리는 곳 : 왕십리역<br> </span><span class="location-info">간선 : 263, 302<br> </span><span class="location-info">지선 : 2014. 2220, 2222 </span><br><br><br>
<h1 id="subtitle"><i class="fas fa-subway"></i> 지하철이용시</h1>
<img class="image4" src="resources/img/locationinformation/sub.jpg"> <br><br>
<span class="location-info">지하철 : 2호선,5호선,중앙선 왕십리역 1번 출구(도보 1분이하)</span>
</div>
</body>

<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>

</html>