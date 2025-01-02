<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/alertAndConfirmPopup.css">
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script src="resources/js/alertConfirmPopup.js"></script>
</head>
<body>    
    <!-- Alert 팝업 -->
    <div id="customAlert" class="popup">
        <div class="popup-content alert-content">
            <div id="alert-message"></div>
            <div class="confirm" id="btn3">
                <div class="confirm-text">확인</div>
            </div>
        </div>
    </div>
    
    <!-- Confirm 팝업 -->
    <div id="customConfirm" class="popup">
        <div class="popup-content confirm-content">
            <div id="confirm-message"></div>
            <div id="confirmBox">
                <div class="confirm" id="btn1" onclick="deleteForm()">
                    <div class="confirm-text">확인</div>
                </div>
                <div class="confirm" id="btn2" onclick="closeConfirm()">
                    <div class="confirm-text">취소</div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
