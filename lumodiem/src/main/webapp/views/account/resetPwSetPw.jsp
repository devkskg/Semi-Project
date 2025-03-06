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
							<form action="/resetPwSetPwEnd" id="resetPwEnd_form" name="resetPwEnd_form" method="post">
								<label for="account_pw">비밀번호 : </label><input name="account_pw" id="account_pw" type="password" required><br>
								<label for="account_pw_check">비밀번호 확인 : </label><input name="account_pw_check" id="account_pw_check" type="password" required>
								<span class="dis" style="vertical-align: middle;"><ion-icon id="openEye" class="eye" name="eye-off-outline" size="large" style=""></span>
								<br>
								<button type="button" id="submitBtn">비밀번호 재설정</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(function(){
			const form = document.resetPwEnd_form;
			
			/* 비밀번호 정규식 검사 */
			$('#account_pw').keyup(function(){
				let pwInput = form.account_pw.value;
				let pwReg =  /^[A-Za-z0-9!@#$%^&*()_+={}\[\]:;<>,.?/~`|-]{3,15}$/;
				if(pwReg.test(pwInput)){
					$('#account_pw').css('backgroundColor', '#98FB98');
				} else{
					$('#account_pw').css('backgroundColor', '#FF9999');
				}
			});	
			/* 비밀번호와 비밀번호 확인 일치 확인 */
			let pwBoolean = false;
			$('#account_pw_check').keyup(function(){
				let passValue = form.account_pw.value;
				let passCheckValue = form.account_pw_check.value;
				if(passValue == passCheckValue){
					$('#account_pw_check').css('backgroundColor', '#98FB98');
					pwBoolean = true;
				} else{
					$('#account_pw_check').css('backgroundColor', '#FF9999');
					pwBoolean = false;
				}
			});
			/* 비밀번호 다시 쳤을 때 비밀번호 확인과 일치 여부 확인 */
			$('#account_pw').keyup(function(){
				let passValue = form.account_pw.value;
				let passCheckValue = form.account_pw_check.value;
				if(passValue == passCheckValue && passValue != '' && passCheckValue != ''){
					$('#account_pw_check').css('backgroundColor', '#98FB98');
					pwBoolean = true;
				} else{
					$('#account_pw_check').css('backgroundColor', '#FF9999');
					pwBoolean = false;
				}
			});
			
			$('#submitBtn').click(function(){
				if(pwBoolean){
					form.submit();
				} else {
					alert('올바른 비밀번호를 입력해주세요.');
				}
			});
			
			/* 비밀번호 보이고 안 보이고 */
	        $(function(){
	            $('.eye').click(function(){
	                let pwtype = $('#account_pw').attr('type');
	                let pwchecktype = $('#account_pw_check').attr('type');
	                if(pwtype == 'text'){
	                    $('#account_pw').attr('type', 'password');
	                    $('#account_pw_check').attr('type', 'password');
	                    $('#openEye').attr('name', 'eye-off-outline');
	                } else{
	                    $('#account_pw').attr('type', 'text');
	                    $('#account_pw_check').attr('type', 'text');
	                    $('#openEye').attr('name', 'eye-outline');
	                }
	                $('#closeEye').toggleClass('dis');
	                $('#openEye').toggleClass('dis');
	            });
	        })
			
		})
	</script>
</body>
</html>