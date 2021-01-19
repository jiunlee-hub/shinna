package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReviewModifyProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		boolean isModifySuccess = false;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int num = Integer.parseInt(request.getParameter("num"));
		ReviewBean article = new ReviewBean();
		ReviewModifyProService reviewModifyProService = new ReviewModifyProService();
		boolean isRightUser = reviewModifyProService.isArticleWriter(num, id);
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(!isRightUser) {
			out.println("<script>");
			out.println("alert('수정할 권한이 없습니다.')");
			out.println("history.go(-2);");
			out.println("</script>");
		} else {
			article.setNum(num);
			article.setCategory(request.getParameter("category"));
			article.setKind(request.getParameter("kind"));
			article.setSubject(request.getParameter("subject"));
			article.setContent(request.getParameter("content"));
			isModifySuccess = reviewModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				out.println("<script>");
				out.println("alert('수정실패')");
				out.println("history.back();");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("reviewDetail.do?num=" + article.getNum()+"&page="+request.getParameter("page"));
			}
		}
		return forward;
	}

}
