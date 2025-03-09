<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 댓글 조회</title>
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
    
    
    
    
    
	table {
	    border: 1px solid #ddd !important;
	    border-spacing: 0 10px !important; /* 간격을 더 넓게 조정 */
	    border-collapse: separate !important; 
	}
	th{
		padding: 8px !important;
	}
	
	td{
		padding: 8px !important;
	}
	tr{
		background-color: #E8DAEF;
		font-weight: bold; 
		
	}
	
	tr:first-child{
		background-color: #D1B5E0;
	}

    .clickable-row:hover {
	    background-color: #D1B5E0; /* 마우스 오버 시 색상 변경 */
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
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
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
				        <div class="mypage-box" style="max-width: 80%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">
									작성한 댓글 목록
				            </h3>
							<ul class="list-group mb-4">
							    
								<li class="list-group-item">
								    <table style="width: 100%; border-collapse: collapse; text-align: center;">
								    	<tbody>
								        <tr style="border-bottom: 1px solid #ddd; width: 100%; border-collapse: separate; border-spacing: 0 5px; text-align: center; border: 1px solid #ddd;">
								        	<th>No.</th>
								        	<th>댓글명</th>
								        </tr>
											<c:choose>
												<c:when test="${not empty reviewCmtList }">
													<c:forEach var="list1" varStatus="vs" items="${reviewCmtList }">
								       					<tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/reviewDetail?review_no=${list1.reviewNo}'/>" style="cursor: pointer;">
								       					
															<td>${vs.count}</td>
															<td>${list1.reviewCmtTxt}</td>
															
												        </tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="2">작성한 댓글이 없습니다.</td>
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