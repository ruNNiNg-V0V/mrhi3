<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
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
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
.name {
	margin:10px;
	
}
.list1 {
	color: #fff;
	font-family: 'Sunflower', sans-serif;
	background:#4682B4;
	border-top: 1px solid;
	border-bottom:1px solid;
	
}
.list2 {
	background: #fff;
	border-bottom:1px solid;
	border-color: #E1DCDC;
	font-family: 'Yeon Sung', cursive;
	font-size:16px;
}
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
.text {
	font-family: 'Yeon Sung', cursive;
	font-size:20px;
	background-color:#4682B4;
	width: 80px;
	height: 40px;
	border: 0px;
	outline: none;
	color: #fff;
}
.textb {
	border: 1px solid #8D8D8C;
	}
.write {
	background-color:#7FB3FA;
	width: 75px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.listp {
	background-color:#7FB3FA;
	width: 50px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.asd{
	position: relative;
	top:10px;
	left: 10px;
}
</style>

</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<div id="op">
	<b id="title">공지사항</b>
	</div>
<div style="width:100%; display:inline;">
		<button style="width:49%; height:60px; background-color:#4682B4; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='board'">공지사항</button>
		<button  style="width:50%; height:60px; background-color:#fff; color:#4682B4; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='question'">자주하시는 질문</button>
</div>
<div id="listLayout" style="width:100%; text-align:center;">
	<input type="hidden" id="curPage" value="${curPage }"/>
		<div style="display:inline-block; width:65%;" >
			<div style="float: right;">
			
			<!-- 검색했을 때 카운트-->
				<c:if test="${map.search eq 's'}">
					<c:choose>
						<c:when test="${map.count == 0 }">
						<span style="font-family: 'Sunflower', sans-serif;">공지사항이 없습니다. 검색을 다시 확인해주세요.&nbsp;</span>
						</c:when>
						<c:otherwise>
						<span style="font-family: 'Sunflower', sans-serif;">${map.count}개의 공지사항이 있습니다.&nbsp;</span>
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
			<br/>
			<table cellpadding="0" cellspacing="0" style="text-align:center;" width="100%">
				<tr height="50">
					<th class="list1" width="5%">번호</th>
					<th class="list1" width="55%">제목</th>
					<th class="list1" width="15%">글쓴이</th>
					<th class="list1" width="15%">날짜</th>
					<th class="list1" width="10%">조회</th>
				</tr>
				<c:forEach begin="0" end="${(fn:length(map.list))}" var="i">
					<c:set var="row" value="${map.list[i]}" />
						<input type="hidden" id="bno" name="bno" value="${row.bno}"/>
				
					<c:choose>
					<%-- 검색결과가 있을 때 --%>
					<c:when test="${not empty row}">
					<tr>
						<td class="list2">${row.bno}</td>
						<td  class="list2" style="text-align:left;"><a href="view?bno=${row.bno}&show=Y">${row.title}</a>
						<c:set var="admin" value="admin"/>
						<c:choose>
						<c:when test="${row.writer eq admin }">
						<td  class="list2" style="text-align:center;">관리자</td></c:when>
						<c:when test="${!empty row.writer }">
						<td  class="list2" style="text-align:center;">${row.writer}</td></c:when>
						</c:choose>
						<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd" var="regdate" />		
						<td class="list2">${regdate}</td>
						<td class="list2">${row.viewcnt}</td>
					</tr>
					</c:when>
					<%-- 검색결과가 없을 떄 --%>
					<c:when test="${map.count == 0}">
					<tr style="text-align:center;"><td colspan='5' size="30px">
					<b style="color: red; font-size:30px;">'${keyword}'</b> 에 대한 검색결과가 없습니다.
					</td></tr>
					</c:when>
					</c:choose>
				</c:forEach>
			</table>
			<br />
			<br />
			
			<!-- 페이지 네비게이션 출력 -->
			<div align="center">
				<c:if test="${map.pager.curBlock > 1}">
					<a href="board?curPage=1
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[처음]</a>
				</c:if>
				<c:if test="${map.pager.curBlock > 1}">
					<a href="board?curPage=${map.pager.prevPage}
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
							<a href="board?curPage=${num}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">${num}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			<!-- 검색 조건 뷰 -->
			<form action="board" class="boardsearch">
					<select name="searchOption" id="searchOption">
						<option value="ALL" <c:out value="${map.searchOption=='ALL'?'selected':''}"/> >제목+이름+내용</option>
						<option value="TITLE" <c:out value="${map.searchOption=='TITLE'?'selected':''}"/> >제목</option>
						<option value="WRITER" <c:out value="${map.searchOption=='WRITER'?'selected':''}"/> >이름</option>
						<option value="CONTENT" <c:out value="${map.searchOption=='CONTENT'?'selected':''}"/> >내용</option>
					</select> 
				<input type="text" name="keyword" placeholder="검색어 입력" id="keyword" value="${keyword}">
				<input type="hidden" name="search" id="search" value="s"/>
				<input type="submit" class="check2" value="조회"/>
				<!-- 관리자일 때 -->
				<div id="registerNotice" style="float:right;">
				<c:if test="${member.user_id eq 'admin'}">
					<button type="button" class="text" onClick="location.href='registerNotice'" style="font-size:15px; width: 75;
	font-size:15px;
	font-family: 'Sunflower', sans-serif;
	background-color:#4682B4;
	width: 50px;
	height: 28px;
	border: 0px;
	outline: none;
	color: white;
	cursor:pointer; " ><i class="far fa-edit"></i></button>
				</c:if>
				</div>
			</form>				
				<c:if test="${map.pager.curBlock < map.pager.totBlock}">
					<a href="board?curPage=${map.pager.nextPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[다음]</a>
				</c:if>
				<c:if test="${(map.pager.totPage > 5) && 
				(map.pager.totPage != map.pager.curPage)}">
					<a href="board?curPage=${map.pager.totPage}
							&searchOption=${searchOption}&keyword=${keyword}
							&search=${search}">[끝]</a>
				</c:if>
			</div>
		</div>
		</div>
</body>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>