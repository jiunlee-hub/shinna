package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewDetailService {

	public ReviewBean getArticle(int num) throws Exception {
		ReviewBean article = null;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			int updateCount = reviewDAO.updateReadCount(num);
			
			if(updateCount > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			article = reviewDAO.selectArticle(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return article;
	}

}
