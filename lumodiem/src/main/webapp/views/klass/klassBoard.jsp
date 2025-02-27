<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.hostboard.vo.Klass" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 게시판</title>
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
</head>
<body>

<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">	

	<form action="/klassBoardListSearch" id="searchKlassList" method="post">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">제목</option>			
				<option value="2">닉네임</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn">검색</button>
	</form>












				</div>
			</div>
		</div>
	</section>	
</div>


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