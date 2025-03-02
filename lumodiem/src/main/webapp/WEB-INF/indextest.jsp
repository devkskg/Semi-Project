<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>LumoDiem</title>

    <!-- CSS & JS 한 번만 로드 -->
    <link rel="stylesheet" href="<c:url value='/views/css/nav.css'/>">
    <script src="<c:url value='/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/js/bootstrap.min.js'/>"></script>
</head>
<body>

    <!-- 네비게이션 포함 (이제 최상단에 넣어도 문제 없음) -->
    <%@ include file="/views/include/navtest.jsp" %>

    <!-- 메인 콘텐츠 -->
    <div id="colorlib-main">
        <section class="ftco-section">
            <div class="container">
                <h2>게시글 목록</h2>

                <!-- 게시글 1 -->
                <div class="blog-entry d-md-flex align-items-center">
                    <a href="/" class="img" 
                        style="background-image: url('/images/post1.jpg'); width: 150px; height: 100px;">
                    </a>
                    <div class="text pl-3">
                        <h3><a href="/">제목</a></h3>
                        <p>내용</p>
                        <p><a href="/" class="btn-custom">더 보기</a></p>
                    </div>
                </div>

                <!-- 게시글 2 -->
                <div class="blog-entry d-md-flex align-items-center">
                    <a href="/" class="img" 
                        style="background-image: url('/images/post2.jpg'); width: 150px; height: 100px;">
                    </a>
                    <div class="text pl-3">
                        <h3><a href="/">제목</a></h3>
                        <p>내용</p>
                        <p><a href="/" class="btn-custom">더 보기</a></p>
                    </div>
                </div>

            </div>
        </section>
    </div>

</body>
</html>
