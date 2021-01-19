package svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.ReservationDAO;
import vo.ReservationBean;

public class ReservationService {
	
	public boolean makeRSVN(ReservationBean reservation) {
		boolean insertSuccess = false;
		Connection con = null;
		try {
			con = getConnection();
			ReservationDAO reservationDAO = ReservationDAO.getInstance();
			reservationDAO.setConnection(con);
			int insertRSVN = reservationDAO.insertRSVN(reservation);
			if(insertRSVN>0) {
				insertSuccess = true;
				commit(con);
			} else {
				rollback(con);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) close(con);	
		}
		return insertSuccess;
		
	}
}