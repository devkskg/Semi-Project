<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 수정 페이지</title>
</head>
<body>
<div>
	<form action="<c:url value='/updateReviewEnd'/>" method="post">
		<fieldset>
			<legend>리뷰 수정</legend>
			<input type="hidden" value="${account.accountNo}" name="account.accountNo">
			<label for="review_name">게시글 제목 : </label>
			<input type="text" name="review_name" id="review_name" placeholder="수정하실 제목을 입력하세요."><br>
			<label for="review_txt">내용 : </label><br>
			<textarea name="review_txt" id="review_txt"  placeholder="수정하실 내용을 입력하세요."></textarea>
			<input type="file" name="res_file" accept=".png,.jpg,.jpeg"><br>
			<button type="button" onclick="createReviewForm();">수정하기</button>
		</fieldset>
	</form>
	<script>
	const createReviewForm = function(){
		let form = document.create_review_form;
		if(!form.review_name.value){
			alert("게시글 제목을 입력하세요.");
			form.review_name.focus();
		}else if(!form.review_txt.value){
			alert("내용을 입력하세요.")
			form.review_txt.focus();
		}else if(!form.res_file.value){
		}else{
			const val = form.res_file.value;
			const idx = val.lastIndexOf('.');
			const type = val.substring(idx+1,val.length);
			if(type == 'jpg' || type == 'png' || type == 'jpeg'){
				const sendData = new FormData(form);
				$.ajax({
					url:'/updateReviewEnd',
					type:'post',
					enctype:"multipart/form-data",
					cache:false,
					async:false,
					contentType:false,
					processData:false,
					data:sendData,
					dataType:'json',
					success:function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/";
						} 
					}
				})
			}else{
				alert('이미지 파일만 선택할 수 있습니다.')
				form.res_file.value = '';
			}
		}
	}
</script>
</div>
</body>
</html>