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
								
								
								
								<!-- <span>
									참여 클래스 조회
								</span>
								</div>
								<ul class="categories">
									<li>진짜 참여 클래스 조회</li>
									<ul>
										<li>
										test
										<li>
									</ul>
									<li>비보잉 댄스</li>
								</ul> -->
							</div>
								<div class="meta-wrap">
									<ul class="categories">
										<li><a href="<c:url value='/hostMypageApproveClass'/>">승인 대기 클래스 조회 <span>(+)</span></a></li>
										<li><a href="<c:url value='/hostMypageOpenClass'/>">개설 클래스 목록 조회 <span>(+)</span></a></li>
										<li><a href="<c:url value='/hostMypageReview'/>">클래스 리뷰 조회 <span>(+)</span></a></li>
										<li><a href="<c:url value='/hostMypageLike'/>">좋아요 목록 조회 <span>(+)</span></a></li>
										<li><a href="<c:url value='/hostMypageCmt'/>">작성 댓글 조회 <span>(+)</span></a></li>
									</ul>
								</div>
						</div>
					</div>
				</section>
			</div>
									
</body>
</html>