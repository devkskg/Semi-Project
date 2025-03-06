<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.hostboard.vo.Klass" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 게시판</title>
<!--<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>  -->
</head>
<body>


	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">	
						<div class="row pt-md-4">
<div class="klass_list">
	<form action="/klassBoardList" id="arrangeKlass" name="arrangeKlass">
		<select name="order_type" id="order_type">
			<option value="x">정렬하기</option>
			<option value="a">최신순</option>
			<option value="b">오래된순</option>
			<option value="c">좋아요순</option>
		</select>
	</form>


		<form>
		<c:choose>
			<c:when test="${account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
			<button type="button" id="insertBtn" name="insertBtn">
				<a href="/klassBoardCreate">작성하기</a>
			</button>
			</c:when>
			
		</c:choose>
	</form>
	
	
	<c:choose>
		<c:when test="${not empty resultList }">
			<c:forEach var="list" varStatus="vs" items="${resultList }">
		
	<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
	
	
	
	<div class="col-md-12 ">
		<div class="blog-entry ftco-animate d-md-flex">
			<c:choose>
				<c:when test="${list.attachNo > 0}">
					<a href="single.html" class="img img-2" style="display: flex; 
			          justify-content: center; align-items: center; width: 244px; height: 244px; background-image: url();">
          <img alt="사진" src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}" style="max-width: 100%; max-height: 100%;"></a>
					
				</c:when>
				<c:otherwise>
					<a href="single.html" class="img img-2" style="background-image: url();"><img alt="사진" src="" style="height: 244 px;">NoImage</a>
				</c:otherwise>
			</c:choose>
			
			<div class="text text-2 pl-md-4">
				<h3 class="mb-2"><a href="/klassDetail?klass_no=${list.klassNo}">${list.klassName}</a></h3>
				<div class="meta-wrap">
					<p class="meta">
						<span><i class="icon-user mr-2"></i>${list.accountNickname}</span>
						<span><a href="single.html"><i class="icon-heart mr-2"></i>좋아요 아이콘 넣기</a></span>
						
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							<span><i class="icon-users mr-2"></i>${klass.klassMax}명(${klass.klassMax - li.klassCount}명)</span>
						</c:forEach>
					</p>
				</div>
				<p class="mb-4">${list.klassTxt }</p>
				<p><a href="/klassDetail?klass_no=${list.klassNo}" class="btn-custom">더 보기..<span class="ion-ios-arrow-forward"></span></a></p>
			</div>
		</div>
	</div>
	<!-- 한 줄 끝! -->
	
	
	
			</c:forEach>
		</c:when>
	</c:choose>
	
	
	
	
	
	
	
	
	
	<%-- <form>
		<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>클래스명</th>			
				<th>닉네임</th>			
				<th>내용</th>			
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty resultList }">
					<c:forEach var="list" varStatus="vs" items="${resultList }">
						<tr data-klass-no="${list.klassNo }">
							<td>${vs.count}</td>
							<td>${list.klassName}</td>
							<td>${list.accountNickname}</td>
							<td>${list.klassTxt }</td>
						</tr>
					</c:forEach>
					
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="4">해당되는 게시글이 존재하지 않습니다.</td>
					</tr>
				
				</c:otherwise>
			
			</c:choose>
		
		</tbody>
		
		</table>
	
	</form> --%>
</div>	

	<form>
		<p>페이징 위치(중앙 정렬 할거임)</p>
	</form>
	
	<form action="/klassBoardList" id="searchKlassList" method="post">
			<select name="search_type" id="search_type">
				<option value="0">선택</option>			
				<option value="1">클래스명</option>			
				<option value="2">닉네임</option>			
				<option value="3">내용</option>			
			</select>
			<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
			<button name="searchBtn" id="searchBtn">검색</button>
	</form>
	
	
	
	
	
	
					</div>
				</div>
			</div>
		</div>
	</section>	
</div>
	<script>
		const orderType = document.getElementById('order_type');
		orderType.onchange = function(){
			document.getElementById('arrangeKlass').submit();
		}
	</script>
<!-- 	<script>
		$('.klass_list tbody tr').click(function(){
			const klassNo = $(this).data('klass-no');
			location.href='/klassDetail?klass_no='+klassNo;
		})
	
	</script>	 -->
<%@ include file="/views/include/nav.jsp" %>
</body>
</html>