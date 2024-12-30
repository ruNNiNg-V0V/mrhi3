<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<link rel="stylesheet" href="resources/css/mypage.css">
<link rel="stylesheet" href="resources/css/include.css">
</head>
<body>
	<div class="body1">
		<!-- 공통 헤더 -->
		<jsp:include page="header.jsp" />

		<div class="main">
			<!-- 공통 사이드바 -->
			<jsp:include page="sidebar.jsp" />

			<!-- 콘텐츠 -->
			<div class="box3">
				<div class="contentTitleWrapper">
					<div class="contentTitle">문의게시판</div>
				</div>
				<div class="content">
					<!-- 게시글 목록 -->
					<table id="qna" style="width: 100%;">
					<thead>
						<tr>
							<th>번호</th>
							<th>분류</th>
							<th>제목</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${inquiryList}" var="inquiry">
							<tr>
								<td>${inquiry.seq}</td>
								<td>${inquiry.category}</td>
								<td align="left">
									<a href="getInquiry.do?seq=${inquiry.seq}" style="text-decoration: none; color: #122639;">
										${inquiry.title}
									</a>
								</td>
								<td>
									<fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd" />
								</td>
								<td>${inquiry.cnt}</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<!-- 공통 푸터 -->
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
