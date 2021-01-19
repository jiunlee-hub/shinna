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
	min-width:480px;
}
.login-color1{
		background:#F2CB61;
		color:black;
	}
	
.join {
	position: relative;
	width:550px;
	margin-top:170px;
	margin-bottom :200px;
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
@media all and (max-width:700px){
	.join{
		width:70%;
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

	
	
<!-- join -->
<div>
	<div class="join mx-auto ">
	
		<div>
			
			<span> <img src="images/logo.png" alt="-" style="height:70px; width:70px;"></span>
			<span class="text-center mx-auto" style="font-size:3em; ">&nbsp;Join</span><br><br>
		</div>			
			<hr>
			신나호텔 회원이 되시면<br><br>
			다양한 혜택과 서비스를 편리하게 이용하실 수 있습니다.<br><br>
					<div class="card  card-form my-4">
						<div class="card-body" style="background-color:#F1E3C4">
							<form name="joinForm" action="JoinPro.do" method="post">
								<div class="form-group"> 국적
								 <select id="country" name="country" class="month text-center form-control mt-2" style="height:48px;"autofocus="autofocus">
										            <option>대한민국 (South Korea)</option>
										            <option>미국 (USA)</option>
										            <option>캐나다 (Canada)</option>
										            <option>러시아 (Russia)</option>
										            <option>네덜란드 (Netherlands)</option>
										            <option>프랑스 (France)</option>
										            <option>스페인 (Spain)</option>
										            <option>이탈리아 (Italy)</option>
										            <option>스위스 (Switzerland)</option>
										            <option>영국 (United Kingdom)</option>
										            <option>독일 (Germany)</option>
										            <option>멕시코 (Mexico)</option>
										            <option>아르헨티나 (Argentina)</option>
										            <option>브라질 (Brazil)</option>
										            <option>말레이시아 (Malaysia)</option>
										            <option>호주 (Australia)</option>
										            <option>인도네시아 (Indonesia)</option>
										            <option>필리핀 (Philippines)</option>
										            <option>타이 (Thailand)</option>
										            <option>일본 (Japan)</option>
										            <option>베트남 (Vietnam)</option>
										            <option>중국 (China)</option>
										            <option>터키 (Turkey)</option>
										            <option>인도 (India)</option>
										            <option>가나 (Ghana)</option>
										            <option>나이지리아 (Nigeria)</option>
										            <option>대만 (Taiwan)</option>
											       </select>
								</div>
								<div class="form-group"> 성명 (영어/여권명)
									 <div class="form-row">
										    <div class="col-4 mt-2" >
											<input type="text" name="F_name" id="F_name" class="form-control form-control-lg mt-2" placeholder="first (성)" required="required"/>
										    </div>

										    <div class="col mt-2" >
											<input type="text" name="L_name" id="L_name" class="form-control form-control-lg mt-2" placeholder="last (이름)" required="required"/>
										    </div>	
									</div>
								</div>
								
								<div class="form-group error"></div>
								
								<div class="form-group"> 성명 (한글)
									<input type="text" name="name" id="name" class="form-control form-control-lg mt-2" required="required"/>
								</div>
								
								<div class="form-group error"></div>
								
								<div class="form-group"> 아이디
									<input type="text" name="id" id="id" class="form-control form-control-lg mt-2" placeholder="영문으로 입력해주세요." required="required"/>
								</div>
								
								<div class="form-group error"></div>
								
								<div class="form-group" id="LoginCheck"></div>
								
<!-- 비밀번호-->				<div class="form-group"> 비밀번호	
									<div class="form-row">
										<input type="password" name="pw" id="pw" class="form-control form-control-lg mt-2" required="required"/>
									</div>
								</div>
								
								<div class="form-group error"></div>

<!-- 비밀번호 재확인-->			
								<div class="form-group"> 비밀번호 재확인
									<input type="password" name="pw_check" id="pw_check" class="form-control form-control-lg mt-2" required="required" />
								</div>
								<div class="form-group">
									<span class="mb-2" style="color:#5853EB; font-weight:bold; font-size:14px;" id="success">비밀번호가 일치합니다</span>
									<span class="mb-2" style="color:red; font-weight:bold; font-size:14px;"  id="danger">비밀번호가 일치하지 않습니다</span>
								</div>
								
<!-- 생년월일 -->								
								<div class="form-group mx-auto px-auto "> 생년월일

									  <div class="form-row">
										    <div class="col mt-2" >
										     	<input type="text" name="yy" id="yy" class="form-control form-control-lg text-center " placeholder="년(4자)"  maxlength="4" required="required"/>
										
										    </div>
										    <div class="col">
												  <select id="memberbb_mm" name="mm" class="month text-center form-control mt-2" style="height:48px;" required="required">
										            <option value="">월</option>
										            <option value="01">1</option>
										            <option value="02">2</option>
										            <option value="03">3</option>
										            <option value="04">4</option>
										            <option value="05">5</option>
										            <option value="06">6</option>
										            <option value="07">7</option>
										            <option value="08">8</option>
										            <option value="09">9</option>                                    
										            <option value="10">10</option>
										            <option value="11">11</option>
										            <option value="12">12</option>
											       </select>
										    </div>
										    <div class="col">	
												  <select id="memberbb_mm" name="dd" class="month text-center form-control mt-2"  style="height:48px;" required="required">
										            <option value="">일</option>
										            <option value="01">1</option>
										            <option value="02">2</option>
										            <option value="03">3</option>
										            <option value="04">4</option>
										            <option value="05">5</option>
										            <option value="06">6</option>
										            <option value="07">7</option>
										            <option value="08">8</option>
										            <option value="09">9</option>                                    
										            <option value="10">10</option>
										            <option value="11">11</option>
										            <option value="12">12</option>
										            <option value="13">13</option>
										            <option value="14">14</option>
										            <option value="15">15</option>
										            <option value="16">16</option>
										            <option value="17">17</option>
										            <option value="18">18</option>
										            <option value="19">19</option>
										            <option value="20">20</option>
										            <option value="21">21</option>
										            <option value="22">22</option>
										            <option value="23">23</option>
										            <option value="24">24</option>
										            <option value="25">25</option>
										            <option value="26">26</option>
										            <option value="27">27</option>
										            <option value="28">28</option>
										            <option value="29">29</option>
										            <option value="30">30</option>
										            <option value="31">31</option>
											       </select>
									 	   </div>
									    </div>
								  </div>
								<div class="form-group error"></div>
								
<!-- 전화번호 -->								
								<div class="form-group mx-auto px-auto "> 전화번호
									  <div class="form-row">
										    <div class="col-3 mt-2" >
												  <select id="tel_1" name="tel_1" class="month text-center form-control mt-2" style="height:48px;" >
										            <option>+82 대한민국</option>
										            <option>+1 미국</option>
										            <option>+7 러시아</option>
										            <option>+31 네덜란드</option>
										            <option>+33 프랑스</option>
										            <option>+34 스페인</option>
										            <option>+41 스위스</option>
										            <option>+44 영국</option>
										            <option>+49 독일</option>
										            <option>+52 멕시코</option>
										            <option>+54 아르헨티나</option>
										            <option>+55 브라질</option>
										            <option>+60 말레이시아</option>
										            <option>+61 호주</option>
										            <option>+62 인도네시아</option>
										            <option>+63 필리핀</option>
										            <option>+66 타이</option>
										            <option>+81 일본</option>
										            <option>+84 베트남</option>
										            <option>+86 중국</option>
										            <option>+90 터키</option>
										            <option>+233 가나</option>
										            <option>+223 나이지리아</option>
										            <option>+886 대만</option>
										            <option>직접입력</option>
											       </select>
										    </div>

										    <div class="col mt-3" >
										     	<input type="text" id="tel_2" name="tel_2"  class="form-control form-control-lg text-center " required="required" placeholder="숫자만 입력하세요" maxlength="15"/>
										    </div>	
									</div>
								</div>
										<div class="form-group error"></div>
										    							
								<div class="form-group mx-auto px-auto "> 이메일
									  <div class="form-row">
										    <div class="col mt-2" >
												<input type="text" id="e_mail" name="e_mail" class="form-control form-control-lg mt-2" required="required"/>
											</div>
											<div class="col-1 h4 mt-4 font-weight-bold">
												@
											</div>
											<div class="col-5 mt-2" >				
												<select class="form-control mt-2 " id="e_mail2" name="e_mail2" style="height:48px" >
												 	<option >naver.com</option>
												 	<option >gmail.com</option>
												 	<option >daum.com</option>
												 	<option >nate.com</option>
												</select>
											</div>
										</div>
								</div>
										<div class="form-group error"></div>
										
								<div class="form-group"> 성별
									<select class="form-control mt-2" name ="gender" style="height:48px" >
									 	<option >선택안함</option>
									 	<option >남성</option>
									 	<option >여성</option>
									</select>
								</div>
								
						
								<div class="text-center" id="joinbutton"> 
									<button type="button"  id="joinbutton" class="btn btn-outline-success font-weight-bold form-control mt-3" style="height:48px;" value = "회원가입" onclick='check()' >회원가입</button>
								</div>
							</form>
						</div>
					</div>
	</div>
</div>

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
<script src="js/join.js"></script>
	
</body>
</html>