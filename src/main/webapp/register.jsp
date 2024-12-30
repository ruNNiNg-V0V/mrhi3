<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MiraeCinema Register</title>
    <link rel="stylesheet" href="register.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .header-container {
            display: flex !important;
            justify-content: space-between !important;
            align-items: center !important;
            padding: 0 20px !important;
        }
        .nav {
            margin-left: auto !important;
        }
        .login-button {
            margin-right: 0 !important;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="header-container">
            <div class="home-button">
                <a href="index.jsp">
                    <img src="resources/images/home.svg" alt="메인 홈 버튼"/>
                </a>
            </div>
            <div class="logo">
                <img src="resources/images/miraecinema.png" alt="미래시네마 로고">
            </div>
            <div class="nav">
                <div class="login-button"><a href="login.jsp">Login</a></div>
            </div>
        </div>
    </header>
    <h2>회원 정보 입력</h2>
    <form id="registrationForm">
        <fieldset>
            <div class="form-group">
                <label for="id">아이디</label>
                <div class="input-button">
                    <input id="id" type="text" placeholder="4~8자 영문, 숫자" required>
                    <button type="button" id="idCheckButton">중복확인</button>
                </div>
                <div class="doublecheck" id="id_check"></div> 
            </div>

            <div class="form-group">
                <label for="pw">비밀번호</label>
                <input id="pw" type="password" placeholder="8~12자 영문, 숫자" required>
                <div class="doublecheck" id="pw_check"></div>
            </div>

            <div class="form-group">
                <label for="repw">비밀번호 확인</label>
                <input id="repw" type="password" placeholder="8~12자 영문, 숫자" required>
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
                    <input type="checkbox" id="age" required>&nbsp;만 14세 이상입니다
                </div>
            </div>

            <div class="form-group">
                <a>만 14세 미만 회원은 법정대리인(부모님) 동의를 받은<br> 
                    경우에만 회원가입이 가능합니다.</a>
            </div>

        </fieldset>

        <!-- 가입하기 버튼 -->
        <div class="submit-btn">
            <button id="submit" type='button' class='btn'>가입하기</button>
        </div>

    </form>

    <!-- Footer 포함 -->
    <div class='footer'>
        <jsp:include page='footer.jsp'/>
    </div>

    <!-- JavaScript 파일 포함 -->
    <script src='resources/js/register.js'></script> 
</body>
</html>
