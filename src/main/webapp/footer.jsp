<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <link rel="stylesheet" href="resources/css/footer.css">
    <script>
        function showPopup(type) {
            const popup = document.getElementById('popup');
            const popupContent = document.getElementById('popup-content');

            // 모든 내용을 숨기고 특정 내용을 포함
            popupContent.innerHTML = ''; // 기존 내용 비우기
            popupContent.innerHTML = `<jsp:include page="${type}.jsp" />`;
            popup.style.display = 'flex';
        }

        function hidePopup() {
            const popup = document.getElementById('popup');
            popup.style.display = 'none';
        }
    </script>
</head>
<body>
    <div class="footer">
        <div class="top-section">
            <a href="#" onclick="showPopup('notice')">공지사항</a>
            <a href="#" onclick="showPopup('privacy')">개인정보처리방침</a>
            <a href="#" onclick="showPopup('terms')">서비스약관</a>
            <a href="#" onclick="showPopup('reject')">이메일무단수집거부</a>
        </div>
        <div class="bottom-section">
            <span>© 2024 MiraeCinema Co., Ltd.</span>
        </div>
        <div class="footer-info">
            <p><strong>회사명:</strong> (주)미래시네마</p>
            <p><strong>대표자:</strong> 나영화</p>
            <p><strong>사업자등록번호:</strong> 123-45-67890</p>
            <p><strong>통신판매업 신고번호:</strong> 제2024-서울성수-01234호</p>
            <p><strong>주소:</strong> 서울특별시 성수일로 123, 성수빌딩 4층</p>
            <p><strong>고객센터:</strong> 02-1234-5678 (운영시간: 09:00 ~ 18:00, 공휴일 제외)</p>
            <p><strong>이메일:</strong> support@miraecinema.com</p>
            <p>ⓒ 2024 MiraeCinema Co., Ltd. All Rights Reserved.</p>
        </div>
    </div>

    <!-- 팝업 영역 -->
    <div id="popup" class="popup" style="display: none;">
        <div class="popup-content" id="popup-content">
            <!-- jsp:include로 내용을 동적으로 포함 -->
        </div>
        <span class="close" onclick="hidePopup()">&times;</span>
    </div>
</body>
</html>
