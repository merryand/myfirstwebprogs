<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소스코드 포함하기</title>
</head>
<body>
	<%
		int num = 1000;
	%>
	<!-- includee.jspf 파일을 포함하기 -->
	<%@ include file="includee.jspf" %>
	<!-- includee.jspf 파일의 msg라는 변수를 가져오기 -->
	<div><%=msg %></div>
</body>
</html>