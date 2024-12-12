<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function updateB() {
	var bno=$("#bno").val();
	var title=$("#title").val();
	var content=CKEDITOR.instances.content.getData();
	var titleLength=title.length;
	if(!title) {
		swal("error", "제목을 입력하세요.", "error");
	} else if(titleLength>50) {
		swal("", "제목이 너무 깁니다.", "error");
	} 
	else if(content == ""){ 
		 swal("error", "글내용을 입력해 주세요!!.", "error");
		 return false; 
	} 
	else {
		swal({
			 icon: "warning",
			 text: "정말 공지사항을 수정 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["취소", "수정"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('수정 완료','공지사항 수정을 완료했습니다.','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "updateBoard",
							data : {
								"bno" : bno,
								"title" : title,
								"content" : content
						}, success : function(data) {
							location.href="view?bno="+bno+"&show=Y";
						}
					});
			    	});
			  }
			})
	}
}

//키보드로 글자수 입력 받았을 때 글자카운트 스크립트
$(document).ready(function(){
	/* 키보드 이벤트 활용 */
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
			swal("", "제목은 한글기준 50자 까지만 쓸 수 있습니다.", "warning");
		}
	})
})
</script>
<script src="resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/menu.jsp" %>

<title>MIRAE SURF</title>

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
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
view {
	table-layout: fixed;
	#E1DCDC
}
.simpleView { 
    border-collapse: collapse; 
    border-spacing: 0px;
}

.a {
	border-top: 2px solid #4682B4;
	border-bottom: 1px dashed #4682B4;
}
.b {
	border-bottom: 2px solid #4682B4;
	border-top: 1px dashed #4682B4;
}
.tdS {
	width: 100px;
}
.previous {
	font-family: 돋움;
	background-color:#4682B4;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.previous:hover {
	color: #483d8b;
}
.next {
	font-family: 돋움;
	background-color:#4682B4;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
.next:hover {
	color: #483D8B;
}
#list_btn {
	font-family: 'Yeon Sung', cursive;
	font-size:18px;
	background-color:#4682B4;
	width: 50px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
#list_btn:hover{
color:black;
}
.adjust {
	border: 1px solid #4682B4;
}
#update {
	font-family: 돋움;
	background-color:#708090;
	width: 70px;
	height: 25px;
	border: 0px;
	outline: none;
	color: white;
}
#update:hover {
	color: #483d8b;
}
</style>

</head>
<body>
<div id="op">
	<b id="title2">공지사항</b>
	</div>
<center>
	<div style="width:800px;">
		<div style="float:right;">
		</div>
		<br/><br/>

	<form>
		<input type="hidden" name="bno" id="bno" value="${board.bno}"/>
		<table border="1" bordercolor="#AAB9FF" cellpadding="0" cellspacing="0" width="100%">
			<tr>
			<td width="70" style="text-align:center;">제목</td>
			<td align="left">
			<input type="text" name="title" id="title" size="85%" maxlength="100" 
			value="&nbsp;${board.title}" />
			<span id="titleCount" style="color:green;">50</span><span>/50</span>
			</td>
			</tr>
				
			<tr>
			<td style="text-align:center;">글쓴이</td>
			<td align="left">&nbsp;${board.writer}</td>
			</tr>
				
			<tr>
			<td style="text-align:center;">날짜</td>
			<td align="left">&nbsp;${board.regdate}</td>
			</tr>
				
			<tr>
			<td style="text-align:center;">조회수</td>
			<td align="left">&nbsp;${board.viewcnt}</td>
			</tr>
				
			<tr>
			<td colspan="2" align="left" height="500px">
			<textarea name="content" id="content" cols="88" rows="80">${board.content}</textarea>
		<script>
   		 	CKEDITOR.replace( 'content', {} );
		</script>
			</td>
			</tr>
		</table>
		<br/><br/>
		<input id="list_btn" type="button" value="저 장" onclick="updateB()" style="cursor:pointer;" />
	</form>
		<button id="list_btn" style="float:right;" onclick="location.href='board'">목 록</button>
	</div>
</center>
<%@ include file="../include/cs_info.jsp" %>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
</body>
</html>