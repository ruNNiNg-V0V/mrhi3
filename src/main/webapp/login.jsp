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
        <header class="header">
            <div class="logo">
                <img src="images/sidelogo.png" alt="사이드 로고">
            </div>
            <div class="nav">
                <div><a href="#">Home</a></div>
                <div><a href="#">Mypage</a></div>
                <div><a href="#">Login</a></div>
            </div>
        </header>
        <div class="main-container">
        <div class="main">
            <img src="images/mainlogo.png" alt="미래시네마 로고">
        </div>
        <div class="main2">
            <img src="images/mainlogo2.png" alt="미래시네마">
        </div>
        <form action="#" method="post">
            <fieldset>
                <div class="login-container">
                    <div class="input-group">
                        <img src="images/user.svg" width="32" height="32" alt="사용자 아이콘">
                        <input type="text" placeholder="ID" name="username">
                    </div>
                    <div class="input-group">
                        <img src="images/lock.svg" width="32" height="32" alt="잠금 아이콘">
                        <input type="password" placeholder="Password" name="password">
                    </div>
                    <div class="submit-group">
                        <input type="submit" value="Login" class="btn">
                    </div>
                    <div class="link-group">
                        <a href="" class="find-id">아이디 찾기</a>
                        <span>|</span>
                        <a href="" class="find-pw">비밀번호 찾기</a>
                        <span>|</span>
                        <a href="register.html" class="register">회원가입</a>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
        <div class="footer">
            <div class="top-section">
                <a href="#">개인정보처리방침</a>
                <a href="#">서비스약관</a>
                <a href="#">사이트맵</a>
            </div>
            <div class="bottom-section">
                <span>© 2024 회사 정보</span>
                <span>문의전화: 02-1234-5678</span>
            </div>
        </div>
    </body>
</html>
