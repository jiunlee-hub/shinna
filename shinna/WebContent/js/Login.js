//쿠키 저장
function setCookie(name,value,days) {
	var today = new Date();
	today.setDate(today.getDate() + days);
	document.cookie = name + "=" + escape(value) + ";path=/;expires=" + today.toGMTString() + ";"
	
}


//쿠키 불러오기
function getCookie(Name) {
	var search = Name + "=";
	if(document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if(offset != -1) {
			offset + search.length;
			end = document.cookie.indexOf(";",offset);
			if(end == -1)
				end = document.cookie.length;
				return unescape(document.cookie.substring(Offset,end));
		}
	}
	
}

