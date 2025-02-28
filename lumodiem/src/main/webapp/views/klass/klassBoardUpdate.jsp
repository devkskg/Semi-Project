<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
</head>
<body>
<div class="klass_update">
	<form action="/klassBoardUpdateEnd" method="post">
		<fieldset>
			<legend>게시글 수정</legend>
			<input type="text" value="${account.accountNo}" style="display: none" name="account_no">
					
			<label for="klass_name">클래스명 : </label>
			<input type="text" name="klass_name" id="klass_name" required value="${klass.klassName}"><br>
			
			<label for="account_nickname">주최자명 :</label>
			<input type="text" readonly value="${account.accountNickname}" name="account_nickname" id="account_nickname"><br>
			
			<label for="klass_address">주소 : </label>
			<input type="text" readonly value="${account.accountAddress}" name="klass_address" id="klass_address"><br>
			
			<label for="klass_max">최대 참가인원 : </label>
			<input type="number" name="klass_max" id="klass_max" 
			required placeholder="숫자만 입력해주세요." value="${klass.klassMax}"><br>
			
			<label for="klass_price">수강료 : </label>
			<input type="number" required name="klass_price" id="klass_price" 
			placeholder="숫자만 입력해주세요." value="${klass.klassPrice}"><br>
			
			<label for="klass_txt">클래스 상세 내용</label><br>
			<textarea name="klass_txt" id="klass_txt" required value="${klass.klassTxt}"></textarea>
			
			<button type="button" id="updateBtn">수정하기</button>
			<button type="button" id="deleteBtn">삭제하기</button>
		
		
		
		
		</fieldset>
	
	
	
	
	
	
	
	
	
	
	
	</form>




</div>	
	
	
	
	
</body>
</html>