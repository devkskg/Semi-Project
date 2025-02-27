<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개설 클래스 목록</title>
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
							</ul>
						</div>



						<div>
							<c:choose>

								<c:when test="${not empty openList }">

									<c:forEach var="list" varStatus="vs" items="${openList }">
										<div>
											<ul>
												<li>${list.klassName}${list.accountNickname}
													${list.klassTxt }</li>
											</ul>
										</div>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<div>해당되는 게시글이 존재하지 않습니다.</div>
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