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
					
<div class="approve_list">
	<form action="/arreoveList" id="searchApproveList" method="post">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">클래스명</option>			
				<option value="2">닉네임</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn">검색</button>
	</form>
	<form action="/arreoveList" id="arrangeKlass" name="arrangeKlass">
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
		<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>클래스명</th>			
				<th>닉네임</th>			
				<th>내용</th>			
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach var="list" varStatus="vs" items="${resultList }">
						<tr data-klass-no="${list.klassNo }">
							<td>${vs.count}</td>
							<td>${list.klassName}</td>
							<td>${list.accountNickname}</td>
							<td>${list.klassTxt }</td>
						</tr>
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">해당되는 게시글이 존재하지 않습니다.</td>
					</tr>
				
				</c:otherwise>
			
			</c:choose>
		
		</tbody>
		
		</table>
	
	</form>
</div>	
<script>
	$('.approve_list tbody tr').click(function(){
		const klassNo = $(this).data('klass-no');
		location.href='/approveDetail?klass_no='+klassNo;
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