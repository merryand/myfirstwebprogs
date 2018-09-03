<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquery 연습</title>
<style>
a{
text
}
</style>
</head>
<body>
	프로젝트 이름까지의 경로:${pageContext.request.contextPath}
	<input type="button" value="클릭" id="btn" />

	<a href="logout">로그아웃</a>

	<nav>
		<ul>
			<li><a href="login.do">로그인</a></li>
			<li><a href="register.do">회원가입</a></li>
		</ul>
	</nav>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
	
</script>
<script>
	$('#btn').bind('click', function() {
		console.log("로그를 출력합니다.")
	})

	//브라우저 창을 닫거나 새로 고침을 할 
	$(window).bind("beforeunload", function() {
		//서버에게 logout 요청을 ajax로 전송
		$.ajax({
			url : "logout"
		})
	})

	//스크립트에 $로 시작하면 jquery를 사용하는 것입니다.
	//문서 내용을 전부 읽자 마자 실행.
	$(function() {
		//alert("jquery를 사용합니다.")
	})
</script>
</html>