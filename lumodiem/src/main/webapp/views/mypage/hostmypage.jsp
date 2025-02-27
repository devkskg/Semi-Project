<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주최자 마이페이지</title>
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
								<h3 class="sidebar-heading">Categories</h3>
								</div>
							
						</div>
							<div class="meta-wrap">
								<ul class="categories">
									<li><a href="<c:url value='/hostMypageApproveKlass?account_no=${account.accountNo}&approve_code=A'/>">승인 완료 클래스 <span>(+)</span></a></li>
									<li><a href="<c:url value='/hostMypageApproveKlass?account_no=${account.accountNo}&approve_code=S'/>">승인 대기 클래스 <span>(+)</span></a></li>
									<li><a href="<c:url value='/hostMypageApproveKlass?account_no=${account.accountNo}&approve_code=D'/>">반려된 클래스 <span>(+)</span></a></li>
									<li><a href="<c:url value='/hostMypageReview?account_no=${account.accountNo}&approve_code=S'/>">클래스 리뷰 조회 <span>(+)</span></a></li>
									<li><a href="<c:url value='/hostMypageLike?account_no=${account.accountNo}'/>">좋아요 목록 조회 <span>(+)</span></a></li>
									<li><a href="<c:url value='/hostMypageCmt?account_no=${account.accountNo}'/>">작성 댓글 조회 <span>(+)</span></a></li>
								</ul>
							</div>
					</div>
				</div>
			</section>
		</div>
</body>
</html>