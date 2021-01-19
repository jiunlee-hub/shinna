package dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import vo.MemberBean;

public class MemberDAO {
	public static MemberDAO instance;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	private MemberDAO() {

	}
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	public String selectLoginId(MemberBean member) {
		String loginId = null;
		String sql = "select id from member where id=? and pw=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginId = member.getId();
			}
		}catch(SQLException e) {
			System.out.println("로그인 에러: " + e);
		}finally {
			if(rs != null) close(rs);
			if(pstmt !=null) close(pstmt);
		}
		return loginId;
	}
		
	public int insertMember(MemberBean member) {
		
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int insertCount = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getCountry());
			pstmt.setString(2, member.getF_name());
			pstmt.setString(3, member.getL_name());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getId());
			pstmt.setString(6, member.getPw());
			pstmt.setInt(7, member.getYy());
			pstmt.setInt(8, member.getMm());
			pstmt.setInt(9, member.getDd());
			pstmt.setString(10, member.getTel_1());
			pstmt.setString(11, member.getTel_2());
			pstmt.setString(12, member.getE_mail());
			pstmt.setString(13, member.getE_mail2());
			pstmt.setString(14, member.getGender());
			pstmt.setInt(15, member.getCount());
			pstmt.setInt(16, member.getStay());
			pstmt.setString(17, member.getGrade());
			insertCount = pstmt.executeUpdate();
		}catch(Exception ex) {
			System.out.println("joinMember 에러: " +ex);
			
		}finally {
			close(pstmt);
		}
		return insertCount;
	}

	public ArrayList<MemberBean> MemberList() {
		String sql = "select*from member";
		ArrayList <MemberBean> memberList = new ArrayList<MemberBean>();
		MemberBean mb = null;
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				do {
					mb=new MemberBean();
					mb.setCountry(rs.getString("country"));
					mb.setName(rs.getString("F_name"));
					mb.setName(rs.getString("L_name"));
					mb.setName(rs.getString("name"));
					mb.setId(rs.getString("id"));
					mb.setPw(rs.getString("pw"));
					mb.setYy(rs.getInt("yy"));
					mb.setMm(rs.getInt("mm"));
					mb.setDd(rs.getInt("dd"));
					mb.setTel_1(rs.getString("tel_1"));
					mb.setTel_2(rs.getString("tel_2"));
					mb.setE_mail(rs.getString("e_mail"));
					mb.setE_mail2(rs.getString("e_mail2"));
					mb.setGender(rs.getString("gender"));
					mb.setCount(rs.getInt("count"));
					mb.setStay(rs.getInt("stay"));
					mb.setGrade(rs.getString("grade"));

					memberList.add(mb);
				}while(rs.next());
			}
		}catch(Exception ex) {
			System.out.println("getDeatilMember 에러: " + ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		return memberList;
	}

	
	
	public boolean checkId(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = con.prepareStatement("select * from member where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					close(rs);
				if (pstmt != null)
					close(pstmt);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
		
	}
//개인정보 확인
		public String memberInfoId(MemberBean member) {
				String infoId = null;
				String sql = "select id from member where id=? and pw=?";
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, member.getId());
					pstmt.setString(2, member.getPw());
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						infoId = member.getId();
					}
				}catch(SQLException e) {
					System.out.println("비밀번호 에러: " + e);
				}finally {
					if(rs != null) close(rs);
					if(pstmt !=null) close(pstmt);
				}
				return infoId;
			}
		
		

//회원탈퇴
	public int isDelete(String id) {
		PreparedStatement pstmt = null;
		String member_sql = "delete from member where id=?";
		String reservation_sql = "delete from reservation where id=?";
		int isDeleteCount = 0;
		
		try {
			pstmt = con.prepareStatement(member_sql);
			pstmt.setString(1, id);
			isDeleteCount = pstmt.executeUpdate();
			close(pstmt);
			pstmt = con.prepareStatement(reservation_sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			System.out.println("isDelete 에러: " + e);
		} finally {
			close(pstmt);
		}
		return isDeleteCount;
	}

	

}