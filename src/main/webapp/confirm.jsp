<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Confirm confirm</title>
<link rel="stylesheet" href="resources/css/confirm.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<body>	
    <!-- 알림 팝업 -->
    <div id="customConfirm">
        <div class="confirm-content">
            <div id="confirm-message"></div>
            <div id="confirmBox">
	              <div class="confirm" onclick="deleteForm()">
                <div class="confirm-text">확인</div>
            </div>
            <div class="confirm" onclick="closeConfirm()">
                <div class="confirm-text">취소</div>
            </div>
        </div>
    </div>
    <script>
    var URL;
    $(document).ready(function() {
        $("#customConfirm").hide();
        $("#customAlert").hide();
		$("#confirm-massage").hide(); 
    });

    function showCustomConfirm(message, val1, val2, val3) {
    	URL = 'reviewDelete.do?rmvname=' +val1+'&rtime='+val2;
    	console.log(val1,val2);
    	console.log(URL);
        $("#customConfirm").show();
        $("#confirm-message").show().html(message);
    }

    function deleteForm() {
    	location.href = URL;    	
    	$("#customConfirm").hide();
        $("#customAlert").hide();
		$("#confirm-massage").hide();
    }

    function closeConfirm() {
    	$("#customConfirm").hide();
        $("#customAlert").hide();
		$("#confirm-massage").hide();
    }
    
    </script>
</body>
</html>
