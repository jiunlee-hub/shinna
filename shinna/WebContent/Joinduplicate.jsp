<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="dao.MemberDAO, db.JdbcUtil, java.sql.*"%>
<%
	
	MemberDAO memberDAO = MemberDAO.getInstance();
	Connection con = null;
	try {
		con = JdbcUtil.getConnection();
		memberDAO.setConnection(con);
		boolean isId = memberDAO.checkId(request.getParameter("id"));
		out.println("["+ isId + "]");
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>