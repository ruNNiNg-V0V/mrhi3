<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.miraecinema.view.reserve.ReserveTime" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예매하기</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reserveMovie.css">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/getThePoster.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/reserveMovie.js"></script>
</head>
<body>
  <div class="wrapper">
    <div class="mirae-cinema">
    <jsp:include page="header.jsp"></jsp:include>
    <div class="reservation-system">
    <form id="ticketForm" action="insertTicket.do" method="post" onsubmit="return validateAndSetTicket()">
        <input type="hidden" name="tcode" id="tcode">
        <input type="hidden" name="tmvname" value="${movie.movieNm}">
        <input type="hidden" name="rnum" value="${movie.rnum}">
        <input type="hidden" name="mvstart" id="selectedTime">
        <input type="hidden" name="seet" id="selectedSeat">
        <div class="header-tabs">
    		<button type="button" id="selectTabBtn" class="tab active" onclick="showTab('select', event)">시간/좌석 선택</button>
    		<button type="button" id="confirmTabBtn" class="tab" onclick="showTab('confirm', event)">예매확인</button>
		</div>

        <div id="selectTab" class="tab-content active">
            
            <div class="reservation-content">
                <div class="left-section">
                 <div class="movie-header">
                  <h2>${movie.movieNm}</h2>
                  <h3>${movie.rnum}관</h3>
                </div>
                	
                	<%
    					ReserveTime reserveTime = new ReserveTime();
    					String rnumStr = request.getParameter("rnum");
    					int rnum = 1; // 기본값 설정
    
    					try {
        				if (rnumStr != null && !rnumStr.isEmpty()) {
            				rnum = Integer.parseInt(rnumStr);
        					}
        				String[] screenTimes = reserveTime.schedule.get(rnum);
        				request.setAttribute("screenTimes", screenTimes);
    					} catch (Exception e) {
        				// 예외 발생 시 기본 시간표 설정
        				String[] defaultTimes = {"09:30", "10:40", "16:20", "18:40", "21:00"};
        				request.setAttribute("screenTimes", defaultTimes);
    					}
					%>

                    <h4>상영시간표</h4>
                    <div class="time-slots">
    					<c:forEach var="time" items="${screenTimes}">
        				<div class="time-slot">
            				<label>
                			<input type="checkbox" name="screenTime" 
                       		value="${time}" 
                       		onclick="checkOnlyOne(this)"> ${time}
            				</label>
        				</div>
    					</c:forEach>
					</div>
                </div>

                <div class="right-section">
    				<div class="seat-selection">
        			<h4>좌석선택 (잔여 15/36)</h4>
        			<div class="screen">SCREEN</div>
        				<div class="seats">
            			<c:forEach var="row" items="A,B,C,D">
                			<div class="seat-row">
                    			<span>${row}</span>
                    	<c:forEach var="num" begin="1" end="9">
                        	<label class="seat">
    							<input type="checkbox" name="seat" value="${row}${num}" 
           						onclick="selectSeat('${row}${num}', event); return false;" disabled>
 								<!-- 초기에 비활성화 상태로 설정 -->
    							${row}${num}
							</label>
                    	</c:forEach>
                			</div>
            			</c:forEach>
        				</div>
        				<div class="selected-seats-info">
            			선택한 좌석 수 <span id="selectedCount">0</span>
        				</div>
    				</div>
				</div>
            </div>
           
          

            <div class="button-area">
        		 <button type="button" class="reserve-btn" onclick="moveToConfirmTab()">예매하기</button>
        		 <button type="button" class="cancel-btn" onclick="location.href='index.do'">취소</button>
			</div>
        </div>

        <div id="confirmTab" class="tab-content">
            <div class="confirm-page">
                <div class="ticket-info">
                    <div class="movie-info-section">
    					<div class="title-section">
        					<div class="title-label">${movie.movieNm}</div>
    			 		</div>
    					 <div class="movie-info">
            				<!-- getThePoster.js가 여기에 포스터를 추가 -->
    					</div>
					</div>
					
					<!-- 원래는 '소방관' 대신 ${ticket.tmvname}을 넣어야하나, 임시용으로 '소방관'자체 기입 -->

                  <div class="booking-info-section">
    				<div class="info-header">예매정보</div>
    				<div class="info-table">
        				<table>
                        <tr>
                            <th>예매번호</th>
                            <td id="ticketNumber"></td>
                        </tr>
                        <tr>
                            <th>상영관</th>
                            <td>${movie.rnum}관</td>
                        </tr>
                        <tr>
                            <th>상영시간</th>
                            <td id="selectedTimeDisplay"></td>
                        </tr>
                        <tr>
                            <th>좌석번호</th>
                            <td id="selectedSeatDisplay"></td>
                        </tr>
                        <tr>
                            <th>예매자명</th>
                            <td>${member.name}</td>
                        </tr>
                    </table>
    						</div>
    	</div>
    			<div class="button-group">
                <button type="button" class="confirm-btn" onclick="submitReservation()">확정</button>
                <button type="button" class="prev-btn" onclick="showTab('select', null); resetSelection();">이전 단계로</button>
            	</div>
			</div>
		</form>
    </div>
</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>