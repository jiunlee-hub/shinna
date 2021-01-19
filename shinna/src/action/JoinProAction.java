package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.JoinService;
import vo.ActionForward;
import vo.MemberBean;

public class JoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberBean member = new MemberBean();
		boolean joinResult = false;
		
		member.setCountry(request.getParameter("country"));
		member.setF_name(request.getParameter("F_name"));
		member.setL_name(request.getParameter("L_name"));
		member.setName(request.getParameter("name"));
		member.setId(request.getParameter("id"));
		member.setPw(request.getParameter("pw"));
		member.setYy(Integer.parseInt(request.getParameter("yy")));
		member.setMm(Integer.parseInt(request.getParameter("mm")));
		member.setDd(Integer.parseInt(request.getParameter("dd")));
		member.setTel_1(request.getParameter("tel_1"));
		member.setTel_2(request.getParameter("tel_2"));
		member.setE_mail(request.getParameter("e_mail"));
		member.setE_mail2(request.getParameter("e_mail2"));
		member.setGender(request.getParameter("gender"));
		
		JoinService JoinService = new JoinService();
		joinResult =  JoinService.joinMember(member);
		
		ActionForward forward = null;
		if(joinResult == false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원등록실패'),history.back(),</script>");
		}else {
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("Login.do");
	}
		return forward;
	}

}
