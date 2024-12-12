<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap"
	rel="stylesheet">
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script> -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>

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
#title {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}
p{
font-family: 'Yeon Sung', cursive;
font-size:25px;
}
h1 {
	text-align: center;
	margin-bottom: 50px;
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
	letter-spacing: 40px;
}

#radius {
	width: 450px;
	height: 450px;
	background-image: url("resources/img/reservation/point.png");
	border-radius: 220px; /* 레이어 반크기만큼 반경을 잡기*/
	display: table-cell;
	vertical-align: middle;
	color: #ffffff;
	text-align: center;
	margin-right:100px;
}

#pro {
	width:500px;
	font-size: 18px;
	text-align: left;
}

.size1 {
	width: 500px;
	height: 400px;
	margin-right: 80px;
	margin-left: 20px;
}

.size2 {
	width: 400px;
	height: 300px;
	margin: 50px;
}

#size3 {
	text-align: center;
	margin-bottom: 50px;
	font-size: 60px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
	letter-spacing: 40px;
}

table {
	margin: auto;
	text-align: center;
}

button {
	font-family: 'Yeon Sung', cursive;
	background-color:#4682B4;
	color:#fff;
	width: 110px;
	height: 35px;
	font-size: 17px;
	margin-right: 20px;
}

.line {
	text-align: center;
	padding-top: 70px;
	padding-bottom: 70px;
	padding-left: 60px;
}

.line1 {
	border: 2px solid #4682B4;
	width: 70%;
	text-align: center;
	border-radius:40px 40px 40px 40px;
}

table {
	margin-bottom: 70px;
}

.text1 {
font-family: 'Yeon Sung', cursive;
	font-size: 35px;
}

.product_info {
	font-size: 30px;
	font-family: 'Yeon Sung', cursive;
}
.res_info{
font-size:20px;
}

.text3 {
font-family: 'Yeon Sung', cursive;
	font-size: 26px;
}

.text4 {
font-family: 'Yeon Sung', cursive;
	font-size: 35px;
	padding-top: 100px;
}

#text5 {
	margin-bottom: 80px;
}

input,select{
	text-align: left;
	width:300px;
	height:40px;
	font-family: 'Yeon Sung', cursive;
	font-size: 23px;
	border-radius:40px 40px 40px 40px;
	border:1px solid #4682B4;
}
.gofacilityinformation:hover{
text-decoration:under;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	<div id="op">
	<b id="title">예 약</b>
	</div>
	<h1 id="size3">초급강습</h1>
	<form method="POST">
	<table>
		<tr>
			<td id="pro">
				<fieldset class="line1">
				<legend><p>강습예약</p></legend>
					<p>
					 <select name="person" id="person">
					 	<option value="0">인원선택</option>
					 	<option value="50000">1</option>
					 	<option value="100000">2</option>
					 	<option value="150000">3</option>
					 	<option value="200000">4</option>
					 	<option value="250000">5</option>
					 	<option value="300000">6</option>
					 	<option value="350000">7</option>
					 	<option value="400000">8</option>
					 	<option value="450000">9</option>
					 </select>
				</p>
				<p>
					<select name="rental" id="rental">
						<option value="0">렌탈선택</option>
						<option value="15000">보드대여</option>
						<option value="25000">슈트대여</option>
						<option value="40000">보드+슈트대여</option>
					</select>
				<p>
					<select name="other" id="other">
						<option value="0">기타선택</option>
						<option value="20000">숙박</option>
						<option value="3000">샤워</option>
					</select>
				</p>
				<p>
					 <input type="date" id="resday" value="날짜선택"  ></input>
				</p>
				<p>
					강습비용 : <label id="total_price">0</label> 원
				</p>
			</td>
			
			<td>
			<p class="res_info">10인 이상 단체 강습은 전화 문의 주세요 [TEL : 010.7914.3374]</p>
                <p class="res_info">예약 후 입금하셔야 예약완료 됩니다.</p>              
                <p class="res_info">강습당일 연기/취소/환불은 불가합니다.<p>
                <p class="res_info" style="color:red;">예약금은 50%만 보내주셔도 됩니다.<br>기업은행 000-000-0000(미래서프)</p>
                <p ><i class="fas fa-info-circle"><a onclick="window.open('facilityinformation')"> 요금안내 보러가기</a></i></p>
                
                <button type="button" onclick="createR()" style="border:1px solid #4682B4;;">예&nbsp;&nbsp;약</button>
				<button type="button" id="goback" style="background-color:red; border:1px solid red; cursor:pointer;">취&nbsp;&nbsp;소</button>
			</td>
		</fieldset>
		
		</tr>
	</table>
</form>
	<script>
	//당일기준 이전날 선택불가
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("resday").setAttribute("min", today);
	
	$('#goback').click(function(){
		alert("예약 진행을 취소합니다.");
		history.back();
		})
		$(function(){
			$('#rental').change(function(){
				var target1 = document.getElementById('rental');
				var target2 = document.getElementById('other');
				var target3 = document.getElementById('person');
				
				document.getElementById('total_price').innerHTML = parseInt(target1.options[target1.selectedIndex].value*parseInt(target3.options[target3.selectedIndex].text))+parseInt(target2.options[target2.selectedIndex].value*parseInt(target3.options[target3.selectedIndex].text))+parseInt(target3.options[target3.selectedIndex].value);
			})
			$('#other').change(function(){
				var target1 = document.getElementById('rental');
				var target2 = document.getElementById('other');
				var target3 = document.getElementById('person');
				
				document.getElementById('total_price').innerHTML = parseInt(target1.options[target1.selectedIndex].value*parseInt(target3.options[target3.selectedIndex].text))+parseInt(target2.options[target2.selectedIndex].value*parseInt(target3.options[target3.selectedIndex].text))+parseInt(target3.options[target3.selectedIndex].value);
			});
			$('#person').change(function(){
				var target1 = document.getElementById('rental');
				var target2 = document.getElementById('other');
				var target3 = document.getElementById('person');
				
				document.getElementById('total_price').innerHTML = parseInt(target1.options[target1.selectedIndex].value*parseInt(target3.options[target3.selectedIndex].text))+parseInt(target2.options[target2.selectedIndex].value*parseInt(target3.options[target3.selectedIndex].text))+parseInt(target3.options[target3.selectedIndex].value);
			});
		})
	
	function createR() {
	var id= '<c:out value = "${member.user_id}"/>';
	var course=$("#size3").text();
	var person = document.getElementById('person');
	var rental = document.getElementById('rental');
	var other = document.getElementById('other');
	var resday=$("#resday").val();
	var totalpay=$("#total_price").text();
	
	if(person.options[person.selectedIndex].value == "0") {
		alert("인원 수 를 선택하세요.")
	} else if(!resday) {
		alert("예약 날짜를선택하세요. ")
	} else{
		$.ajax({
			type:"POST",
			url : "checkReservation",
			data : {
				"id" : id
			},success:function(data){
				if(data != 0){
					alert("이미 예약된 정보가 있습니다.");
				}else{
			swal({
			 icon: "warning",
			 text: "예약을 진행 하시겠습니까?",
			 closeOnClickOutside : false,
			 closeOnEsc : false, 
			 buttons: ["취소", "확인"],
			}).then(function(isConfirm) {
			  if (isConfirm) {
			    swal('예약 완료','빠른 시일 내로 입금부탁드립니다.','success').then(function(isConfirm)
			    	{
			    		$.ajax({
							type : "POST",
							url : "beginnerclassReservation",
							data : {
								"id" : id,
								"course" : course,
								"person" : person.options[person.selectedIndex].text,
								"rental" : rental.options[rental.selectedIndex].text,
								"other" : other.options[other.selectedIndex].text,
								"resday" : resday,
								"totalpay" : totalpay
						}, success : function(data) {
						}
						});
			    	});
			  }
			})
	}
	}
})	
	}
}
</script>

</body>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
</html>