<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LumoDiem</title>

<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/ionicons.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/css/jquery.timepicker.css">
<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/icomoon.css">

<link rel="stylesheet" href="<c:url value='/css/style.css'/>">
<style type="text/css">
    .scrollax-performance, .scrollax-performance *, .scrollax-performance *:before, .scrollax-performance *:after {
        pointer-events: none !important;
        -webkit-animation-play-state: paused !important;
        animation-play-state: paused !important;
    }
</style>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/60/1/int/ko_ALL/common.js"></script>
<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/60/1/int/ko_ALL/util.js"></script>

</head>
<body>
	<c:url value="/views/include/nav.jsp" var="nav"/>
	<c:import url="${nav}"/>
	<!-- c태그 이상시 아래의 include 태그 활성화 -->
	<%-- <%@ include file="/views/include/nav.jsp" %> --%>
	<a>부트스트랩 적용 전이라 이상한 페이지</a>
	
	<aside id="colorlib-aside" role="complementary" class="js-fullheight" >
		<div>
			<ul>
				<li>test1</li>
				<li>test2</li>
				<li>test3</li>
			</ul>
		</div>
	</aside>
</body>
</html>