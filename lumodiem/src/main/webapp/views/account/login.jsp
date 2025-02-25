<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<form action="/loginEnd" method="post">
		<label for="login_id">아이디 : </label><input name="login_id" id="login_id" type="text">
		<label for="login_pw">비밀번호 : </label><input name="login_pw" id="login_pw" type="password">
		<button>로그인하기</button>
		<button><a href="/">홈으로 가기</a></button>
	</form>
	
</body>
</html>