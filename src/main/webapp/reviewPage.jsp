<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>미리보기 페이지</title>
</head>
<body>

	<div class="header">
		<div class="logo">
			<img src="resources/img/miraecinema.png" height="25px">
		</div>
		<div class="nav">
			<div>
				<a href="index.do">Home</a>
			</div>
			<div>
				<a href="review.do">Mypage</a>
			</div>
			<div>
				<% 
					String name = (String) session.getAttribute("name");
					if(name!=null){
					%>
				<a href="#">${name}</a>
				<%						
					}else{
						%>
				<a href="login.do">Login</a>
				<%		
					}
				%>
			</div>
		</div>
	</div>


	<h1>회원 정보</h1>
	<p>회원 ID : ${member.id}</p>
	<br>
	<p>회원 PW : ${member.pw}</p>
	<br>
	<p>회원 EMAIL : ${member.email}</p>
	<br>
	<p>회원 TEL : ${member.tel}</p>
	<br>
	<p>회원명 : ${member.name}</p>
	<br>
	<h1>리뷰 정보</h1>
	<c:forEach items="${review }" var="theReview">

		<p>영화 : ${theReview.rmvname }
		<p>
			<br>
		<p>후기 : ${theReview.coment }
		<p>
			<br>
		<p>작성 시간 : ${theReview.rtime }
		<p>
			<br>
		<p>작성자 : ${theReview.rname }
		<p>
			<br>
		<p>작성자 ID : ${theReview.rid }
		<p>
			<br>
	</c:forEach>
	<h1>티켓(예매) 정보</h1>
	<c:forEach items="${ticket}" var="theTicket">

		<p>티켓 코드 : ${theTicket.tcode }
		<p>
			<br>
		<p>상영관 : ${theTicket.rnum } 관
		<p>
			<br>
		<p>상영 시작 : ${theTicket.mvstart }
		<p>
			<br>
		<p>선택 좌석 : ${theTicket.seet }
		<p>
			<br>
		<p>영화 : ${theTicket.tmvname }
		<p>
			<br>
		<p>예매 시간 : ${theTicket.ttime }
		<p>
			<br>
		<p>예매자 : ${theTicket.tname }
		<p>
			<br>
		<p>예매자 ID : ${theTicket.tid }
		<p>
			<br>
	</c:forEach>
</body>
</html>