<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 목록</title>
<%-- <link rel="stylesheet" href="<c:url value='/views/css/adminPage.css'/>"> --%>
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
	background-color: #D1B5E0 !important; /* 배경색 강제 적용 */
	color: #D1B5E0 !important; /* 글자 색상 강제 적용 */
	border: none; /* 부트스트랩의 기본 테두리 제거 */
}

.mypage-box {
	border-radius: 10px;
	padding: 20px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
}
.btn-outline-primary {
    color: #000000 !important;
    border: solid thin !important;
    border-color: #D1B5E0 !important;
}
.btn-outline-primary:hover {
    background-color: #D1B5E0 !important;
    color: #fff !important;
    border: none !important;
}
.btn-outline-danger {
    color: #000000 !important;
    border: solid thin !important;
    border-color: #D1B5E0 !important;
}
.btn-outline-danger:hover {
    background-color: #D1B5E0 !important;
    color: #fff !important;
    border: none !important;
}

</style>

</head>
<body>
<%@ include file="/views/include/nav.jsp" %>	
	
	<!-- <div id="colorlib-main">
				<section class="ftco-section ftco-no-pt ftco-no-pb">
					<div class="container">
						<div class="row d-flex">
							<div class="col-xl-8 py-5 px-md-5">
								<div class="row pt-md-4">
								
								<a href="/reportKlass" class="pastel-btn pastel-blue">신고된 클래스</a>
								<hr>
								<a href="/reportReview" class="pastel-btn pastel-blue">신고된 리뷰</a>
								<hr>
								<a href="/reportReviewCmt" class="pastel-btn pastel-blue">신고된 리뷰 댓글</a>
								
								</div>
							</div>
						</div>
					</div>
				</section>
			</div> -->
	
	
		<div id="colorlib-main">	
			<section class="ftco-section ftco-no-pt ftco-no-pb">
				<div class="container">
					<div class="row d-flex">
					    <div class="col-xl-8 py-5 px-md-5">	
						<div class="mypage-box" style="width: 500px">
								<h3 class="text-primary text-center mb-4">신고 목록</h3>
								<form action="/accountCreateMove" method="post">
									<div class="d-flex justify-content-between">
										<button type="button" class="btn btn-outline-primary" id="reportKlassBtn" 
											style="width: 30%;">신고된 클래스</button>
										<button type="button" class="btn btn-outline-danger" id="reportReviewBtn" 
											style="width: 30%;">신고된 리뷰</button>
										<!-- <button type="button" class="btn btn-outline-danger" id="reportReviewCmtBtn" 
											style="width: 30%;">신고된 리뷰 댓글</button> -->
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		
		
		
		
		
		
		
		
		
		
	
	<script>
		$(function(){
			$('#reportKlassBtn').click(function(){
				location.href = "/reportKlass";
			});
			$('#reportReviewBtn').click(function(){
				location.href = "/reportReview";
			});
			$('#reportReviewCmtBtn').click(function(){
				location.href = "/reportReviewCmt";
			});
		})
	</script>
	
</body>
</html>