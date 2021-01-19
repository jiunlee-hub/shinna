package action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import api.ApiExamCaptchaNkeyResult;
import svc.ReviewWriteProService;
import vo.ActionForward;
import vo.ReviewBean;

public class ReviewWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		ReviewBean reviewBean = null;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();

		reviewBean = new ReviewBean();
		reviewBean.setId((String)session.getAttribute("id"));
		reviewBean.setCategory(request.getParameter("category"));
		reviewBean.setKind(request.getParameter("kind"));
		reviewBean.setSubject(request.getParameter("subject"));
		reviewBean.setContent(request.getParameter("content"));
		
		
		// 공통 api아이디 + 시크릿값
		String clientId = "8_My5i_s3A_JtzUR_jmk"; // 애플리케이션 클라이언트 아이디값";
		String clientSecret = "h4VX8XSjPA"; // 애플리케이션 클라이언트 시크릿값";

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		//ReviewWriteFormAction에서 발급한 api 키 값을 저장한 session을 불러옴 
		String responseImage = (String)session.getAttribute("responseImage"); 
		String code = "1"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
		String value = request.getParameter("key"); // 사용자가 입력한 캡차 이미지 글자값
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code + "&key=" + responseImage + "&value=" + value;

		ApiExamCaptchaNkeyResult apiExamCaptchaNkeyResult = new ApiExamCaptchaNkeyResult();
		String responseBody = apiExamCaptchaNkeyResult.get(apiURL, requestHeaders);
		responseBody = responseBody.split(",")[0];
		responseBody = responseBody.substring(10);
		boolean result = Boolean.valueOf(responseBody);
		
		if(!result) {
			out.println("<script>");
			out.println("alert('Captcha 실패')");
			out.println("location.href='reviewWriteForm.do';");
			out.println("</script>");
		} else {
			ReviewWriteProService reviewWriteProService = new ReviewWriteProService();
			boolean isWriteSuccess = reviewWriteProService.registArticle(reviewBean);
			if(!isWriteSuccess) {
				out.println("<script>");
				out.println("alert('등록실패')");
				out.println("location.href='reviewWriteForm.do';");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("reviewList.do");
			}
		}
		return forward;
	}

}
