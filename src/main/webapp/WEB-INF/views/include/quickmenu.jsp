<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap"
	rel="stylesheet">

<style>
#floatMenu{
position: absolute;
font-weight:bold;
width: 150px;
height: 360px;
top: 450px;
left:92%;
background-color: #4682B4;
opacity:0.8;
color: #fff;
text-align:center;
border-radius:50px 50px 50px 50px;
}
.myhr{
border:0;
height:2px;
background:#fff;
}

#floatMenu-question,#floatMenu-kakaotalk,#floatMenu-reservation,#floatMenu-call,#floatMenu-surfingterm{
font-size:16px;
padding:3px;
font-family: 'Sunflower', sans-serif;
cursor:pointer;
}

.scroll-top {
	opacity:0.8;
    position: fixed;
    right: 20px;
    bottom: 20px;
    z-index: 100;
    background-color: #4682B4;
    opacity: .8;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    border: none;
    color: #fff;
    cursor:pointer;
}

</style>
</head>

<body>

<div id="floatMenu">
<c:choose>
<c:when test="${member.user_id == null}">
<p id="floatMenu-reservation" onclick="gologin()"> 예 약</p>

<p  id="floatMenu-question" onclick="location.href='question'"> 고객센터</p>

<p id="floatMenu-call"  onclick="alert('MIRAE SURF 전화번호는 010-7914-3374 입니다 전화는 모바일에서만 가능합니다.')"> 전 화</p>

<p id="floatMenu-kakaotalk" onclick="window.open('https://open.kakao.com/o/sPTQ1jHb')" style="cursor:pointer;"> 카카오톡</p>

<p id="floatMenu-surfingterm" onclick="location.href='cooperator'" style="cursor:pointer;"> 협력업체</p>
</c:when>
<c:otherwise>
<input type="hidden" id="member_id" name="member_id"
	value="${member.user_id}" />
<p id="floatMenu-reservation" onclick="location.href='reservation'"> 예 약</p>

<p id="floatMenu-question" onclick="location.href='question'"> 고객센터</p>

<p id="floatMenu-call"  onclick="alert('MIRAE SURF 전화번호는 010-7914-3374 입니다 전화는 모바일에서만 가능합니다.')" > 전 화</p>

<p id="floatMenu-kakaotalk" onclick="window.open('https://open.kakao.com/o/sPTQ1jHb')" style="cursor:pointer;"> 카카오톡</p>

<p id="floatMenu-surfingterm" onclick="location.href='cooperator'" style="cursor:pointer;"> 협력업체</p>
</c:otherwise>
</c:choose>
</div>
<script>
		function gologin(){
			alert("예약은 로그인 후 가능합니다.");
			location.href="login";
		}
</script>

<button class="scroll-top" id="js-button">
    <i class="fa fa-chevron-up" style="color:#fff; font-size:15px;" aria-hidden="true">TOP</i>
</button>

<script>
$(document).ready(function() {

	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($("#floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */

		$("#floatMenu").stop().animate({
			"top" : newPosition
		}, 200);

	}).scroll();

});

scrollTop('js-button', 300);
function scrollTop(elem,duration) {
    let target = document.getElementById(elem);
 
    target.addEventListener('click', function() {
        let currentY = window.pageYOffset; 
        let step = duration/currentY > 1 ? 10 : 100;
        let timeStep = duration/currentY * step;
        let intervalID = setInterval(scrollUp, timeStep);
 
        function scrollUp(){
            currentY = window.pageYOffset;
            if(currentY === 0) {
                clearInterval(intervalID);
            } else {
                scrollBy( 0, -step );
            }
        }
    });
}

</script>

</body>
</html>