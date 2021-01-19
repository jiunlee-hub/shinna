package svc;

import java.sql.Connection;
import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;
public class LoginService {

	public boolean login(MemberBean member) {
		boolean loginResult = false;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			String loginId=memberDAO.selectLoginId(member);
			if(loginId !=null) {
				loginResult = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return loginResult;
	}

}
