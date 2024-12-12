<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>MIRAE SURF</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="resources/js/signup.js" charset="UTF-8"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://kit.fontawesome.com/049a2474af.js"
crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


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
.btn-signup{
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
<span  class="title_name" onclick="location.href='http://localhost:8181/home/#0'" style="cursor:pointer;">MIRAE SURF</span>
</div>

<div class = 'signup_div' width="768px" height="1027px">
<form id="signup_form">

<label>아이디</label><br>
<input type="text" id="user_id" oninput="idChk()"><br><label id="check_id" style="font-size:15px;"></label><br>
<label>비밀번호</label><br>
<input type="password" id="user_password"><br><label id="check_password1" style="font-size:15px;"></label><br>
<label>* 비밀번호 재확인</label><br>
<input type="password" id="user_re_password"><br><label id="check_password2" style="font-size:15px;"></label><br>
<label>이 름</label><br>
<input type="text" id="user_name" oninput="checkName()"><br><label id="check_name" style="font-size:15px;"></label><br>
<label>생년월일</label><br>
<input type="text" id="user_birth" oninput="checkBirth()" placeholder="ex) '960410' "><br><label id="check_birth" style="font-size:15px;"></label><br>
<label>연락처</label><br>
<input type="text" id="user_tel" placeholder="ex) '01012345678'" oninput="checkTel()"><br><label id="check_tel" style="font-size:15px;"></label><br>
<label>* 이메일</label><em> 비밀번호 찾기 시 이메일로 비밀번호가 발송됩니다.</em><br>
<input type="text" id="user_email" placeholder="ex) 'mirae@naver.com'" oninput="checkEmail()"><br><label id="check_email" style="font-size:15px;"></label><br>
<label>주 소</label><br>
<input type="text" id="user_addr_number" placeholder="우편번호" readonly><input type="button" id="search_addr_number" value="우편번호 찾기" onclick="searchPost()"><br><br>
<input type="text" id="user_addr" placeholder="기본주소" readonly><br><br>
<input type="text" id="user_detail_addr" placeholder="나머지주소" oninput="checkAddr()"><br><br>
<input type="button" id="signup_cancel" value="취소" onclick="location.href='term'"><input type="button" class="btn-signup" onclick = "Signup()" value="회원가입" style="cursor:pointer;">

</form>
</div>
  
 </body>
 <%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>