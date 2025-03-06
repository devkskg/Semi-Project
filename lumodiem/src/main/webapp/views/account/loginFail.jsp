<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
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
							아이디와 비밀번호를 확인해주세요.<br>
						</div>
						<div class="row pt-md-4">
							<a href='<c:url value="/login" />' id="loginBtn"><button>로그인 하러 가기</button></a>
							<a href='<c:url value="/searchId" />' id="searchIdBtn"><button>아이디 찾기</button></a>
							<a href='<c:url value="/" />'><button>홈페이지</button></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>