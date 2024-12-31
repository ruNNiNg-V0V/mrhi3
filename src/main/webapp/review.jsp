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
<link rel="stylesheet" href="resources/css/confirm.css">
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
									<td><input type="text" name="rmvname" id="rmvname"
										value="${theReview.rmvname }" readonly></td>
									<td width="40%"><input type="text" name="coment" id="coment"
										value="${theReview.coment }" readonly></td>
									<td><input type="text" name="rtime" id="rtiem"
										value="${theReview.rtime }" readonly></td>
									<td><button type="submit" class="confirmBtn">수정</button>
										<button id="delete" type="button" class="confirmBtn" onclick="event.preventDefault(); 
										showCustomConfirm('이 작업은 되돌릴 수 없습니다.<br><div id=\'red\'>리뷰를 삭제하시겠습니까?</div>', '${theReview.rmvname}', '${theReview.rtime}')">삭제</button>
	
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
		<!-- Confirm 팝업 -->
    	<jsp:include page="confirm.jsp"></jsp:include>
    </div>
</body>
</html>
