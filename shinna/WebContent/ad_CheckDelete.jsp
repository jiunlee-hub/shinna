<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="vo.MemberBean"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	String id = null;

if ((session.getAttribute("id") == null) || (!((String) session.getAttribute("id")).equals("shinna604"))) {
	out.println("<script>");
	out.println("location.href='Login.do'");
	out.println("</script>");
}
id = session.getAttribute("id").toString();
String delete_id = request.getParameter("id");
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {

	Context init = new InitialContext();
	DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/e1b_shotel");
	con = ds.getConnection();
	pstmt = con.prepareStatement("delete from reservation where id =?");
	pstmt.setString(1, delete_id);
	pstmt.executeUpdate();

} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		con.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
}

out.println("<script>");
out.println("location.href='ad_CheckList.do'");
out.println("</script>");

%>