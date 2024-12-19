
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>나의후기</title>
        <link rel="stylesheet" href="resources/css/movie.css">
    </head>
    <body>
        <div class="body1">
            <!-- 헤더 -->
            <div class="header">
                <div class="logo"><img src="miraecinema.png" height="25px"></div>
                <div class="nav">
                    <div><a href="#">Home</a></div>
                    <div><a href="#">Mypage</a></div>
                    <div><a href="#">Login</a></div>
                </div>
            </div>
    
            <!-- 메인 -->
            
            <div class="main">
                    
                <!-- 사이드바 -->
                <div class="sidebar">
                    <div class="info">
                        <h1>MyPage</h1>
                    </div>
                    <div class="box1">
                        <div>userName님 <br> 환영합니다!</div>
                        <button>회원정보 수정</button>
                        <button>회원탈퇴</button>
                    </div>
                    <div class="box2">
                        <div class="sidetext2"><a href="#">예매확인/취소</a></div>
                        <div class="sidetext2"><a href="#">나의 후기</a></div>
                        <div class="sidetext2"><a href="#">문의하기</a></div>
                    </div>
                </div>
                
                      <!-- 콘텐츠 -->
            <div class="box3">
                <div class="contentTitleWrapper">
                    <div class="contentTitle">나의 후기</div>
                </div>
                <div class="content">
                            <table id="review">
                                <thead>
                                    <th>영화명</th>
                                    <th width="300px">내용</th>
                                    <th>작성시간</th>
                                    <th>수정/삭제하기</th>
                                </thead>
                                <tr>
                                    <td>모아나2</td>
                                    <td>넘넘재밌땅zㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                        </td>
                                    <td>2024-12-14 13:57:42</td>
                                    <td><button id ="update" class="confirmBtn">수정</button>
                                        <button id ="go" class="confirmBtn">삭제</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td>모아나2</td>
                                    <td>넘넘재밌땅</td>
                                    <td>2024-12-14 13:57:42</td>
                                    <td><button id ="update" class="confirmBtn">수정</button>
                                        <button id ="go" class="confirmBtn">삭제</button>
                                    </td>
                                </tr>
                                
                            </table>
                        </div>
                    </div>
                </div>
    <!-- 하단 고정 영역 -->
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
</body>
</html>