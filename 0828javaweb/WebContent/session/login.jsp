<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<Style>
#msg {
	color: red
}
</Style>
</head>
<body>
	<%//아래 구문 때문에 로그인이 안된 상태에서 로그인창에 들어올 때마다 메시지가 뜸. 
		if (session.getAttribute("msg") != null) {
			out.println("<div id='msg'>" + session.getAttribute("msg") + "</div>");
		}
	%>
	<form action="loginprocess.jsp" method="post">
		아이디&nbsp;<input type="text" name="id" /><br /> 비밀번호&nbsp;<input
			type="text" name="pw" /><br /> <input type="submit" value="로그인" />
		<input type="button" value="메인으로" id="mainbtn" />
	</form>
</body>
<script>
	document.getElementById("mainbtn").addEventListener("click", function() {
		location.href = 'main.jsp'
	})
</script>
</html>