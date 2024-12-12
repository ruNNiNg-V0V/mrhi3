<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>MIRAE SURF</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- <script src="resources/js/changeuser.js" charset="UTF-8"></script> -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/049a2474af.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


  <style>
.title{
text-align:center;
margin-top : 100px;
margin-bottom : 50px;
}
body { 
align:center;
line-height:2.5em;}
.title_name{
top : 10;
font-size:55px;
font-weight:bold;
color: #4682B4;
margin-top:20px;
}
.signup_div{

margin-left:700px;
font-size:20px;
}
input[type="text"],input[type="password"]{
width:450px;
height:30px;
padding:10px;
}
#btn-signup{
width:237.5px;
height:53px;
color:white;
background-color:#4682B4;
border: 1px solid #4682B4;
}
#signup_cancel{
width:237.5px;
height:53px;
color:white;
background-color:#FF4646;
border: 1px solid #FF4646;
cursor:pointer;
}
#user_addr_number{
width:350px;
}
#search_addr_number{
margin-left:5px;
width:100px;
height:51.5px;
color:white;
background-color: #4682B4;
border: 1px solid  #4682B4;
cursor:pointer;
}
em{
font-size:5px;
color:red;
font-style:normal;
}
   </style>
</head>


 <body>
 
 <div class='title'>
<span  class="title_name"  ><label>회원정보 수정</label></span>
</div>

<div class = 'signup_div' width="768px" height="1027px">
<form id="signup_form">

<label>*아이디</label><br>
<input type="text" class="input" value="${member.user_id}" disabled="disabled"><br><br>

<label>비밀번호</label><br>
<input type="password"  class="input" id="user_password"><br><label id="check_password1" style="font-size:15px;"></label><br>

<label>* 비밀번호 재확인</label><br>
<input type="password"  class="input" id="user_re_password"><br><label id="check_password2" style="font-size:15px;"></label><br>

<label>*이 름</label><br>
<input type="text" class="input" value="${member.user_name}" disabled="disabled"><br><br>

<label>생년월일</label><br>
<input type="text"  class="input" value="${member.user_birth }" disabled="disabled"><br><br>

<label>* 이메일</label><em> 비밀번호 찾기 시 이메일로 비밀번호가 발송됩니다.</em><br>
<input type="text"  class="input" id="user_email" placeholder="ex) 'mirae@naver.com'" oninput="checkEmail()"><br><label id="check_email" style="font-size:15px;" oninput="checkEmail()"></label><br>

<input type="button" id="signup_cancel" value="취소" onclick="cancel()">

<input type="button" id="btn-signup" onclick = "myinfoUp()" value="확인" style="cursor:pointer;">

</form>
</div>
  <script>
  var checkPWD = false;
  var checkBIRTH = false;
  var checkEMAIL = false;
  $(document).ready(function() {
  	$("#user_password").keyup(function() {
  		var regExpPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,50}$/;
  		var user_password = $("#user_password").val();
  		var checkText1 = $("#check_password1");
  		if(regExpPw.test(user_password) == false){
  			checkText1.text("최소 8자리의 최소 한개의 숫자 혹은 특수문자를 포함하여주세요.");
  			checkText1.css("color","red");
  		}else{
  			checkText1.css("color","green");
  			checkText1.text("사용가능한 비밀번호입니다.");
  		}
  	});	
  	
  	$("#user_re_password").keyup(function() {
  		var checkText2 = $("#check_password2");
  		if ($("#user_password").val() == "" || $("#user_re_password").val() == "") {
  			checkText2.css("color", "red");
  			checkText2.text("비밀번호를 입력해주세요.");
  			checkPWD = false;
  		} else if ($("#user_password").val() != $("#user_re_password").val()) {
  			checkPWD = false;
  			checkText2.text("비밀번호가 동일하지 않습니다.");
  			checkText2.css("color", "red");
  		}
  			else if ($("#user_password").val() == false){
  				checkText2.css("color", "red");
  				checkText2.text("비밀번호를 입력해주세요.");
  				checkPWD = false;
  		} else {
  			checkPWD = true;
  			checkText2.text("비밀번호가 동일합니다.");
  			checkText2.css("color", "green");
  		}
  	});
  })
  function checkEmail(){
  	var user_email = $("#user_email").val();
  	var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
  	var oMsg = $("#check_email");
  	
  	
  	if(regExpEm.test(user_email)==false){
  		checkEMAIL = false;
  		oMsg.css("color","red");
  		oMsg.text("잘못된 형식의 이메일 주소입니다.")
  	}
  	else{
  		oMsg.css("color","green");
  		oMsg.text("인증되었습니다.")
  		checkEMAIL = true;
  		return true;
  	}
  	
  	if(user_email==false){
  		oMsg.css("color","red");
  		oMsg.text("필수정보입니다.");
  		checkEMAIL = false;
  	}
  }
  function checkBirth(){
  	var user_birth = $("#user_birth").val();
  	var regExpbirth = /^\d{6}$/;
  	var oMsg = $("#check_birth");
  	
  	if(regExpbirth.test(user_birth) == false){
  		oMsg.css("color","red");
  		oMsg.text("주민등록번호 앞 6자리를 입력해주세요.");
  		checkBIRTH = false;
  		
  	}else{
  		oMsg.text("");
  		checkBIRTH = true;
  		return true;
  	}
  	
  	if(user_birth == false){
  		oMsg.css("color","red");
  		oMsg.text("필수정보입니다.");
  		checkBIRTH = false;
  	}
  }
  //회원정보 수정
  function myinfoUp() {
  	var user_id = '<c:out value = "${member.user_id}"/>';
  	var user_password = $("#user_password").val();
  	var user_email = $("#user_email").val();
  	var user_birth = $("#user_birth").val();
  	
  	if (checkPWD == false) {
  		console.log("비밀번호 다름");
  	}
  	if (checkPWD == false || checkEMAIL == false) {
  		swal("", "수정할 정보를 입력해주세요.", "warning");
  	} else {
  		swal({
  			icon : "warning",
  			text : "정말 수정 하시겠습니까?",
  			closeOnClickOutside : false,
  			closeOnEsc : false,
  			buttons : [ "돌아가기", "수정완료" ],
  		}).then(function(isConfirm) {
  			if (isConfirm) {
  				swal('수정 완료!', '정보수정이 완료되었습니다.', 'success').then(function(isConfirm) {
  					$.ajax({
  						type : "POST",
  						url : "changuser",
  						data : {
  							"user_id" : user_id,
  							"user_password" : user_password,
  							"user_email" : user_email,
  						},
  						success : function(data) {
  							alert("회원정보 수정을 완료하였으므로 다시 로그인을 해주세요");
  							$.ajax({
  								type : "GET",
  								url : "logout",
  								data : {},
  								success : function(data) {
  									location.reload(true);
  									window.location.href="login";
  								}
  							});
  						},
  						error : function(data) {
  							console.log(data);
  						}
  					});
  				});
  			}
  		})
  	}
  }
  	function cancel(){
  		var user_id = '<c:out value = "${member.user_id}"/>';
  		swal({
  		  title: "취소되었습니다.",
  		  icon: "error",
  		})
  		.then((value) => {
  			window.location.href = "mypage?user_id=" + user_id;
  		});
  	}
  </script>
 </body>
 <%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>