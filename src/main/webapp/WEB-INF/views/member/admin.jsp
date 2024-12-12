<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap"
	rel="stylesheet">
	<link
	href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap"
	rel="stylesheet">
      <style>
body,
html {
  height: 100%;
  margin: 0;
  line-height:3em;
}

.container {
  position: relative;
  height: 100%;
  width: 100%;
  left: 0;
  -webkit-transition: left 0.4s ease-in-out;
  -moz-transition: left 0.4s ease-in-out;
  -ms-transition: left 0.4s ease-in-out;
  -o-transition: left 0.4s ease-in-out;
  transition: left 0.4s ease-in-out;
}

.container.open-sidebar { left: 240px; margin:0; }

.swipe-area {
  position: absolute;
  margin:0;
  width: 50px;
  left: 0;
  top: 0;
  height: 100%;
  background: #f3f3f3;
  z-index: 0;
}

#sidebar {
  background: #4682B4;
  position: absolute;
  width: 240px;
  height: 100%;
  left: -240px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

#sidebar ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

#sidebar ul li { margin: 0; }

#sidebar ul li a {
font-family: 'Sunflower', sans-serif;
  padding: 15px 20px;
  font-size: 20px;
  font-weight: bold;
  color: white;
  text-decoration: none;
  display: block;
  border-bottom: 1px solid #4682B4;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  -ms-transition: background 0.3s ease-in-out;
  -o-transition: background 0.3s ease-in-out;
  transition: background 0.3s ease-in-out;
}

#sidebar ul li a:hover{
color:black;
}

.main-content {
  width: 100%;
  height: 100%;
  padding: 10px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  position: relative;
}

.main-content .content {
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  padding-left: 60px;
  width: 100%;
}

.main-content .content h1 { font-weight: 100; }

.main-content .content p {
  width: 100%;
  line-height: 160%;	
}

.main-content #sidebar-toggle {
  background: #4682B4;
  border-radius: 3px;
  display: block;
  position: relative;
  padding: 10px 7px;
  float: left;
}

.main-content #sidebar-toggle .bar {
  display: block;
  width: 18px;
  margin-bottom: 3px;
  height: 2px;
  background-color: #fff;
  border-radius: 1px;
}

.main-content #sidebar-toggle .bar:last-child { margin-bottom: 0; }

.check2 {
	width: 75;
	font-size:15px;
	font-family: 'Sunflower', sans-serif;
	background-color:#4682B4;
	width: 50px;
	height: 28px;
	border: 0px;
	outline: none;
	color: white;
	cursor:pointer;
}

.check2:hover{
color:black;
}
#searchOption {
	font-family: 'Yeon Sung', cursive;
	font-size:15px;
	height: 25px;
	width: 125px;
	margin: 10px;
	border: 1px solid #4682B4;
	background: #ffffff;
	height: 25px;
}
#keyword {
	font-family: 'Yeon Sung', cursive;
	font-size:15px;
	border: 1px solid #4682B4;
	background: #ffffff;
	height: 25px;
}
.list {
	background: #fff;
	border-bottom:1px solid;
	border-color: #E1DCDC;
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	  
<div class="container">
        <div id="sidebar">
          <ul>
            <li><a onclick="location.href='admin'" style="cursor:pointer;">회원현황</a></li>
            <li><a onclick="location.href='admin2'" style="cursor:pointer;">예약현황</a></li>
            <li><a onclick="location.href='registerNotice'" style="cursor:pointer;">공지사항</a></li>
          </ul>
        </div>
        <div class="main-content">
          <div class="swipe-area"></div>
          <a href="#" data-toggle=".container" id="sidebar-toggle"> <span class="bar"></span> <span class="bar"></span> <span class="bar"></span> </a>
          <div class="content">
        <%--   <div style="float: left	;">
			
			<!-- 검색했을 때 카운트-->
				<c:if test="${map.search eq 's'}">
					<c:choose>
						<c:when test="${map.count == 0 }">
						<span style="font-family: 'Sunflower', sans-serif;">회원이 없습니다.&nbsp;</span>
						</c:when>
						<c:otherwise>
						<span style="font-family: 'Sunflower', sans-serif;">${map.count}명의 회원이 있습니다.&nbsp;</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div> --%>
		  <table cellpadding="0" cellspacing="0" align="center" width="1200" style="margin-top:30px;" >
		<tr align="center" colspan="8">
			<th colspan="8"><p style="font-size:40px;  font-family: 'Sunflower', sans-serif; color: #4682B4;">회원현황</p></th>
		</tr>
		<tr bgcolor="#4682B4" align="center" style="color:#fff; font-family: 'Yeon Sung', cursive; font-size:22px; border:2px solid #4682B4" >
			<td>번호</td>
			<td>이름</td>
			<td>아이디</td>
			<td>생년월일</td>
			<td>연락처</td>
			<td>이메일</td>
			<td>주소</td>
			<td>가입일</td>
		</tr>
			<c:forEach begin="0" end="${(fn:length(map.memberList))}" var="i">
					<c:set var="row" value="${map.memberList[i]}" />
					<c:choose>
						
						<c:when test="${!empty row}">
							<tr bgcolor="#fff" height="50" style="font-family: 'Yeon Sung', cursive; font-size:20px;">
								<td align="center" class="list" >${row.user_num }</td>
								<td align="center" class="list" >${row.user_name }</td>
								<td align="center" class="list" >${row.user_id}</td>
								<fmt:parseDate value="${row.user_birth}" pattern="yyMMdd" var="user_birth" />
								<fmt:formatDate value="${user_birth}" pattern="yyyy-MM-dd" var="user_birth" />
								<td align="center" class="list" >${user_birth }</td>
								<td align="center" class="list" >${row.user_tel }</td>
								<td align="center" class="list" >${row.user_email }</td>
								<td align="center"  class="list">${row.user_addr }</td>
								<fmt:formatDate value="${row.user_join}" pattern="yyyy-MM-dd" var="user_join" />
								<td align="center" class="list">${user_join }</td>
							</tr>
						</c:when>
						
					<c:when test = "${map.count == 0}">
							<tr style="text-align: center;">
								<td colspan='10'><b>회원내역이 없습니다.</b></td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
		</table>

		
		<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="admin?curPage=1
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="admin?curPage=${map.pager.prevPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[이전]</a>
				</c:if>

				<c:forEach var="num" begin="${map.pager.blockBegin}" 
							end="${map.pager.blockEnd}">
					<c:choose>
						<c:when test="${num == map.pager.curPage}">
							<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
							<span style="color:red; font-weight:bold;">${num}</span>
						</c:when>
						
						<c:otherwise>
							<a href="admin?curPage=${num}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<!-- 검색 조건 뷰 -->
			<form action="admin" class="membersearch">
					<select name="searchOption" id="searchOption">
						<option value="ALL" <c:out value="${map.searchOption=='ALL'?'selected':''}"/> >아이디+이름</option>
						<option value="USER_ID" <c:out value="${map.searchOption=='USER_ID'?'selected':''}"/> >아이디</option>
						<option value="USER_NAME" <c:out value="${map.searchOption=='USER_NAME'?'selected':''}"/> >이름</option>
						
					</select> 
				<input type="text" name="keyword" placeholder="검색어 입력" id="keyword" value="${keyword}">
				<input type="hidden" name="search" id="search" value="s"/>
				<input type="submit" class="check2" value="조회"/>
		</form>
          </div>
        </div>
</div>

	  
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script src="http://www.blueb.co.kr/SRC2/swipemenu/jquery.touchSwipe.min.js"></script> 

<script>
$(window).load(function(){
$("[data-toggle]").click(function() {
  var toggle_el = $(this).data("toggle");
  $(toggle_el).toggleClass("open-sidebar");
});
 $(".swipe-area").swipe({
	  swipeStatus:function(event, phase, direction, distance, duration, fingers)
		  {
			  if (phase=="move" && direction =="right") {
				   $(".container").addClass("open-sidebar");
				   return false;
			  }
			  if (phase=="move" && direction =="left") {
				   $(".container").removeClass("open-sidebar");
				   return false;
			  }
		  }
  }); 
});
</script>

</body>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>