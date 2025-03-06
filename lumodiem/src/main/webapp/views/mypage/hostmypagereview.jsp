<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 리뷰 조회</title>
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
								<h3 class="sidebar-heading">Categories</h3>
							</div>

						</div>
						<div class="meta-wrap">
							<ul class="categories">
								<li>1</li>
								<li>2</li>
								<li>3</li>
								<li>4</li>
								<li>5</li>
							</ul>
						</div>



						<div>
							<c:choose>

								<c:when test="${not empty approveList }">

									<c:forEach var="list1" varStatus="vs" items="${approveList }">
										<div>
											
											<a href="<c:url value='/klassDetail?klass_no=${list1.klassNo }'/>">${list1.klassName} ${list1.accountNickname} ${list1.klassTxt }</a>
										</div>
											<c:choose>
												<c:when test="${not empty reviewList }">
												<ul>
													<c:forEach var="list2" varStatus="vs2" items="${reviewList}">
														<li>
															<a href="<c:url value="/reviewDetail?review_no=${list2.reviewNo}"/>">${list2.reviewName}</a>
														</li>
													</c:forEach>
												</ul>
												</c:when>
												<c:otherwise>
													<div>리뷰가 없습니다.</div>
												</c:otherwise>
											</c:choose>
												
									</c:forEach>
									
								</c:when>
								<c:otherwise>
									<div>개설된 클래스가 존재하지 않습니다.</div>
								</c:otherwise>
							</c:choose>
						</div>



					</div>




				</div>
			</div>
		</section>
	</div>


</body>
</html>