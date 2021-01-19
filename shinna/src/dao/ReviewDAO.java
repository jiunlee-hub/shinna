package dao;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.ReviewBean;

public class ReviewDAO {
	DataSource ds;
	Connection con;
	private static ReviewDAO reviewDAO;
	
	private ReviewDAO() {
		
	}
	
	public static ReviewDAO getInstance() {
		if(reviewDAO == null) {
			reviewDAO = new ReviewDAO();
		}
		return reviewDAO;
	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	//글의 개수
	public int selectListCount() {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement("select count(*) from review");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch(Exception e) {
			System.out.println("getListCount 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}
	
	//글 목록
	public ArrayList<ReviewBean> selectArticleList(int page, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String review_list_sql = "select * from review order by ref desc, seq asc limit ?, ?";
		
		
		ArrayList<ReviewBean> articleList = new ArrayList<ReviewBean>();
		ReviewBean review = null;
		int startrow = (page - 1) * 10;
		
		try {
			pstmt = con.prepareStatement(review_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				review = new ReviewBean();
				review.setNum(rs.getInt("num"));
				review.setOrdernum(rs.getInt("ordernum"));
				review.setId(rs.getString("id"));
				review.setCategory(rs.getString("category"));
				review.setKind(rs.getString("kind"));
				review.setSubject(rs.getString("subject"));
				review.setContent(rs.getString("content"));
				review.setRef(rs.getInt("ref"));
				review.setLev(rs.getInt("lev"));
				review.setSeq(rs.getInt("seq"));
				review.setReadcount(rs.getInt("readcount"));
				review.setDate(rs.getDate("date"));
				articleList.add(review);
			}
		} catch(Exception e) {
			System.out.println("getReviewList 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	
	//글쓰기
	public int insertArticle(ReviewBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int ordernum = 0;
		String sql = "";
		int insertCount = 0;
		
		try {
			
			pstmt = con.prepareStatement("select max(ordernum) from review");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ordernum = rs.getInt(1) + 1;
			} else {
				ordernum = 1;
				close(pstmt);
				close(rs);
			}
			
			sql = "insert into review (num, ordernum, id, category, kind, subject, content, ref, lev, seq, readcount, date) values (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			pstmt.setString(2, article.getId());
			pstmt.setString(3, article.getCategory());
			pstmt.setString(4, article.getKind());
			pstmt.setString(5, article.getSubject());
			pstmt.setString(6, article.getContent());
			pstmt.setInt(7, ordernum);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			insertCount = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("reviewInsert 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}
	
	//조회수 업데이트
	public int updateReadCount(int num) {
		PreparedStatement pstmt = null;
		int updateCount = 0;
		String sql = "update review set readcount = readcount + 1 where num = " + num;
		
		try {
			pstmt = con.prepareStatement(sql);
			updateCount = pstmt.executeUpdate();
		} catch(SQLException e) {
			System.out.println("setReadCountUpdate 에러: " + e);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	//글내용
	public ReviewBean selectArticle(int num) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewBean reviewBean = null;
		
		try {
			pstmt = con.prepareStatement("select * from review where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewBean = new ReviewBean();
				reviewBean.setNum(rs.getInt("num"));
				reviewBean.setOrdernum(rs.getInt("ordernum"));
				reviewBean.setId(rs.getString("id"));
				reviewBean.setCategory(rs.getString("category"));
				reviewBean.setKind(rs.getString("kind"));
				reviewBean.setSubject(rs.getString("subject"));
				reviewBean.setContent(rs.getString("content"));
				reviewBean.setRef(rs.getInt("ref"));
				reviewBean.setLev(rs.getInt("lev"));
				reviewBean.setSeq(rs.getInt("seq"));
				reviewBean.setReadcount(rs.getInt("readcount"));
				reviewBean.setDate(rs.getDate("date"));
			}
		} catch(Exception e) {
			System.out.println("getDetail 에러: " + e);
		} finally {
			close(rs);
			close(pstmt);
		}
		return reviewBean;
	}

	//글답변
	public int insertReplyArticle(ReviewBean article) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int insertCount = 0;
		int ref = article.getRef();
		int lev = article.getLev();
		int seq = article.getSeq();
		
		try {
			if(lev == 0) {
				sql = "select max(seq) from review where ref = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					seq = rs.getInt(1);
					close(rs);
					close(pstmt);
				}
			} else {
				sql = "update review set seq = seq + 1 where ref = ? and seq > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, seq);
				int updateCount = pstmt.executeUpdate();
				
				if(updateCount > 0) {
					commit(con);
					close(rs);
					close(pstmt);
				}
			} 
			
			seq = seq + 1;
			lev = lev + 1;
			
			sql = "insert into review (num, ordernum, id, category, kind, subject, content, ref, lev, seq, readcount, date) values (null, null, ?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getId());
			pstmt.setString(2, article.getCategory());
			pstmt.setString(3, article.getKind());
			pstmt.setString(4, article.getSubject());
			pstmt.setString(5, article.getContent());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, lev);
			pstmt.setInt(8, seq);
			pstmt.setInt(9, 0);
			
			insertCount = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("reviewReply 에러: " + e);
		} finally {
			close(pstmt);
		}
		return insertCount;
	}
	
	//글쓴이확인
	public boolean isArticleReviewWriter(int num, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String review_sql = "select * from review where num = ?";
		boolean isWriter = false;
		
		try {
			pstmt = con.prepareStatement(review_sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			rs.next();
			
			if(id.equals(rs.getString("id")) || id.equals("shinna604")) {
				isWriter = true;
			}
		} catch(Exception e) {
			System.out.println("isReviewWriter 에러: " + e);
		} finally {
			close(pstmt);
		}
		return isWriter;
	}
	
	//글수정
	public int updateArticle(ReviewBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		String sql = "update review set category = ?, kind = ?, subject = ?, content = ? where num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getCategory());
			pstmt.setString(2, article.getKind());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getContent());
			pstmt.setInt(5, article.getNum());
			
			updateCount = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("reviewModify 에러: " + e);
		} finally {
			close(pstmt);
		}
		return updateCount;
	}
	
	//글삭제
	public int deleteArticle(int num, int ref, boolean original) {
		PreparedStatement pstmt = null;
		String review_delete_sql = "";
		
		if(original) {
			review_delete_sql = "delete from review where ref = ?";
		} else {
			review_delete_sql = "delete from review where num = ?";
		}
		
		int deleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(review_delete_sql);

			if(original) {
				pstmt.setInt(1, ref);
			} else {
				pstmt.setInt(1, num);
			}
			
			deleteCount = pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("reviewDelete 에러: " + e);
		} finally {
			close(pstmt);
		}
		return deleteCount;
	}
}
