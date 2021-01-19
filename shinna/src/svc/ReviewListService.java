package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import dao.ReviewDAO;
import vo.ReviewBean;

public class ReviewListService {

	public int getListCount() throws Exception {
		int listCount = 0;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			listCount = reviewDAO.selectListCount();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return listCount;
	}

	public ArrayList<ReviewBean> getArticleList(int page, int limit) throws Exception {
		ArrayList<ReviewBean> articleList = null;
		Connection con = null;
		try {
			con = getConnection();
			ReviewDAO reviewDAO = ReviewDAO.getInstance();
			reviewDAO.setConnection(con);
			
			articleList = reviewDAO.selectArticleList(page, limit);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);
		}
		return articleList;
	}

}
