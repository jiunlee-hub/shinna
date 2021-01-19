package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberBean member = new MemberBean();
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		
		MemberProService MemberProService = new MemberProService();
		boolean infoResult = MemberProService.memberInfo(member);
		ActionForward forward=null;
		if(infoResult) {
			forward = new ActionForward();
			
			session.setAttribute("id", member.getId());
			forward.setRedirect(true);	
			forward.setPath("./memberInfo.do");
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>alert('비밀번호가 틀렸습니다.');history.back();</script>");
		}
		return forward;
	}

}
