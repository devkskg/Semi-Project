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
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>	

	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
						
		<form action="<c:url value='/reportReviewCmt'/>" id="search_report_klass" method="post">
				<select name="search_type" id="search_type">
					<option value="0">선택</option>			
					<option value="1">제목</option>			
					<option value="2">닉네임</option>			
					<option value="3">내용</option>			
				</select>
				<input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
				<button name="searchBtn" id="searchBtn">검색</button>
		</form>
	<form>
		<div class="report_review_cmt_list">
			<table border="1">
				<thead>
					<tr>
						<th>리뷰이름</th>			
						<th>내용</th>			
						<th>닉네임</th>			
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty resultList }">
							<c:forEach var="list" varStatus="vs" items="${resultList }">
								<tr>
									<%-- <td>${list.reviewName}</td> --%>
									<td>${list.reviewCmtTxt}</td>
									<td>${list.accountNickname }</td>
									<td><button type='button' data-report-review-cmt-no="${list.reportReviewCmtNo }">삭제</button></td>
								</tr>
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="3">해당되는 게시글이 존재하지 않습니다.</td>
							</tr>
						
						</c:otherwise>
					
					</c:choose>
				</tbody>
			</table>
		</div>
	</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script>
		
 		 
 		 $('.report_review_cmt_list tbody button').click(function(){
 			if(confirm("삭제하시겠습니까?")){
 				const ReportReviewCmtNo = $(this).data('report-review-cmt-no');
				
 				
 			$.ajax({
				url : "/deleteReportReviewCmt",
				type : "post",
				data : {"report_review_cmt_no":ReportReviewCmtNo},
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				
				success:function(data){
					alert(data.res_msg);
					
					if(data.res_code==200){
						location.href="";
					}
				}
			});
 			}else{
 				
 			}
 		});  
 		
 	</script>
</body>
</html>