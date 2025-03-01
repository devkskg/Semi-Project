<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LumoDiem</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/open-iconic-bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/owl.carousel.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/owl.theme.default.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/magnific-popup.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/aos.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/ionicons.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/bootstrap-datepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/jquery.timepicker.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/flaticon.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/icomoon.css'/>">
</head>
<body>

    <!-- 왼쪽 네비게이션 -->
    <%@ include file="/views/include/nav2.jsp" %>

    <!-- 메인 콘텐츠 -->
    <div id="colorlib-main">
        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <!-- 가운데 게시판 내용 -->
                        <%-- <c:forEach var="post" items="${postList}">
                            <div class="blog-entry">
                                <a href="/post/${post.id}" class="img" style="background-image: url('${post.imageUrl}');"></a>
                                <div class="text">
                                    <h3><a href="/post/${post.id}">${post.title}</a></h3>
                                    <p>${post.summary}</p>
                                    <p><a href="/post/${post.id}" class="btn-custom">더 보기</a></p>
                                </div>
                            </div>
                        </c:forEach> --%>
                    <div class="col-xl-8">
				    <h2>게시글 목록</h2>
				
				    <!-- 게시글 1 -->
				    <div class="blog-entry d-md-flex align-items-center">
				        <!-- 왼쪽에 이미지 -->
				        <a href="/" class="img" 
				            style="background-image: url('/images/post1.jpg'); width: 150px; height: 100px; flex-shrink: 0;">
				        </a>
				
				        <!-- 오른쪽에 텍스트 -->
				        <div class="text pl-3">
				            <h3><a href="/">제목</a></h3>
				            <p>내용</p>
				            <p><a href="/" class="btn-custom">더 보기</a></p>
				        </div>
				    </div>

                    <!-- 오른쪽 사이드바 -->
                    <div class="col-xl-4 sidebar">
                        <h3>사이드바</h3>
                        <p>이곳에 사이드바 내용을 추가하세요.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>

</body>
</html>
