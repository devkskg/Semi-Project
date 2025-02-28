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

<div id="colorlib-main">
				<section class="ftco-section ftco-no-pt ftco-no-pb">
					<div class="container">
						<div class="row d-flex">
							<div class="col-xl-8 py-5 px-md-5">
								<div class="row pt-md-4">
<div class="klass_update">

	<form action="" name="update_klass_form">
		<fieldset>
			<legend>게시글 수정</legend>
			<input type="hidden" value="${klass.klassNo}" name="klass_no">
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
			<textarea name="klass_txt" id="klass_txt" required >${klass.klassTxt}</textarea>
			
			<button type="button" id="updateBtn" onclick="updateKlass();">수정하기</button>
			<button type="button" id="deleteBtn" onclick="deleteKlass();">삭제하기</button>
		
		</fieldset>
	
	</form>

</div>	
<script type="text/javascript">
	const updateKlass = function(){
		const form = document.update_klass_form;
		$.ajax({
			url : "klassBoardUpdateEnd",
			type : "post",
			data : {"account_no" : form.account_no.value,
					"klass_name" : form.klass_name.value,
					"account_nickname" : form.account_nickname.value,
					"klass_address" : form.klass_address.value,
					"klass_max" : form.klass_max.value,
					"klass_price" : form.klass_price.value,
					"klass_txt" : form.klass_txt.value,
					"klass_no" : form.klass_no.value
					
			},
			dataType : "JSON",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data){
				alert(data.res_msg);
				if(data.res_code == "200"){
					location.href="/";
				} else{
					location.href="/";
				}
			}
			
		});
	}
	
	const deleteKlass = function(){
		const form = document.update_klass_form;
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				url : "klassBoardDelete",
				type : "post",
				data : {"klass_no" : form.klass_no.value},
				dataType : "JSON",
				contentType : "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data){
					alert(data.res_msg);
					if(data.res_code == "200"){
						location.href="/";
					} else{
						location.href="/";
					}
				}
				
			});
		}
	}

</script>	
								
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
	
</body>
</html>