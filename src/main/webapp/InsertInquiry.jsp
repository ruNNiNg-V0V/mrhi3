<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
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
                    <div class="contentTitle">문의하기</div>
                </div>
                <div class="content">
                    <form action="insertInquiry.do" method="post" onsubmit="return validateForm();">
                        <table border="2" id="inquiry" style="height: 300px;">
                            <tr>
                                <th class="type">제목</th>
                                <td style="width: 67%;"><input type="text" name="title" placeholder="제목을 입력하세요" required></td>
                            </tr>
                            <tr>
                                <th class="type">분류</th>
                                <td>
                                    <select name="category">
                                        <option value="예매 관련">예매 관련</option>
                                        <option value="취소 관련">취소 관련</option>
                                        <option value="결제 관련">결제 관련</option>
                                        <option value="대관 문의">대관 문의</option>
                                        <option value="기타">기타</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th class="type">내용</th>
                                <td><textarea name="content" style="min-height: 200px;" placeholder="문의 내용을 입력하세요" required></textarea></td>
                            </tr>
                            <tr>
                                <th class="type">파일 업로드</th>
                                <td><input type="file" name="uploadFile"></td>
                            </tr>
                        </table>
                        <input type="submit" style="width: 100%; height: 100%; color: white; background-color: #122639; border: none; font-size: 16px; cursor: pointer;" value="등록하기" />
                    </form>
                    <small>※문의에 대한 답변은 등록하신 이메일로 보내 드립니다.</small>
                </div>
            </div>
        </div>
        <script>
            function validateForm() {
                const title = document.querySelector('input[name="title"]').value.trim();
                const content = document.querySelector('textarea[name="content"]').value.trim();
                
                if (title === "" || content === "") {
                    alert("제목과 내용을 모두 입력해 주세요.");
                    return false;
                }
                
                if (!confirm("등록하시겠습니까?")) {
                    return false;
                }
                
                alert("제출되었습니다!");
                return true;
            }
        </script>
        <!-- 공통 푸터 -->
        <jsp:include page="footer.jsp" />
    </div>
</body>
</html>
