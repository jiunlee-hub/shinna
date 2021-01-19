<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.MemberBean" %>
<%@ page import = "vo.ReservationBean" %>
<% 
	String id = null, grade=" ";
	if(session.getAttribute("id") != null) id = (String)session.getAttribute("id");
	if(session.getAttribute("grade") != null) id = (String)session.getAttribute("grade");   //보류
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>SHINNA</title>
<link href = "images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<style>
body{
	background-color:white;
}
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
  .display { 
 display: none; 
  } 
#reservation > ul {
	list-style-type: none;
	}
	
.rom {
	margin:10px;
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
	width:80%;
	}		
}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false">
<!-- nav -->
	<div class="container pb-5 mb-5 clearfix">
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
<br>
<br>
<br>

	<div class="text-center mt-5">
			<h1 class="h2 font-weight-bold">일정체크 &amp; 객실 인원선택</h1>
	</div>
<!-- 예약 -->
<form action="ReservationProAction.do" method ="post">
<div class="mx-auto"  >
<div id="reservation" class="clearfix text-center mx-auto mb-5 mt-5"  >
<!--예약자 아이디-->	
<ul class="display">
		<li class="mb-2 mt-2">아이디 </li>
			<li> <select class="form-control" name="id">
					<option><%=id %></option>
				</select>
			</li>
	</ul>

<!--호텔객실-->	

	<ul>
		<li class="mb-2 mt-2">호텔객실 </li>
		<li><select class="form-control" name="type" >
					<option>객실선택</option>
					<option>스탠다드</option>
					<option>스위트</option>
					<option>그랜드</option>
					<option>프로모션1</option>
					<option>프로모션2</option>
					<option>프로모션3</option>
					<option>프로모션4</option>
					<option>프로모션5</option>
					<option>프로모션6</option>
					
			</select>
		</li>	
	</ul>
	
<!-- 체크인 & 체크아웃 -->			
		<ul>
		<li class="mb-2 mt-2">체크인 </li>	
		<li>
			<input class="date form-control" type="text" id="datepicker1" name="chkin" required="required" style="height:38px; font-size:15px;  text-align: center;">
		</li>
	</ul>
	<ul>
		<li class="mb-2 mt-2">체크아웃 </li>
		<li>
			<input class="date form-control" type="text" id="datepicker2" name="chkout" required="required" style="height:38px; font-size:15px;  text-align: center;">
		</li>
	</ul>
<!-- 객실 -->			
	<ul>
		<li class="mb-2 mt-2">객실 </li>
		<li> <select class="form-control" name="room">
				<option>1</option>
				<option>2</option>
				<option>3</option>
				</select>
		</li>	
	</ul>
	
<!-- 성인 -->			
	<ul>
		<li class="mb-2 mt-2">성인 </li>
			<li> <select class="form-control" name="adult">
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
			<li> <select class="form-control" name="child">
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
			<li> <select class="form-control" name="baby">
					<option>0</option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
				</select>
			</li>			
	</ul>
<!-- 예약버튼 -->	
	<ul>
	<% 
			if(id == null ) {
		%>
			<li><a href="Login.do"><input type="button" value="예약" class="btn btn-warning btn-lg mt-2" style="height:63px;"></a></li>	
			
		<% 
			} else {
		%>
				<li><input type="submit" value="예약" class="btn btn-warning btn-lg mt-2" style="height:63px;"></li>	
		<% 
		} 
		%>
			
	</ul>
	</div>
</div>
</form>


<!-- top 버튼 -->
	<div>
		<a id="toTop" href="#"><img src="images/top.png" class="top"
			alt="..."></a>
	</div>
	

<!-- 객실 선택 -->

	<div>
		<div class="mx-auto mt-5 mb-5" style="width: 80%;">
			<!-- 스탠다드 객실 -->
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3  text-center">
						<img src="./images/sr1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<h5 class="card-title font-weight-bold h5" id="standard">스탠다드</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 310,930~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="standard.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 스위트 객실-->
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/ss1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<h5 class="card-title font-weight-bold h5" id="suite">스위트</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 340,560~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="suite.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 그랜드 객실 -->
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/gr2-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<h5 class="card-title font-weight-bold h5" id="grand">[자쿠지]그랜드</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 490,220~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="grand.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 프로모션 객실 -->
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/bed1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<span class="badge badge-warning">프로모션1</span><h5 class="card-title font-weight-bold h5" id="promotion1">EARLY
								BIRD OFFER</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 322,500~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="promotion.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/wl1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<span class="badge badge-warning">프로모션2</span><h5 class="card-title font-weight-bold h5" id="promotion2">3+1
								PROMOTION</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 294,920~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="promotion.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/ye1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<span class="badge badge-warning">프로모션3</span><h5 class="card-title font-weight-bold h5" id="promotion3">Romantic
								Year-End</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 390,350~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="promotion.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/week1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<span class="badge badge-warning">프로모션4</span><h5 class="card-title font-weight-bold h5" id="promotion4">평일한정
								특별요금</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW 312,000~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="promotion.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/2days1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<span class="badge badge-warning">프로모션5</span><h5 class="card-title font-weight-bold h5" id="promotion5">연박
								PROMOTION</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW (5%)305,000~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="promotion.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="card mb-3 mx-auto" style="width: 80%;">
				<div class="row no-gutters mt-3">
					<div class="col-md-4 mb-3 text-center">
						<img src="./images/suite1-1.jpg" class="card-img ml-3 pic" alt="...">
					</div>
					<div class="col-md-8">
						<div class="card-body ml-3">
							<span class="badge badge-warning">프로모션6</span><h5 class="card-title font-weight-bold h5" id="promotion6">스위트룸
								PROMOTION</h5>
							<p class="card-text">전망 오션뷰/시티뷰</p>
							<p class="card-text font-weight-bold h5">KRW (5%)335,000~</p>
							<p class="card-text mb-4">
								<small class="text-muted">평균가/1박(세금, 봉사료 별도)</small>
							</p>
							<div class="text-right mr-3">
								<a class="btn btn-secondary btn-sg" href="promotion.do"
									role="button">상세보기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
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
		$(function() {
			$("#datepicker1").datepicker({
				showAnim: 'slideDown',
				dateFormat : 'yy-mm-dd', // 날짜 형식
				showMonthAfterYear:true, //년도가 먼저 앞에
				monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력 월 부분 tooltip 텍스트
				dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 부분 텍스트
				minDate: 0, maxDate: "+12M"
				
			});
		});
		$(function() {
			$("#datepicker2").datepicker({
				showAnim: 'slideDown',
				dateFormat : 'yy-mm-dd',
				showMonthAfterYear:true,
				monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], //달력 월 부분 tooltip 텍스트
				dayNamesMin: ['일','월','화','수','목','금','토'], //달력의 요일 부분 텍스트
				minDate: 0+1, maxDate: "+12M"
				
			});
		});
	</script>
</body>
</html>