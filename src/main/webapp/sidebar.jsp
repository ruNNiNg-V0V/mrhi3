<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="sidebar">
    <div class="info">
        <h1>MyPage</h1>
    </div>
    <div class="box1">
        <!-- 아직 구현되지 않은 버튼 -->
        <div>${member.name}님 <br> 환영합니다!</div>
        <button >회원정보 수정</button>
        <button >회원탈퇴</button>
    </div>
    <div class="box2">
        <!-- Spring Controller 경로를 사용 -->
        <div class="sidetext2"><a href="tickets.do">예매확인/취소</a></div>
        <div class="sidetext2"><a href="review.do">나의 후기</a></div>
        <div class="sidetext2"><a href="insertBoard.do">문의하기</a></div>
        <div class="sidetext2"><a href="getBoardList.do">문의내역</a></div>
    </div>
</div>
