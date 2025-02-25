<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>⭐리뷰 게시판⭐</title>
</head>
<body>
		<button class="selectBtn" name="insert">
			<a href="<c:url value='/insertReviewPage'/>">리뷰 게시글 추가</a>
		</button>
		<button class="selectBtn" name="update">
			<a href="<c:url value='/updateReviewPage'/>">리뷰 게시글 수정</a>
		</button>
		<button class="selectBtn" name="delete">
			<a href="<c:url value='/deleteReviewPage'/>">리뷰 게시글 삭제</a>
		</button>
		<button class="seleceBtn" name="res">
			<a href="<c:url value='/klassRes'/>">클래스 예약</a>
		</button>
		<!-- <button>금액결제</button> -->
</body>
</html>