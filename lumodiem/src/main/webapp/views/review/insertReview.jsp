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
	<div class="crate_review_form">
		<form action="<c:url value='/insertReviewPageEnd'/>" method="post">	
			<fieldset>
				<legend>리뷰 작성</legend>
				<label for="klass_name">게시글 제목 : </label>
				<input type="text" name="klass_name" id="klass_name" placeholder="제목을 입력하세요."><br>
				<label for="chat_txt">내용 : </label><br>
				<textarea name="klass_txt" id="klass_txt"  placeholder="내용을 입력하세요."></textarea>
				<input type="file" name="res_file" accept=".png,.jpg,.jpeg"><br>
				<button onclick="createReviewForm();">작성하기</button>
			</fieldset>
		</form>	
	</div>		
<script>
	const createReviewForm = function(){
		let form = document.crate_review_form;
		if(!form.klass_name.value){
			alert("게시글 제목을 입력하세요.");
			form.klass_name.focus();
		}else if(!form.klass_txt.value){
			alert("내용을 입력하세요.")
			form.chat_txt.focus();
		}else if(!form.res_file.value){
			const val = form.res_file.value;
			const idx = val.lastIndex('.');
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
						} else{
							location.href="/";
						}
					}
				})
			}
		}
	}
</script>
</body>
</html>