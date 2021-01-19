package api;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

//네이버 캡차 API 예제 - 캡차 이미지 수신
public class ApiExamCaptchaImage {
	//이미지 저장 경로 지정을 위해 HttpServletRequest request로 지정하려 했으나,
	//해당 메소드가 private static으로 선언되어 private static HttpServletRequest request로 선언
	private static HttpServletRequest request = null;
	
	public ApiExamCaptchaImage(HttpServletRequest request) {
		ApiExamCaptchaImage.request = request;
	}

	public String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return getImage(con.getInputStream());
			} else { // 에러 발생
				return error(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}
	//이미지 생성 및 저장 경로 지정
	private static String getImage(InputStream is) {
		int read;
		byte[] bytes = new byte[1024];
//		랜덤한 이름으로 파일 생성
//		String filename = Long.valueOf(new Date().getTime()).toString();
//		File f = new File(filename + ".jpg");
		// 파일 저장 경로 지정 코드
		ServletContext context = request.getServletContext();
		String imagePath = context.getRealPath("images");
//		System.out.println(imagePath);
		// 동일 이미지파일에 번호만 새로 갱신 됨
		File f = new File(imagePath + "/out.jpg");
		try (OutputStream outputStream = new FileOutputStream(f)) {
			f.createNewFile();
			while ((read = is.read(bytes)) != -1) {
				outputStream.write(bytes, 0, read);
			}
			return "이미지 캡차가 생성되었습니다.";
		} catch (IOException e) {
			throw new RuntimeException("이미지 캡차 파일 생성에 실패 했습니다.", e);
		}
	}

	private static String error(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}
}



