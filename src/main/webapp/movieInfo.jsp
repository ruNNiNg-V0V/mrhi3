<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Mirae Cinema - Movie Details</title>
    <link rel="stylesheet" type="text/css" href="resources/css/movieInfo.css?after">
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="resources/js/getThePoster.js"></script>
    <script src="resources/js/getMovieInfo.js?v=<%=System.currentTimeMillis()%>"></script>
        <style>
        .img-responsive {
            width: 250px; 
   			height: 330px; 
       		float: left; 
   			margin-right: 10px;
   			flex: 0;
   		}
   		
   		body {
   			color: #2866A2;
    		background-image: linear-gradient(to bottom, #010c16, #0c82f5);
   		}
   		
   		div.details {margin-left : 60px; color : white;}
   		
   		h2, div.logo {color : white;}
    </style>
</head>

<body>
    <div class="container">
        <header class="header">
            <div class="logo">MIRAE CINEMA</div>
            <nav class="nav">
                <a href="#">Home</a>
                <a href="#">Mypage</a>
                <a href="#">Login</a>
            </nav>
        </header>

        <div class="movie-info">
        	<div class="poster"></div>
            <div class="details">
                <h1>영화 제목: </h1>
                <p>영화 제작 연도: </p>
              	<p>${movie.rnum}관<p>       
                <p>상영 시간: </p>
                <p>감독: </p>
                <p>출연진: </p>
              
                <button class="reserve-btn">예매하기</button>
            </div>
        </div>

        <div class="review-section">
            <h2>후기 남기기</h2>
            <input id="ratingInput" class="rating-input" type="number" min="0" max="5" step="0.1" placeholder="평점 (0~5.0)">
            <textarea id="reviewInput" class="review-input" placeholder="리뷰를 작성해 주세요!"></textarea>
            <button id="submitReview" class="submit-btn">등록</button>
        </div>

        <div>
            <h2>리뷰</h2>
            <div id="reviewsContainer" class="reviews-container">
            </div>
        </div>
    </div>

    <!-- Main Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {          
            if (typeof getMovieInfo === "function") {
            	getMovieInfo("${movie.movieCd}");
            }
            document.getElementById("submitReview").addEventListener("click", function() {
	            var reviewInput = document.getElementById("reviewInput").value.trim();
	            var ratingInput = parseFloat(document.getElementById("ratingInput").value.trim());
	
	            // 평가 리뷰를 확인한다
	            if (isNaN(ratingInput) || ratingInput < 0 || ratingInput > 5 || reviewInput == "") {
	                alert("모든 필드를 알맞게 입력해주세요!");
	                return;
	            }
	
	            var newReview = document.createElement("div");
	            newReview.className = "review";
	            newReview.innerHTML = ratingInput.toFixed(1) + '</p>' + '<p>' + reviewInput + '</p>';
	            document.getElementById("reviewsContainer").appendChild(newReview);
	            document.getElementById("reviewInput").value = "";
	            document.getElementById("ratingInput").value = "";
	        });
	    });
	    </script>
	</body>
</html>
