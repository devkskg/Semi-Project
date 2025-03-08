<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .list-group-item {
        color: #000; /* 글자 색상 검은색 */
        border-bottom: 1px solid #ddd; /* 밑줄 추가 */
        display: flex;
        justify-content: space-between; /* "+" 기호를 우측으로 이동 */
        align-items: center;
    }
</style>
</head>
<body>
    <%@ include file="/views/include/nav.jsp" %>

	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
				        <div class="review" style="max-width: 60%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
				            <h3 class="text-primary text-center mb-4">마이페이지</h3>
				
							<ul class="list-group mb-4">
							    <li class="list-group-item d-flex justify-content-between">
							        <a href="<c:url value='/memberMypageKlass'/>" class="text-decoration-none">참여 클래스 조회</a>
							        <div class="badge badge-primary">+</div>
							    </li>
							    <li class="list-group-item d-flex justify-content-between">
							        <a href="<c:url value='/memberMypageReview'/>" class="text-decoration-none">작성 리뷰 조회</a>
							        <div class="badge badge-success">+</div>
							    </li>
							    <li class="list-group-item d-flex justify-content-between">
							        <a href="<c:url value='/mypageLike'/>" class="text-decoration-none">좋아요 목록 조회</a>
							        <div class="badge badge-warning">+</div>
							    </li>
							    <li class="list-group-item d-flex justify-content-between">
							        <a href="<c:url value='/mypageCmt'/>" class="text-decoration-none">작성 댓글 조회</a>
							        <div class="badge badge-info">+</div>
							    </li>
							</ul>
				
				            <div class="d-flex justify-content-between">
				                <a href='<c:url value="/mypageUpdateDelete?val=update"/>' class="btn btn-outline-primary">회원정보 수정</a>
				                <a href='<c:url value="/mypageUpdateDelete?val=delete"/>' class="btn btn-outline-danger">회원 탈퇴</a>
				            </div>
				        </div>
				    </div>
		    	</div>
		    </div>
	    </section>
    </div>		
</body>
</html>
