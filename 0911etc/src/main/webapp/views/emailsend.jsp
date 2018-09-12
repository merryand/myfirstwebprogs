<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 보내기</title>
</head>
<style>
* {
	box-sizing: border-box;
}

input[type=text], textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid gray;
	border-radius: 3px;
	resize: vertical;
}

label {
	padding: 15px 15px 15px 0px;
}

input[type=submit] {
	background-color: seagreen;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: yellowgreen;
}

div {
	background-color: whitesmoke;
}
</style>
<body>
	<div>
		<form action="sendmail.do" method="post">

			<label for="receiver">받는 사람:</label> <input type="text"
				name="receiver" required="required" placeholder="이메일을 반드시 적어야 합니다." />
			<label for="subject">제목:</label> <input type="text" name="subject" />
			<label for="msg">내용:</label>
			<textarea rows="10" cols="30" name="msg"></textarea>
			<input type="submit" value="메일보내기" />
		</form>
	</div>
</body>
</html>