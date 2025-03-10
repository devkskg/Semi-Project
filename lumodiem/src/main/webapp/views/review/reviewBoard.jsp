<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>⭐리뷰 게시판⭐</title>
<%-- <script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script> --%>
  <style>
  /* ================================
     1) 톤온톤 컬러 팔레트 설정
     ================================ */
  :root {
    /* 메인 컬러(base-500) 기준: #D1B5E0 (원하시는 값) */
    --base-100: #F4ECF8;
    --base-200: #EBE0F2;
    --base-300: #E2D5ED;
    --base-400: #D8C9E7;
    --base-500: #D1B5E0; /* 메인 컬러 */
    --base-600: #BFA3CE;
    --base-700: #AD91BC;
    --base-800: #9B7FAA;
    --base-900: #8A6E99;

    /* 텍스트/테두리 등 */
    --text-color: #333;
    --border-color: #CABED1;
  }

  /* 전역 기본 스타일 */
  * {
    box-sizing: border-box; /* 테두리·패딩 계산 일관성 위해 추가 권장 */
  }
  body {
    margin: 0;
    padding: 0;
    background-color: var(--base-100);
    color: var(--text-color);
    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트 */
  }

  /* ================================
     2) 테이블 스타일 (톤온톤)
     ================================ */
  table {
    width: 100%;
    border-collapse: collapse;  /* 테두리 겹침 제거 */
    /* background-color: var(--base-200); */
    margin: 16px 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    border: 1px solid var(--border-color);
  }
  thead {
    background-color: var(--base-400);
    color: var(--text-color);
  }
  thead th {
    padding: 12px;
    border-bottom: 1px solid var(--border-color);
    text-align: left;
  }
  tbody tr {
    border-bottom: 1px solid var(--border-color);
  }
  tbody td {
    padding: 12px;
  }
  tbody tr:nth-child(even) {
    background-color: var(--base-300); /* 짝수 행에 다른 톤 적용 */
  }

  /* ================================
     3) select, input, button
        모서리/높이 통일
     ================================ */
  select, input[type="text"], button {
    /* 모서리 둥글기 통일 */
    border-radius: 6px;
    /* 테두리 색 통일 */
    border: 1px solid var(--border-color);
    /* 높이·패딩 통일 */
    padding: 6px 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.2;
    transition: border-color 0.2s ease, box-shadow 0.2s ease,
                background-color 0.2s ease, transform 0.2s ease;
  }

  /* select, input은 흰 배경 + 기본 텍스트 */
  select, input[type="text"] {
    background-color: #fff;
    color: var(--text-color);
  }
  select:focus, input[type="text"]:focus {
    outline: none;
    border-color: var(--base-500);
    box-shadow: 0 0 0 2px rgba(209,181,224,0.2);
  }

  /* 버튼은 메인 컬러(기본 상태) */
  button {
    background-color: var(--base-500);
    color: #fff;
    cursor: pointer;
  }
  /* 버튼 호버 */
  button:hover {
    background-color: var(--base-600);
  }
  /* 버튼 클릭(액티브) */
  button:active {
    background-color: var(--base-700);
    transform: translateY(1px);
  }

  /* ================================
     4) 한 줄 정렬: .inline-form-group
     ================================ */
  .inline-form-group {
    display: flex;
    align-items: center;
    gap: 8px; /* 요소 간 간격 */
    margin: 8px 0; /* 위아래 여백 */
  }

  /* =============== (필요시) 나머지 스타일 =============== */
  /* 예전 .btn-pastel, .select-rounded 등 필요 없으면 삭제 */
  </style>
</head>

<body>
<%-- <%@ include file="/views/include/nav.jsp" %> --%>
<div id="colorlib-main">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex">
				<div class="col-xl-8 py-5 px-md-5">
					<div class="row pt-md-4">

<div class="review_list">	

<h3 style="text-align: center; margin-bottom: 20px;">리뷰 게시판</h3>
<hr>
<!-- 정렬하기 + 작성하기 (한 줄 정렬) -->
	<form action="<c:url value='/reviewBoard'/>" method="post" id="searchFrm"
	class="inline-form-group"
	    style="justify-content: space-between; width: 100%;">
	
		<select name="order_type" id="order_type">
				<option value="x">정렬하기</option>
				<option value="a">최신순</option>
				<option value="b">오래된순</option>
				<option value="c">좋아요순</option>
		</select>
		<c:choose>
			<c:when test="${account.accountGrade eq 'M' or account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
				<button type="button" class="selectBtn" name="insert"
					onclick="location.href='/insertReviewPage'" style="border-radius: 6px;">
					리뷰 작성
				</button>
			</c:when>
		<%-- <c:otherwise>
			<script>
				alert("회원만 리뷰 게시판을 사용할수있습니다.");
				if(confirm('로그인 페이지로 이동하시겠습니까?')){
				location.href="/views/account/login.jsp";
				}else{
				location.href="/";
				}
			</script>
		</c:otherwise> --%>
		</c:choose>
		<%-- <a href="<c:url value='/insertReviewPage'/>"></a> --%>
	
	</form>

	<!-- 게시글 리스트 (resultList) -->	
	<c:choose>
		<c:when test="${not empty resultList }">
			<c:forEach var="list" varStatus="vs" items="${resultList }">
			<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
				<div class="col-md-12 ">
					<div class="blog-entry ftco-animate d-md-flex">
						<c:choose>
							<c:when test="${list.attachNo > 0}">
								<a href="/reviewDetail?review_no=${list.reviewNo}" 
										class="img img-2" 
										style="display: flex; justify-content: center; align-items: center; 
										width: 244px; height: 244px; background-image: url();">
									<img alt="사진" src="/filePath?attach_no=${list.attachNo}"
									style="max-width: 100%; max-height: 100%;">
								</a>
							
							</c:when>
							<c:otherwise>
								<a href="/reviewDetail?review_no=${list.reviewNo}">
									<img alt="사진" src="/views/mainpage/thumbnail.jpg" style="height: 244px; width:244px;">
								</a>
							</c:otherwise>
						</c:choose>
					
						<div class="text text-2 pl-md-4">
							<h3 class="mb-2">
								<a href="/reviewDetail?review_no=${list.reviewNo}">
									${list.reviewName}
								</a>
							</h3>
							<div class="meta-wrap">
								<p class="meta">
									<span><i class="icon-user mr-2"></i>${list.accountNickname}</span>
									<span><a href="single.html"><i class="icon-heart mr-2" style="color: #FF4848;"></i>${list.reviewLikeCount}</a></span>
									<span>${kName.klassName}</span>
								</p>
							</div>
							<p>
								<a href="/reviewDetail?review_no=${list.reviewNo}" class="btn-custom"
									style="text-decoration: none; color: #724AA9">
									더 보기.. 
									<span class="ion-ios-arrow-forward"></span>
								</a>
							</p>
						</div>
					</div>
				</div>
			<!-- 한 줄 끝! -->
			
			</c:forEach>
		</c:when>
		<c:otherwise>
		<p>해당 게시글이 없습니다.</p>
		</c:otherwise>
	
	</c:choose>	
	<!-- 페이징 위치 예시 -->
	<form style="text-align: center;">
		<p>페이징 위치(중앙 정렬 할거임)</p>
	</form>
		
	 <!-- 검색 (한 줄 정렬) -->
	 <div style="text-align: center; margin-top: 20px;">
		 <form action="/reviewBoard" id="searchReviewBoard" method="post"
                class="inline-form-group"
                style="display: inline-flex;">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">리뷰제목</option>			
				<option value="2">닉네임</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn" style="border-radius: 6px;">검색</button> 
		
		</form>
	</div>
		
		<%-- <table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>닉네임</th>
			</tr>
	</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach items="${resultList}" var="rb" varStatus="vs">
						<tr data-review-no="${rb.reviewNo}">
							<td><c:out value="${vs.count}" /></td>
							<td><c:out value="${rb.reviewName}" /></td>
							<td><c:out value="${rb.reviewTxt}" /></td>
							<td><c:out value="${rb.accountNickname}"/></td>
						</tr>
						
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">자료없음!</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>	--%>
						</div><!-- review_list -->
					</div><!-- .row pt-md-4 -->
				</div><!-- .col-xl-8 -->
			</div><!-- .row d-flex -->
		</div><!-- .container -->
	</section>	
</div><!-- #colorlib-main -->
<script>
	const orderType = document.getElementById('order_type');
	orderType.onchange = function(){
		document.getElementById('searchFrm').submit();
	}
</script>

<!-- <script>
	$('.review_list tbody tr').click(function(){
		const reviewNo = $(this).data('review-no');
		location.href='/reviewDetail?review_no='+reviewNo;
	})
</script> -->  

<%@ include file="/views/include/nav.jsp" %>
</body>
</html>