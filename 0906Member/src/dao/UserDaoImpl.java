package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.TMember;

public class UserDaoImpl implements UserDao {
	// 데이터 베이스 연결을 위한 변수
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private UserDaoImpl() {
		try {
			// MySQL인 경우 여기를 다르게 작성해야 합니다.
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	private static UserDao userDao;

	public static UserDao sharedInstance() {
		if (userDao == null) {
			userDao = new UserDaoImpl();
		}
		return userDao;
	}

	@Override
	public TMember login(TMember tmember) {

		// 넘어온 데이터를 확인
		System.out.println("넘어온 데이터 :" + tmember);

		TMember user = null;
		try {
			// 데이터베이스 입력
			con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.10.101:1521:xe", "user04", "user04");
			// Statement 인스턴스를 생성하고 SQL 실행 - 테이블을 만들 때 조건을 char로 만들면 여백의 문제를 생각해야 한다.
			pstmt = con.prepareStatement("select email, name from tmember where trim(email)=? and trim(pw)=?");
			// ?에 값 채우기
			pstmt.setString(1, tmember.getEmail().trim());
			pstmt.setString(2, tmember.getPw().trim());
			// SQL 실행
			rs = pstmt.executeQuery();

			// 결과를 읽기
			// 읽은 데이터가 있는 경우에 user에 인스턴스를 생성해서 대입
			// 읽은 데이터가 없으면 user는 null
			if (rs.next()) {
				// 인스턴스를 생성하고 결과를 저장
				user = new TMember();
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
			}
		}

		// email과 pw가 일치하는 데이터가 없으면 null이 리턴되고
		// 일치하는 데이터가 있으면 인스턴스를 생성해서 리턴

		System.out.println("리턴하는 데이터 : " + user);

		return user;
	}
}
