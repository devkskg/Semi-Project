<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
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
		
		<c:choose>
			<c:when test="${account.accountGrade eq 'H'}">
				<li>
					<a href="/klassBoardCreate">작성하기</a>
					<%-- <form action="<c:url value='/klassBoardCreate'/>" method="post"> --%>
				</li>
			</c:when>
		</c:choose>
			
		
			
		<li>
			<a>수정</a>
		</li>
		<li>
			<a>삭제</a>
		</li>
	</ul>
</body>
</html>