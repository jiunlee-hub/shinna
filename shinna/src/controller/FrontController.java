package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.CheckAction;
import action.ad_CheckDeleteAction;
import action.ad_CheckListAction;
import action.Ed1Action;
import action.Ed2Action;
import action.Ed3Action;
import action.EventAction;
import action.Fa_caAction;
import action.Fa_fiAction;
import action.Fa_loAction;
import action.Fa_reAction;
import action.Fa_saAction;
import action.Fa_swAction;
import action.GrandAction;
import action.HotelMapAction;
import action.IndexAction;
import action.IntroduceAction;
import action.JoinAction;
import action.JoinDeleteAction;
import action.JoinDeleteProAction;
import action.JoinProAction;
import action.LoginAction;
import action.LoginProAction;
import action.MdAction;
import action.MemberAction;
import action.ad_MemberDeleteAction;
import action.MemberInfoAction;
import action.ad_MemberListAction;
import action.MemberProAction;
import action.Pd1Action;
import action.Pd2Action;
import action.Pd3Action;
import action.Pd4Action;
import action.Pd5Action;
import action.Pd6Action;
import action.PromotionAction;
import action.ReservationF1Action;
import action.ReservationFAction;
import action.ReservationProAction;
import action.ReservationProAction1;
import action.ReviewDeleteProAction;
import action.ReviewDetailAction;
import action.ReviewListAction;
import action.ReviewModifyFormAction;
import action.ReviewModifyProAction;
import action.ReviewReplyFormAction;
import action.ReviewReplyProAction;
import action.ReviewWriteFormAction;
import action.ReviewWriteProAction;
import action.StandardAction;
import action.SuiteAction;
import vo.ActionForward;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProc(request, response);
	}
	
	protected void doProc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;
		
		if (command.equals("/index.do")) {
			action = new IndexAction();
			try {
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Login.do")) {
			action = new LoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/Join.do")) {
			action = new JoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/LoginPro.do")) {
			action = new LoginProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/Logout.do")) {
			HttpSession session	= request.getSession();
			session.invalidate();
			response.sendRedirect("index.do");
//회원수정			
		
		} else if (command.equals("/member.do")) {
			action = new MemberAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberPro.do")) {
			action = new MemberProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberInfo.do")) {
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		
//회원가입			
		}else if (command.equals("/JoinPro.do")) {
			action = new JoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/JoinDelete.do")) {
			action = new JoinDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/JoinDeletePro.do")) {
			action = new JoinDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
//회원관리			
		}else if (command.equals("/ad_MemberList.do")) {
			action = new ad_MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}else if (command.equals("/ad_MemberDelete.do")) {
			action = new ad_MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/introduce.do")) {
			action = new IntroduceAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/hotelmap.do")) {
			action = new HotelMapAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
		}else if (command.equals("/md.do")) {
			action = new MdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		} else if(command.equals("/Logout.do")) {
			HttpSession session	= request.getSession();
			session.invalidate();
			response.sendRedirect("index.do");
			
//객실
		}else if (command.equals("/ed1.do")) {
			action = new Ed1Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ed2.do")) {
			action = new Ed2Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ed3.do")) {
			action = new Ed3Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/event.do")) {
			action = new EventAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/grand.do")) {
			action = new GrandAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/standard.do")) {
			action = new StandardAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/suite.do")) {
			action = new SuiteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/promotion.do")) {
			action = new PromotionAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/pd1.do")) {
			action = new Pd1Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/pd2.do")) {
			action = new Pd2Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/pd3.do")) {
			action = new Pd3Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/pd4.do")) {
			action = new Pd4Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/pd5.do")) {
			action = new Pd5Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/pd6.do")) {
			action = new Pd6Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

// 예약
		
		}else if (command.equals("/reservationF.do")) {
			action = new ReservationFAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/reservationF1.do")) {
			action = new ReservationF1Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}else if (command.equals("/check.do")) {
			action = new CheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/ad_CheckList.do")) {
			action = new ad_CheckListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/ad_CheckDelete.do")) {
			action = new ad_CheckDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if (command.equals("/ReservationProAction.do")) {
			action = new ReservationProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/ReservationProAction1.do")) {
			action = new ReservationProAction1();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
// 부대시설			
		}else if (command.equals("/fa_ca.do")) {
			action = new Fa_caAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/fa_lo.do")) {
			action = new Fa_loAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/fa_re.do")) {
			action = new Fa_reAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/fa_sa.do")) {
			action = new Fa_saAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/fa_sw.do")) {
			action = new Fa_swAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/fa_fi.do")) {
			action = new Fa_fiAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
//게시판
		}else if(command.equals("/reviewList.do")) {
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewWriteForm.do")) {
			action = new ReviewWriteFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewWritePro.do")) {
			action = new ReviewWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewDetail.do")) {
			action = new ReviewDetailAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewReplyForm.do")) {
			action = new ReviewReplyFormAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewReplyPro.do")) {
			action = new ReviewReplyProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewModifyForm.do")) {
			action = new ReviewModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewModifyPro.do")) {
			action = new ReviewModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/reviewDeletePro.do")) {
			action = new ReviewDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}
