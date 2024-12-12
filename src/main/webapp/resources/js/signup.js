var checkID = false;
var checkPWD = false;
var checkBIRTH = false;
var checkNAME = false;
var checkEMAIL = false;
var checkADDR = false;
var checkTEL = false;

$(document).ready(function() {
	$("#user_password").keyup(function() {
		var regExpPw = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,50}$/;
		var user_password = $("#user_password").val();
		var checkText1 = $("#check_password1");
		if(regExpPw.test(user_password) == false){
			checkText1.text("최소 8자리의 최소 한개의 숫자 혹은 특수문자를 포함하여주세요.");
			checkText1.css("color","red");
		}else{
			checkText1.css("color","green");
			checkText1.text("사용가능한 비밀번호입니다.");
		}
	});	
	
	$("#user_re_password").keyup(function() {
		var checkText2 = $("#check_password2");
		if ($("#user_password").val() == "" || $("#user_re_password").val() == "") {
			checkText2.css("color", "red");
			checkText2.text("비밀번호를 입력해주세요.");
			checkPWD = false;
		} else if ($("#user_password").val() != $("#user_re_password").val()) {
			checkPWD = false;
			checkText2.text("비밀번호가 동일하지 않습니다.");
			checkText2.css("color", "red");
		}
			else if ($("#user_password").val() == false){
				checkText2.css("color", "red");
				checkText2.text("비밀번호를 입력해주세요.");
				checkPWD = false;
		} else {
			checkPWD = true;
			checkText2.text("비밀번호가 동일합니다.");
			checkText2.css("color", "green");
		}
	});
	
	$("#user_name").blur(function() {
		checkName();
	});
})

function Signup() {
	var user_id = $("#user_id").val();
	var user_password = $("#user_password").val();
	var user_name = $("#user_name").val();
	var user_birth = $("#user_birth").val();
	var user_email = $("#user_email").val();
	var user_tel = $("#user_tel").val();
	var user_addr = $("#user_addr").val() +" "+ $("#user_detail_addr").val();
	
	if (checkID == false) { console.log("아이디 중복검사 안함"); }
	if (checkPWD == false) { console.log("비밀번호 다름"); }
	if (checkNAME == false) { console.log("이름이 비어있음"); }
	if (checkBIRTH == false) { console.log("생일이 비어있음"); }
	if (checkTEL == false) { console.log("연락처가 비어있음"); }
	if (checkEMAIL == false) { console.log("이메일이 비어있음"); }
	if (checkADDR == false) { console.log("주소가 비어있음"); }
	if (checkID == false || checkPWD == false || checkNAME == false || checkBIRTH == false || checkTEL == false || checkEMAIL == false || checkADDR == false) {
		alert("빠진 정보가 있는지 확인해주세요.");
	} else {
		$.ajax({
			type : "POST",
			url : "join",
			data : {
				"user_id" : user_id,
				"user_password" : user_password,
				"user_name" : user_name,
				"user_birth" : user_birth,
				"user_email" : user_email,
				"user_tel" : user_tel,
				"user_addr" : user_addr
			},
			success : function(data) {
				alert("MIRAE SURF 회원가입을 축하드립니다.")
				window.location.href="login";
			}
		});
	}
}

function idChk() {
	var user_id = $("#user_id").val();
	var oMsg = $("#check_id");
	var regExpId = /^[0-9a-z]+$/;
	if (user_id==false) {
		oMsg.css("color", "red");
		oMsg.text("아이디를 입력해주세요.");
		checkID = false;
	}else if(regExpId.test(user_id)==false){
		oMsg.css("color","red");
		oMsg.text("숫자,영문만 입력가능합니다.")
	} else {
		$.ajax({	
			type : "POST",	
			url : "checkID",
			data : {
				"user_id" : user_id
			},
			success : function(data) {
				if (data == 0) {
					oMsg.css("color", "green");
					oMsg.text("사용 가능한 아이디입니다.");
					checkID = true;
				} else if (data != 0) {
					oMsg.css("color", "red");
					oMsg.text("이미 존재하는 아이디입니다.");
					checkID = false;
				} else if (!user_id==""){
					oMsg.css("color", "red");
					oMsg.text("아이디를 입력해주세요.");
					checkID = false;
				}
			}, error : function(error) { swal("", user_id, "error"); }
		});
	}
}

function checkName() {
	var oMsg = $("#check_name");
	var nonchar = /[^가-힣a-zA-Z]/gi;
	
	var user_name = $("#user_name").val();
	if (user_name == false) {
		oMsg.css("color", "red");
		oMsg.text("필수정보입니다.");
		return false;
	}
	
	if (user_name != "" && nonchar.test(user_name)) {
		oMsg.css("color", "red");
		oMsg.text("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
		return false;
	}
	checkNAME = true;
	oMsg.css("color","green");
	oMsg.text("멋진이름이시군요!");
	return true;
}

function checkEmail(){
	 var user_email = $("#user_email").val();
	 var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	 var oMsg = $("#check_email");
	
	 
	 	if(regExpEm.test(user_email)==false){
		checkEMAIL = false;
		oMsg.css("color","red");
		oMsg.text("잘못된 형식의 이메일 주소입니다.")
	}
	else{
		oMsg.css("color","green");
		oMsg.text("사용하실 수 있는 이메일 주소입니다.")
		checkEMAIL = true;
		return true;
	}
	 	
	 	if(user_email==false){
	 		oMsg.css("color","red");
	 		oMsg.text("필수정보입니다.");
	 		checkEMAIL = false;
	 	}
}

function checkAddr(){
	var user_addr_number = $("#user_addr_number").val();
	var user_addr = $("#user_addr").val();
	var user_detail_addr = $("#user_detail_addr").val();
	
	if(user_addr_number != false && user_addr != false && user_detail_addr != false){
		checkADDR = true;
		return true;
	}else{
		checkADDR = false;
		return false;
	}
}

function checkBirth(){
	var user_birth = $("#user_birth").val();
	var regExpbirth = /^\d{6}$/;
	var oMsg = $("#check_birth");
	
	if(regExpbirth.test(user_birth) == false){
		oMsg.css("color","red");
		oMsg.text("주민등록번호 앞 6자리를 입력해주세요.");
		checkBIRTH = false;

	}else{
		oMsg.text("");
		checkBIRTH = true;
		return true;
	}
	
	if(user_birth == false){
		oMsg.css("color","red");
		oMsg.text("필수정보입니다.");
		checkBIRTH = false;
	}
}

function checkTel(){
	var user_tel = $("#user_tel").val();
	var oMsg = $("#check_tel");
	var regex= /^[0-9]*$/;
	
	if(regex.test(user_tel)==false){
		oMsg.css("color","red");
		oMsg.text("숫자만 입력 가능합니다.");
		checkTEL = false;
		
	}else{
		oMsg.text("");
		checkTEL = true;
		return true;
	}
	
	if(user_tel == false){
		oMsg.css("color","red");
		oMsg.text("필수정보입니다.");
		checkTEL = false;
	}
}



function searchPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType == 'R') {
				fullAddr = data.roadAddress;
			} else {
				fullAddr = data.jibunAddress;
			}
			if (data.userSelectedType == 'R') {
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
			}
			document.getElementById('user_addr_number').value = data.zonecode;
			document.getElementById('user_addr').value = fullAddr;
			document.getElementById('user_detail_addr').focus();
		}
	}).open();
}