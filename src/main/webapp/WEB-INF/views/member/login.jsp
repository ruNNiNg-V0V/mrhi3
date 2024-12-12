<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="resources/js/login.js" charset="UTF-8"></script>
<script src="https://kit.fontawesome.com/049a2474af.js"
	crossorigin="anonymous"></script>



<title>MIRAE SURF</title>

<style>
html,body {
	width: 100%;
	height: 100%;
	display: block;
}

div {
	text-align: center;
	margin-top: 75px;
}

.title-name {
	font-size: 45px;
	font-weight: bold;
	color: #4682B4;
	cursor: pointer;
}

input {
	height: 50px;
	width: 440px;
	padding: 10px;
}

input:focus {
	border-color: #4682B4;
}

.pw_find_modal{
padding:5px;
}

.pw_id, .pw_email {
	height:30px;
	width:300px;
}
.give_pwd{
width:325px;
background-color:#4682B4;
color:#fff;
text-align:center;
border:1px solid #4682B4;
}

button {
	width: 465px;
	height: 50px;
	font-size: 20px;
	background-color: #4682B4;
	color: white;
	border: 1px solid #4682B4;
}

hr {
	width: 465px;
}

.low {
	position: relativce;
	width: 100%;
	text-align: center;
	margin-top: 5px;
}

.low span, em {
	font-size: 15px;
	color: gray;
	cursor: pointer;
}

.foot {
	margin-top: 20px;
	position: relativce;
	width: 100%;
	text-align: center;
}

.banner {
	margin-top: 0;
	position: relative;
	width: 550px;
	height: 170px;
	/* top: 50px; */
	margin: 0 auto;
	padding: 0;
	overflow: hidden;
}

.banner ul {
	position: absolute;
	margin: 0px;
	padding: 0;
	list-style: none;
}

.banner ul li {
	float: left;
	width: 550px;
	height: 175px;
	margin: 0;
	padding: 0;
}
 #my_modal {
        display: none;
        height:350px;
        width: 480px;
        padding: 10px 10px 10px 10px;
        background-color: #fefefe;
        border: 1px solid #888;
        border-radius: 3px;
        text-align:center;
    }

    #my_modal .modal_close_btn {
        position: absolute;
        top: 10px;
        right: 10px;
    }
</style>

</head>

<body>
	<section>
		<div class="title">
			<span class="title-name" onclick="location.href='http://localhost:8181/home/#0'">MIRAE
				SURF</span>
		</div>
		<div class="input">
			<input type="text" id="user_id" placeholder="아이디"><br>
			<br> <input type="password"  id="user_password" placeholder="비밀번호"><br>
			<br>
			<button id="login" onclick= "memberCheck();" style="cursor:pointer">로그인</button>
		</div>

		<div class="low">
			<hr>
			<span id="popup_open_btn">비밀번호를 잊으셨나요?</span> <em>|</em> <span onclick="location.href='term'">회원가입</span><br>
			<br>
			<br>
			<div id="my_modal">
			<span style="margin-top:10px; color:#4682B4; font-size:25px; font-weight:bold;">비밀번호 찾기</span>
			<div class="pw_find_modal" style="margin-top:30px;">
			<form>
			<input type='text' id="user_id2" placeholder='아이디를 입력하세요' ><br><br>
			<input type='email' id="user_email" placeholder='가입시 기재한 email 주소를 입력하세요'><br><br>
			<input type='button' class='give_pwd'  value='비밀번호 찾기' onclick="forgotPW()" style="cursor:pointer;">
			
			</form>
			</div>
			
			
                  
    <a class="modal_close_btn"><i class="fas fa-times-circle" style="color:#4682B4; cursor:pointer;"></i></a>
</div>
<script>
function enterkey() {
    if (window.event.keyCode == 13) {

        
         memberCheck();
    }
}


 function forgotPW() {
            	var user_id=$("#user_id2").val();
            	var user_email=$("#user_email").val();
            	$.ajax({
            		type : "POST",
            		url : "forgotPWChkm",
            		data : {
            			"user_id" : user_id,
            			"user_email" : user_email
            		}, success : function(data) {
            			if (data != 0) {
            				$.ajax({
            					type : "POST",
            					url : "forgotPW",
            					data : {
            						"user_id" : user_id,
            						"user_email" : user_email
            					}, success : function() {
            						alert("비밀번호를 이메일로 발송하였습니다.");
            						location.reload(true);
            					}
            				});
            			} else {
            				alert("존재하지 않는 회원입니다.");
            			}
            		}
            	});
            }
          	</script>
			
            <script src="resources/js/find-pwd.js"></script>
			
			
			<div class="banner">
				<ul>
					<li><img src="resources/img/Loginbanner1.png" width="550px"
						height="175px" onclick="window.open('https://shop.kt.com/')" style="cursor:pointer;"></li>
					<li><img src="resources/img/Loginbanner2.png" width="550px"
						height="175px" onclick="window.open('https://sulbing.com/main.php')" style="cursor:pointer;"></li>
					<li><img src="resources/img/Loginbanner3.png" width="550px"
						height="175px" onclick="window.open('http://www.mrhi.or.kr/')" style="cursor:pointer;"></li>
				</ul>
			</div>
		</div>
		<script src="resources/js/login-banner-slide.js"></script>
	</section>
</body>

<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>

</html>