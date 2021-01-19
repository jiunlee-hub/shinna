package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class JoinDeleteProService {

	public boolean isDelete(String pw, String id) {
		boolean isDelete = false;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDAO = MemberDAO.getInstance();
			memberDAO.setConnection(con);
			MemberBean member = new MemberBean();
			member.setId(id);
			member.setPw(pw);
			String userId = memberDAO.memberInfoId(member);
			int isDeleteCount = 0;
			if (userId != null)
				isDeleteCount = memberDAO.isDelete(id);

			if (isDeleteCount > 0) {
				commit(con);
				isDelete = true;
			} else {
				rollback(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			if(con != null) close(con);
		}
		return isDelete;
	}
}
