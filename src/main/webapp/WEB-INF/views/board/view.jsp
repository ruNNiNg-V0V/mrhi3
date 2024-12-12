<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">

<script>
	// 게시물 삭제 확인
	function deleteB() {
		swal({
			 icon: "warning",
			 text: "정말 공지사항을 삭제하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["취소", "삭제"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('삭제 완료','공지사항을 삭제했습니다.','success').then(function(isConfirm)
			   		{
						location.href='delete?bno='+${board.bno};
			    	});
			  }
			})
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
view {
	table-layout: fixed;
	#E1DCDC
}
.simpleView { 
    border-collapse: collapse; 
    border-spacing: 0px;
}

.a {
	border-top: 2px solid #4682B4;
	border-bottom: 1px dashed #4682B4;
}
.b {
	border-bottom: 2px solid #4682B4;
	border-top: 1px dashed #4682B4;
}
.tdS {
	width: 100px;
}
.previous {
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	background-color:#4682B4;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.previous:hover {
	color: black;
}
.next {
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	background-color:#4682B4;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.next:hover {
	color: black;
}
#list_btn {
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	background-color:#4682B4;
	width: 50px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
#list_btn:hover{
color:black;
}
.adjust {
	border: 1px solid #4682B4;
}
#update {
	font-family: 돋움;
	background-color:#708090;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
#update:hover {
	color: #483d8b;
}
</style>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<div id="op">
	<b id="title">공지사항</b>
	</div>
<center>
	<div style="width:800px;">
		
		<script>
		$("#list_btn").click(function(){
			self.location="board?"
					+ "searchOption=${searchOption}&keyword=${keyword}"
					+ "&search=${search}&curPage=${curPage}";
		});
		</script>
		
		<br/><br/>
	<form>
		<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
		<input type="hidden" name="bno" value="${board.bno}">
		<table border="1" bordercolor="#AAB9FF" class="view" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70" style="text-align:center;">제목</td>
			<td colspan='3' align="left">&nbsp;${board.title}</td>
			</tr>
				
			<tr>
			<td style="text-align:center;">글쓴이</td>
			<td colspan='3' align="left">&nbsp;${board.writer}</td>
			</tr>
				
			<tr>
			<td style="text-align:center;">날짜</td>
			<td colspan='3' align="left">
			<div style="width:240px;float:left;">&nbsp;
			<fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" var="regdate" />
			${regdate}  
			</div>
			<div>
			|&nbsp;&nbsp;&nbsp;조회수 :  ${board.viewcnt}
			</div>
			</td>
			</tr>
				
			<tr valign="top">
			<td colspan='4' height="500px">&nbsp;${board.content}</td>
			</tr>
		</table>
	</form>
	<div style="margin-top: 10px; margin-bottom:20px;">
	<div align="center" style="float:left; ">
			<c:if test="${map.previousB != null}">
			<button class="previous" onClick="location.href='view?bno=${map.previousB.bno}&show=Y'">이전글</button>
			</c:if>
			<c:if test="${map.nextB != null}">
			<button class="next" onClick="location.href='view?bno=${map.nextB.bno}&show=Y'">다음글</button>
			</c:if>
		</div>

		<div style="float:right;">
		<!-- 관리자만 수정,삭제 버튼 표시 -->
		<c:if test="${member.user_id eq 'admin'}">
			<button type="button" id="list_btn" onClick="location.href='updateNotice'">수 정</button>&nbsp;&nbsp;&nbsp;
			<button type="button" id="list_btn" onClick="deleteB()">삭 제</button>&nbsp;&nbsp;&nbsp;
		</c:if>
		
		<button type="button" id="list_btn" onClick="location.href='board'">목 록</button>
		</div>
		</div>
		</div>

	
	
	<br/><br/><br/>
	<!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
	<div align="center">
		<table class="simpleView" width="800">
			<c:if test="${map.previousB != null}">
			<tr class="a">
				<td onClick="location.href='view?bno=${map.previousB.bno}&show=Y'"
				style="cursor: pointer">이전글</td>
				<td onClick="location.href='view?bno=${map.previousB.bno}&show=Y'"
				style="cursor: pointer;width:400px;">${map.previousB.title}</td>
				<td class="tdS">${map.previousB.writer}</td><td class="tdS">${map.previousB.regdate}</td>
			</tr>
			</c:if>
			<c:if test="${map.nextB != null}">
			<tr class="b">
				<td onClick="location.href='view?bno=${map.nextB.bno}&show=Y'"
				style="cursor: pointer">다음글</td>
				<td  onClick="location.href='view?bno=${map.nextB.bno}&show=Y'" 
				style="cursor: pointer;width:400px;">${map.nextB.title}</td>
				<td class="tdS">${map.nextB.writer}</td><td class="tdS">${map.nextB.regdate}</td>
			</tr>
			</c:if>
		</table>
	</div>
</center>
<%@ include file="../include/cs_info.jsp" %>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
</body>
</html>