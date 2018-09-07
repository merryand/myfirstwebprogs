package test;

import dao.UserDao;
import dao.UserDaoImpl;
import vo.TMember;

public class TestMain {

	public static void main(String[] args) {

		TestMain test = new TestMain();
		test.sampleTest();

	}

	public void sampleTest() {
		UserDao userDao = UserDaoImpl.sharedInstance();
		TMember member = new TMember();

		member.setEmail("test2@gmail.com");
		member.setPw("1234test2");
		member.setName("테스트2");
		member.setPhone("01023456789");
		member.setAddr("서울시 양천구 목동");

		boolean r = userDao.registerMember(member);
		System.out.println(r);
	}
}
