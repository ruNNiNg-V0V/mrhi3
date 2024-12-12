<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MIRAE SURF</title>
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<style>
body,html {
line-height:3em;
 height: 100%;
 margin: 0;
}
#title {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}
#op{
background-image:url("resources/img/op.jpg");
height:200px;
padding-top:80px;
padding-left:10px;
opacity:0.8;
}
.tit1{
font-family: 'Yeon Sung', cursive;
font-size: 50px;
color: #4682B4;
text-align: center;
margin-top: 50px;
}
#div1{
text-align: center;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
    <div id="op">
	<b id="title">협력업체</b>
	</div>
	
	 <div>
        <div id="div1">
<div>

<h2 class="tit1">업무협약</h2>
<br>
<a href="http://www.hanseohospital.or.kr/" target="_blank"><img src="resources/img/cooperator/업무협약1.PNG" border="0"></a>
<a href="http://rsmu.apartner.co.kr/" target="_blank"><img src="resources/img/cooperator/업무협약2.PNG" border="0"></a>
<a href="http://www.hf.go.kr" target="_blank"><img src="resources/img/cooperator/업무협약3.PNG" border="0"></a>
<a href="http://pec.bestbz.com" target="_blank"><img src="resources/img/cooperator/업무협약4.PNG" border="0"></a>

<br><br>
<br>


<h2 class="tit1">제휴업체</h2>
<br>
<a href="http://cafe.naver.com/jogym" target="_blank"><img src="resources/img/cooperator/제휴업체1.PNG" border="0"></a>
<a href="http://cafe.naver.com/crossfitk" target="_blank"><img src="resources/img/cooperator/제휴업체2.PNG" border="0"></a>
<a href="http://www.silla.ac.kr/" target="_blank"><img src="resources/img/cooperator/제휴업체3.PNG" border="0"></a>
<a href="http://www.jaseng.co.kr/" target="_blank"><img src="resources/img/cooperator/제휴업체4.PNG" border="0"></a>
<a href="http://www.iloveeye.com?/" target="_blank"><img src="resources/img/cooperator/제휴업체5.PNG" border="0"></a>
<a href="http://www.samsun.or.kr" target="_blank"><img src="resources/img/cooperator/제휴업체6.PNG" border="0"></a>

<br>
<br><br>


<h2 class="tit1">숙박업체</h2>
<br>
<a href="http://www.mayaguesthousekorea.com/" target="_blank"><img src="resources/img/cooperator/숙박업체1.PNG" border="0"></a>
<a href="http://www.glory.co.kr" target="_blank"><img src="resources/img/cooperator/숙박업체2.PNG" border="0"></a>
<a href="http://www.arpina.co.kr/" target="_blank"><img alt="아르피나호텔" src="resources/img/cooperator/숙박업체3.PNG" border="0"></a>
<a href="https://b-songjeong.wnhotels.com/" target="_blank"><img alt="브라운도트호텔" src="resources/img/cooperator/숙박업체4.PNG" border="0"></a>


</div>
</div>
</div>
</body>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>