<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
										<li><a href="<c:url value='memberMypageKlass'/>">참여 클래스 조회 <span>(+)</span></a></li>
										<li><a href="<c:url value='memberMypageLike'/>">좋아요 목록 조회 <span>(+)</span></a></li>
										<li><a href="<c:url value='memberMypageCmt'/>">작성 댓글 조회 <span>(+)</span></a></li>
									</ul>
								</div>
							</div>
						</div>
					</section>
				</div>
									
</body>
</html>