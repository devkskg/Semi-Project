<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 실패</title>
<style>
.list-group-item a {
	color: #000 !important; /* 글자 색상 검은색 강제 변경 */
	text-decoration: none; /* 링크 밑줄 제거 */
}

h3.text-primary {
	color: #000 !important; /* "마이페이지" 글자 검은색 */
}

.list-group-item {
	border-bottom: 1px solid #ddd; /* 밑줄 추가 */
	display: flex;
	align-items: center; /* 세로 정렬 */
}

.list-group-item .badge {
	margin-left: auto; /* "+" 기호만 우측 정렬 */
}

.clickable-row:hover {
	background-color: #E8F7DC; /* 마우스 오버 시 색상 변경 */
	cursor: pointer; /* 커서를 포인터로 변경 */
}

a.btn-outline-danger {
	background-color: #F1948A !important; /* 배경색 강제 적용 */
	color: #fff !important; /* 글자 색상 강제 적용 */
	border: none; /* 부트스트랩의 기본 테두리 제거 */
}

a.btn-outline-primary {
	background-color: #E8DAEF !important; /* 배경색 강제 적용 */
	color: #4A235A !important; /* 글자 색상 강제 적용 */
	border: none; /* 부트스트랩의 기본 테두리 제거 */
}

.mypage-box {
	background-color: #FFFFEF; /* 연한 살구색 */
	border: 1px solid #E6B0AA; /* 은은한 로즈 컬러 테두리 */
	border-radius: 10px;
	padding: 20px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
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
							회원 탈퇴가 실패했습니다.
						
						</div>
							<a href='<c:url value="/mypageUpdateDelete?val=delete"/>'>회원 탈퇴하러 가기</a><br>
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
						<div class="mypage-box" style="max-width: 100%; margin: 0 auto;">
			                <h3 class="text-primary text-center mb-4">회원 탈퇴 실패</h3>
			                <p class="text-center text-danger" style="margin-bottom: 20px;">
			                    회원 탈퇴가 실패했습니다.<br>
			                    다시 시도해 주세요.
			                </p>
			
			                <div class="d-flex justify-content-between">
			                    <a href="/mypageUpdateDelete?val=delete" class="btn btn-outline-primary" style="width: 48%;">회원 탈퇴하러 가기</a>
			                    <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
			                </div>
			            </div>
			        </div>
			        </div>
	        </div>
	    </section>
	</div>
		
</body>
</html>