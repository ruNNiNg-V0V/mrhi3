<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>MIRAE CINEMA Login</title>
        <link rel="stylesheet" href="login.css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="main-container">
        <div class="main">
            <img src="resources/images/mainlogo.png" alt="미래시네마 로고">
        </div>
        <div class="main2">
            <img src="resources/images/mainlogo2.png" alt="미래시네마">
        </div>
        <form action="#" method="post">
            <fieldset>
                <div class="login-container">
                    <div class="input-group">
                        <img src="resources/images/user.svg" width="32" height="32" alt="사용자 아이콘">
                        <input type="text" placeholder="ID" name="id">
                    </div>
                    <div class="input-group">
                        <img src="resources/images/lock.svg" width="32" height="32" alt="잠금 아이콘">
                        <input type="password" placeholder="Password" name="pw">
                    </div>
                    <div class="submit-group">
                        <input type="submit" value="Login" class="btn">
                    </div>
                    <div class="link-group">
                        <a href="FindId.jsp" class="find-id">아이디 찾기</a>
                        <span>|</span>
                        <a href="FindPassword.jsp" class="find-pw">비밀번호 찾기</a>
                        <span>|</span>
                        <a href="register.jsp" class="register">회원가입</a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
