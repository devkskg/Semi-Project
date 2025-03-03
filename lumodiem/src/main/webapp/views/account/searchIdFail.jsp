<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 조회 실패</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>

	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							일치하는 회원 정보가 없습니다.<br>
							개인 정보를 확인해주세요.<br>
						</div>
						<div class="row pt-md-4">
							<a href='<c:url value="/searchId" />' id="loginBtn"><button>아이디찾기</button></a>
							<a href='<c:url value="/" />'><button>홈페이지</button></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>