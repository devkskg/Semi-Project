<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <!-- 단일 이미지 컬럼 (원한다면 여러 개 복제해서 3개씩 or 4개씩 배치 가능) -->
    <div class="col-md-4 mb-4">
      <article>
        <!-- Masonry 템플릿에서 가져온 링크/이미지 부분 -->
        <a href="single-standard.html">
          <img src="images/thumbs/masonry/woodcraft-600.jpg"
               alt="woodcraft thumb"
               class="img-fluid">
        </a>
      </article>
    </div>
  </div>
</div>

<!-- (신규) Bootstrap 5 JS (Popper 내장) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
