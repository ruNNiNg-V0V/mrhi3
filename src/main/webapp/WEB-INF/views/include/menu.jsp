<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/049a2474af.js"
	crossorigin="anonymous"></script>
<style>
#menu{
background-color:#4682B4;
margin-top:0;
margin-left:0;
margin-right:0;
width:100%;
height:8%;
align:center;
}
.navigation {
	background-color:#4682B4;
	position:relative;
	width: 100%;
	height: 80px;
	text-align: center;
}
.nav{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 35px;
	padding-top: 15px;
	padding-left:30px;
	padding-right: 150px;
	color: white;
	float:right;
	cursor:pointer;
}
#login, #signup{
	font-size : 20px;
	padding-top:15px;
	padding-right:20px;
}

.nav:hover {
	color:black;
	
}
.back-home{
font-family: 'Do Hyeon', sans-serif;
padding-left:10px;
padding-top:15px;
font-size: 35px; 
float:left;
color:white;
}
	</style>
	</head>
	<body>
<div id=menu>
 <div class="navigation">
 <c:choose>

<c:when test="${member.user_id == null}"> 
	<span class="back-home" onclick="location.href='http://localhost:8181/home/#0'" style="cursor:pointer; ">MIRAE SURF</span>
	<span class="nav" id = "signup" onclick="location.href='term'"><i class="fas fa-user-plus"></i> 회원가입</span>
	<span class="nav" id = "login" onclick="location.href='login'"><i class="fas fa-sign-in-alt"></i> 로그인</span>
	<span class="nav" onclick="location.href='locationinformation'">위치안내</span>
	<span class="nav" onclick="location.href='facilityinformation'" style="cursor:pointer;">요금안내</span>
	 <span class="nav" onclick="location.href='fareinformation'">시설안내</span>
	<span class="nav" onclick="location.href='useinformation'">이용안내</span>
	<br><br><br><br><br><br>
	</c:when>
	
	<c:when test="${member.user_id eq 'admin' }">
	<span class="back-home" onclick="location.href='http://localhost:8181/home/#0'" style="cursor:pointer;">MIRAE SURF</span>
	<span class="nav" id = "login" style="cursor:pointer;" onclick="logout()"><i class="fas fa-sign-out-alt"></i> 로그아웃</span>
	<span class="nav" id = "login" onclick="location.href='admin'"><i class="fas fa-list-alt"></i> 현황표</span>
	<span class="nav" onclick="location.href='locationinformation'">위치안내</span>
	<span class="nav" onclick="location.href='facilityinformation'">요금안내</span>
	<span class="nav" onclick="location.href='fareinformation'">시설안내</span>
	<span class="nav" onclick="location.href='useinformation'">이용안내</span>
	<br><br><br><br><br><br>
	</c:when>
	
	<c:otherwise>
	<span class="back-home" onclick="location.href='http://localhost:8181/home/#0'" style="cursor:pointer;">MIRAE SURF</span>
	<span class="nav" id = "signup" style="cursor:pointer;" onclick="mypBtn()"><i class="far fa-user-circle"></i> 내정보</span>
	<span class="nav" id = "login" style="cursor:pointer;" onclick="logout()"><i class="fas fa-sign-out-alt"></i> 로그아웃</span>
	<span class="nav" onclick="location.href='locationinformation'">위치안내</span>
	<span class="nav" onclick="location.href='facilityinformation'">요금안내</span>
	<span class="nav" onclick="location.href='fareinformation'">시설안내</span>
	<span class="nav" onclick="location.href='useinformation'">이용안내</span>
	<br><br><br><br><br><br>
	</c:otherwise>
	</c:choose>
 </div>
</div>
		<script>
		function logout() {
			$.ajax({
				type : "GET",
				url : "logout",
				data : {},
				success : function(data) {
					alert("로그아웃 성공");
					window.location.href="http://localhost:8181/home/#0";
				}
			});
		}
		// 마이페이지 클릭 이벤트
		function mypBtn() {
			var user_id = '<c:out value = "${member.user_id}"/>';
			
			$.ajax({
				type : "GET",
				url : "mypL",
				data : {
					"user_id" : user_id
					
				}, success : function(data) {
					window.location.href = "mypage?user_id=" + user_id;
				}
			});	
		}
		</script>
		</body>
		</html>