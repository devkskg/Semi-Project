<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여 클래스 조회</title>
<style>
    .list-group-item a {
        color: #000 !important;  /* 글자 색상 검은색 강제 변경 */
        text-decoration: none;   /* 링크 밑줄 제거 */
    }

    h3.text-primary {
        color: #000 !important;  /* "마이페이지" 글자 검은색 */
    }

    .list-group-item {
        border-bottom: 1px solid #ddd; /* 밑줄 추가 */
        display: flex;
        align-items: center; /* 세로 정렬 */
    }

    .list-group-item .badge {
        margin-left: auto; /* "+" 기호만 우측 정렬 */
    }

    .clickable-row:hover {
	    background-color: #E8F7DC; /* 마우스 오버 시 색상 변경 */
	    cursor: pointer;           /* 커서를 포인터로 변경 */
	}
    a.btn-outline-danger {
	    background-color: #F1948A !important;  /* 배경색 강제 적용 */
	    color: #fff !important;                /* 글자 색상 강제 적용 */
	    border: none;                          /* 부트스트랩의 기본 테두리 제거 */
	}
    a.btn-outline-primary {
	    background-color: #E8DAEF !important;  /* 배경색 강제 적용 */
	    color: #4A235A !important;                /* 글자 색상 강제 적용 */
	    border: none;                          /* 부트스트랩의 기본 테두리 제거 */
	}
	.mypage-box {
	    /* background-color: #FFFFEF; */  /* 연한 살구색 */
	    border: 1px solid #E6B0AA;  /* 은은한 로즈 컬러 테두리 */
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
	}

	
	    
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp"%>















	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
				        <div class="mypage-box" style="max-width: 100%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">
									수강 예정 클래스
				            </h3>
							<ul class="list-group mb-4">
							    
								<li class="list-group-item" style="background-color: #F8FFEF;">
								    <table style="width: 100%; border-collapse: collapse; text-align: center;">
								    	<tbody>
								        <tr style="border-bottom: 1px solid #ddd; background-color: #E8F7DC; width: 100%; border-collapse: separate; border-spacing: 0 5px; text-align: center; border: 1px solid #ddd;">
								        	<th>No.</th>
								        	<th>클래스명</th>
								        	<th>닉네임</th>
								        	<th>날짜</th>
								        	<th>장소</th>
								        </tr>
											<c:choose>
												<c:when test="${not empty afterKlassList }">
													<c:forEach var="list1" varStatus="vs" items="${afterKlassList }">
								       					<tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/klassDetail?klass_no=${list1.klassNo}'/>" style="cursor: pointer;">
								       						 
															<td>${vs.count}</td>
															<td>${list1.klassName}</td>
															<td>${list1.accountNickname}</td>
															<td>
															    <c:if test="${not empty list1.klassStart}">
															        ${fn:substring(list1.klassStart, 0, 10)}
															    </c:if>
														    </td>
															<td>${list1.klassAddress }</td>
															
												        </tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<td colspan="5">수강 예정 클래스가 없습니다.</td>
												</c:otherwise>
											</c:choose>							        
								        </tbody>
								    </table>
								</li>
							</ul>
				        </div>
				    </div>
		    	</div>
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
				        <div class="mypage-box" style="max-width: 100%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">
									수강 완료 클래스
				            </h3>
							<ul class="list-group mb-4">
							    
								<li class="list-group-item" style="background-color: #F8FFEF;">
								    <table style="width: 100%; border-collapse: collapse; text-align: center;">
								    	<tbody>
								        <tr style="border-bottom: 1px solid #ddd; background-color: #E8F7DC; width: 100%; border-collapse: separate; border-spacing: 0 5px; text-align: center; border: 1px solid #ddd;">
								        	<th>No.</th>
								        	<th>클래스명</th>
								        	<th>닉네임</th>
								        	<th>날짜</th>
								        	<th>장소</th>
								        </tr>
											<c:choose>
												<c:when test="${not empty beforeKlassList }">
													<c:forEach var="list2" varStatus="vs" items="${beforeKlassList }">
								       					<tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/klassDetail?klass_no=${list2.klassNo}'/>" style="cursor: pointer;">
								       						 
															<td>${vs.count}</td>
															<td>${list2.klassName}</td>
															<td>${list2.accountNickname}</td>
															<td>
															    <c:if test="${not empty list2.klassStart}">
															        ${fn:substring(list2.klassStart, 0, 10)}
															    </c:if>
														    </td>
															<td>${list2.klassAddress }</td>
															
												        </tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="5">
														수강 완료 클래스가 없습니다.
														</td>
													</tr>
												</c:otherwise>
											</c:choose>							        
								        </tbody>
								    </table>
								</li>
							</ul>
				        </div>
				    </div>
		    	</div>
		    	
		    	
		    	
		    	
		    </div>
	    </section>
    </div>


	<script>
	    document.querySelectorAll('.clickable-row').forEach(row => {
	        row.addEventListener('click', function() {
	            const url = row.getAttribute('data-url');
	            if (url) {
	                window.location.href = url;
	            }
	        });
	        
	    });
	</script>



























</body>
</html>