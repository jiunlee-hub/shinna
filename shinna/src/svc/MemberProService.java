package svc;

import java.sql.Connection;
import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;
public class MemberProService {

	public boolean memberInfo(MemberBean member) {
		boolean infoIdResult = false;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			String infoId=memberDAO. memberInfoId(member);
			if(infoId !=null) {
				infoIdResult = true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return infoIdResult;
	}

}
		
		