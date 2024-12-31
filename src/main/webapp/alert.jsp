<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/alert.css">
</head>
<body>
	<!-- Alert 팝업 -->
		<div id="customAlert">
        	<div class="alert-content">
            	<div id="alert-massage"></div>
            	<div class="confirm" onclick="submitForm()">
            		<div class="alert-text">확인</div>
            	</div>
        	</div>
    	</div>
		<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
		<script>
		$(document).ready(function() { 
			$("#customAlert").hide();
			$("#alert-massage").hide(); 
		});

		function showCustomAlert(massage) {
			$("#customAlert").show();
		    $("#alert-massage").show().text(massage);
		}

		function submitForm() {
		    $("#reviewForm").submit();
		}
		</script>
	</body>
</html>