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
</head>
<body>
	<c:url value="/views/include/nav.jsp" var="nav"/>
	<c:import url="${nav}"/>
	<!-- c태그 이상시 아래의 include 태그 활성화 -->
	<%-- <%@ include file="/views/include/nav.jsp" %> --%>
	<a>부트스트랩 적용 전이라 이상한 페이지</a>
	<a href="/views/test01/test01.jsp">부트스트랩 테스트 페이지 이동</a>
	
</body>
</html>