<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>결과 페이지</div>
	<%=request.getAttribute("data1")%><br />
	<%=session.getAttribute("data2")%>
</body>
</html>