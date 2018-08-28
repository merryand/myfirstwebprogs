<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키를 이용한 언어선택</title>
</head>
<body>
	<%
		//쿠키 읽기
		Cookie[] cookies = request.getCookies();
		//쿠키 값 저장할 변수
		String lang = "kor";
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("lang")) {
					lang = cookie.getValue();
				}
			}
		}
		if (lang.equals("eng")) {
			out.println("<h3>English</h3>");
		} else if (lang.equals("kor")) {
			out.println("<h3>한국</h3>");
		} else if (lang.equals("jpn")) {
			out.println("<h3>日本語</h3>");
		}
	%>
	<!-- form의 데이터를 langsave.jsp로 전송 -->
	<form action="langsave.jsp">
		<h3>언어선택</h3>
		<input type="radio" value="eng" name="lang" id="english" />영어 <input
			type="radio" value="kor" name="lang" id="korean" checked="checked" />한국어
		<input type="radio" value="jpn" name="lang" id="japan"
			checked="checked" />일본어 <input type="submit" value="선택완료" />
	</form>

	<script>
		
	<%//영어일 때 영어에 체크하는 스크립트
			if (lang.equals("eng")) {
				out.println("document.getElementById('english').checked=true");
			} else if (lang.equals("kor")) {
				out.println("document.getElementById('korean').checked=true");
			} else if (lang.equals("jpn")) {
				out.println("document.getElementById('japan').checked=true");
			}%>
		
	</script>
</body>
</html>