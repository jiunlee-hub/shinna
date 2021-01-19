<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.PageInfo, vo.ReviewBean, java.util.*, java.text.SimpleDateFormat" %>
<%
	ArrayList<ReviewBean> articleList = (ArrayList<ReviewBean>)request.getAttribute("articleList");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>
<%
	String id = null, grade="";
	if(session.getAttribute("id") != null) id = (String)session.getAttribute("id");
	if(session.getAttribute("grade") != null) id = (String)session.getAttribute("grade");   //보류
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>SHINNA</title>
<link href = "images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
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
	
	<!-- 게시판리스트 -->
	<div class="container mt-5 pt-5 mb-4 pb-4 clearfix">
		<div class="container pt-5 mt-5 pb-5 mb-5 conta2">
			<div class="h3" style="color: #B22222;">게시판</div>
			<hr style="height: 2.5px;" color="black" />
			<%
				if(articleList != null && listCount > 0) {
			%>
				<table class="table table-striped text-center">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				<%
					for(int i=0; i< articleList.size(); i++) {
				%>
					<tr>
						<td>
						<%
							if(articleList.get(i).getLev() != 0) {
						%>
								<span style="display: none;"><%=articleList.get(i).getOrdernum() %></span>
						<%
							} else {
						%>
								<%=articleList.get(i).getOrdernum() %>
						<%
							}
						%>
						</td>
						<td class="text-left">
						<%if(articleList.get(i).getLev() != 0) { %>
							<%for(int a=0; a<=articleList.get(i).getLev()*2; a++) { %>
							&nbsp;
							<%} %> <span style="color: #E5B98F;">↪</span>&nbsp;<span class="badge badge-info badge-pill">Re</span>
						<%} else { %>
							<span style="color: #B22222;">▶</span>
						<%} %>
							<a href="reviewDetail.do?num=<%=articleList.get(i).getNum() %>&page=<%=nowPage %>">
								<%=articleList.get(i).getSubject() %>
							</a>
						</td>
						
						<td>
									<%
						   	 			if(articleList.get(i).getId().toString().equals("shinna604")) {
						   	 				out.println("<span class=' text-danger'>관리자</span> ");
						   	 			} else {
						   	 		%>
						   	 			<%= articleList.get(i).getId()  %>
						   	 		<% 	}
						   	 		%>
									
						</td>
						
						
						<td><%=articleList.get(i).getDate() %></td>
						<td><%=articleList.get(i).getReadcount() %></td>
					</tr>
				<%} %>
			</table>
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<%if(nowPage <= 1) { %>
						<li class="page-item disabled" id="prevBlock">
							<a class="page-link" aria-label="PreviousBlock" 
							href="reviewList.do?page=<%=startPage %>">
								<span aria-hidden="true">«</span>
								<span class="sr-only">Previous Block</span>
							</a> &nbsp;
						</li>
					<%} else { %>
						<li class="page-item" id="prevBlock">
							<a class="page-link" aria-label="PreviousBlock" 
							href="reviewList.do?page=<%=startPage %>">
								<span aria-hidden="true">«</span>
								<span class="sr-only">Previous Block</span>
							</a> &nbsp;
						</li>
					<%} %>
					<%if(nowPage <= 1) { %>
						<li class="page-item disabled" id="prevPage">
							<a class="page-link" aria-label="PreviousPage"
							href="reviewList.do?page=<%=nowPage-1 %>">
								<span aria-hidden="true">‹</span>
								<span class="sr-only">Previous Page</span>
							</a> &nbsp;
						</li>
					<%} else { %>
						<li class="page-item" id="prevPage">
							<a class="page-link" aria-label="PreviousPage"
							href="reviewList.do?page=<%=nowPage-1 %>">
								<span aria-hidden="true">‹</span>
								<span class="sr-only">Previous Page</span>
							</a> &nbsp;
						</li>
					<%} %>
					<%for(int a=startPage; a<=endPage; a++) { 
						if(a==nowPage) { %>
							<li class="page-item active">
								<a class="page-link" href="reviewList.do?page=<%=a %>">
									<%=a %>
									<span class="sr-only">(current)</span>
								</a>&nbsp;
							<li>
						<%} else { %>
							<li class="page-item">
								<a class="page-link" href="reviewList.do?page=<%=a %>">
									<%=a %>
								</a>&nbsp;
							</li>
						<%} %>
					<%} %>
					<%if(nowPage >= maxPage) { %>
						<li class="page-item disabled" id="nextPage">
							<a class="page-link" aria-label="NextPage" 
							href="reviewList.do?page=<%=nowPage+1 %>"> 
								<span aria-hidden="true">›</span>
								<span class="sr-only">Next Page</span>
							</a>
						</li>
					<%} else { %>
						<li class="page-item" id="nextPage">
							<a class="page-link" aria-label="NextPage" 
							href="reviewList.do?page=<%=nowPage+1 %>"> 
								<span aria-hidden="true">›</span>
								<span class="sr-only">Next Page</span>
							</a>
						</li>
					<%} %>
					<%if(nowPage >= maxPage) { %>
						<li class="page-item disabled" id="nextBlock">
							<a class="page-link" aria-label="NextBlock" 
							href="reviewList.do?page=<%=maxPage%>"> 
								<span aria-hidden="true">»</span>
								<span class="sr-only">Next Block</span>
							</a>
						</li>
					<%} else { %>
						<li class="page-item" id="nextBlock">
							<a class="page-link" aria-label="NextBlock" 
							href="reviewList.do?page=<%=maxPage%>"> 
								<span aria-hidden="true">»</span>
								<span class="sr-only">Next Block</span>
							</a>
						</li>
					<%} %>
						<li class="page-item">
					<%
						} else {
					%>
							등록된 글이 없습니다.
					<%
						}
					%>
						</li>
				</ul>
			<%
				if(id == null) {
			%>
					<a href="javascript:alert('권한이 없습니다.'); location.href='Login.do';" class="btn btn-warning float-right" id="writeBtn">글쓰기</a>
			<%
				} else {
			%>
					<a href="reviewWriteForm.do" class="btn btn-warning float-right" id="writeBtn">글쓰기</a>
			<%
				}
			%>
			</nav>
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
</body>
</html>