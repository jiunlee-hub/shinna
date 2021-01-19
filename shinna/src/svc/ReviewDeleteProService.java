package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReviewDAO;

public class ReviewDeleteProService {
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
	
	public boolean removeArticle(int num, int ref) throws Exception {
		boolean isRemoveSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			boolean original = reviewDAO.selectArticle(num).getLev() == 0;
			
			int deleteCount = reviewDAO.deleteArticle(num, ref, original);
			
			if(deleteCount > 0) {
				commit(con);
				isRemoveSuccess = true;
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return isRemoveSuccess;
	}
	
}
