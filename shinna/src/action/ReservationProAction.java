package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.ReservationService;
import vo.ActionForward;
import vo.ReservationBean;

public class ReservationProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ReservationBean reservation = new ReservationBean();
		boolean reservationRs = false;
		
		reservation.setId(request.getParameter("id"));
		reservation.setType(request.getParameter("type"));
		reservation.setChkin(request.getParameter("chkin"));
		reservation.setChkout(request.getParameter("chkout"));
		reservation.setRoom(Integer.parseInt(request.getParameter("room")));
		reservation.setAdult(Integer.parseInt(request.getParameter("adult")));
		reservation.setChild(Integer.parseInt(request.getParameter("child")));
		reservation.setBaby(Integer.parseInt(request.getParameter("baby")));
		
		ReservationService reservationService = new ReservationService();
		reservationRs = reservationService.makeRSVN(reservation);
		ActionForward forward = null;
		
		if(reservationRs==false) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('예약등록 실패');,history.back(),</script>");
		} else {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("check.do");
		}
		HttpSession session = request.getSession();
		session.setAttribute("reservation", reservation);
		return forward;
	}
}
