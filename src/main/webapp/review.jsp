<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 후기내역 -->
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
            <jsp:include page="header.jsp"></jsp:include>
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
                                    <td>넘넘재밌땅zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                        ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                        ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ캬캬캬커커커컼커</td>
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
    <jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>
