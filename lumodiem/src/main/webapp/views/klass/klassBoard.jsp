<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 게시판</title>
</head>
<body>
	<ul>
		<li>
			<a href="/klassBoardList">목록 조회</a>
		</li>
		<li>
			등록
			<form action="<c:url value='/klassBoardCreate'/>" method="post">
				<fieldset>
					<legend>게시글</legend>
					<label for="klass_name">클래스명 : </label>
					<input type="text" name="klass_name" id="klass_name"><br>
					<label>주최자명 :</label>
					<input><br>
					<input><br>
					<input><br>
				
				</fieldset>
			
			</form>
		</li>
		<li>
			<a>수정</a>
		</li>
		<li>
			<a>삭제</a>
		</li>
	</ul>
</body>
</html>