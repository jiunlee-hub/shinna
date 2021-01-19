package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReviewDeleteProService;
import vo.ActionForward;

public class ReviewDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int ref = Integer.parseInt(request.getParameter("ref"));
		
		String nowPage = request.getParameter("page");
		ReviewDeleteProService reviewDeleteProService = new ReviewDeleteProService();
		boolean isArticleWriter = reviewDeleteProService.isArticleWriter(num, id);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(!isArticleWriter) {
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		} else {
			boolean isDeleteSuccess = reviewDeleteProService.removeArticle(num, ref);
		
			if(!isDeleteSuccess) {
				out.println("<script>");
				out.println("alert('삭제실패')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("reviewList.do?page=" + nowPage);
			}
		}
		return forward;
	}

}
