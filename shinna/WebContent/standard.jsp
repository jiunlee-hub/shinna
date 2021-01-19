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
<link href = "images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<style>
body{
	background: white;
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

#reservation > ul {
	list-style-type: none;
	}
	
.rom {
	margin:10px;
}

.ga {
	height:400px;
}


@media all and (min-width:768px){
	#reservation > ul { float: left;
		margin-left:10px;
	}
	#reservation {
		width:750px;
	}

}

@media all and (min-width:425px){
.member {
	text-algin:left;

}	
}

</style>
</head>
<body oncontextmenu="return false" ondragstart="return false">
<!-- nav index -->
	<div class="container clearfix">
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


<!-- 객실 사진 영역 -->
<div id="carouselExampleControls" class="carousel slide" data-ride="carousel"> 
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./images/sr1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./images/sr2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="./images/sr3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<div class="text-center">
<div class="card mb-5">
  <div class="card-body">
    <h2 class="card-title font-weight-bold h3">스탠다드 룸</h2>
    <p class="card-text">신나호텔의 세련미와 우아함을 더한 고급스러운 인테리어로 구성되어 있는 고품격 객실입니다.</p>
    <p class="card-text">또한, 룸의 욕실은 모던하고 고급어메니티로 구성 되어 고품격 휴식을 즐기기에 충분합니다.</p>
  </div>
</div>
</div>

<div class="text-center">
<div class="card mb-5">
  <div class="card-body">
    <h2 class="card-title font-weight-bold h3">객실개요</h2>
    <p class="card-text h5">침대 타입         더블/트윈</p>
    <p class="card-text h5">투숙인원          2명</p>
    <p class="card-text h5">객실면적          46~60㎡</p>
    <p class="card-text h5">전망              시티뷰/오션뷰</p>
    <p class="card-text h5">체크인/체크아웃   15:00/11:00</p>
  </div>
</div>
</div>

	<section class="bg-white text-dark mt-5 mb-3 pt-5 pb-4" > <!-- 객실소개 영역 -->
		<div class="row justify-content-center">
			<div class="col-4 text-left mb-5" style="max-width: 480px;">
				<h2 class="font-weight-bold h4">객실이용</h2>
				<ul class="mt-5">
					<li class="mt-4">LED TV (37개 채널)</li>
					<li class="mt-4">책상</li>
					<li class="mt-4">냉장고</li>
					<li class="mt-4">무료 커피/티백</li>		
					<li class="mt-4">무료 생수 2병</li>		
					<li class="mt-4">개인금고</li>		
					<li class="mt-4">유니버셜 어댑터(220V 전용)</li>		
					<li class="mt-4">아베다 욕실용품</li>		
				</ul>
			</div>
			<div class="col-4 text-left mb-5" style="max-width: 480px;">
				<h2 class="font-weight-bold h4">추가정보</h2>
				<ul class="mt-5">
					<li class="mt-4">Ocean View(바다전망) 객실료 추가 부과됩니다.</li>
					<li class="mt-4">모든 요금에 세금 10%가 부과됩니다.</li>
					<li class="mt-4">객실 내 장식물 부착 관련 문의 사항은 신나호텔서비스로 연락부탁드립니다.(111-1111)</li>
					<li class="mt-4">화재의 위험이 있는 양초류는 사용이 어렵습니다.</li>
					<li class="mt-4">호텔 내 반려동물 동반입장은 불가합니다.</li>		
					<li class="mt-4">데코레이션 업체를 통한 객실 내 장식물 부착은 불가합니다.</li>		
					<li class="mt-4">기간 이후 취소(No Show 포함) 또는 변경 시 최초 1박 요금의 10% 부과됩니다.</li>		
				</ul>
			</div>
		</div>
		<div class="text-center">
		<a class="btn btn-secondary btn-lg" href="reservationF.do" role="button">예약하기</a>
		</div>
	</section>
<br>
<br>


<!-- top 버튼 -->
	<div>
		<a id="toTop" href="#"><img src="images/top.png" class="top"
			alt="..."></a>
	</div>
	
	
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
</body>
</html>