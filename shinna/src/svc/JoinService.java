package svc;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;
public class JoinService {

	public boolean joinMember(MemberBean member) {
		boolean joinSuccess =false;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			int insertCount = memberDAO.insertMember(member);
			if(insertCount > 0) {
				joinSuccess = true;
				commit(con);
			}else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return joinSuccess;
	}

}
