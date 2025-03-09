<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 조회</title>
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js"></script>
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

</style>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>	

	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
	<!-- 페이지 제목  -->
	<h3 style="text-align: center; margin-bottom: 20px;">신고된 클래스 목록</h3>		
	<!-- 선택 / 검색하기 -->		
	<div style="text-align: center; margin-top: 20px;">					
		<form action="<c:url value='/reportKlass'/>" id="search_report_klass" method="post"
				class="inline-form-group"
                 style="display: inline-flex;">
				<select name="search_type" id="search_type">
					<option value="0">선택</option>			
					<option value="1">제목</option>			
					<option value="2">닉네임</option>			
					<option value="3">내용</option>			
				</select>
				<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
				<button name="searchBtn" id="searchBtn" style="border-radius: 6px;">검색</button>
		</form>
	</div>	
	
	<!-- 신고된 클래스 목록 출력 부분 -->	
	<div class="report_klass_list" style="width: 100%; max-width: 100%; margin: 20px auto; 
                        border: 1px solid #ddd; border-radius: 10px; padding: 10px;">
		<form>
			<table class="report_klass_list" style="
                    width: 100%;
                    border-collapse: separate;
                    border-spacing: 0 5px;
                    text-align: center;
                    border: 1px solid #ddd;">
				
				<thead style="border-bottom: 2px solid #aaa; background-color: #D1B5E0;">
					<tr style="border-bottom: 1px solid #ddd; text-align: center;">
						<th style="width: 300px; padding: 8px; text-align: center;">클래스명</th>			
						<!-- <th style="width: 200px; padding: 8px; text-align: center;">내용</th>	 -->	
						<th style="width: 100px; padding: 8px; text-align: center;">닉네임</th>			
						<th style="width: 60px; padding: 8px; text-align: center;">신고 사유</th>	
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty resultList }">
							<c:forEach var="list" varStatus="vs" items="${resultList }">
								<tr data-klass-no="${list.klassNo }" style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
									<td style="padding: 8px;">${list.klassName}</td>
									<%-- <td style="padding: 8px;">${list.klassTxt }</td> --%>									<td style="padding: 8px;">${list.accountNickname}</td>
									<td style="padding: 8px;">${list.reportKlassTxt }</td>
								</tr>
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr style="background-color: #E8DAEF; border-bottom: 1px solid #ddd;">
								<td colspan="3">해당되는 게시글이 존재하지 않습니다.</td>
							</tr>
						
						</c:otherwise>
					
					</c:choose>
				</tbody>
			</table>
		</form>
	</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
	
	$('.report_klass_list tbody tr').click(function(){
		const klassNo = $(this).data('klass-no');
		if(klassNo!=undefined){
			location.href='/klassDetail?klass_no='+klassNo;
		}else{
			location.reload();
		}
		
	})

 	</script>
</body>
</html>