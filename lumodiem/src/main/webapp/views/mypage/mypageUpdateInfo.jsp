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
							</div>
						</div>
					</div>
				</section>
			</div>
</body>
</html>