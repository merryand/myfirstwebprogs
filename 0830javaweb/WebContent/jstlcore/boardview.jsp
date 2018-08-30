<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 보기</title>
</head>
<body>
	<table rules="rows" width="700" align="center">
		<tr style="background-color: gray;">
			<th width="30">번호</th>
			<th width="300">제목</th>
			<th width="80">작성자</th>
			<th width="100">작성일</th>
			<th width="50">조회수</th>
		</tr>
		<c:forEach var="board" items="${list}">
			<tr>
				<td align="center">${board.num}</td>
				<td align="center">${board.title}</td>
				<td align="center">${board.nickname}</td>
				<td align="center">${board.regdate}</td>
				<td align="center">${board.readcnt}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>