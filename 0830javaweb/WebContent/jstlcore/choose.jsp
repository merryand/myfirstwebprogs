<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl core -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose 테스트</title>
<style>
#A {
	color: red;
}

#B {
	color: gold;
}

#C {
	color: blue;
}

#D {
	color: green;
}

#F {
	color: violet;
}
</style>
</head>
<body>
	<!-- 파라미터를 받는 페이지가 없어서 직접 주소창 URL 뒤에 ?score=값을 써야함 -->
	<c:choose>
		<c:when test="${param.score >= 90}">
			<h3 id="A">당신의 성적은 A</h3>
		</c:when>
		<c:when test="${param.score >= 80}">
			<h3 id="B">당신의 성적은 B</h3>
		</c:when>
		<c:when test="${param.score >= 70}">
			<h3 id="C">당신의 성적은 C</h3>
		</c:when>
		<c:when test="${param.score >= 60}">
			<h3 id="D">당신의 성적은 D</h3>
		</c:when>
		<c:otherwise>
			<h3 id="F">당신의 성적은 F</h3>
		</c:otherwise>
	</c:choose>
</body>
</html>