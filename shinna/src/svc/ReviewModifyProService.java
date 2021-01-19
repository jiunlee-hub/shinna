package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewModifyProService {
	public boolean isArticleWriter(int num, String id) {
		boolean isArticleWriter = false;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			isArticleWriter = reviewDAO.isArticleReviewWriter(num, id);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return isArticleWriter;
	}

	public boolean modifyArticle(ReviewBean article) throws Exception {
		boolean isModifySuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			int updateCount = reviewDAO.updateArticle(article);
			
			if(updateCount > 0) {
				commit(con);
				isModifySuccess = true;
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return isModifySuccess;
	}

	
}
