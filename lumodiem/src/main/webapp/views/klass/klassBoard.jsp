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
<style>
	.btn-custom {
	  text-decoration: none; /* 밑줄 제거 */
	  color: gray;           /* 회색 텍스트 */
	}

/* 마우스 올렸을 때 (선택 사항) */
	.btn-custom:hover {
	  text-decoration: none;
	  color: #666; /* 조금 진한 회색 등 */
	}
	
	 .btn-pastel {
     
      color: #333;
      padding: 8px 16px;
      border-radius: 12px; /* 둥글기 정도 조절 */
      cursor: pointer;
      transition: background-color 0.2s ease;
      margin-right: 8px; /* 버튼 간격 */
      font-weight: 600;
      padding: 6px 16px;
      cursor: pointer;
      text-shadow: 0 1px 0 rgba(255,255,255,0.8),
                   0 1px 2px rgba(0,0,0,0.2);
      box-shadow: 0 2px 4px rgba(0,0,0,0.2);
      transition: all 0.2s ease;
      margin: 5px;
    }
    .btn-pastel:hover {
      filter: brightness(95%); /* 살짝 어둡게 */
       box-shadow: 0 4px 6px rgba(0,0,0,0.25);
    }
    .btn-pastel:active {
   	 transform: translateY(2px);
      box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
    
    .select-rounded {
      /* 브라우저 기본 화살표 제거 (선택 사항) */
      appearance: none;         /* 표준 */
      -webkit-appearance: none; /* 사파리 등 웹킷 */

      /* 배경: 하얀색, 글자: 차콜색 */
      background-color: #ffffff;
      color: #2c3e50;

      /* 테두리: 차콜색 or 연한 차콜 */
      border: 1px solid #2c3e50;
      border-radius: 12px;

      /* 안쪽 여백 + 크기 조절 */
      padding: 6px 12px;
      cursor: pointer;

      /* 약간의 입체감(그림자) 주고 싶다면 */
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);

      /* 폰트 크기/굵기 (필요 시 조정) */
      font-size: 14px;
      font-weight: 500;

      /* 부드러운 전환 효과 */
      transition: all 0.2s ease;
    }

    /* 호버 시 배경 살짝 변화 */
    .select-rounded:hover {
      background-color: #f9f9f9; /* 살짝 더 밝게 */
    }

    /* 포커스 시 외곽선 대신 그림자 강조 */
    .select-rounded:focus {
      outline: none; /* 기본 파란 라인 제거 */
      box-shadow: 0 0 4px rgba(44,62,80,0.3); /* 차콜색 그림자 */
    }

    /* 만약 화살표 아이콘 직접 넣고 싶으면
       background-image: url('data:image/svg+xml;base64,...');
       background-position: right 8px center;
       background-size: 16px 16px;
       background-repeat: no-repeat;
       padding-right: 30px; 
       등등 추가 */
</style>
<body>


	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">	
						<div class="row pt-md-4">
<div class="klass_list">
	<form action="/klassBoardList" id="arrangeKlass" name="arrangeKlass" 
			style="display: flex; justify-content: space-between; align-items: center;">
		<select name="order_type" id="order_type" class="select-rounded">
			<option value="x">정렬하기</option>
			<option value="a">최신순</option>
			<option value="b">오래된순</option>
			<option value="c">좋아요순</option>
		</select>
		<c:choose>
			<c:when test="${account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
				 <button type="button" id="insertBtn" name="insertBtn"
              		onclick="location.href='/klassBoardCreate'" class="btn-pastel" 
              		style="background-color: #FFD1DC; background: linear-gradient(to bottom, #FFD1DC, #F9BFCB);
              		border: 1px solid #F9BFCB; color: #444444; font-weight: 700;">
		        	작성하기
		      	</button>
			</c:when>
			
		</c:choose>
	</form>


		<form>
	</form>
	
	
	<c:choose>
		<c:when test="${not empty resultList }">
			<c:forEach var="list" varStatus="vs" items="${resultList }">
		
	<!-- (게시판 작성할때 한 줄이라고 생각 하면 됨!) -->
	<div class="col-md-12 ">
		<div class="blog-entry ftco-animate d-md-flex">
			<c:choose>
				<c:when test="${list.attachNo > 0}">
					<a href="/klassDetail?klass_no=${list.klassNo}" class="img img-2" style="display: flex; 
			          justify-content: center; align-items: center; width: 244px; height: 244px; background-image: url();">
          <img alt="사진" src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}" 
          style="max-width: 100%; max-height: 100%;" ></a>
					
				</c:when>
				<c:otherwise>
					<a href="/klassDetail?klass_no=${list.klassNo}" class="img img-2" style="background-image: url();"><img alt="사진" src="" style="height: 244 px;"
					 >NoImage</a>
				</c:otherwise>
			</c:choose>
			
			<div class="text text-2 pl-md-4">
				<h3 class="mb-2"><a href="/klassDetail?klass_no=${list.klassNo}">${list.klassName}</a></h3>
				<div class="meta-wrap">
					<p class="meta">
						<span><i class="icon-user mr-2"></i>${list.accountNickname}</span>
						
						<c:choose>
							<c:when test="${not empty list.dateList }">
								<c:forEach var="d" items="${list.dateList }" varStatus="vs">
									<span><i class="icon-users mr-2"></i>${d.klassCount}명/${list.klassMax}명</span>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<span>없어요 test</span>
							</c:otherwise>
						</c:choose>
						<span><a href="single.html"><i class="icon-heart mr-2" style="color: #FF4848;"></i>${list.klassLikeCount}</a></span>
						
					</p>
				</div>
				<%-- <p class="mb-4">${list.klassTxt }</p> --%>
				<p><a href="/klassDetail?klass_no=${list.klassNo}" class="btn-custom" >더 보기..<span class="ion-ios-arrow-forward"></span></a></p>
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
	
	
	
	<div style="text-align: center; margin-top: 20px;">
		<form action="/klassBoardList" id="searchKlassList" method="post"
			style="display: inline-block;">
				<select name="search_type" id="search_type" class="select-rounded">
					<option value="0">선택</option>			
					<option value="1">클래스명</option>			
					<option value="2">닉네임</option>			
					<option value="3">내용</option>			
				</select>
				<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
				<button name="searchBtn" id="searchBtn" class="btn-pastel" 
					style="background-color: #7AA0CB; background: linear-gradient(to bottom, #8BB4D8, #7AA0CB);
					 border: 1px solid #6b8eb6; color: #444444; font-weight: 700;">
					검색
				</button>
		</form>
	</div>
	
	
	
	
	
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