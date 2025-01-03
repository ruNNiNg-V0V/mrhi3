<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jstl/core_rt" prefix = "c" %>
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
            padding : 0;
            background-image: linear-gradient(to bottom, #010c16, #0c82f5);
        }
        
        .header {
		    display: flex;
		    justify-content: space-between;
		    background-color: #122639;
		    padding: 15px;
		    padding-top: 20px;		    
		}
        
        .nav {
        	display : flex;
        	justify-content : space-around;
        	gap : 30px;
        	margin-left : 10px;
        }
        
        div.details {margin-left: 60px; color: white;}
        
        h2, div.logo {color: white;} 
        
        table {width: 100%;border-collapse: collapse;}
	
	    th, td {text-align: left; padding: 8px; color: white;}
	
	    th {background-color: #122639; color: white;}

	    td {border-bottom: 1px dotted #ddd;}      
        
        td:nth-child(2), td:nth-child(3) {text-align: right; font-size : 13px;}
        
        td:nth-child(1) {font-size: 18px;}
    </style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="movie-info">
            <div class="poster"></div>
            <div class="details">
                <h1>영화 제목: </h1>
                <p>영화 제작 연도: </p>
                <p>${movie.rnum}관<p>       
                <p>상영 시간: </p>
                <p>감독: </p>
                <p>출연진: </p>
                
                <a href="reserveMovie.do?rnum=${movie.rnum}&movieNm=${movie.movieNm}"><button class="reserve-btn">예매하기</button></a>
            </div>
        </div>

        <div class="review-section">
            <h2>후기 남기기</h2>
            <form action="insertMovieInfo.do" method="post">
            <input type="hidden" name="rmvname" value="${movie.movieNm}">
            <input type="hidden" name="rnum" value="${movie.rnum}">
            <input type="hidden" name="movieCd" value="${movie.movieCd}">
            <input type="hidden" name="movieNm" value="${movie.movieNm}">
            <textarea name="coment" class="review-input" placeholder="리뷰를 작성해 주세요!">${existingReview != null ? existingReview.coment : ''}</textarea>   
            <button id="submitReview" class="submit-btn">등록</button>
            </form>
        </div>

        <div>
            <h2>리뷰</h2>
            <div id="reviewsContainer" class="reviews-container">   
            <!-- Backend Data in 리뷰 -->
                <table>
		        <c:forEach var="review" items="${reviews}">
		            <tr>
		                <td>${review.coment}</td>
		                <td>${review.rtime}</td>
		                <td>${review.rname}</td>
		            </tr>
		        </c:forEach>
		    </tbody>
		</table>
            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>

    <!-- Main Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            let reviewCount = 0;

            if (typeof getMovieInfo === "function") {
                getMovieInfo("${movie.movieCd}");
            }

            // Create Review function
            function createReview() {
                var reviewInput = document.getElementById("reviewInput").value.trim();
                
                // If the review input is empty, show an alert
                if (reviewInput === "") {
                    alert("리뷰를 입력해 주세요!");
                    return;
                }

                reviewCount++;
                
                // If it's the second submission, ask for confirmation to edit
                if (reviewCount > 1) {
                    const confirmation = confirm("리뷰를 변경하시겠습니까?");
                    if (confirmation) {
                        editReview(reviewInput);
                    } else {
                        return;
                    }
                } else {
                    var newReview = document.createElement("div");
                    newReview.className = "review";
                    newReview.innerHTML = '<p>' + reviewInput + '</p>';
                    document.getElementById("reviewsContainer").appendChild(newReview);
                    document.getElementById("reviewInput").value = "";
                }
            }

            // Edit Review function
            function editReview(newReviewText) {
                const reviewDiv = document.querySelector('.reviews-container .review');
                reviewDiv.innerHTML = '<p>' + newReviewText + '</p>';
                document.getElementById("reviewInput").value = "";
            }
            document.getElementById("submitReview").addEventListener("click", function() {
                createReview();
            });
        });
    </script>
</body>
</html>