<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%-- <script src="<c:url value='/views/jquery-3.7.1.js'/>"></script> --%>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
			
				<form name="create_member_form" action="">
					<input name="account_grade" style="display: none" value=${select}><br>
					<label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text">
					<button type="button" id="duplicate_id" name="duplicate_id" class="duplicate">중복확인</button><br>
					
					<label for="account_pw">비밀번호 : </label><input name="account_pw" id="account_pw" type="password"><br>
					<label for="account_pw_check">비밀번호 확인 : </label><input name="account_pw_check" id="account_pw_check" type="password"><br>
					
					<label for="account_name">이름 : </label><input name="account_name" id="account_name" type="text"><br>
					<label for="account_nickname">닉네임 : </label><input name="account_nickname" id="account_nickname" type="text">
					<button type="button" id="duplicate_nickname" name="duplicate_nickname" class="duplicate">중복확인</button> <br>
					
					<label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text">
					<button type="button" id="duplicate_ssn" name="duplicate_ssn" class="duplicate">중복확인</button> <br>
					
					<label for="account_phone">전화번호 : </label><input name="account_phone" id="account_phone" type="text">
					<button type="button" id="duplicate_phone" name="duplicate_phone" class="duplicate">중복확인</button> <br>
					
					<label for="account_address">주소 : </label><input name="account_address" id="account_address" type="text"><br>
					<label for="account_email">이메일 : </label><input name="account_email" id="account_email" type="text"><br>
					
					
					<button type="button" id="submitBtn">가입하기</button>
					<a href="/" style="color: black"><button type="button">홈으로 돌아가기</button></a>
				</form>
			
			</div>
		</section>
	</div>
	
	
	<!-- 이후에 쓸 것 -->
	<script>
		$(function(){
			const form = document.create_member_form;
			
			$('#submitBtn').click(function(){
				if(!form.account_id.value){
					alert("아이디를 입력하세요.");
					form.account_id.focus();
				} else if(!form.account_pw.value){
					alert("비밀번호를 입력하세요.");
					form.account_pw.focus();
				} else if(!form.account_pw_check.value){
					alert("비밀번호 확인을 입력하세요.")
					form.account_pw_check.focus();
				} else if(form.account_pw.value != form.account_pw_check.value){
					alert("비밀번호가 일치하지 않습니다.")
					form.account_pw_check.focus();
				} else if(!form.account_name.value){
					alert("이름을 입력하세요.")
					form.account_name.focus();
				} else if(!form.account_nickname.value){
					alert("닉네임을 입력하세요.")
					form.account_nickname.focus();
				} else if(!form.account_ssn.value){
					alert("주민등록번호를 입력하세요.")
					form.account_ssn.focus();
				} else if(!form.account_phone.value){
					alert("전화번호을 입력하세요.")
					form.account_phone.focus();
				} else if(!form.account_address.value){
					alert("주소를 입력하세요.")
					form.account_address.focus();
				}  else if(!form.account_email.value){
					alert("이메일을 입력하세요.")
					form.account_email.focus();
				} else{
					$.ajax({
						url : "/accountCreateEnd",
						type : "post",
						data : {"account_grade" : form.account_grade.value,
								"account_id" : form.account_id.value,
								"account_pw" : form.account_pw.value,
								"account_name" : form.account_name.value,
								"account_nickname" : form.account_nickname.value,
								"account_ssn" : form.account_ssn.value,
								"account_phone" : form.account_phone.value,
								"account_address" : form.account_address.value,
								"account_email" : form.account_email.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
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
			});
			
			/* 아이디 정규식 검사 */
			let idBoolean = false;
			$('#account_id').keyup(function(){
				let idInput = form.account_id.value;
				let idReg = /^[a-zA-Z][a-zA-Z0-9]{2,14}$/;
				if(idReg.test(idInput)){
					$('#account_id').css('backgroundColor', '#98FB98');
					idBoolean = true;
				} else{
					$('#account_id').css('backgroundColor', '#FF9999');
					idBoolean = false;
				}
			});
			/* 아이디 중복 검사 */
			$('#duplicate_id').click(function(){
				if(idBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_id" : form.account_id.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '아이디입니다.');
							} else{
								alert(data.res_msg + '아이디입니다.');
								$('#account_id').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 아이디를 입력해주세요.');
					form.account_id.focus();
				}
			});
			
			/* 닉네임 정규식 검사 / 임시 : 영문자, 한글, 숫자 2~15자리 */
			let nicknameBoolean = false;
			$('#account_nickname').keyup(function(){
				let nicknameInput = form.account_nickname.value;
				let nicknameReg =  /^[a-zA-Z가-힣0-9]{2,15}$/;
				if(nicknameReg.test(nicknameInput)){
					$('#account_nickname').css('backgroundColor', '#98FB98');
					nicknameBoolean = true;
				} else{
					$('#account_nickname').css('backgroundColor', '#FF9999');
					nicknameBoolean = false;
				}
			});			
			/* 닉네임 중복 검사 */
			$('#duplicate_nickname').click(function(){
				if(nicknameBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_nickname" : form.account_nickname.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '닉네임입니다.');
							} else{
								alert(data.res_msg + '닉네임입니다.');
								$('#account_nickname').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 닉네임을 입력해주세요.');
					form.account_nickname.focus();
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
			/* 주민등록번호 중복 검사 */
			$('#duplicate_ssn').click(function(){
				if(ssnBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_ssn" : form.account_ssn.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '주민등록번호입니다.');
							} else{
								alert(data.res_msg + '주민등록번호입니다.');
								$('#account_ssn').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 주민등록번호를 입력해주세요.');
					form.account_ssn.focus();
				}
			});
			
			
			
			
			
			/* 핸드폰번호 정규식 검사 */
			let phoneBoolean = false;
			$('#account_phone').keyup(function(){
				let phoneInput = form.account_phone.value;
				let phoneReg =  /^01[016789]\d{3,4}\d{4}$/;
				if(phoneReg.test(phoneInput)){
					$('#account_phone').css('backgroundColor', '#98FB98');
					phoneBoolean = true;
				} else{
					$('#account_phone').css('backgroundColor', '#FF9999');
					phoneBoolean = false;
				}
			});	
			/* 핸드폰번호 중복 검사 */	
			$('#duplicate_phone').click(function(){
				if(phoneBoolean){
					$.ajax({
						url : "/accountCreateDuplicate",
						type : "post",
						data : {
								"account_phone" : form.account_phone.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								alert(data.res_msg + '핸드폰 번호입니다.');
							} else{
								alert(data.res_msg + '핸드폰 번호입니다.');
								$('#account_phone').css('backgroundColor', '#FF9999');
							}
						}
					});
				} else{
					alert('올바른 핸드폰번호를 입력해주세요.');
					form.account_phone.focus();
				}
			});
			

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
			/* 비밀번호와 비밀번호 재입력 일치 확인 */
			$('#account_pw_check').keyup(function(){
				let passValue = form.account_pw.value;
				let passCheckValue = form.account_pw_check.value;
				if(passValue == passCheckValue){
					$('#account_pw_check').css('backgroundColor', '#98FB98');
				} else{
					$('#account_pw_check').css('backgroundColor', '#FF9999');
				}
			});
			
		})
		
		
		
		
		
	</script>
	
	
</body>
</html>