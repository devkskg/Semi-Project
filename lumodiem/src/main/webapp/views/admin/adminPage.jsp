<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<!-- CSS 파일 연결 -->
<link rel="stylesheet" href="<c:url value='/views/css/adminPage.css'/>">

</head>
<body>

<%@ include file="/views/include/nav.jsp" %>

<div id="colorlib-main">
    <section class="ftco-section ftco-no-pt ftco-no-pb">
        <div class="container">
            <div class="row d-flex">
                <div class="col-xl-8 py-5 px-md-5">
                    <div class="row pt-md-4">
                        <a href="/reportList" class="pastel-btn pastel-blue">신고 목록 조회</a>
                        <a href="/arreoveList" class="pastel-btn pastel-pink">대기중인 클래스 목록</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

</body>
</html>
