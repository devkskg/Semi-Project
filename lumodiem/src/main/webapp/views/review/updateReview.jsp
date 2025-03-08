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
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
</head>
<body>
<div>
<%@ include file="/views/include/nav.jsp" %>
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
				
	<form action="<c:url value='/updateReviewEnd'/>" method="post" name="update_review_form" enctype="multipart/form-data">
		<fieldset>
			<legend>리뷰 수정</legend>
			<input type="hidden" name="review_no" value="${review.reviewNo}">
			<input type="hidden" name="account_no" value="${account.accountNo}">
			
			<label for="review_name">게시글 제목 : </label>
			<input type="text" name="review_name" id="review_name" required value="<c:out value='${review.reviewName}'/>"  style="width : 600px;"><br>
			
			<label>작성자 : </label>
			<input type="text" name="nickName" id="nickName" readonly value="${review.accountNickname}"  style="width : 600px;"><br>
			
			<textarea name="review_txt" id="review_txt"  placeholder="수정하실 내용을 입력하세요."><c:out value='${review.reviewTxt }'/></textarea><br>
			
			<input type="file" name="res_file" accept=".png,.jpg,.jpeg"><br>
			<button type="button" id="updateBtn">수정하기</button>
		</fieldset>
	</form>
				</div>
			</div>
		</div>
	</section>
</div>	
	<script>
	$(function(){
		const form = document.update_review_form;
		$('#updateBtn').click(function(){
			const check =  confirm("등록하시겠습니까?");
			
			if(!form.review_name.value){
				alert("게시글 제목을 입력하세요.");
				form.review_name.focus();
			}else if(!form.review_txt.value){
				alert("내용을 입력하세요.");
				form.review_txt.focus();
			}else{
				if(check){
					
					const val = form.res_file.value;
					const idx = val.lastIndexOf('.');
					const type = val.substring(idx+1,val.length);
					if(val){
						if(type == 'jpg' || type == 'png' || type == 'jpeg'){
							let sendData = new FormData(form);
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
										location.href="/reviewBoard";
									} 
								}
							})
						}else{
							alert('이미지 파일만 선택할 수 있습니다.')
							form.res_file.value = '';
						}
						
					}else{
						let sendData = new FormData(form);
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
									location.href="/reviewBoard";
								} 
							}
						})
					}
					
				}
				
			}
			
			
		});
	
		// summernote 동작
		$('#review_txt').summernote({
			  width: 800,           // 가로 크기
		      height: 400,          // 높이 설정
		      placeholder: '내용을 입력해주세요...',  // 플레이스홀더(기본 안내 문구)
		      focus: true,          // 초기 로딩 후 편집 영역에 커서 포커스
		      lang: 'ko-KR',        // 한국어 설정 (lang 파일 필요)
		      toolbar: [
		        // 툴바 그룹/버튼 구성
		        ['groupName', ['list of button']],
		        ['insert', ['picture']],
		        ['style', ['fontname']],
		        ['fontname', ['fontname']],
		        ['font', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
		        ['color', ['color', 'backcolor']],
		        ['para', ['ul', 'ol', 'paragraph']],
		        ['height', ['height']],
		        ['view', ['fullscreen', 'codeview', 'help']]
		      ]
			});
		
		
		
	});
	
/* 	
	
	const updateReviewForm = function(){
		let form = document.update_review_form;
	} */
</script>
</div>


</body>
</html>