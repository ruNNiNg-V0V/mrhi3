<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIRAE SURF</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300,500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung&display=swap" rel="stylesheet">

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

#title {
	font-size: 50px;
	font-family: 'Sunflower', sans-serif;
	color: #4682B4;
}

ul{
   list-style:none;
   }

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}
ol{
list-style:none;
}

li {
    padding: 0;
    margin: 0;
    list-style: none;
}
a:link,a:visited,a:hover{
text-decoration:none;
}
/* Contents */
#contents {
    background: #fff;
}
section {
    padding: 40px 0;
}
section.customer.container {
    position: relative;
}
section.customer #bo_v_con ol,
section.customer #bo_v_con ul,
section.customer #bo_v_con li {
    list-style: none;
}
section.customer #bo_v_con p {
    font-family: 'Noto Sans KR', sans-serif;
    font-weight: 400;
    font-size: 16px;
}
section .section-title {
    color: #144155;
    font-size: 30px;
    letter-spacing: -1px;
}
section .section-title:first-child {
    margin-top: 0;
}
section .section-title.eng .text-light {
    display: block;
}
section hr {
    margin: 20px 0 30px;
    width: 50px;
    height: 3px;
    background: #fff;
}
section .img-responsive {
    margin: 0 auto;
}
.main section .section-title {
    font-size: 34px;
}
.main .features,
.main .contact .contact-detail {
    display: none;
}
.main .contact .sns_link {
    display: block;
}
.main .contact .section-title {
    margin-top: 100px;
}
.main .contact-box .panel {
    border: none;
}
.map_frame {
    width: 100%;
    min-width: 100%;
    max-height: 100%;
    height: 200px;
    border: 0
}
.text_box {
    margin: 0 auto 20px;
    line-height: 1.8em;
}
.img_box {
    margin: 0 auto 20px;
}
.col-xs-20 {
    float: left;
    position: relative;
    width: 20%;
    min-height: 1px;
    padding: 0 5px;
}

/* Customer */
.customer a.btn-square {
    float: left;
    margin-bottom: 40px;
    padding: 10px 15px;
    width: 50%;
}

section.customer.container {
    position: inline
}

/* FAQ */
#bo_cate{display:none;}
#bo_cate h2 {position:absolute;font-size:0;line-height:0;overflow:hidden}
#bo_cate ul {margin-bottom:10px;padding-left:1px;zoom:1}
#bo_cate ul:after {display:block;visibility:hidden;clear:both;content:""}
#bo_cate li {float:left;margin-bottom:-1px}
#bo_cate a {display:block;position:relative;margin-left:-1px;padding:6px 0 5px;width:90px;border:1px solid #ddd;background:#f7f7f7;color:#888;text-align:center;letter-spacing:-0.1em;line-height:1.2em;cursor:pointer}
#bo_cate a:focus, #bo_cate a:hover, #bo_cate a:active {text-decoration:none}
#bo_cate #bo_cate_on {z-index:2;border:1px solid #565e60;background:#fff;color:#565e60;font-weight:400}

#faq_wrap {display:inline-block;width:50%;font-size:15px; text-align:left;}
#faq_wrap h2 {position:absolute;font-size:0;line-height:0;overflow:hidden}
.faq_admin {text-align:right}
#faq_wrap ol {margin:0;padding:0;list-style:none}
#faq_con {padding:0;border:0;}
#faq_con a {display:inline-block;margin-bottom:10px;padding:15px;width:100%;background:#4682B4;;font-weight:500;}
#faq_con a p{margin:0;}
#faq_con .con_inner {display:none;padding:5px 15px 25px 15px;}
#faq_con .con_inner ul{margin-left:10px;}
#faq_con .con_inner ul li:before{font-family:xeicon;content:"\e914";color:#0f9ba5;margin-right:5px;vertical-align:middle;}
#faq_con .con_inner p {margin-bottom: 5px;}
#faq_con .con_closer {margin:10px 0 0;text-align:right}
#faq_con .closer_btn {margin:0;padding:0;border:0;background:transparent}
.faq_tolist {padding:0 10px;text-align:right}
.faq_img {text-align:center}

#faq_sch {text-align:center}
#faq_sch legend{display:none;}


/* Button */
.btn {
    text-transform: uppercase;
    letter-spacing: 0;
    border-radius: 20px;
    font-family: 'nanumsquare';
    font-weight: 600;
    font-size: 16px;
}
.bg-primary {
    background: #1e91b4;
}
.bg-white {
    background: #fff;
}
a.btn-outline,
.btn-outline {
    color: #fff;
    border: 1px solid #fff;
}
.btn-outline:hover,
.btn-outline:focus,
.btn-outline.active {
    color: #fff !important;
    background-color: #1e91b4 !important;
    border-color: transparent;
}
a.btn-square,
.btn-square,
.btn-square:hover,
.btn-square:focus {
    width: 100%;
    border: 0;
    border-radius: 0;
    border: 1px solid #9db4bd;
    background: #9db4bd;
    color: #fff;
    font-family: 'nanumsquare';
    font-weight: 600;
    font-size: 16px;
    line-height: 1.6em;
}
.btn-square.active {
    color: #0f9ba5 !important;
    background-color: #fff !important;
    border-color: #fff;
    border-bottom-color: transparent;
    box-shadow: none;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/menu.jsp"%>
<div id="op">
	<b id="title">자주하시는 질문</b>
	</div>
<div style="width:100%; display:inline;"></div>
		<button style="width:49%; height:60px; background-color:#fff; color:#4682B4; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;;" onclick="location.href='board'">공지사항</button>
		<button  style="width:50%; height:60px; background-color:#4682B4; color:#fff; border-style:none;  font-size:25px; font-family: 'Sunflower', sans-serif; font-weight:bold; cursor:pointer;" onclick="location.href='question'">자주하시는 질문</button>
<!-- Sub Contents -->
<div id="contents">
	<section class="customer container">
<!-- FAQ 시작 { -->
<div id="faq_hhtml"></div>
<nav id="bo_cate">
    <h2>자주하시는질문 분류</h2>
    <ul id="bo_cate_ul">
                <li><a href="http://xn--oy2b19ko0o5nb3wd.com/g5/bbs/faq.php?fm_id=1"  id="bo_cate_on" ><span class="sound_only">열린 분류 </span>자주하시는 질문</a></li>
            </ul>
</nav>

<div style="width:100%; text-align:center;">
<div id="faq_wrap" class="faq_1" >
        <section id="faq_con">
        <h2>자주하시는 질문 목록</h2>
        <ol>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 날씨가 좋지 않은데 서핑이 가능한가요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">날씨가 흐리거나 비가 와도 서핑은 가능합니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">태풍경보, 풍랑경보 발효시 입수가 금지되오며 파도 상황이 너무 안 좋아 안전에 문제가 있다고 판단될 시 자체적으로 입수 제한합니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 수영을 못해도 서핑을 할 수 있나요?</p>
</a>
                <div class="con_inner">
                    <p class="text-primary" style="font-family: 'Yeon Sung', cursive; font-size:20px;">수영을 못해도 서핑은 가능합니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">전문 강사분들이 옆에서 항상 옆에서 케어해주고 계시며 가슴 이하의 수심에서 강습이 진행되므로 안전합니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">하지만 계속 지속적으로 서핑을 하시고 싶으시면 수영을 배우시는 것이 많은 도움이 됩니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 파도가 없어도 강습이 가능한가요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">서핑을 배우기에는 파도가 높은 것보다 없는 것이 더 밸런스 잡는데 도움 됩니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">또한 정확한 테이크오프 동작, 패들링, 발의 위치 잡는 것이 작은 파도 또는 파도가 없을 때 더 정확하게 배우실 수 있습니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 몇 살부터 서핑을 배울 수 있나요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">나이보다는 키가 중요합니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">130cm 이상 되는 어린이면 나이 상관없이 가능합니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 강습비용에 추가되는 비용이 있나요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">강습비용에 보드 대여 + 슈트 대여 + 샤워 비용이 포함되어 있습니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">따라서 강습 비용에 추가되는 금액은 없습니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 준비물은 어떻게 되나요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">슈트 안에 이너로 입을 수영복 또는 속옷 / 세면도구 / 안경 착용자는 일회용 렌즈 / 해변까지 신고 갈 슬리퍼나 워터슈즈 / 선크림을 준비하시면 됩니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">스쿨에 드라이기, 타올, 바디클렌져, 샴푸, 린스, 샤워타올이 비치되어 있습니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 얼마나 강습을 받으면 서핑 할 수 있나요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">서핑은 개인 편차가 큰 스포츠입니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">운동신경이 뛰어난 성인 남성은 1회만 받고 바로 프리라이딩 가능하시지만 보통 2~3회 정도 강습 받으시면 혼자서 서핑을 시작하실 수 있습니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 혼자서 강습 받아도 되나요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">50% 이상 혼자 서핑 강습 받으시러 오십니다.</p>
<p style="font-family: 'Yeon Sung', cursive; font-size:20px;">강습 받으시다 보면 같이 강습 받으시는 분들과 금방 친해지십니다.</p>
                </div>
            </li>
                        <li>
                <a href="#none" onclick="return faq_open(this);"><p style="font-family: 'Sunflower', sans-serif; color: #fff; font-size:17px;"><i class="fas fa-search-plus"></i> 춥지는 않나요?</p>
</a>
                <div class="con_inner">
                    <p style="font-family: 'Yeon Sung', cursive; font-size:20px;">MIRAE SURF 는 수온이 낮은 계절에는 겨울용 슈트와 글러브, 슈즈까지 같이 지급해 드립니다.</p>
                </div>
            </li>
                    </ol>
    </section>
    </div>
</div>

<script src="http://xn--oy2b19ko0o5nb3wd.com/g5/js/viewimageresize.js"></script>
<script>
function faq_open(el)
{
    var $con = $(el).closest("li").find(".con_inner");

    if($con.is(":visible")) {
        $con.slideUp();
    } else {
        $("#faq_con .con_inner:visible").css("display", "none");

        $con.slideDown(
            function() {
                // 이미지 리사이즈
                $con.viewimageresize2();
            }
        );
    }
    return false;
}
</script>		</section>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/quickmenu.jsp"%>
<%@ include file="/WEB-INF/views/include/cs_info.jsp"%>

</html>