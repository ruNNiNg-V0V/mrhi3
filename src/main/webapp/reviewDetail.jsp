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
<link rel="stylesheet" href="resources/css/alert.css">
</head>
<body>
	<%request.setCharacterEncoding("UTF-8");%>
	<div class="body1">
		<!-- 헤더 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 메인 -->
		<div class="main">
			<!-- 공통 사이드바 -->
			<jsp:include page="sidebar.jsp" />


			<!-- 콘텐츠 -->
			<div class="box3">
				<div class="contentTitleWrapper">
					<div class="contentTitle">나의 후기</div>
				</div>
				<div class="content">
					<form method="POST" action="reviewUpdate.do" id="reviewForm">
						<table id="review">
							<thead>
								<th>영화명</th>
								<th width="40%">내용</th>
								<th>작성시간</th>
								<th>수정/뒤로가기</th>
							</thead>
							<tr>
								<td>${inReview.rmvname }<input type="hidden" name="rmvname"
									value="${inReview.rmvname }"></td>
								<td width="40%"><textarea style="resize: none;" rows="17"
										maxlength="200" name="coment" placeholder="최대 200자">${inReview.coment }</textarea></td>
								<td>${inReview.rtime }<input type="hidden" name="rtime"
									value="${inReview.rtime }"></td>
								<td>
									<button id="update" type="button" class="confirmBtn"
										onclick="showCustomAlert('후기를 수정했습니다')">수정</button>
									<button id="back" class="confirmBtn"
										onclick="event.preventDefault(); location.href='review.do?'">뒤로</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- 하단 고정 영역 -->
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- Alert 팝업 -->
	<jsp:include page="alert.jsp"></jsp:include>
</body>
</html>
