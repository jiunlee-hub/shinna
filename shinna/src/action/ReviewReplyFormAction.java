package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.ReviewDetailService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		String nowPage = request.getParameter("page");
		int num = Integer.parseInt(request.getParameter("num"));
		ReviewDetailService reviewDetailService = new ReviewDetailService();
		ReviewBean article = reviewDetailService.getArticle(num);
		request.setAttribute("article", article);
		request.setAttribute("page", nowPage);
		forward.setPath("/review_reply.jsp");
		return forward;
	}

}
