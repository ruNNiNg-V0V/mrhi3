<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기 결과</title>
</head>
<body>
<h2>아이디 찾기 결과</h2>

<c:if test="${not empty foundId}">
   <p>회원님의 아이디는: ${foundId} 입니다.</p>
</c:if>

<a href="/login">로그인 페이지로 돌아가기</a><br/>
<a href="/member/findId">다시 시도하기</a> <!-- 다시 아이디 찾기로 돌아가기 -->
</body>
</html>
ml>