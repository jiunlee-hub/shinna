function checkIt() {
	if(confirm("정말 탈퇴시키겠습니까?")) {
		location.href='memberDelete.do'
	}
	return false;
}