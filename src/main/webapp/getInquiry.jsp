<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세</title>
<link rel="stylesheet" href="resources/css/include.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script src="resources/js/inquiry.js"></script>

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
                    <div class="contentTitle">문의내용</div>
                </div>
                <div class="content">
                    <form action="updateInquiry.do" method="post">
                        <input id="seq" name="seq" type="hidden" value="${inquiry.seq}" />
                        <table border="2" id="inquiry" style="height: 300px;">
                            <tr>
                                <th class="type">제목</th>
                                <td><input name="title" type="text" value="${inquiry.title}" /></td>
                            </tr>
                            <tr>
                                <th class="type">조회수</th>
                                <td>${inquiry.cnt}</td>
                            </tr>
                            <tr>
                                <th class="type">작성자 ID</th>
                                <td>${inquiry.qid}</td>
                            </tr>
                            <tr>
                                <th class="type">분류</th>
                                <td><input type="hidden" id="category" value="${inquiry.category}" />${inquiry.category}</td>
                            </tr>
                            <tr>
                                <th class="type">내용</th>
                                <td><textarea name="content" style="min-height: 200px;">${inquiry.content}</textarea></td>
                            </tr>
                            <tr>
                                <th class="type">등록일</th>
                                <td>
                                    <fmt:formatDate value="${inquiry.createdAt}" pattern="yyyy-MM-dd" />
                                </td>
                            </tr>
                        </table>
                    </form>
                    <hr>
                    <div style="text-align: center;">
                        <style>
                        .qnaBoardBtn {
                            width: 30%;
                            height: 50%;
                            cursor: pointer;
                            color: white;
                            background-color: #122639;
                        }
                        </style>
                        <button class="qnaBoardBtn" onclick="updateInquiry()">글수정</button>
                        &nbsp;&nbsp;&nbsp;
                        <button class="qnaBoardBtn" onclick="confirmBtn('삭제하시겠습니까?', 'deleteInquiry.do?seq=${inquiry.seq}');">글삭제</button>
                        &nbsp;&nbsp;&nbsp;
                        <button class="qnaBoardBtn" onclick="window.location.href='getInquiryList.do';">글목록</button>
                    </div>
                </div>
            </div>
        </div>
		<!-- 팝업 -->
        <jsp:include page="alertAndConfirmPopup.jsp"></jsp:include>
        <!-- 공통 푸터 -->
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
