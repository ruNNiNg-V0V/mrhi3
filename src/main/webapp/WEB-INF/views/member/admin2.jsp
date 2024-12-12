<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<link
	href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap"
	rel="stylesheet">
	<link
	href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap"
	rel="stylesheet">
	
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart1);
      google.charts.setOnLoadCallback(drawChart2);

      function drawChart1() {
    	  var bgCount = '<c:out value="${countmap.bgCount}"/>';
    	  var iteCount = '<c:out value="${countmap.iteCount}"/>';
    	  var ptCount = '<c:out value="${countmap.ptCount}"/>';
    	  
    	  console.log(bgCount);	
    	  console.log(iteCount);
    	  console.log(ptCount);
    	  
        var data1 = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['초급강습',     parseInt(bgCount)],
          ['중급강습',     parseInt(iteCount)],	
          ['포인트강습',  parseInt(ptCount)]
        ]);

        var options1 = {

          pieHole: 0.4,
          'chartArea': {'width': '100%', 'height': '80%'},
          'legend': {'position': 'bottom'}
        };

        var chart1 = new google.visualization.PieChart(document.getElementById('piechart1'));

        chart1.draw(data1, options1);
      }
      
       function drawChart2() {
     	var payCount1 = '<c:out value ="${countmap.payCount1}"/>';
     	var payCount2 = '<c:out value ="${countmap.payCount2}"/>';
     	var payCount3 = '<c:out value ="${countmap.payCount3}"/>';
     	
     	console.log(payCount1);
     	console.log(payCount2);
     	console.log(payCount3);
     	  
         var data2 = google.visualization.arrayToDataTable([
           ['Task', 'Hours per Day'],
           ['50,000-250,000',parseInt(payCount1)],
           ['250,000-500,000',parseInt(payCount2)],
           ['500,000 이상',parseInt(payCount3)]
        
         ]);

         var options2 = {
          
        	pieHole: 0.4,
            'chartArea': {'width': '100%', 'height': '80%'},
            'legend': {'position': 'bottom'}
         };

         var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));

         chart2.draw(data2, options2);
       }
    
  </script>
      <style>
body,
html {
  height: 100%;
  margin: 0;
  line-height:3em;
}

.container {
  position: relative;
  height: 100%;
  width: 100%;
  left: 0;
  -webkit-transition: left 0.4s ease-in-out;
  -moz-transition: left 0.4s ease-in-out;
  -ms-transition: left 0.4s ease-in-out;
  -o-transition: left 0.4s ease-in-out;
  transition: left 0.4s ease-in-out;
}

.container.open-sidebar { left: 240px; }

.swipe-area {
  position: absolute;
  width: 50px;
  left: 0;
  top: 0;
  height: 100%;
  background: #f3f3f3;
  z-index: 0;
}

#sidebar {
  background: #4682B4;
  position: absolute;
  width: 240px;
  height: 100%;
  left: -240px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

#sidebar ul {
  margin: 0;
  padding: 0;
  list-style: none;
}

#sidebar ul li { margin: 0; }

#sidebar ul li a {
font-family: 'Sunflower', sans-serif;
  padding: 15px 20px;
  font-size: 20px;
  font-weight: bold;
  color: white;
  text-decoration: none;
  display: block;
  border-bottom: 1px solid #4682B4;
  -webkit-transition: background 0.3s ease-in-out;
  -moz-transition: background 0.3s ease-in-out;
  -ms-transition: background 0.3s ease-in-out;
  -o-transition: background 0.3s ease-in-out;
  transition: background 0.3s ease-in-out;
}

#sidebar ul li a:hover{
color:black;
}

.main-content {
  width: 100%;
  height: 100%;
  padding: 10px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  position: relative;
}

.main-content .content {
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  padding-left: 60px;
  width: 100%;
  hegiht:100%;
}

.main-content .content h1 { font-weight: 100; }

.main-content .content p {
  width: 100%;
  line-height: 160%;	
}

.main-content #sidebar-toggle {
  background: #4682B4;
  border-radius: 3px;
  display: block;
  position: relative;
  padding: 10px 7px;
  float: left;
}

.main-content #sidebar-toggle .bar {
  display: block;
  width: 18px;
  margin-bottom: 3px;
  height: 2px;
  background-color: #fff;
  border-radius: 1px;
}

.main-content #sidebar-toggle .bar:last-child { margin-bottom: 0; }

.check2 {
	width: 75;
	font-size:15px;
	font-family: 'Sunflower', sans-serif;
	background-color:#4682B4;
	width: 50px;
	height: 28px;
	border: 0px;
	outline: none;
	color: white;
	cursor:pointer;
}

.check2:hover{
color:black;
}
#searchOption {
	font-family: 'Yeon Sung', cursive;
	font-size:15px;
	height: 25px;
	width: 125px;
	margin: 10px;
	border: 1px solid #4682B4;
	background: #ffffff;
	height: 25px;
}
#keyword {
	font-family: 'Yeon Sung', cursive;
	font-size:15px;
	border: 1px solid #4682B4;
	background: #ffffff;
	height: 25px;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
	  
<div class="container">
        <div id="sidebar">
          <ul>
            <li><a onclick="location.href='admin'" style="cursor:pointer;">회원현황</a></li>
            <li><a onclick="location.href='admin2'" style="cursor:pointer;">예약현황</a></li>
            <li><a onclick="location.href='registerNotice'" style="cursor:pointer;">공지사항</a></li>
          </ul>
        </div>
        <div class="main-content">
          <div class="swipe-area"></div>
          <a href="#" data-toggle=".container" id="sidebar-toggle"> <span class="bar"></span> <span class="bar"></span> <span class="bar"></span> </a>
          <div class="content">
          <div style="width:100%; align:center; height:100%; margin-top:10%; ">
          <div style="width: 49%;   display:inline-block; text-align:center; font-family: 'Yeon Sung', cursive; color:#4682B4; font-size:20px;"><h1>강습별 예약 현황</h1></div>
          <div style="width: 49%;   display:inline-block; text-align:center; font-family: 'Yeon Sung', cursive; color:#4682B4; font-size:20px;" ><h1>금액별 예약 현황</h1></div>
      	 <div id="piechart1" style="width: 49%; height: 600px;  display:inline-block;"  ></div>
      	 <div id="piechart2" style="width: 49%; height: 600px;  display:inline-block;"  ></div>
      	 
          </div>
       
        </div>
</div>
</div>

	  
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script> 
<script src="http://www.blueb.co.kr/SRC2/swipemenu/jquery.touchSwipe.min.js"></script> 

<script>
$(window).load(function(){
$("[data-toggle]").click(function() {
  var toggle_el = $(this).data("toggle");
  $(toggle_el).toggleClass("open-sidebar");
});
 $(".swipe-area").swipe({
	  swipeStatus:function(event, phase, direction, distance, duration, fingers)
		  {
			  if (phase=="move" && direction =="right") {
				   $(".container").addClass("open-sidebar");
				   return false;
			  }
			  if (phase=="move" && direction =="left") {
				   $(".container").removeClass("open-sidebar");
				   return false;
			  }
		  }
  }); 
});
</script>

</body>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>
</html>