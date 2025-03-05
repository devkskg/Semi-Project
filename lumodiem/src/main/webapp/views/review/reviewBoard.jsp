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
<div class="review_list">			
	<c:choose>
		<c:when test="${account.accountGrade eq 'M' or account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
		<button type="button" class="selectBtn" name="insert">
			<a href="<c:url value='/insertReviewPage'/>">리뷰 게시글 추가</a>
		</button>
		</c:when>
		<%-- <c:otherwise>
			<script>
				alert("회원만 리뷰 게시판을 사용할수있습니다.");
				if(confirm('로그인 페이지로 이동하시겠습니까?')){
				location.href="/views/account/login.jsp";
				}else{
				location.href="/";
				}
			</script>
		</c:otherwise> --%>
	</c:choose>
	
		<form action="<c:url value='/reviewBoard'/>" method="post" id="searchFrm">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">리뷰제목</option>			
				<option value="2">닉네임</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn">검색</button>
			<fieldset>		
				<legend>정렬하기</legend>
				<select name="order_type" id="order_type">
					<option value="x">정렬하기</option>
					<option value="a">최신순</option>
					<option value="b">오래된순</option>
					<option value="c">좋아요순</option>
				</select>
			</fieldset>	
		</form>
		<script>
			const orderType = document.getElementById('order_type');
			orderType.onchange = function(){
				document.getElementById('searchFrm').submit();
			}
		</script>
		
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
						<tr data-review-no="${rb.reviewNo}">
							<td><c:out value="${vs.count}" /></td>
							<td><c:out value="${rb.reviewName}" /></td>
							<td><c:out value="${rb.reviewTxt}" /></td>
							<td><c:out value="${rb.accountNickname}"/></td>
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
</div>	
<script>
	$('.review_list tbody tr').click(function(){
		const reviewNo = $(this).data('review-no');
		location.href='/reviewDetail?review_no='+reviewNo;
	})
</script>	

	
	
	
	
	
	
						<div class="row pt-md-4">
					</div>
				</div>
			</div>
		</div>
	</section>	
</div>
</body>
</html>