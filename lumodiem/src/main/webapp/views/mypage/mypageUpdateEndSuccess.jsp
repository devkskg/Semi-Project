<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 완료</title>
<style>
.mypage-box {
	color: black;
    background-color: #FFFFEF; /* 부드러운 배경색 */
    border: 2px solid #E6B0AA; /* 연한 로즈 컬러 */
    border-radius: 12px;
    padding: 30px;
    box-shadow: 4px 4px 15px rgba(0, 0, 0, 0.1);
    max-width: 500px;
    margin: 50px auto;
    text-align: center;
}

.mypage-box h3 {
	color: black;
    margin-bottom: 20px;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 6px;
    box-sizing: border-box;
    margin-bottom: 10px;
}

#openEye {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
}

.btn-outline-primary {
    background-color: #E8DAEF !important;
    color: #4A235A !important;
    border: none;
    width: 48%;
}

.btn-outline-danger {
    background-color: #F1948A !important;
    color: #fff !important;
    border: none;
    width: 48%;
}

.mypage-box .d-flex {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

a {
    text-decoration: none;
    color: #4A235A;
}
    
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
<%-- 	<div id="colorlib-main">
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
	</div> --%>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
						<div class="mypage-box">
						    <h3 class="text-center mb-4">회원 정보 수정 완료</h3>
						    <p>회원 정보 수정이 완료되었습니다.<br>다시 로그인 해주세요.</p>
						
						    <div class="d-flex justify-content-between">
						        <a href='<c:url value="/login"/>' class="btn btn-outline-primary">로그인하러가기</a>
						        <a href='<c:url value="/"/>' class="btn btn-outline-danger">홈페이지</a>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	
</body>
</html>