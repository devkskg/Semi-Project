<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 리뷰 조회</title>
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
								<c:when test="${not empty beforeKlassList }">
									<div>수강 완료 클래스</div>
										<ul>
											
											<c:forEach var="list1" varStatus="vs1" items="${beforeKlassList }">
												<li>
													<a href="<c:url value="/klassDetail?klass_no=${list1.klassNo}"/>">클래스 정보 : ${list1.klassName} ${list1.accountNickname} ${list1.klassStart } ${list1.klassEnd }</a><br>
													<c:set var="check" value="true" />
													<c:forEach var="list2" varStatus="vs2" items="${reviewDTO }">
														<c:if test="${list1.klassDateNo eq list2.klassDateNo }">
															<c:set var="check" value="false" />
															<a href="<c:url value="/reviewDetail?review_no=${list2.reviewNo }"/>">클래스 + 내가 쓴 리뷰 : ${list2.klassName } ${list2.accountNickName } ${list2.reviewName }</a><br>
														</c:if>
													</c:forEach>
														<c:if test="${check }">
															<a href="<c:url value="/insertReviewPage"/>">리뷰 작성하러 가기</a><br>
														</c:if>
												</li>
											</c:forEach>
											
											<%-- <c:when test="${not empty reviewDTO }">
												<c:forEach var="list2" varStatus="vs" items="${reviewDTO }">
													<a href="<c:url value="/reviewboard?review_no=${reviewDTO.review_no }"/>">클래스 + 내가 쓴 리뷰 : ${reviewDTO.klassName } ${reviewDTO.accountNickName } ${reviewDTO.reviewName }</a>
												</c:forEach>
												</c:when>
												<c:otherwise>
													<a href="<c:url value="/insertReviewPage"/>">리뷰 작성하러 가기</a>
												</c:otherwise> --%>
												
										</ul>
								</c:when>
								<c:otherwise>
									<div>수강 완료 클래스가 존재하지 않습니다.</div>
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