<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>
	
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
						
							<form name="update_member_form" action="">
								<%-- <label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text" value="${account.accountId }" readonly><br> --%>
								
								<span>입력하신 비밀번호로 변경됩니다.</span><br>
								<label for="account_pw"> 새로운 비밀번호 : </label><input name="account_pw" id="account_pw" type="password"><br>
								<label for="account_pw_check">비밀번호 확인 : </label><input name="account_pw_check" id="account_pw_check" type="password"><br>
								
								<%-- <label for="account_name">이름 : </label><input name="account_name" id="account_name" type="text" value="${account.accountName }" readonly><br> --%>
								<label for="account_nickname">닉네임 : </label><input name="account_nickname" id="account_nickname" type="text" value="${account.accountNickname }">
								<button type="button" id="duplicate_nickname" name="duplicate_nickname" class="duplicate">중복확인</button> <br>
								
								<%-- <label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text" value="${account.accountSsn }" readonly> --%>
								
								<label for="account_phone">전화번호 : </label><input name="account_phone" id="account_phone" type="text" value="${account.accountPhone }">
								<button type="button" id="duplicate_phone" name="duplicate_phone" class="duplicate">중복확인</button> <br>
								
								<label for="account_address">주소 : </label><input name="account_address" id="account_address" type="text" value="${account.accountAddress }"><br>
								<label for="account_email">이메일 : </label><input name="account_email" id="account_email" type="text" value="${account.accountEmail }"><br>
								
								
								<button type="button" id="submitBtn">회원정보 수정하기</button>
								<a href="/" style="color: black"><button type="button">홈으로 돌아가기</button></a>
							</form>
						
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
			
			
			
			
			
	<script>
		$(function(){
			const form = document.update_member_form;
			$('#submitBtn').click(function(){
				if(!form.account_pw.value){
					alert("비밀번호를 입력하세요.");
					form.account_pw.focus();
				} else if(!form.account_pw_check.value){
					alert("비밀번호 확인을 입력하세요.")
					form.account_pw_check.focus();
				} else if(form.account_pw.value != form.account_pw_check.value){
					alert("비밀번호가 일치하지 않습니다.")
					form.account_pw_check.focus();
				}else if(!form.account_nickname.value){
					alert("닉네임을 입력하세요.")
					form.account_nickname.focus();
				}else if(!form.account_phone.value){
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
						url : "/mypageUpdateEndFin",
						type : "post",
						data : {
							"account_pw" : form.account_pw.value,
							"account_nickname" : form.account_nickname.value,
							"account_phone" : form.account_phone.value,
							"account_address" : form.account_address.value,
							"account_email" : form.account_email.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							alert(data.res_msg);
							if(data.res_code == "200"){
								location.href="/mypageUpdateEndSuccess";
							} else{
								location.href="/mypageUpdateEndFail";
							}
						}
					});
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
				/* 닉네임 정규식 검사 / 임시 : 영문자, 한글, 숫자 2~15자리 */
				let nicknameBoolean = true;
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
							url : "/mypageUpdateEndDuplicate",
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
			
				/* 핸드폰번호 정규식 검사 */
				let phoneBoolean = true;
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
							url : "/mypageUpdateEndDuplicate",
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
			
			
		})
	</script>
</body>
</html>