<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요 목록 조회</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">

							<div>
									<div>좋아요 클래스 목록</div>
								<c:choose>
									<c:when test="${not empty klassLikeList }">
										<div>
											<ul>
												<c:forEach var="list1" varStatus="vs" items="${klassLikeList }">
													<li>
														<a href="<c:url value="/klassDetail?klass_no=${list1.klassNo}"/>">${list1.klassName}</a>
													</li>
												</c:forEach>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<div>좋아요를 누른 클래스가 없습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>










						</div>
					</div>

					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">

							<div>
									<div>좋아요 리뷰 목록</div>
								<c:choose>
									<c:when test="${not empty reviewLikeList }">
										<div>
											<ul>
												<c:forEach var="list2" varStatus="vs" items="${reviewLikeList }">
													<li>
														<a href="<c:url value="/reviewDetail?review_no=${list2.reviewNo}"/>">${list2.reviewName}</a>
													</li>
												</c:forEach>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<div>좋아요를 누른 리뷰가 없습니다.</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

</body>
</html>