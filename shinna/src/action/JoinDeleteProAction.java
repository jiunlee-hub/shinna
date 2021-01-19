package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.JoinDeleteProService;
import vo.ActionForward;

public class JoinDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		JoinDeleteProService deleteService = new JoinDeleteProService();
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		boolean isDelete = deleteService.isDelete(pw, id);
		if(!isDelete) {
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.')");
			out.println("history.go(-1);");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원탈퇴 되었습니다')");
			out.println("</script>");
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("Logout.do");
			}
		return forward;
		
		
	}

}
