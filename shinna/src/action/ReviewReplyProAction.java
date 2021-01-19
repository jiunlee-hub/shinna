package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReviewReplyProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String nowPage = request.getParameter("page");
		ReviewBean article = new ReviewBean();
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setId((String)session.getAttribute("id"));
		article.setCategory(request.getParameter("category"));
		article.setKind(request.getParameter("kind"));
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setLev(Integer.parseInt(request.getParameter("lev")));
		article.setSeq(Integer.parseInt(request.getParameter("seq")));
		ReviewReplyProService reviewReplyProService = new ReviewReplyProService();
		boolean isReplySuccess = reviewReplyProService.replyArticle(article);
		
		if(isReplySuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("reviewList.do?page=" + nowPage);
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답장실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
