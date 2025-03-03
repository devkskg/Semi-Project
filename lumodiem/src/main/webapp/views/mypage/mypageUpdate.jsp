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
							<form action="/mypageUpdateEnd" method="post">
								<label for="account_pw">비밀번호 : </label><input name="account_pw" id="account_pw" type="password"><br>
								<button>다음</button>
							</form>
						
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>