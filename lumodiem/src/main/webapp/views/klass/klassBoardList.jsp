<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.hostboard.vo.Klass" %>
<% List<Klass> resultList = (List<Klass>)request.getAttribute("resultList"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 조회</title>
</head>
<body>
	<form action="<c:url value='/klassBoardListSearch'/>" id="searchKlassList">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">제목</option>			
				<option value="2">작성자</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn">검색</button>
	</form>
<!-- 	<script>
		const searchType = document.getElementById('search_type');
		searchType.onchange = function(){
			document.getElementById('searchKlassList').submit();
		}
	
	
	</script>
 -->	
 		<form>
		<c:choose>

			<c:when test="${not empty resultList }">

				<c:forEach var="list" varStatus="vs" items="${resultList }">
					<div>
						<ul>
							<li>클래스명 : ${list.klassName} 작성자 : ${list.accountNickname}</li>
						
						</ul>					
					</div>

				</c:forEach>

			</c:when>
			<c:otherwise>
				<div>
					해당되는 게시글이 존재하지 않습니다.
				</div>
			</c:otherwise>
		
		
		</c:choose>
	
	</form>
</body>
</html>