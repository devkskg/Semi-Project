<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	
	
	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<form action="" id="searchId_form" name="searchId_form">
								<label for="account_name">이름 : </label><input name="account_name" id="account_name" type="text"><br>
								<label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text">
								<button type="button" id="searchBtn">아이디 찾기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<script type="text/javascript">
		$(function(){
			const form = document.searchId_form;
			$('#searchBtn').click(function(){
				if(!form.account_name.value){
					alert("이름을 입력하세요.")
					form.account_name.focus();
				} else if(!form.account_ssn.value){
					alert("주민등록번호를 입력하세요.")
					form.account_ssn.focus();
				} else{
					$.ajax({
						url : "/searchIdEnd",
						type : "post",
						data : {
							"account_name" : form.account_name.value,
							"account_ssn" : form.account_ssn.value,
						},
						dataType : "JSON",
						contentType: "application/x-www-form-urlencoded; charset=UTF-8",
						success : function(data){
							if(data.res_code == "200"){
								location.href="/searchIdSuccess";
							} else{
								alert('일치하는 회원이 없습니다.');
							}
						}
					});
				}
			});
		})
	</script>
</body>
</html>