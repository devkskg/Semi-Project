<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- mobile specific metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- (기존 CSS) -->
  <link rel="stylesheet" href="css/normalize.css">
  <link rel="stylesheet" href="css/main.css">

  <!-- (신규) Bootstrap 5 CSS -->
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

  <!-- script -->
  <script src="js/modernizr.js"></script>

  <!-- favicons -->
  <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
  <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
  <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
  <link rel="manifest" href="site.webmanifest">
</head>

<body>

<!-- Bootstrap 컨테이너 -->
<div class="container my-5">
  <!-- 그리드 row -->
  <div class="row">
    
    <!-- resultList를 반복하여, 각각 하나의 col-md-4로 -->
    <c:forEach var="list" items="${resultList}">
      <div class="col-md-4 mb-4">
        <article>
          <!-- /klassFilePath?attach_no=xxx 형태의 URL 만들기 -->
          <c:url var="imgUrl" value="/klassFilePath">
            <c:param name="attach_no" value="${list.attachNo}" />
          </c:url>
          
          <!-- 동적 이미지 -->
          <img src="${imgUrl}" 
               alt="사진" 
               class="img-fluid">
        </article>
      </div>
    </c:forEach>
    
  </div>
</div>

<!-- (신규) Bootstrap 5 JS (Popper 내장) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
