<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 실패</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							회원 탈퇴가 실패했습니다.
						
						</div>
							<%-- <a href='<c:url value="/mypageUpdateDelete?val=delete"/>'>회원 탈퇴하러 가기</a><br> --%>
							<a href='<c:url value="/"/>'>홈페이지</a>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>