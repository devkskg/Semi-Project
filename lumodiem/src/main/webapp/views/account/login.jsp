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
					 
	
	
	
	
	
	
	
</body>
</html>