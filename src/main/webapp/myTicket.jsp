<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매확인</title>
<link rel="stylesheet" href="resources/css/mypage.css">
<link rel="stylesheet" href="resources/css/include.css">
<script src="resources/js/alertConfirmPopup.js"></script>
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
                    <div class="contentTitle">예매확인/취소</div>
                </div>
                <div class="content">
                    <table id="booking">
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>영화명</th>
                                <th>관람일시</th>
                                <th>좌석번호</th>
                                <th>매수</th>
                                <th>취소하기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ticket" items="${tickets}">
                                <tr>
                                    <td>${ticket.tcode}</td>
                                    <td>${ticket.tmvname}</td>
                                    <td>${ticket.mvstart}</td>
                                    <td>${ticket.seet}</td>
                                    <td>${ticket.ttime}</td>
                                    <td>
                                        <button id="cancel" class="confirmBtn" onclick="cancelTicket('${ticket.rnum}', '${ticket.seet}', '${ticket.ttime}')">취소</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- 팝업 -->
        <jsp:include page="alertAndConfirmPopup.jsp"></jsp:include>
        <!-- 공통 푸터 -->
        <jsp:include page="footer.jsp" />
    </div>

<script>
function cancelTicket(rnum, seet, ttime) {
    event.preventDefault();
    showCustomConfirm('예매를 취소하시겠습니까?', false, function(result) {
        if (result) {
            location.href = 'ticketCancel.do?rnum=' + rnum + '&seet=' + seet + '&ttime=' + ttime;
        }
    });
}
</script>

</body>
</html>
