<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
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
    a.btn-outline-danger {
	    background-color: #F1948A !important;  /* 배경색 강제 적용 */
	    color: #fff !important;                /* 글자 색상 강제 적용 */
	    border: none;                          /* 부트스트랩의 기본 테두리 제거 */
	}
    a.btn-outline-primary {
	    background-color: #E8DAEF !important;  /* 배경색 강제 적용 */
	    color: #4A235A !important;                /* 글자 색상 강제 적용 */
	    border: none;                          /* 부트스트랩의 기본 테두리 제거 */
	}
	.mypage-box {
	    background-color: #FFFFEF;  /* 연한 살구색 */
	    border: 1px solid #E6B0AA;  /* 은은한 로즈 컬러 테두리 */
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
	}

	
	    
</style>
</head>
<body>
	<%@ include file="/views/include/nav.jsp" %>
	
	
	
<%-- 	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<form action="/resetPwSetPw" id="resetPw_form" name="resetPw_form" method="post">
								<c:choose>
									<c:when test="${not empty searchIdResetPw }">
										<label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text" required value="${searchIdResetPw }"><br>
									</c:when>
									<c:otherwise>
										<label for="account_id">아이디 : </label><input name="account_id" id="account_id" type="text" required><br>
									</c:otherwise>
								</c:choose>
								<label for="account_ssn">주민등록번호 : </label><input name="account_ssn" id="account_ssn" type="text" required>
								<button type="button" id="searchBtn">다음</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div> --%>
	<div id="colorlib-main">
	    <section class="ftco-section ftco-no-pt ftco-no-pb">
	        <div class="container">
	            <div class="row d-flex">
	                <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
	                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
	                        <h3 class="text-primary text-center mb-4">비밀번호 재설정</h3>
	                        <form action="/resetPwSetPw" id="resetPw_form" name="resetPw_form" method="post">
	                            <div style="margin-bottom: 10px;">
	                                <label for="account_id">아이디 :</label>
	                                <c:choose>
	                                    <c:when test="${not empty searchIdResetPw}">
	                                        <input name="account_id" id="account_id" type="text" required value="${searchIdResetPw}"
	                                               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                                    </c:when>
	                                    <c:otherwise>
	                                        <input name="account_id" id="account_id" type="text" required
	                                               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                                    </c:otherwise>
	                                </c:choose>
	                            </div>
	                            <div style="margin-bottom: 10px;">
	                                <label for="account_ssn">주민등록번호 :</label>
	                                <input name="account_ssn" id="account_ssn" type="text" required
	                                       style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
	                            </div>
	                            <div class="d-flex justify-content-between mt-4">
	                                <button id="searchBtn" class="btn btn-outline-primary" style="width: 48%;">다음</button>
	                                <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	
	
	
	
	
	
	
	
	<script>
		$(function(){
			const form = document.resetPw_form;
			$('#searchBtn').click(function(){
				if(!form.account_id.value){
					alert("아이디를 입력하세요.")
					form.account_id.focus();
				} else if(!form.account_ssn.value){
					alert("주민등록번호를 입력하세요.")
					form.account_ssn.focus();
				}
			});
			
			/* 있어야 할 필요가 있을까? */
			/* 주민등록번호 정규식 검사 */
			/* let ssnBoolean = false;
			$('#account_ssn').keyup(function(){
				let ssnInput = form.account_ssn.value;
				let ssnReg = /^(?:[0-9]{2})((01|03|05|07|08|10|12)(0[1-9]|[12][0-9]|3[01])|(04|06|09|11)(0[1-9]|[12][0-9]|30)|(02)(0[1-9]|1[0-9]|2[0-8]|29))[1-4][0-9]{6}$/;
				if(ssnReg.test(ssnInput)){
					$('#account_ssn').css('backgroundColor', '#98FB98');
					ssnBoolean = true;
				} else{
					$('#account_ssn').css('backgroundColor', '#FF9999');
					ssnBoolean = false;
				}
			});
			
			$('#searchBtn').click(function(){
				if(ssnBoolean){
					form.submit();
				} else{
					alert('올바른 주민등록번호를 입력해주세요.');
				}
			}); */
		})
	</script>
</body>
</html>