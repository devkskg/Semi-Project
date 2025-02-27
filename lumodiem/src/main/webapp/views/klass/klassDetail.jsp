<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
<title>클래스 상세조회</title>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
<div id="colorlib-main">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex">
				<div class="col-xl-8 py-5 px-md-5">
					<div class="row pt-md-4">
					
	<div class="klass_detail">
		<form>
			<table>
				<tr>
					<th>클래스명</th>
					<td>${klass.klassName}</td>
				</tr>
				<tr>
					<th>주최자</th>
					<td>${klass.accountNickname}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${klass.klassTxt}</td>
				</tr>
				<tr>
					<th>일정</th>
					<td>${klassDate.klassStart}</td>
<%-- 					<td>${fn:substring(klassDate.klassStart,1,10)}</td> --%>
				</tr>
				<tr>
					<th>시간</th>
					<td>${klassDate.klassStart}</td>
<%-- 					<td>${fn:substring(klassDate.klassStart,12,19)}</td> --%>
				</tr>
				<tr>
					<th>최대인원(예약가능인원)</th>
					<%-- <td>${klass.klassMax}명(${klass.klassMax - klassDate.klassCount}명)</td> --%>
					<td>여기라고요?</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${klass.klassAddress }</td>
				</tr>
				<tr>
					<th>수업료</th>
					<td>${klass.klassPrice }</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${klass.klassRegDate}</td>
				</tr>
				<tr>
					<th>상세 내용</th>
					<td>${klass.klassTxt}</td>
				</tr>
			
			</table>		
		
		
		
		
		
		
		
		
		
		
		
		</form>
	
	</div>				































					
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

</body>
</html>