<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<div class="sidebar">
    <div class="info">
        <h1>MyPage</h1>
    </div>
    <div class="box1">
         <div class="profile">
            <img id="profileImage" src="resources/images/default.png">
             <button id="changeProfileButton" 
             style="font-size: 12px; padding: 3px 3px; border-radius: 3px; width:30px;"
             onclick="alert('프로필 이미지 변경 기능은 준비 중입니다!')">변경</button>
        </div>
        <div>${member.name}님 <br> 환영합니다!</div>
        <button >회원정보 수정</button>
        <button >회원탈퇴</button>
    </div>
    <div class="box2">
        <!-- Spring Controller 경로를 사용 -->
        <div class="sidetext2"><a href="tickets.do">예매확인/취소</a></div>
        <div class="sidetext2"><a href="review.do">나의 후기</a></div>
        <div class="sidetext2"><a href="insertInquiry.do">문의하기</a></div>
        <div class="sidetext2"><a href="getInquiryList.do">문의내역</a></div>
    </div>
</div>
