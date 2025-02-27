<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${approveCode eq 'A' }">
		<title>승인 완료 클래스</title>
	</c:when>
	<c:when test="${approveCode eq 'S' }">
		<title>승인 대기 클래스</title>
	</c:when>
	<c:when test="${approveCode eq 'D' }">
		<title>반려된 클래스</title>
	</c:when>
</c:choose>
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

								<c:when test="${not empty approveList }">

									<c:forEach var="list" varStatus="vs" items="${approveList }">
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