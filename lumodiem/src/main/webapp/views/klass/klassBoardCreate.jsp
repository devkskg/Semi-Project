<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
</head>
<body>
	<form name="create_klass_form" action="">
				<fieldset>
					<legend>게시글</legend>
					<input type="text" value="${account.accountNo}" style="display: none" name="account_no">
					
					<label for="klass_name">클래스명 : </label>
					<input type="text" name="klass_name" id="klass_name"><br>
					
					<label for="account_nickname">주최자명 :</label>
					<input type="text" readonly value="${account.accountNickname}" name="account_nickname" id="account_nickname"><br>
					
					<label for="klass_address">주소 : </label>
					<input type="text" readonly value="${account.accountAddress}" name="klass_address" id="klass_address"><br>
					
					<label for="klass_max">최대 참가인원 : </label>
					<input type="number" name="klass_max" id="klass_max"><br>
					
					<label for="klass_price">수강료 : </label>
					<input type="number" name="klass_price" id="klass_price"><br>
					
					<label for="klass_txt">클래스 상세 내용</label><br>
					<textarea name="klass_txt" id="klass_txt"></textarea>
					
					<button type="button" id="insertBtn">등록</button>					
				</fieldset>
			
	</form>
	
	<script>
		$(function(){
			const form = document.create_klass_form;
			
			$('#insertBtn').click(function(){
				if(!form.klass_name.value){
					alert("클래스명을 입력하세요.");
					form.klass_name.focus();
				}
			})
			
			
			
		})
	
	
	
	</script>
</body>
</html>