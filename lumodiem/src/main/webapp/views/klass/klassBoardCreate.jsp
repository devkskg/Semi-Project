<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성하기</title>
<script src="<c:url value='/views/jquery-3.7.1.js'/>"></script>
</head>
<body>
	<form name="create_klass_form" action="">
				<fieldset>
					<legend>게시글</legend>
					<input type="text" value="${account.accountNo}" style="display: none" name="account_no">
					
					<label for="klass_name">클래스명 : </label>
					<input type="text" name="klass_name" id="klass_name" required><br>
					
					<label for="account_nickname">주최자명 :</label>
					<input type="text" readonly value="${account.accountNickname}" name="account_nickname" id="account_nickname"><br>
					
					<label for="klass_address">주소 : </label>
					<input type="text" readonly value="${account.accountAddress}" name="klass_address" id="klass_address"><br>
					
					<label for="klass_date">날짜 : </label>
					<input type=date name="klass_date" id="klass_date" required><br>
					
					<label for="klass_start">시작 : </label>
					<input type="time" name="klass_start" id="klass_start" required><br>
					
					<label for="klass_end">종료 : </label>
					<input type="time" name="klass_end" id="klass_end" required><br>
					
					<input type="hidden" id="klass_start_full" name="klass_start_full">
					<input type="hidden" id="klass_end_full" name="klass_end_full">
					
					<label for="klass_max">최대 참가인원 : </label>
					<input type="number" name="klass_max" id="klass_max" required placeholder="숫자만 입력해주세요."><br>
					
					<label for="klass_price">수강료 : </label>
					<input type="number" required name="klass_price" id="klass_price" placeholder="숫자만 입력해주세요."><br>
					
					<label for="klass_txt">클래스 상세 내용</label><br>
					<textarea name="klass_txt" id="klass_txt" required></textarea>
					
					<button type="button" id="insertBtn">등록</button>					
				</fieldset>
			
	</form>
	
	<script>
		$(function(){
			const form = document.create_klass_form;
			$('#insertBtn').click(function(){
				
				
			const check =  confirm("등록하시겠습니까?");
				if(!form.klass_name.value){
					alert("클래스명을 입력하세요.");
					form.klass_name.focus();
				}else if(!form.klass_date.value){
					alert("날짜를 입력해주세요.");
					form.klass_date.focus();
				}else if(!form.klass_start.value){
					alert("시작 시간을 입력해주세요");
					form.klass_start.focus();
				}else if(!form.klass_end.value){
					alert("종료 시간을 입력해주세요");
					form.klass_end.focus();
				}else if(!form.klass_max.value){
					alert("최대 참가인원 수를 입력하세요.");
					form.klass_max.focus();
				}else if(!form.klass_price.value){
					alert("수강료를 입력하세요.");
					form.klass_price.focus();
				}else if(!form.klass_txt.value){
					alert("내용을 입력하세요.");
					form.klass_txt.focus();
				}else{
					if(check == true){
						let dateVal = form.klass_date.value;
						let startVal = form.klass_start.value;
						let endVal = form.klass_end.value;
						
						let klassStartFull = dateVal + " " + startVal + ":00";
						let klassEndFull = dateVal + " " + endVal + ":00";
						$.ajax({
							url : "/klassBoardCreateEnd",
							type : "post",
							data : {"klass_name" : form.klass_name.value,
									"account_nickname" : form.account_nickname.value,
									"klass_address" : form.klass_address.value,
									"klass_start_full" : klassStartFull,
									"klass_end_full" : klassEndFull,
									"klass_max" : form.klass_max.value,
									"klass_price" : form.klass_price.value,
									"klass_txt" : form.klass_txt.value,
									"account_no" : form.account_no.value
							},
							dataType : "JSON",
							contentType: "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data){
								alert(data.res_msg);
								if(data.res_code == "200"){
									location.href="/klassBoardList";
								} else{
									location.href="/klassBoardCreateEnd";
								}
							}
						});
					}else{
						location.href="/klassBoardList";
					}
					
				}
			})
			
			
			
		})
	
	
	
	</script>
</body>
</html>