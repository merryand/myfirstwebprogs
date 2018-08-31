<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl의 fmt 기능을 위한 태그 라이브러리 설정 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 다국어 설정파일의 대표이름 설정 -->
<fmt:setBundle basename="intro" />
<%@ page import="java.util.*"%>
<c:set var="date" value="<%=new Date()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>다국어 지원</title>
</head>
<body>
	<h3>
		<fmt:message key="title" />
	</h3>
	서울:
	<fmt:formatDate value="${date}" type="both" />
	<br />
	<fmt:timeZone value="Europe/London">
	런던:<fmt:formatDate value="${date}" type="both" />
	</fmt:timeZone>
</body>
</html>