package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import service.UserService;
import service.UserServiceImpl;
import vo.TMember;

@WebServlet("/user/*")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService;

	public UserController() {
		super();
		userService = UserServiceImpl.sharedInstance();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 요청 경로에서 프로젝트 경로를 제거
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length() + 1);
		// 세션을 사용하는 경우가 많으므로 여기서 세션 생성
		// command가 콘솔에 출력이 안되면
		// url 제대로 처리하지 못하는 것입니다.
		// form에서
		// System.out.println(command);
		HttpSession session = request.getSession();
		switch (command) {
		case "user/login":
			// 서비스 메소드 호출
			TMember user = userService.login(request);
			// 로그인 실패한 경우
			if (user == null) {
				session.setAttribute("user", user);
				session.setAttribute("msg", "email이나 비밀번호가 틀렸습니다.");
			}
			// 로그인 성공
			else {
				session.setAttribute("user", user);
			}
			// 로그인 성공여부에 관계없이 메인 페이지 리다이렉트
			// 현재 요청이 user/login이므로 현재 위히는 user
			// 메인으로 가려면 user의 상위로 이동해야 합니다.
			response.sendRedirect("../");
			break;
		case "user/logout":
			// 세션을 초기화
			session.invalidate();
			// 시작 페이지로 리다이렉트
			response.sendRedirect("../");
			break;
		case "user/register":
			// 단순 페이지 이동
			// 출력하는 페이지 경로를 설정할 때는 URL을 기준으로 합니다
			// 지금 URL이 member/register 이므로
			// 위치는 WebContent/member 입니다.
			RequestDispatcher dispatcher = request.getRequestDispatcher("../member/register.jsp");
			dispatcher.forward(request, response);
			break;
		case "user/insert":
			boolean r = userService.registerMember(request);
			if (r == true) {
				// 회원가입에 성공했을 때 처리
				session.setAttribute("msg", "회원 가입에 성공하셨습니다.");
				response.sendRedirect("../");
			} else {
				// 회원가입에 실패했을 때 처리
				session.setAttribute("registermsg", "회원 가입에 실패했습니다.");
				response.sendRedirect("register");
			}
			break;
		case "user/emailcheck":
			boolean result = userService.emailCheck(request);
			// JSON으로 출력할 때는 리턴받은 데이터를 바로 저장하지 말고 JSON 객체로 변환해서 저장
			JSONObject obj = new JSONObject();
			obj.put("result", result);

			// 데이터를 저장 - 값만 저장함. 뒤를 obj로 하면 json 오브젝트로 저장되서 읽어 올때 키를 줘야 함.
			request.setAttribute("result", result);
			// 결과 페이지로 포워딩 - 리다이렉트로도 가능
			RequestDispatcher checkdispatcher = request.getRequestDispatcher("/member/emailcheck.jsp");
			checkdispatcher.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
