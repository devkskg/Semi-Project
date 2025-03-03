<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정 성공</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<div>
								아이디 : "${accountResetPw.accountId }"님의 비밀번호가 재설정 되었습니다.<br>
								로그인 페이지로 이동하시겠습니까?<br>
								<form action="/login" method="post">
									<input type="hidden" value="${accountResetPw.accountId }" name="searchId">
									<button>로그인</button>
									<a href='<c:url value="/resetPw" />'><button type="button">비밀번호 재설정</button></a>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
</body>
</html>