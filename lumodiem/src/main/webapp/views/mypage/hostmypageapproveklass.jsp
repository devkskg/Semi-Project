<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${approveCode eq 'A' }">
		<title>승인 완료 클래스</title>
	</c:when>
	<c:when test="${approveCode eq 'S' }">
		<title>승인 대기 클래스</title>
	</c:when>
	<c:when test="${approveCode eq 'D' }">
		<title>반려된 클래스</title>
	</c:when>
</c:choose>
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
	    background-color: #FFFFEF;  /* 연한 살구색 */
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
				            	<c:choose>
									<c:when test="${approveCode eq 'A' }">
										승인 완료 클래스
									</c:when>
									<c:when test="${approveCode eq 'S' }">
										승인 대기 클래스
									</c:when>
									<c:when test="${approveCode eq 'D' }">
										반려된 클래스
									</c:when>
								</c:choose>
				            </h3>
							<ul class="list-group mb-4">
							    
								<li class="list-group-item" style="background-color: #F8FFEF;">
								    <table style="width: 100%; border-collapse: collapse; text-align: center;">
								    	<tbody>
								    	<c:choose>
								    		<c:when test="${approveCode eq 'D'}">
										        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row">
										        	<th>No.</th>
										        	<th>클래스명</th>
										        	<th>닉네임</th>
										        	<th>사유</th>
										        </tr>
								    		</c:when>
								    		<c:otherwise>
										        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row">
										        	<th>No.</th>
										        	<th>클래스명</th>
										        	<th>닉네임</th>
										        </tr>
								    		</c:otherwise>
								    	</c:choose>
								        
											<c:choose>
												<c:when test="${not empty approveList and approveCode eq 'D'}">
													<c:forEach var="list" varStatus="vs" items="${approveList }">
								       					<tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/klassDetail?klass_no=${list.klassNo}'/>" style="cursor: pointer;">
															<td>${vs.count}</td>
															<td>${list.klassName}</td>
															<td>${list.accountNickname}</td>
															<td>${list.approveFb}</td>
												        </tr>
													</c:forEach>
												</c:when>
												<c:when test="${not empty approveList and (approveCode eq 'A' or approveCode eq 'S')}">
													<c:forEach var="list" varStatus="vs" items="${approveList }">
								       					<tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/klassDetail?klass_no=${list.klassNo}'/>" style="cursor: pointer;">
															<td>${vs.count}</td>
															<td>${list.klassName}</td>
															<td>${list.accountNickname}</td>
												        </tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${approveCode eq 'D'}">
															<tr>
																<td colspan="4">해당되는 게시글이 존재하지 않습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<tr>
																<td colspan="3">해당되는 게시글이 존재하지 않습니다.</td>
															</tr>
														</c:otherwise>
													</c:choose>
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