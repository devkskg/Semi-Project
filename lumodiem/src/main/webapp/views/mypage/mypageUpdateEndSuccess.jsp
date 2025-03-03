<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 완료</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							회원 정보 수정이 완료되었습니다.<br>
							다시 로그인 해주세요.
						
						</div>
							<a href='<c:url value="/login"/>'>로그인하러가기</a><br>
							<a href='<c:url value="/"/>'>홈페이지</a>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>