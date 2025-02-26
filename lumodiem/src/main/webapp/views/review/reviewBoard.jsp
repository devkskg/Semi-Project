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
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
								
	<c:choose>
		<c:when test="${account.accountGrade eq 'M' or account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
		<button type="button" class="selectBtn" name="insert">
			<a href="<c:url value='/insertReviewPage'/>">리뷰 게시글 추가</a>
		</button>
		<button type="button" class="selectBtn" name="update">
			<a href="<c:url value='/updateReviewPage'/>">리뷰 게시글 수정</a>
		</button>
		<button type="button" class="selectBtn" name="delete">
			<a href="<c:url value='/deleteReviewPage'/>">리뷰 게시글 삭제</a>
		</button>
		<button type="button" class="seleceBtn" name="res">
			<a href="<c:url value='/klassRes'/>">클래스 예약</a>
		</button>
		</c:when>
		<c:otherwise>
			<script>
				alert("회원만 리뷰 게시판을 사용할수 있습니다.");
				location.href="/";
			</script>
		</c:otherwise>
	</c:choose>
	
		<form action="<c:url value='/reviewBoard'/>" method="post">
			<fieldset>
				<legend>검색하기</legend>
				<input type="text" name="review_name" placeholder="제목">
				<input type="text" name="review_txt" placeholder="내용">
				<input type="text" name="account_nickname" placeholder="닉네임">
				<input type="submit" value="조회">
			</fieldset>
		</form>
		
		<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>닉네임</th>
			</tr>
	</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach items="${resultList}" var="rb" varStatus="vs">
						<tr>
							<td><c:out value="${vs.count}" /></td>
							<td><c:out value="${rb.reviewName}" /></td>
							<td><c:out value="${rb.reviewTxt}" /></td>
							<td><c:out value="${rb.accountNickName}"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">자료없음!</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
						<div class="row pt-md-4">
					</div>
				</div>
			</div>
		</div>
	</section>	
</div>
</body>
</html>