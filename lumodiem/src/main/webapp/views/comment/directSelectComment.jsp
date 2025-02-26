<%@page import="com.lumodiem.board.memberboard.vo.ReviewCmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% ReviewCmt cmt = (ReviewCmt)request.getAttribute("cmt"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>test</h1>
	<section>
		<div>
			<%-- <table update_comment_>
				<tr>
					<td>${cmt.reviewCmtNo }</td>
					<td>${cmt.accountNo }</td>
					<td>${cmt.reviewNo }</td>
					<td><input id="change" value="${cmt.reviewCmtTxt }"></td>
					<td><button type='button' onclick="updateComment();">수정</button></td>
				</tr>
			</table> --%>
			
			<div class="update_comment_form">
				<form action='updateReviewComment' name="update_comment_form" method="post">
					<input name="review_comment_txt" value="${cmt.reviewCmtTxt }">
					<input type="button" value="수정" onclick="updateComment();">
				</form>
			</div>
			
		</div>
	</section>
	<script type="text/javascript">
		const updateComment = function() {
			const form = document.update_comment_form;
			$.ajax({
				url : "/updateReviewComment",
				type : "post",
				data : {"review_cmt_txt":form.review_comment_txt
						},
				dataType : "JSON",
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				
				}
			});
		}
	</script>
</body>
</html>