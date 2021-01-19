	var isSubmit = false;

	$(function() {
			//성명(영문-이름) 공백확인
		$("#L_name").blur(function(e){
			e.preventDefault();
			if($("#L_name").val().length == 0) {
				$(".error:eq(0)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#L_name").val().length !=0){
				$(".error:eq(0)").addClass("d-none");				
			}
		});
		
		
		//성명(한글) 공백확인
		$("#name").blur(function(e){
			e.preventDefault();
			if($("#name").val().length == 0) {
				$(".error:eq(1)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#name").val().length !=0){
				$(".error:eq(1)").addClass("d-none");				
			}
		});
		
		//아이디 공백, 한글 정규식
		$("#id").blur(function(e){
			e.preventDefault();
			if($("#id").val().length == 0) {
				$(".error:eq(2)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#id").val().length !=0){
				$(".error:eq(2)").addClass("d-none");				
			}		
		});
    
		 

		//아이디 중복검사
		$("#id").blur(function() {
			$.get("Joinduplicate.jsp", { "id": $(this).val() }, function(data) {
				var obj = jQuery.parseJSON(data); 
				var idJ = /^[a-z0-9][a-z0-9_\-]{3,14}$/; 
				console.log(obj[0]);
				if(idJ.test($('#id').val())!=true){
					$("#LoginCheck").html("<span style='font-size:14px; color: #00B700; font-weight:bold;'>4~15자의 영문, 숫자만 사용 가능합니다.</span>");
				} else if (obj[0] == true) {
					$("#LoginCheck").html("<span style='font-size:14px; color: red; font-weight:bold;'>중복된 아이디 입니다.</span>");
				} else{
					$("#LoginCheck").html("<span  style='font-size:14px; color: #5853EB; font-weight:bold;'>중복 되지 않은 아이디 입니다.</span>");
					isSubmit = true;
				}
				
			});
		});
 
		
		//비밀번호 공백확인
		$("#pw").blur(function(e){
			e.preventDefault();
			if($("#pw").val().length == 0) {
				$(".error:eq(3)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#pw").val().length !=0){
				$(".error:eq(3)").addClass("d-none");				
			}		
		});
		
		//비밀번호 유효성 검사
		$('#success').hide();
		$('#danger').hide();
		$('input').keyup(function() {
			var pwd1 = $('#pw').val();
			var pwd2 = $('#pw_check').val();
			if (pwd1 != "" || pwd2 != "") {
				if (pwd1 == pwd2) {
					$('#success').show();
					$('#danger').hide();
					$('#submit').removeAttr("disabled");
				} else {
					$('#success').hide();
					$('#danger').show();
					$('#submit').attr('disabled', "disabled");
				}
			}
		});
		
		//생일(년도) 공백확인
		$("#yy").blur(function(e){
			e.preventDefault();
			if($("#yy").val().length == 0) {
				$(".error:eq(4)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#yy").val().length !=0){
				$(".error:eq(4)").addClass("d-none");				
			}		
		});
		
		//전화번호 공백확인
		$("#tel_2").blur(function(e){
			e.preventDefault();
			if($("#tel_2").val().length == 0) {
				$(".error:eq(5)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#tel_2").val().length !=0){
				$(".error:eq(5)").addClass("d-none");				
			}		
		});
		
		//이메일 공백확인
		$("#e_mail").blur(function(e){
			e.preventDefault();
			if($("#e_mail").val().length == 0) {
				$(".error:eq(6)").html("<span style='font-size:14px; color: red; font-weight:bold;'>필수사항입니다.</span>");
			}else if ($("#e_mail").val().length !=0){
				$(".error:eq(6)").addClass("d-none");				
			}		
		});
		
	});
	   
	function check(){
		theForm = document.joinForm;
		if(theForm.L_name.value=="" || theForm.name.value=="" || theForm.id.value=="" ||
		theForm.pw.value=="" || theForm.tel_2.value=="" || theForm.e_mail.value=="" ) {
			alert("필수 입력란이 비었습니다. 확인해 주세요.");
			}else if(!isSubmit){
				alert("아이디를 확인해 주세요.");
			}else{
				alert("회원가입을 축하합니다.");
				theForm.submit();
			}
		}