/* 페이지 로드 시 */
$(document).ready(function() { 
    $("#customAlert").hide();
    $("#customConfirm").hide();
    $("#alert-message").hide(); 
    $("#confirm-message").hide();
    $(".confirm").hide();
});

var formValidated = false; // 전역 변수를 사용하여 폼 제출 여부를 제어

/* Form validation */
function validateForm() {
    const title = document.querySelector('input[name="title"]').value.trim();
    const content = document.querySelector('textarea[name="content"]').value.trim();
    
    if (title === "" || content === "") {
        alert("제목과 내용을 모두 입력해 주세요.");
        return false;
    }

    showCustomAlert('문의사항을 등록했습니다');
    return formValidated; // 폼 제출 여부에 따라 반환값 결정
}

/* Alert 팝업 */
function showCustomAlert(message, form) {
    $("#customAlert").show();
    $("#alert-message").show().text(message);
    $(".confirm").show(); // .confirm 요소 표시

    $("#btn3").off('click').on('click', function() {
        formValidated = true; // 폼 제출 여부를 true로 설정
        hideCustomAlert();
        if(!form) {
        	$("#inquiryForm").submit();
        }
        $("#reviewForm").submit();// 폼 제출
    });
}

function hideCustomAlert() {
    $("#customAlert").hide();
    $("#alert-message").hide();
    $(".confirm").hide(); // .confirm 요소 숨기기
}

/* Confirm 팝업 */
var URLPath;

function showCustomConfirm(message, form, callback) {
    $("#customConfirm").show();
    $("#confirm-message").show().html('<div class="red">이 작업은 되돌릴 수 없습니다</div>' + message);
    $("#btn1").show(); // 확인 버튼 표시
    $("#btn2").show(); // 취소 버튼 표시
    console.log("showCustomConfirm : " + message + ", " + form);

    $("#btn1").off('click').on('click', function() {
        if (form) {
            console.log("if : " + message + ", " + form);
            location.href = URLPath;
            console.log(URLPath);
        }
        console.log("else : " + message + ", " + form);
        closeConfirm();
        callback(true); // 확인 버튼 클릭 시 콜백 함수로 true 반환
    });

    $("#btn2").off('click').on('click', function() {
        closeConfirm();
        callback(false); // 취소 버튼 클릭 시 콜백 함수로 false 반환
    });
}


function closeConfirm() {
    $("#customConfirm").hide();
    $("#confirm-message").hide();
    $("#btn1").hide();
    $("#btn2").hide();
}
