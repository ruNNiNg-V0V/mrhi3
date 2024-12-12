<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
<script src="https://kit.fontawesome.com/049a2474af.js"
	crossorigin="anonymous"></script>

<style>
body,html {
line-height:3em;
 height: 100%;
 margin: 0;
}
#op{
background-image:url("resources/img/op.jpg");
height:200px;
padding-top:80px;
padding-left:10px;
opacity:0.8;
}

#title2 {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}
.name {
	margin:10px;
	
}
.list1 {
	color: #fff;
	background: #7FB3FA;
	border-top: 1px solid;
	border-bottom:1px solid;
	
}
.list2 {
	background: #fff;
	border-bottom:1px solid;
	border-color: #E1DCDC;
}
.check2 {
	width: 75;
	font-family: 돋움;
	background-color:#7FB3FA;
	width: 50px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
#searchOption {
	height: 25px;
	width: 125px;
	margin: 10px;
	border: 1px solid #7FB3FA;
	background: #ffffff;
	height: 25px;
}
#keyword {
	border: 1px solid #7fb3fa;
	background: #ffffff;
	height: 25px;
}
.text {
	background-color:#4682B4;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.textb {
	border: 1px solid #8D8D8C;
	}
.write {
	background-color:#4682B4;
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	width: 75px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.write:hover{
color:black;
}
.listp {
	background-color:#4682B4;
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	width: 50px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.asd{
	position: relative;
	top:10px;
	left: 10px;
}
</style>



</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<div id="op">
	<b id="title2">공지사항</b>
	</div>

<script>
function createB() {
	var writer=$("#writer").val();
	var title=$("#title").val();
	var content=CKEDITOR.instances.content.getData();
	var titleLength=title.length;
	
	if(!title) {
		alert("공지사항 제목을 입력하세요.")
	} else if(titleLength>50) {
		alert("공지사항 제목 이름이 너무 깁니다")
	} else if(content==""){ 
		alert("내용을 입력해주세요.")
		 return false; 
	} else {
		swal({
			 icon: "warning",
			 text: "공지사항 등록을 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["취소", "등록"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('등록 완료','공지사항 등록 완료.','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "doregisterNotice",
							data : {
								"writer" : writer,
								"title" : title,
								"content" : content
						}, success : function(data) {
							location.href='board';
						}
						});
			    	});
			  }
			})
	}
}

// 키보드로 글자수 입력 받았을 때 글자카운트 스크립트
$(document).ready(function(){

	$('#title').keyup(function(){
		// 남은 글자수를 구한다.
		var titleLength = $(this).val().length; //현재 글자수
		var remain = 50 - titleLength;
		
		// 문서 객체에 남은 글자수 표시
		$('#titleCount').html(remain);
		
		if(remain>=0){
		      $('#titleCount').css('color', 'green');
		}else{
		      $('#titleCount').css('color', 'red');
		}
		
		if(remain<0) {
			alert("제목은 한글 기준 50자 이하로 입력하실 수 있습니다.");
		}
	})
})
</script>

<div style="width:100%; text-align: center;">
	<div style="width:50%; display:inline-block;">

		<br/><br/>
	<form>
		<input type="hidden" name="writer" id="writer" value="${member.user_id}"/>
		<table class="textb" width="100%">
			<tr>
			
			<td  class="asd" align="left">
			<input type="text" name="title" id="title" maxlength="120" size="120" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="content" id="content" cols="88" rows="80"></textarea>
		<script>
			CKEDITOR.replace( 'content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input type="button" class="write" value="등 록" onClick="createB()" style="cursor:pointer;" />
	</form>
	
		<button style="float:right;" class="listp"onClick="location.href='board'">목 록</button>
	</div>
</div>



</body>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>