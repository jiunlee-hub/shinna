

//TOP 버튼
$(function() {
	$("#toTop").hide();
	$(window).scroll(function(){
		if ($(this).scrollTop() > 50) {
			$('#toTop').fadeIn();
		} else {
			$('#toTop').fadeOut();
		}
	});	
	$("#toTop").click(function(){
		$('html, body').animate({
			scrollTop : 0
		}, 400);
		return fasle;
	});
});

$(function() {
$(document).ready(function(){  
  var $doc           = $(document);  
  var position       = 0;  
  var top = $doc.scrollTop(); //현재 스크롤바 위치  
  var screenSize     = 0;        // 화면크기  
//  var halfScreenSize = 0;    // 화면의 반  
 
   
  var pageWidth      = 1350; // 페이지 폭, 단위:px  
  var pagemblWidth      = 880; // 모바일페이지 폭, 단위:px  
  var leftOffet      = 1009;  // 중앙에서의 폭(왼쪽 -, 오른쪽 +), 단위:px  
  var leftMargin     = 500; // 페이지 폭보다 화면이 작을때 옵셋, 단위:px, leftOffet과 pageWidth의 반만큼 차이가 난다.  
  var leftmblMargin     = 60;
//  var speed          = 1500;     // 따라다닐 속도 : "slow", "normal", or "fast" or numeric(단위:msec)  
//  var easing         = 'swing'; // 따라다니는 방법 기본 두가지 linear, swing  
  var $layer         = $('#divpop'); // 레이어 셀렉팅  
  var layerTopOffset = 360;   // 레이어 높이 상한선, 단위:px  
  $layer.css('z-index', 10);   // 레이어 z-인덱스  
   
 
  //좌우 값을 설정하기 위한 함수  
  function resetXPosition()  
  {  
    $screenSize = $('body').width();// 화면크기  
//    halfScreenSize = $screenSize;// 화면의 반  
//    xPosition = halfScreenSize + leftOffet;  
    xPosition = leftOffet;  
    if ($screenSize < pageWidth)  
      xPosition = leftMargin;  
    if ($screenSize < pagemblWidth)  
      xPosition = leftmblMargin;  
    $layer.css('left', xPosition);  
  }  
 
  // 스크롤 바를 내린 상태에서 리프레시 했을 경우를 위해  
  if (top > 0 )  
    $doc.scrollTop(layerTopOffset+top);  
  else 
    $doc.scrollTop(0);  
 
  // 최초 레이어가 있을 자리 세팅  
  $layer.css('top',layerTopOffset);  
  resetXPosition();  
 
  //윈도우 크기 변경 이벤트가 발생하면  
  $(window).resize(resetXPosition);  
 
  //스크롤이벤트가 발생하면  
  $(window).scroll(function(){  
    yPosition = $doc.scrollTop()+layerTopOffset;  
    $layer.animate({"top":yPosition }, {duration:0, queue:false});  
  });  
});  
//레이어 HTML 마크업은 아주 간단하게. ID만 주는정도로 끝..(position:absolute는 줘야 합니다..)  
});


$(function() {
	
	 	var previousScroll = 0;
		
		var heightArray=new Array();
		$(".sub").css({display:"none"});
		$(".ani > ul >li").each(function() {
			heightArray.push($(this).find("ul").height());
		});
		
			$(".ani > ul > li").hover(
				function() {
					var n=$(this).index();
					
					$(".menuBg").removeClass("menuBgAni");
						
					$(this).find("ul").css({display:"block", height:"0px"}).stop()
					.animate({height:heightArray[n]+"px"}, 200);
					$(this).find("a:first").addClass("on");
				},
				function() {
					$(".menuBg").addClass("menuBgAni");
					
					$(this).find("ul").stop()
					.animate({height:"0px"}, 200,
					function(){
						$(this).css({display:"none"})
					});
					$(this).find("a:first").removeClass("on");
				}
			);
			
			$("nav > button").click(
				function() {
					$(".menuBg").removeClass("menuBgAni");
				}
			);	
			
			
			
	    $(window).scroll(function(){
		   var currentScroll = $(this).scrollTop();
		   previousScroll = currentScroll;
			
	       if (currentScroll == 0) {
				$(".menuBg").addClass("menuBgAni");
	       } else {
				$(".menuBg").removeClass("menuBgAni");
	       }

			
			$(".ani > ul > li").hover(
		
				function() {
					var n=$(this).index();
					
					$(".menuBg").removeClass("menuBgAni");
						
					$(this).find("ul").css({display:"block", height:"0px"}).stop()
					.animate({height:heightArray[n]+"px"}, 200);
					$(this).find("a:first").addClass("on");
				},
				function() {
					if(currentScroll == 0) {
						$(".menuBg").addClass("menuBgAni");
						
						$(this).find("ul").stop()
						.animate({height:"0px"}, 200,
						function(){
							$(this).css({display:"none"})
						});
						$(this).find("a:first").removeClass("on");
					} else {
						$(".menuBg").removeClass("menuBgAni");
						
						$(this).find("ul").stop()
						.animate({height:"0px"}, 200,
							function(){
								$(this).css({display:"none"})
							});
						$(this).find("a:first").removeClass("on");
					}
				}
			);
			


	   	});
	
	
	// 게시판 유형 선택
	$(".radi").click(function() {
		
		let radiValue = $(this).val(); 
		$(".radio").css({display:"table-row"});
	
		if(radiValue == "리워즈") {
			$("#radioSelect").empty().html(
				'<option value="">선택</option>'
				+ '<option value="신나리워즈가입">신나리워즈가입</option>'
				+ '<option value="포인트사용/적립">포인트사용/적립</option>'
				+ '<option value="포인트조정">포인트조정</option>'
				+ '<option value="기타">기타</option>'
			);
		} else if(radiValue == "호텔") {
			$("#radioSelect").empty().html(
				'<option value="">선택</option>'
				+ '<option value="객실/패키지문의">객실/패키지문의</option>'
				+ '<option value="다이닝문의">다이닝문의</option>'
				+ '<option value="멤버십문의">멤버십문의</option>'
				+ '<option value="홈페이지오류문의">홈페이지오류문의</option>'
				+ '<option value="기타">기타</option>'
			);
		} else {
			$("#radioSelect").empty().html(
				'<option value="">선택</option>'
				+ '<option value="라운지">라운지</option>'
				+ '<option value="레스토랑">레스토랑</option>'
				+ '<option value="휘트니스">휘트니스</option>'
				+ '<option value="샤워장">샤워장</option>'
				+ '<option value="수영장">수영장</option>'
			);
		}
	});
	
	
	
	
//	function jsChangeLang(lang) {
//		//$.session.clear();
//		location.href = "/front/?language=" + lang;
//	}
	
	
	
});