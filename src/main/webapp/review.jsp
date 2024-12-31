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
    <tbody>
        <c:forEach items="${review}" var="theReview">
            <tr>
<tr>
    <td>
        <div class="rmvname">${theReview.rmvname}</div>
        <input type="hidden" name="rmvname" value="${theReview.rmvname}" form="reviewForm_${theReview.rtime}">
    </td>
    <td width="40%">
        <div class="coment">${theReview.coment}</div>
        <input type="hidden" name="coment" value="${theReview.coment}" form="reviewForm_${theReview.rtime}">
    </td>
    <td>
        <div>${theReview.rtime}</div>
        <input type="hidden" name="rtime" value="${theReview.rtime}" form="reviewForm_${theReview.rtime}">
    </td>
    <td>
        <form id="reviewForm_${theReview.rtime}" action="reviewDetail.do" method="POST">
            <button type="submit" class="confirmBtn">수정</button>
        </form>
        <button id="delete" type="button" class="confirmBtn" onclick="event.preventDefault(); 
        showCustomConfirm('이 작업은 되돌릴 수 없습니다.<br><div id=\'red\'>리뷰를 삭제하시겠습니까?</div>', '${theReview.rmvname}', '${theReview.rtime}')">삭제</button>
    </td>
</tr>

        </c:forEach>
    </tbody>
</table>

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
