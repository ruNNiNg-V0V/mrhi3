<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MiraeCinema Register</title>
        <link rel="stylesheet" href="register.css"/>
    </head>
    <body>
        <header class="header">
            <div class="header-container">
                <div class="home-button">
                    <a href="index.do">
                        <img src="resources/images/home.svg" alt="메인 홈 버튼"/>
                    </a>
                </div>
                <div class="logo">
                    <img src="resources/img/miraecinema.png" alt="미래시네마 로고">
                </div>
            </div>
        </header>
        <h2>회원 정보 입력</h2>
        <form>
            <fieldset>
                <div class="form-group">
                    <label for="id">아이디</label>
                    <input id="id" type="text" placeholder="6~10자 영문,숫자" required>
                    <div class="doublecheck" id="id_check"></div> 
                </div>
                <div class="form-group">
                    <label for="pw">비밀번호</label>
                    <input id="pw" type="password" placeholder="8~12자 영문,숫자" required>
                    <div class="doublecheck" id="pw_check"></div>
                </div>
                <div class="form-group">
                    <label for="repw">비밀번호 확인</label>
                    <input id="repw" type="password" placeholder="8~12자 영문,숫자" required>
                    <div class="doublecheck" id="repw_check"></div>
                </div>
                <div class="form-group">
                    <label for="name">이름</label>
                    <input id="name" type="text" placeholder="예약자명" required>
                    <div class="doublecheck" id="name_check"></div>
                </div>
                <div class="form-group">
                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email" placeholder="example@email.com" required>
                    <div class="doublecheck" id="email_check"></div>
                </div>
                <div class="form-group">
                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" placeholder="010-1234-5678" required>
                    <div class="doublecheck" id="phone_check"></div>
                </div>
                <br>
                <div class="form-group">
                    <div class="check">
                        <input type="checkbox" id="agree">&nbsp;이메일로 이벤트 정보를 받겠습니다(선택)<br>
                        <input type="checkbox" id="age">&nbsp;만 14세 이상입니다
                    </div>
                </div>
                <div class="form-group">
                <a>만 14세 미만 회원은 법정대리인(부모님) 동의를 받은<br> 
                    경우에만 회원가입이 가능합니다.</a>
                </div>
            </fieldset>
        </form>
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
    </div>
        <div class="submit-btn">
            <button id="submit" type="submit" class="btn" value="submit" onclick="myFunction()">가입하기</button>
        </div>
        <script src="register.js"></script>
    </body>
</html>
