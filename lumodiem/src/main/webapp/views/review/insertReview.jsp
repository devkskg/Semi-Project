<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>⭐리뷰 게시글 추가⭐</title>
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
</head>
<body>
	<!-- 클래스,
	게시글제목,내용,사진 작성 시 '등록' 버튼 활성화 
	등록 버튼 클릭시 '해당 글을 등록하시겠습니까' 알림창 확인/취소 
	-->
	<div>
		<form action="<c:url value='/insertReviewPageEnd'/>" method="post" name="create_review_form">	
			<fieldset>
				<legend>리뷰 작성</legend>
				<input type="text" style="display:none" value="${account.accountNo}">
				<label for="review_name">게시글 제목 : </label>
				<input type="text" name="review_name" id="review_name" placeholder="제목을 입력하세요."><br>
				<label for="review_txt">내용 : </label><br>
				<textarea name="review_txt" id="review_txt"  placeholder="내용을 입력하세요."></textarea>
				<input type="file" name="res_file" accept=".png,.jpg,.jpeg"><br>
				<button type="button" onclick="createReviewForm();">작성하기</button>
			</fieldset>
		</form>	
	</div>		
<script>
	const createReviewForm = function(){
		let form = document.create_review_form;
		if(!form.review_name.value){
			alert("게시글 제목을 입력하세요.");
			form.review_name.focus();
		}else if(!form.review_txt.value){
			alert("내용을 입력하세요.")
			form.review_txt.focus();
		}else{
			const val = form.res_file.value;
			const idx = val.lastIndexOf('.');
			const type = val.substring(idx+1,val.length);
			if(type == 'jpg' || type == 'png' || type == 'jpeg'){
				const sendData = new FormData(form);
				$.ajax({
					url:'/insertReviewPageEnd',
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
</body>
</html>