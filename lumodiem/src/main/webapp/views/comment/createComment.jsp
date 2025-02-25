<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 댓글</title>
</head>
<body>
	<form action="<c:url value='/createcmt'/>" method="post">
		<input type="hidden" name="account_no" value="<c:out value='${vo.accountNo}'/>">
		<input type="text" name="revview_cmt_txt" value="<c:out value='${vo.reviewCmtTxt }'/>" placeholder="내용을 입력하세요.">
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>

	<!-- <div class="review_cmt">
 		<form action="/createComment" name="review_cmt" method="post">
 			<input type="text" name="review_cmt_txt" placeholder="내용을 입력하세요">
 			<button type="button" onclick="();">등록</button>
 			<input type="reset" value="취소">
 		</form>
 	</div>
 	<script type="text/javascript">
 		const uploadComment = function() {
			let form = document.review_cmt;
			if(!form.review_cmt_txt.value){
				alert("내용을 입력하세요.");
				form.review_cmt_txt.focus();
			}
		}
 	</script> -->
 	
</body>
</html>