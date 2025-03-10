<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style>
    .list-group-item a {
        color: #000 !important;  /* 글자 색상 검은색 강제 변경 */
        text-decoration: none;   /* 링크 밑줄 제거 */
    }

    h3.text-primary {
        color: #000 !important;  /* "마이페이지" 글자 검은색 */
    }

    .list-group-item {
        border-bottom: 1px solid #ddd; /* 밑줄 추가 */
        display: flex;
        align-items: center; /* 세로 정렬 */
    }

    .list-group-item .badge {
        margin-left: auto; /* "+" 기호만 우측 정렬 */
    }

    .clickable-row:hover {
	    background-color: #E8F7DC; /* 마우스 오버 시 색상 변경 */
	    cursor: pointer;           /* 커서를 포인터로 변경 */
	}
	.mypage-box {
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
	}
    a.btn-outline-danger {
	    background-color: #F0F2EF !important;  /* 배경색 강제 적용 */
	    color: #000000 !important;                /* 글자 색상 강제 적용 */
	    border: 1px solid #ccc !important;                  /* 부트스트랩의 기본 테두리 제거 */
	}
	.btn-outline-primary {
	    color: #ffffff !important;
	    border: solid thin !important;
	    border-color: #D1B5E0 !important;
	    background-color: #D1B5E0 !important;
	    
	}
	div a{
		color: #724AA9;
	}
	div a:hover{
		color: #724AA9;
	}

	
	    
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	
	
<!-- 	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<form action="/searchIdEnd" id="searchId_form" name="searchId_form" method="post">
								<label for="account_name">이름 : </label><input name="account_name" id="account_name" type="text" required><br>
								<label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text" required>
								<button type="submit" id="searchBtn">아이디 찾기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div> -->
	<div id="colorlib-main">
	    <section class="ftco-section ftco-no-pt ftco-no-pb">
	        <div class="container">
	            <div class="row d-flex">
	                <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
	                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
	                        <h3 class="text-primary text-center mb-4">아이디 찾기</h3>
	                        <form action="/searchIdEnd" id="searchId_form" name="searchId_form" method="post">
	                            <div style="margin-bottom: 10px;">
	                                <label for="account_name">이름 :</label>
	                                <input name="account_name" id="account_name" type="text" required
	                                       style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                            </div>
	                            <div style="margin-bottom: 10px;">
	                                <label for="account_ssn">주민등록번호 :</label>
	                                <input name="account_ssn" id="account_ssn" type="text" required
	                                       style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                            </div>
	                            <div class="d-flex justify-content-between mt-4">
	                                <button type="submit" id="searchBtn" class="btn btn-outline-primary" style="width: 48%;">아이디 찾기</button>
	                                <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
	                            </div>
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
				}
			});
			
			/* $('#searchBtn').click(function(){
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
			}); */
		})
	</script>
</body>
</html>