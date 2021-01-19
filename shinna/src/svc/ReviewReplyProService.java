package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewReplyProService {

	public boolean replyArticle(ReviewBean article) throws Exception {
		boolean isReplySuccess = false;
		int insertCount = 0;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			insertCount = reviewDAO.insertReplyArticle(article);
			
			if(insertCount > 0) {
				commit(con);
				isReplySuccess = true;
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return isReplySuccess;
	}

}
