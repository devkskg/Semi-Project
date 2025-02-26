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
			<table>
				<tr>
					<td>${r.reviewCmtNo }</td>
					<td>${r.accountNo }</td>
					<td>${r.reviewNo }</td>
					<td>${r.reviewCmtTxt }</td>
					<td><button type='button' data-comment-no="${r.reviewCmtNo }">버튼</button></td>
				</tr>
			</table>
			
			<div>
				<a href="">수정</a>
				<a>삭제</a>
			</div>
		</div>
		
	
	</section>
</body>
</html>