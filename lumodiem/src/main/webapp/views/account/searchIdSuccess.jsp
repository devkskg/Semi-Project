<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 조회 성공</title>
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
								"${searchAccount.accountName }"님의 아이디를 조회합니다.<br>
								아이디 : "${searchAccount.accountId }"<br>
								로그인 페이지로 이동하시겠습니까?<br>
								<form action='<c:url value="/login" />' method="post">
									<input type="hidden" value="${searchAccount.accountId }" name="searchIdLogin">
									<button>로그인</button>
								</form>
								
								<form action='<c:url value="/resetPw" />' method="post">
									<input type="hidden" value="${searchAccount.accountId }" name="searchIdResetPw">
									<button>비밀번호 재설정</button>
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