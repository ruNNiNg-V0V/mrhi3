<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container { width: 300px; margin: 0 auto; }
        .error { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <h2>아이디 찾기</h2>
        
        <form action="${contextPath}/member/findId" method="post">
            <div>
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div>
                <label for="email">이메일:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div>
                <button type="submit">아이디 찾기</button>
            </div>
        </form>

        <a href="login.do">로그인 페이지로 돌아가기</a>
    </div>
</body>
</html>
