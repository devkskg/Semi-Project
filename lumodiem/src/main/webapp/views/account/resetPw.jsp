<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<form action="/resetPwSetPw" id="resetPw_form" name="resetPw_form" method="post">
								<c:choose>
									<c:when test="${not empty searchIdResetPw }">
										<label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text" required value="${searchIdResetPw }"><br>
									</c:when>
									<c:otherwise>
										<label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text" required><br>
									</c:otherwise>
								</c:choose>
								<label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text" required>
								<button type="button" id="searchBtn">다음</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		$(function(){
			const form = document.resetPw_form;
			$('#searchBtn').click(function(){
				if(!form.account_id.value){
					alert("아이디를 입력하세요.")
					form.account_id.focus();
				} else if(!form.account_ssn.value){
					alert("주민등록번호를 입력하세요.")
					form.account_ssn.focus();
				}
			});
			
			/* 주민등록번호 정규식 검사 */
			let ssnBoolean = false;
			$('#account_ssn').keyup(function(){
				let ssnInput = form.account_ssn.value;
				let ssnReg = /^(?:[0-9]{2})((01|03|05|07|08|10|12)(0[1-9]|[12][0-9]|3[01])|(04|06|09|11)(0[1-9]|[12][0-9]|30)|(02)(0[1-9]|1[0-9]|2[0-8]|29))[1-4][0-9]{6}$/;
				if(ssnReg.test(ssnInput)){
					$('#account_ssn').css('backgroundColor', '#98FB98');
					ssnBoolean = true;
				} else{
					$('#account_ssn').css('backgroundColor', '#FF9999');
					ssnBoolean = false;
				}
			});
			
			$('#searchBtn').click(function(){
				if(ssnBoolean){
					form.submit();
				} else{
					alert('올바른 주민등록번호를 입력해주세요.');
				}
			});
		})
	</script>
</body>
</html>