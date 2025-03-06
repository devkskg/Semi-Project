<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
			<div id="colorlib-main">
				<section class="ftco-section ftco-no-pt ftco-no-pb">
					<div class="container">
						<div class="row d-flex">
							<div class="col-xl-8 py-5 px-md-5">
							
							
							
								<div class="row pt-md-4">
								
									<form action="/loginEnd" method="post">
										<c:choose>
											<c:when test="${not empty searchIdLogin }">
												<label for="login_id">아이디 : </label><input name="login_id" id="login_id" type="text" value="${searchIdLogin }">
											</c:when>
											<c:otherwise>
												<label for="login_id">아이디 : </label><input name="login_id" id="login_id" type="text">
											</c:otherwise>
										</c:choose>
										<label for="login_pw">비밀번호 : </label><input name="login_pw" id="login_pw" type="password">
										<span class="dis" style="vertical-align: middle;"><ion-icon id="openEye" class="eye" name="eye-off-outline" size="large" style=""></span><br>
										<button>로그인하기</button>
									</form>
									
								</div>
								<a href="<c:url value='/searchId'/>">아이디 찾기</a>
								<a href="<c:url value='/resetPw'/>">비밀번호 재설정</a>
								
								
								
							</div>
						</div>
					</div>
				</section>
			</div>
					 
	
	
	<script>
		/* 비밀번호 보이고 안 보이고 */
	    $(function(){
	        $('.eye').click(function(){
	            let pwtype = $('#login_pw').attr('type');
	            if(pwtype == 'text'){
	                $('#login_pw').attr('type', 'password');
	                $('#openEye').attr('name', 'eye-off-outline');
	            } else{
	                $('#login_pw').attr('type', 'text');
	                $('#openEye').attr('name', 'eye-outline');
	            }
	            $('#closeEye').toggleClass('dis');
	            $('#openEye').toggleClass('dis');
	        });
	    })
	
	</script>
	
	
	
	
</body>
</html>