package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;


public class ReviewWriteProService {

	public boolean registArticle(ReviewBean reviewBean) throws Exception {
		boolean isWriteSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			int insertCount = reviewDAO.insertArticle(reviewBean);
			
			if(insertCount > 0) {
				commit(con);
				isWriteSuccess = true;
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return isWriteSuccess;
	}

}
