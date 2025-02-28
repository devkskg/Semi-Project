<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여 클래스 조회</title>
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
							<div>수강 예정 / 수강 완료 클래스 나눠야함</div>
							<c:choose>

								<c:when test="${not empty klassList }">

									<c:forEach var="list" varStatus="vs" items="${klassList }">
										<div>
											<ul>
												<li>
													${list1.klassName}
													${list1.accountNickname}
													${list1.klassTxt }
												</li>
											</ul>
										</div>
									</c:forEach>
									
								</c:when>
								<c:otherwise>
									<div>참여한 클래스가 존재하지 않습니다.</div>
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