package sec01;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection con;
	private DataSource dataFactory;
	private PreparedStatement pstmt;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context)ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List listMembers() {
		List membersList = new ArrayList();
		try {
			con = dataFactory.getConnection(); // 연결
			String query = "SELECT * FROM t_member order by joindate desc";
			
			pstmt = con.prepareStatement(query);
		
			ResultSet rs = pstmt.executeQuery(query); // 결과셋의 주소값 rs에 저장
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				MemberBean vo = new MemberBean();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setJoinDate(joinDate);
				membersList.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
			// 별도의 데이터베이스 연결 모듈
		} catch (Exception e) {
			e.printStackTrace();
		}
		return membersList;
	}
	
		public void addMember(MemberBean memberBean)
		{
			try {
				Connection con = dataFactory.getConnection();
				String id = memberBean.getId();
				String pwd = memberBean.getPwd();
				String name = memberBean.getName();
				String email = memberBean.getEmail();
				String query = "INSERT INTO t_member (id,pwd,name,email) "+"VALUES(?,?,?,?)";
				System.out.println(query);
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				pstmt.setString(3, name);
				pstmt.setString(4, email);
				pstmt.executeUpdate();
				pstmt.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
}
