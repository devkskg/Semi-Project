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

	<form action="/klassBoardList" id="searchKlassList" method="post">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">클래스명</option>			
				<option value="2">닉네임</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn">검색</button>
	</form>
	<form action="/klassBoardList" id="arrangeKlass" name="arrangeKlass">
		<select name="order_type" id="order_type">
			<option value="x">정렬하기</option>
			<option value="a">최신순</option>
			<option value="b">오래된순</option>
		</select>
	</form>
	<script>
		const orderType = document.getElementById('order_type');
		orderType.onchange = function(){
			document.getElementById('arrangeKlass').submit();
		}
	</script>


		<form>
		<c:choose>
			<c:when test="${account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
			<button type="button" id="insertBtn" name="insertBtn">
				<a href="/klassBoardCreate">작성하기</a>
			</button>
			<button type="button" id="updateBtn" name="updateBtn">
				<a href="/klassBoardUpdate">수정하기</a>
			</button>
			<button type="button" id="deleteBtn" name="deleteBtn">
				<a href="/klassBoardDelete">삭제하기</a>
			</button>
			</c:when>
			
			<c:when test="${account.accountGrade eq 'M'}">
			<button type="button" class="selectBtn" name="res">
			<a href="<c:url value='/klassRes'/>">클래스 예약</a>
			</button>
			</c:when>		
		</c:choose>
	</form>
	
	<form>
		<table border="1">
		<thead>
			<tr>
				<th>클래스명</th>			
				<th>닉네임</th>			
				<th>내용</th>			
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach var="list" varStatus="vs" items="${resultList }">
						<tr>
							<td>${list.klassName}</td>
							<td>${list.accountNickname}</td>
							<td>${list.klassTxt }</td>
						</tr>
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="3">해당되는 게시글이 존재하지 않습니다.</td>
					</tr>
				
				</c:otherwise>
			
			</c:choose>
		
		</tbody>
		
		</table>
	
	</form>

				</div>
			</div>
		</div>
	</section>	
</div>

</body>
</html>