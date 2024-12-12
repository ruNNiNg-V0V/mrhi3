/**
 * 로그인
 */
function memberCheck() {
	var user_id=$("#user_id").val();
	var user_password=$("#user_password").val();
	if (!user_id || !user_password) {
		alert("아이디 혹은 비밀번호를 입력해주세요.");
	} else {
		$.ajax({
			type : "POST",
			url : "checkMember",
			data : {
				"user_id" : user_id,
				"user_password" : user_password
			}, success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "login",
						data : {
							"user_id" : user_id,
							"user_password" : user_password
						}, success : function() {
							alert("로그인 성공");
							window.location.href = "http://localhost:8181/home/#0";
						}
					});
				} else {
					alert("아이디 혹은 비밀번호를 확인해주세요");
				}
			}, error : function(data) {
				console.log(data);
			}
		});
	}
}

