<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<form action="/mypageDeleteEnd" method="post" name="delete_form">
								<label for="account_pw">비밀번호 : </label><input name="account_pw" id="account_pw" type="password">
								<span class="dis" style="vertical-align: middle;"><ion-icon id="openEye" class="eye" name="eye-off-outline" size="large" style=""></span>
								<br>
								<button id="submitBtn" type="button">다음</button>
							</form>
						
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
	<script>
		$(function(){
			const form = document.delete_form;
			$('#submitBtn').click(function(){
				let temp = confirm('회원 탈퇴시 정보 복구가 불가합니다. 탈퇴 하시겠습니까?');
				if(temp){
					form.submit();
				} else{
					console.log('test');
				}
			});
		})
		
		/* 비밀번호 보이고 안 보이고 */
        $(function(){
            $('.eye').click(function(){
                let pwtype = $('#account_pw').attr('type');
                if(pwtype == 'text'){
                    $('#account_pw').attr('type', 'password');
                    $('#openEye').attr('name', 'eye-off-outline');
                } else{
                    $('#account_pw').attr('type', 'text');
                    $('#openEye').attr('name', 'eye-outline');
                }
                $('#closeEye').toggleClass('dis');
                $('#openEye').toggleClass('dis');
            });
        })
		
	</script>
	
</body>
</html>