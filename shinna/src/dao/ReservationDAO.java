package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import vo.ReservationBean;

public class ReservationDAO {
	public static ReservationDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	private ReservationDAO() {

	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public static ReservationDAO getInstance() {
		if(instance == null) {
			instance = new ReservationDAO();
		}
		return instance;
	}

	public int insertRSVN(ReservationBean reservation) {
		
		String sql = "insert into reservation values (?,?,?,?,?,?,?,?)";
		
		int insertRSVN = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reservation.getId());
			pstmt.setString(2, reservation.getType());
			pstmt.setString(3, reservation.getChkin());
			pstmt.setString(4, reservation.getChkout());
			pstmt.setInt(5, reservation.getRoom());
			pstmt.setInt(6, reservation.getAdult());
			pstmt.setInt(7, reservation.getChild());
			pstmt.setInt(8, reservation.getBaby());
			insertRSVN = pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("insertRSVN 에러: " +ex);
			
		}finally {
			close(pstmt);
		}
		return insertRSVN;
	}
}
