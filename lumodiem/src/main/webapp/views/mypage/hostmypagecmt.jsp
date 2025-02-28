<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글 조회</title>
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
								<div>댓글 목록</div>
								<c:choose>
									<c:when test="${not empty reviewCmtList }">
										<div>
											<ul>
												<c:forEach var="list1" varStatus="vs"
													items="${reviewCmtList }">
													<li><a
														href="<c:url value="/reviewDetail?review_no=${list1.reviewNo}"/>">${list1.reviewCmtTxt}</a>
													</li>
												</c:forEach>
											</ul>
										</div>
									</c:when>
									<c:otherwise>
										<div>작성한 댓글이 없습니다.</div>
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