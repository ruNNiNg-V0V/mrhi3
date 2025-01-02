<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Footer</title>
    <link rel="stylesheet" href="resources/css/include.css">
 <script>
 function openPopup(type) {
	    const url = "/biz/popup/" + type + ".jsp";
	    window.open(url, '_blank', 'width=600,height=400,scrollbars=yes');
	}
    </script>
</head>
<body>
    <div class="footer">
        <div class="top-section">
            <a href="#" onclick="openPopup('notice')">공지사항</a>
            <a href="#" onclick="openPopup('privacy')">개인정보처리방침</a>
            <a href="#" onclick="openPopup('terms')">서비스약관</a>
            <a href="#" onclick="openPopup('reject')">이메일무단수집거부</a>
        </div>
        <div class="bottom-section">
            <span><strong>회사명:</strong> (주)미래시네마</span>
            <span><strong>대표자:</strong> 나영화</span>
            <span><strong>사업자등록번호:</strong> 123-45-67890</span>
            <span><strong>통신판매업 신고번호:</strong> 제2024-서울성수-01234호</span>
            <span><strong>주소:</strong> 서울특별시 성수일로 123, 성수빌딩 4층</span>
            <span><strong>고객센터:</strong> 02-1234-5678 (운영시간: 09:00 ~ 18:00, 공휴일 제외)</span>
            <span><strong>이메일:</strong> support@miraecinema.com</span>
            <span>ⓒ 2024 MiraeCinema Co., Ltd. All Rights Reserved.</span>
        </div>
    </div>
</body>
</html>
