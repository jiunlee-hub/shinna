<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.MemberBean" %>
<% 
	String id = null, grade=" ";
	if(session.getAttribute("id") != null) id = (String)session.getAttribute("id");
	if(session.getAttribute("grade") != null) id = (String)session.getAttribute("grade");   //보류
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>SHINNA</title>
<link href="images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>

#toTop {
	position: fixed;
	bottom: 15%;
	right: 2%;
	z-index: 9999;
}

.top {
	width: 40px;
	height: 40px;
}
#center{
	text-align:center;
	margin:0px auto;
}

#reservation > ul {
	list-style-type: none;
}
	
.rom {
	margin:10px;
}

.ga {
	height:940px;
}


@media all and (min-width:768px){
	#reservation > ul { float: left;
		margin-left:10px;
	}
	#reservation {
		width:750px;
	}
	.date {
	width:110px;
	}
}

@media all and (max-width:767px){
	.date {
		width:100%;
	}	
	.pic{
		width:100%;
	}
	
}

</style>
<script lang="Javascript"> 
function setCookie( name, value, expiredays ) { 
    var todayDate = new Date(); 
        todayDate.setDate( todayDate.getDate() + expiredays ); 
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";" 
    }
function closeWin() { 
    if ( document.notice_form.chkbox.checked ){ 
        setCookie( "maindiv", "done" , 1 ); 
    } 
    document.all['divpop'].style.visibility = "hidden"; 
} 
</script> 
</head> 
<body oncontextmenu="return false" ondragstart="return false"
bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">  
	<div id="divpop"  style="position:absolute;" >  
		<form name="notice_form"> 
			<table> 
				<tr> 
					<td>
						<div style="position:absolute; left: 280px; top:10px;">
		      				<a href="javascript:closeWin()" class="h4 text-light text-decoration-none" >✖</a>
		      			</div>
						<img src="./images/wine.png" alt="-" onclick="location.href='ed2.do';" style="width:350px; height:300px; cursor: pointer;">
						<div style="position:absolute; left: 120px; top:260px;">
		        			<input style="width: 15px; height: 15px;" type="checkbox" name="chkbox" id="chkebox" value="checkbox"><label class="text-light" style="font-size:0.875rem;" for="chkebox">&nbsp;오늘 그만 보기</label> 
						</div>
					</td>
				</tr>
			</table> 
     	</form> 
	</div> 
<!-- 	</div>  -->
<script lang="Javascript"> 
	cookiedata = document.cookie;    
	
	if ( cookiedata.indexOf("maindiv=done") < 0 ){      
		document.all['divpop'].style.visibility = "visible"; 
	} else { 
		document.all['divpop'].style.visibility = "hidden"; 
	}
</script>
<!-- nav index -->
	<div class="container clearfix header">
		<nav class="navbar navbar-expand-sm navbar-light fixed-top menuBgAni menuBg" >
			<div class="text-center pl-4 ml-4">
				<a href="index.do"><img class="hei" src="images/logo1.png" alt="-" /></a>
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse ani" id="navbarSupportedContent" >
				<ul class="navbar-nav">
					<li class="menu"><a href="introduce.do">신나호텔</a>
						<ul class="sub">
							<li class="mt-4"><a href="introduce.do">호텔소개</a></li>
							<li><a href="hotelmap.do">호텔안내</a></li>
						</ul>
					</li>
					<li class="menu"><a href="standard.do">호텔객실</a>
						<ul class="sub">
							<li class="mt-4"><a href="standard.do">스탠다드</a></li>
							<li><a href="suite.do">스위트</a></li>
							<li><a href="grand.do">그랜드</a></li>
							<li><a href="event.do">이벤트</a></li>
							<li><a href="promotion.do">프로모션</a></li>
						</ul>
					</li>
					<li class="menu"><a href="reviewList.do">고객문의</a>
						<ul class="sub">
							<li class="mt-4"><a href="reviewList.do">게시판</a></li>
						</ul>
					</li>
					<li class="menu"><a href="fa_ca.do">부대시설</a>
						<ul class="sub">
							<li class="mt-4"><a href="fa_ca.do">카페</a></li>
							<li ><a href="fa_lo.do">라운지</a></li>
							<li><a href="fa_re.do">레스토랑</a></li>
							<li><a href="fa_fi.do">휘트니스</a></li>
							<li><a href="fa_sa.do">샤워장</a></li>
							<li><a href="fa_sw.do">수영장</a></li>
						</ul>
					</li>
				</ul>
			</div>
				
			<div class="collapse navbar-collapse anis" id="navbarSupportedContent">
				<div class="navbar-nav drs">
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" style="width:100%;"
							aria-haspopup="true" aria-expanded="false">신나호텔</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="introduce.do">호텔소개</a>
							<a class="dropdown-item pt-3 pb-2" href="hotelmap.do">호텔안내</a>
						</div>
					</div>
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" style="width:100%;"
							aria-haspopup="true" aria-expanded="false">호텔객실</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="standard.do">스탠다드</a>
							<a class="dropdown-item pt-3 pb-3" href="suite.do">스위트</a>
							<a class="dropdown-item pt-3 pb-3" href="grand.do">그랜드</a>
							<a class="dropdown-item pt-3 pb-3" href="event.do">이벤트</a>
							<a class="dropdown-item pt-3 pb-2" href="promotion.do">프로모션</a>
						</div>
					</div>
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" style="width:100%;"
							aria-haspopup="true" aria-expanded="false">고객문의</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-2" href="reviewList.do">게시판</a>
						</div>
					</div>
					<div class="dropdown mb-2 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" style="width:100%;"
							aria-haspopup="true" aria-expanded="false">부대시설</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="fa_ca.do">카페</a>
							<a class="dropdown-item pt-2 pb-3" href="fa_lo.do">라운지</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_re.do">레스토랑</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_fi.do">휘트니스</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_sa.do">샤워장</a>
							<a class="dropdown-item pt-3 pb-2" href="fa_sw.do">수영장</a>
						</div>
					</div>
				</div>
			</div>
			
<!-- 로그인 탭 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto rig">
				<% 
					if(id == null ) {
				%>
					<li class="nav-item" style="width:100%;">
						<a href="Login.do" class="text-center ml-2" style="width:100px; margin-top: 13px;">로그인</a>
					</li>
					<li class="nav-item" style="width:100%;">
						<a href="Join.do" class="text-center" style="width:100px; margin-top: 13px;">회원가입</a>
					</li>
				<% 
					} else {
				%>
					<li class="nav-item " style="width:100%; ">
						<div class="dropdown lang">
	    					<button class="text-left btn btn-white dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" style="width:100%; "><img src="images/dia.png" alt="-" style="width:27px; height:27px;"><%= grade %>
								<%
					   	 			if(session.getAttribute("id").toString().equals("shinna604")) {
					   	 				out.println("관리자");
					   	 			} else {
					   	 		%>
					   	 			<%= id %>님
					   	 		<% 	}
					   	 		%>
							</button>
	    					<div class="dropdown-menu langs" aria-labelledby="dropdownMenuButton" style="width: 100%; min-width: 100%;">
	   	 						<a class="dropdown-item" href="Logout.do">로그아웃</a>
					   	 		<%
					   	 			if(session.getAttribute("id").toString().equals("shinna604")) {
					   	 				out.println("<a class='dropdown-item' href='ad_CheckList.do'>예약관리</a>");
					   	 				out.println("<a class='dropdown-item' href='ad_MemberList.do'>회원관리</a>");
					   	 			} else {
					   	 				out.println("<a class='dropdown-item' href='check.do'>예약확인</a>");
					   	 				out.println("<a class='dropdown-item' href='member.do'>회원정보</a>");
					   	 				out.println("<a class='dropdown-item' href='JoinDelete.do'>회원탈퇴</a>");
					   	 			}
					   	 		%>
	    					</div>
		    			</div>
	    			</li>
		    	<% 
		    		}
				%>
					<li class="nav-item" style="width: 100%;">
						<div class="dropdown lang mt-2 ml-1">
							<button class="text-left btn btn-white dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" style="width: 100%;"><img src="images/ji.png" alt="-" class="mr-1" style="width:20px; height:20px;">&nbsp;한국어</button>
							<div class="dropdown-menu langs" aria-labelledby="dropdownMenuButton" style="width: 100%; min-width: 100%;">
								<a class="dropdown-item" href="#none">English</a>
								<a class="dropdown-item" href="#none">日本語</a> 
								<a class="dropdown-item" href="#none">简体中文</a> 
							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>


<!-- 갤러리 -->
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="images/main1.jpg" class="d-block w-100 ga" alt="...">
			</div>
			<div class="carousel-item">
				<img src="images/main2.jpg" class="d-block w-100 ga" alt="...">
			</div>
			<div class="carousel-item">
				<img src="images/main3.jpg" class="d-block w-100 ga" alt="...">
			</div>
			<div class="carousel-item">
				<img src="images/main4.jpg" class="d-block w-100 ga" alt="...">
			</div>
		</div>

		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev" >
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="sr-only">Previous</span>
  		</a>
  		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    		<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="sr-only">Next</span>
  		</a>
	</div>


<!-- top 버튼 -->
	<div>
		<a id="toTop" href="#"><img src="images/top.png" class="top"
			alt="..."></a>
	</div>


<!-- 예약 -->
	<form action="reservationF1.do" method="post">
		<div class="mx-auto"  >
			<div id="reservation" class="clearfix text-center mx-auto mb-5 mt-5"  >
<!--호텔객실-->
				<ul>
					<li class="mb-2 mt-2">호텔객실</li>
					<li><select class="form-control" name="type">
							<option>객실선택</option>
							<option id="standard">스탠다드</option>
							<option id="suite">스위트</option>
							<option id="grand">그랜드</option>
							<option id="promotion1">프로모션1</option>
							<option id="promotion2">프로모션2</option>
							<option id="promotion3">프로모션3</option>
							<option id="promotion4">프로모션4</option>
							<option id="promotion5">프로모션5</option>
							<option id="promotion6">프로모션6</option>
						</select>
					</li>
				</ul>

<!-- 체크인 & 체크아웃 -->
				<ul>
					<li class="mb-2 mt-2">체크인</li>
					<li>
						<input class="date form-control" type="text"
						id="datepicker1" name="chkin" 
						style="height: 38px; font-size: 15px; text-align: center;">
					</li>
				</ul>
				<ul>
					<li class="mb-2 mt-2">체크아웃 </li>
					<li>
						<input class="date form-control" type="text" 
						id="datepicker2" name="chkout" 
						style="height:38px; font-size:15px;  text-align: center;">
					</li>
				</ul>
<!-- 객실 -->			
				<ul>
					<li class="mb-2 mt-2">객실 </li>
					<li> 
						<select class="form-control" name="room">
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</li>	
				</ul>
<!-- 성인 -->			
				<ul>
					<li class="mb-2 mt-2">성인 </li>
					<li> 
						<select class="form-control" name="adult">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
						</select>
					</li>
				</ul>
<!-- 어린이 -->			
				<ul>
					<li class="mb-2 mt-2">어린이</li>
					<li> 
						<select class="form-control" name="child">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</li>
				</ul>
<!-- 유아 -->			
				<ul>
					<li class="mb-2 mt-2">유아 </li>
					<li> 
						<select class="form-control" name="baby">
							<option>0</option>
							<option>1</option>
							<option>2</option>
							<option>3</option>
						</select>
					</li>			
				</ul>
<!-- 예약버튼 -->	
				<ul>
					<li>
						<button onclick="location.href='reservationF1.do'" 
						class="btn btn-warning btn-lg mt-2" style="height:63px;">검색</button>
					</li>
				</ul>
			</div>
		</div>
	</form>
	
	
<!-- 이벤트 소개 -->
	<div class="card-group">
		<div class="card bg-dark text-white" onclick="location.href='ed1.do'"
			style="cursor: pointer;">
			<img src="./images/doma1.jpg" class="card-img" alt="...">
			<div class="card-img-overlay">
				<h5 class="card-title font-weight-bold h5">
					Wine Bazaar Event&nbsp;<span class="badge badge-danger badge-pill">인기</span>
				</h5>
				<p class="card-text h6">소믈리에 추천와인 60여종 판매</p>
				<p class="card-text h6">리테일 와인 35만원 이상 구매 시 플레이팅 도마 증정</p>
			</div>
		</div>
		<div class="card bg-dark text-white" onclick="location.href='ed2.do'"
			style="cursor: pointer;">
			<!-- 이벤트 소개 -->
			<a href="ed2.do"><img src="./images/plate1.jpg" class="card-img"
				alt="..."></a>
			<div class="card-img-overlay">
				<h5 class="card-title font-weight-bold h5">
					Sweet Moment&nbsp;<span class="badge badge-secondary badge-pill">추천</span>
				</h5>
				<p class="card-text h6">특별하고 달콤한 시간을 선사할 신나에서의 하루!</p>
				<p class="card-text h6">신나호텔 회원 한정 사전 예약제</p>
			</div>
		</div>
		<div class="card bg-dark text-white" onclick="location.href='ed3.do'"
			style="cursor: pointer;">
			<!-- 이벤트 소개 -->
			<div>
				<a href="ed3.do"><img src="./images/tree1.jpg" class="card-img"
					alt="..."></a>
			</div>
			<div class="card-img-overlay">
				<h5 class="card-title font-weight-bold h5">
					Merry Christmas &amp; Happy New Year&nbsp;<span
						class="badge badge-success badge-pill">New</span>
				</h5>
				<p class="card-text h6">세상에서 단 하나뿐인 크리스마스 케이크를 만들어보세요</p>
				<p class="card-text h6">신나호텔 투숙 고객 대상으로 진행되는 이벤트</p>
			</div>
		</div>
	</div>


	<!-- 멤버십 소개 영역 -->
<div class="jumbotron jumbotron-fluid mt-5">
  <div class="container">
    <h1 class="h2 text-center font-weight-bold text-danger">신나호텔 멤버십 혜택</h1>
    <br><br>
    <div class ="d-flex">
    <div class="row justify-content-center align-items-center">
    <div class="col-4 mb-5 text-center">
    <img src="./images/star.svg" alt="-"><p class="lead font-weight-bold">등급에 따른 차등 이벤트 혜택 제공</p></div>
    <div class="col-4 mb-5 text-center">
    <img src="./images/gift.svg" alt="-"><p class="lead font-weight-bold">회원만을 위한 할인된 가격 제공</p></div>
    <div class="col-4 mb-5 text-center">
    <img src="./images/database.svg" alt="-"><p class="lead font-weight-bold">포인트 적립 후, 현금처럼 사용</p></div>
  <a class="btn btn-secondary btn-lg" href="md.do" role="button">자세히 보기</a>
  </div>
  </div>
</div>
</div>

<!-- 부대시설 소개 -->
<div class="mt-5 mb-5">
			<h1 class="h3 ml-3 mb-4">Shinna Gallery</h1>
<div class="text-center pi">
		<ul>
			<li>
				<img  src="images/ca01.jpg" alt="-" class="pic" >
				<img  src="images/lo02.jpg" alt="-" class="pic" >
				<img  src="images/re02.jpg" alt="-" class="pic" >
			</li>
		</ul>	
		<ul>
			<li>
				<img  src="images/sw03.jpg" alt="-" class="pic" >
				<img src="images/sa04.jpg" alt="-" class="pic" >
				<img  src="images/re05.jpg" alt="-" class="pic" >
			</li>
		</ul>
	</div>
</div>
<br>
<br>

<!-- footer -->
	<footer class="footer">
		<div class="footer-above" style="background: #F1E3C4;">
			<div class="container pt-4">
				<div class="row">
					<div class="col-6 mt-4 mb-3 text-center">
						<h3 style="font-family: Lucida Handwriting; font-size: 1.8rem; color: #D45751;">SHINNA</h3>
						<br>
						<h6 style="font-family: Lucida Handwriting; font-size: 1rem; color: #BB5954;">호텔 &amp; 리조트&nbsp;┃&nbsp;백화점&nbsp;┃&nbsp;투어&nbsp; </h6>
					</div>
					
					<div class="col-6 mb-5 text-center">
						<br>
						<a href="https://play.google.com/store/apps/details?id=net.shilla.shlapp&hl=ko&gl=US" target="_blank"><img src="images/shin.png" alt="-" style="width: 70px;" /></a> &nbsp;&nbsp;
						<a href="https://ko-kr.facebook.com/theshillahotels" target="_blank"><img src="images/face.png" alt="-" style="width: 70px;" /></a> &nbsp;&nbsp;
						<a href="https://www.instagram.com/accounts/login/?next=/theshillajeju/%3Fhl%3Dko" target="_blank"><img src="images/ins.png" alt="-" style="width: 70px;" /></a>&nbsp;&nbsp;&nbsp;
						<a href="https://www.youtube.com/channel/UC--hsMkZ_kAUx-1A5YMaXTQ" target="_blank"><img src="images/you.png" alt="-" style="width: 70px;" /></a>&nbsp;&nbsp;&nbsp;
						<a href="https://twitter.com/theshillain" target="_blank"><img src="images/twi.png" alt="-" style="width: 70px;" /></a>&nbsp;&nbsp;&nbsp;
						<a href="https://theshilla.tistory.com" target="_blank"><img src="images/blog.png"  alt="-"	style="width: 70px;" /></a>
					</div>
				</div>
			</div>
		</div>	
		
		
		<div class="footer-below pt-4 pb-5 mx-auto" style="width: 100%; line-height: 18px;">
			<div class="container">
				<div class="foot" style="font-weight:bold; color: #C4AE9C; font-size: 0.8rem;">
					<a href="hotelmap.do">오시는길</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a href="introduce.do">호텔소개</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a href="#none">개인정보처리방침</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a href="#none">이용약관</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a href="#none">이메일주소무단수집거부</a> &nbsp;&nbsp; | &nbsp;&nbsp; <a href="#none">사이트맵</a>
				</div>
				<hr/>
				<div style="font-weight:bold; color: #B3B3B3; font-size: 0.75rem;">(주) 신나 호텔 | 제주특별자치도 서귀포시 중문관광로 72번길 75 (우) 63535 Tel. 064-123-4567 Fax. 064-987-6543</div>
				<div style="font-weight:bold; color: #B3B3B3; font-size: 0.75rem;">사업자등록번호 203-81-43363 통신판매번호 제 2009-제주-147호 대표이사 박시현</div>
				<div style="font-weight:bold; color: #B3B3B3; font-size: 0.75rem;">Copyright &copy; 2020 Shinna Hotel. All rights reserved</div>
			</div>
		</div>
	</footer>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
  $( function() {
    $( "#datepicker1" ).datepicker({
    	showAnim:'slideDown',
    	dateFormat: 'yy-mm-dd',
    	showMonthAfterYear:true,
    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
    	dayNamesMin : ['일','월','화','수','목','금','토'],
    	minDate : 0, maxDate:"+12M"
    });
  } );
  $( function() {
	  $( "#datepicker2" ).datepicker({
		  showAnim:'slideDown',
	    	dateFormat: 'yy-mm-dd',
	    	showMonthAfterYear:true,
	    	monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    	dayNamesMin : ['일','월','화','수','목','금','토'],
	    	minDate : 0+1, maxDate:"+12M"
	  } );
  } );
</script>

</body>
</html>