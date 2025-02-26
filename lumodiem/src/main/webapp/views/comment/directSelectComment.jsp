<%@page import="com.lumodiem.board.memberboard.vo.ReviewCmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ReviewCmt cmt = (ReviewCmt)request.getAttribute("cmt"); %>
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
					<td>sw</td>
					<td>${cmt.reviewCmtTxt }</td>
				</tr>
			</table>
		</div>
	
	
	</section>
</body>
</html>