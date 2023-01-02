package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() { // 오라클 접속하게 해주는 생성자 (데이터를 가져오거나 저장하는 기능)
		try {
			String URL= "jdbc:oracle:thin:@localhost:1521:XE";
			String USER="hr";
			String PWD="happy";
			Class.forName("oracle.jdbc.driver.OracleDriver"); // sql 접속 매개체 라이브러리
			conn=DriverManager.getConnection(URL, USER,PWD);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM member WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) 
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디가 없음
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	
	public int join(Member member) {
		String SQL="insert into member values(?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, member.getUserID());
			pstmt.setString(2, member.getUserPassword());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserGender());
			pstmt.setString(5, member.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception ex	) {
			ex.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
}











