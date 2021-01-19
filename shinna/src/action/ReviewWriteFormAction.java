package action;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import api.ApiExamCaptchaImage;
import api.ApiExamCaptchaNkey;
import vo.ActionForward;

public class ReviewWriteFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		// 공통 api아이디 + 시크릿값
		ApiExamCaptchaNkey apiExamCaptchaNkey = new ApiExamCaptchaNkey();
		String clientId = "8_My5i_s3A_JtzUR_jmk"; // 애플리케이션 클라이언트 아이디값";
		String clientSecret = "h4VX8XSjPA"; // 애플리케이션 클라이언트 시크릿값";
		// 캡차 키 값 생성
		String code = "0"; // 키 발급시 0, 캡차 이미지 비교시 1로 세팅
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String key = apiExamCaptchaNkey.getCaptcha(apiURL, requestHeaders);
		key = key.substring(8, key.length() - 2); // substring으로 Json출력부분을 키 외 부분 자름
		// 위의 생성한 키 값을 넣어 이미지 값 생성
		apiURL = "https://openapi.naver.com/v1/captcha/ncaptcha.bin?key=" + key;
		
		ApiExamCaptchaImage apiExamCaptchaImage = new ApiExamCaptchaImage(request);
		String responseImage = apiExamCaptchaImage.get(apiURL, requestHeaders);
		//발급한 키 값을 ReviewWriteProAction에 불러가기 위해 session에 저장
		request.getSession().setAttribute("responseImage", key);
		
		//위의 생성한 이미지 값 유무
		if(responseImage != null) {
			forward = new ActionForward();
			forward.setPath("review_write.jsp");
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Captcha생성 실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
