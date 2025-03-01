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
									<div>작성 리뷰 조회</div>
									<div>
										<ul>
											<c:forEach var="list2" varStatus="vs" items="${beforeKlassList }">
														<li>
															<a href="<c:url value="/klassDetail?review_no=${list2.klassNo}"/>">${list2.klassName} ${list2.accountNickname} ${list2.klassStart } ${list2.klassEnd }</a>
														</li>
											</c:forEach>
										</ul>
									</div>
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