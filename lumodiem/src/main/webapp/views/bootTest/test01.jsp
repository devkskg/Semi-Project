<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<script src="<c:url value='/views/jquery-3.7.1.js'/>"></script> 
    <meta charset="UTF-8">
    <title>LumoDiem</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<!-- ✅ Summernote CSS (CDN) -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.css">


    <!-- ✅ 기존 CSS 유지 -->
    <link rel="stylesheet" href="<c:url value='/views/css/nav.css'/>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/css/summernote/summernote-bs4.min.css'/>">
    
    <!-- ✅ 기존 JS 유지 -->
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/jquery-migrate-3.0.1.min.js'/>"></script>
    <script src="<c:url value='/js/popper.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/js/jquery.easing.1.3.js'/>"></script>
    <script src="<c:url value='/js/jquery.waypoints.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.stellar.min.js'/>"></script>
    <script src="<c:url value='/js/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='/js/jquery.magnific-popup.min.js'/>"></script>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script src="<c:url value='/js/jquery.animateNumber.min.js'/>"></script>
    <script src="<c:url value='/js/scrollax.min.js'/>"></script>
    <script src="<c:url value='/js/main.js'/>"></script>
    <script src="<c:url value='/css/summernote/summernote-bs4.min.js'/>"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            $("#nav-placeholder").load("${pageContext.request.contextPath}/views/include/nav.jsp", function() {
                console.log("네비게이션 로드 완료!");
            });
        });
    </script>
</head>
<body>

    <!-- 네비게이션 AJAX 로드 -->
    <div id="nav-placeholder"></div>

    <!-- 메인 콘텐츠 -->
    <div id="colorlib-main">
        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-xl-8 py-5 px-md-5">
                        <div class="row pt-md-4">
                            <div class="col-md-12">
                                <div class="blog-entry ftco-animate d-md-flex">
                                    <a href="single.html" class="img img-2">
                                        <img alt="이미지" src="">
                                    </a>
                                    <div class="text text-2 pl-md-4">
                                        <h3 class="mb-2"><a href="single.html">제목</a></h3>
                                        <div class="meta-wrap">
                                            <p class="meta">
                                                <span><i class="icon-calendar mr-2"></i>날짜</span>
                                                <span><a href="single.html"><i class="icon-folder-o mr-2"></i>좋아요</a></span>
                                                <span><i class="icon-comment2 mr-2"></i>댓글 수: 5</span>
                                            </p>
                                        </div>
                                        <p class="mb-4">간단한 내용</p>
                                        <p><a href="#" class="btn-custom">더 보기<span class="ion-ios-arrow-forward"></span></a></p>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <label for="test123">입력: </label>
                                <input type="text" id="test123">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.body.classList.add("loaded");
        });
    </script>
</body>
</html>
