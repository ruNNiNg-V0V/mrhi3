<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- 후기내역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의후기</title>
<link rel="stylesheet" href="resources/css/mypage.css">
<link rel="stylesheet" href="resources/css/include.css">
</head>
<body>
<%request.setCharacterEncoding("UTF-8");%>
	<div class="body1">
		<!-- 헤더 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 메인 -->

		<div class="main">

			<div class="main">
				<!-- 공통 사이드바 -->
				<jsp:include page="sidebar.jsp" />


				<!-- 콘텐츠 -->
				<div class="box3">
					<div class="contentTitleWrapper">
						<div class="contentTitle">나의 후기</div>
					</div>
					<%-- <jsp:include page="reviewContent.jsp"> --%>
					<div class="content">
						<table id="review">
							<thead>
								<th>영화명</th>
								<th width="40%">내용</th>
								<th>작성시간</th>
								<th>수정/삭제하기</th>
							</thead>
						</table>
						<c:forEach items="${review }" var="theReview" >
							<form action="reviewDetail.do" method="POST" accept-charset="UTF-8">
							<table id="review">
								<tr>
									<td><input type="text" name="rmvname"
										value="${theReview.rmvname }" readonly></td>
									<td width="40%"><input type="text" name="coment"
										value="${theReview.coment }" readonly></td>
									<td><input type="text" name="rtime"
										value="${theReview.rtime }" readonly></td>
									<td><button type="submit" class="confirmBtn">수정</button>
										<button id="back" class="confirmBtn" onclick="event.preventDefault(); 
										location.href='reviewDelete.do?rmvname=${theReview.rmvname}&rtime=${theReview.rtime}'">삭제</button></td>
								</tr>
							</table>
							</form>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 하단 고정 영역 -->
			<jsp:include page="footer.jsp"></jsp:include>
		</div>
</body>
</html>
