<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 조회 성공</title>
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
    .btn-outline-danger {
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
<%-- 	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							<div>
								"${searchAccount.accountName }"님의 아이디를 조회합니다.<br>
								아이디 : "${searchAccount.accountId }"<br>
								로그인 페이지로 이동하시겠습니까?<br>
								<form action='<c:url value="/login" />' method="post">
									<input type="hidden" value="${searchAccount.accountId }" name="searchIdLogin">
									<button>로그인</button>
								</form>
								
								<form action='<c:url value="/resetPw" />' method="post">
									<input type="hidden" value="${searchAccount.accountId }" name="searchIdResetPw">
									<button>비밀번호 재설정</button>
								</form>
							</div>
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
	                    <div class="mypage-box text-center" style="max-width: 500px; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);">
	                        <h3 class="text-primary text-center mb-4">아이디 찾기 성공</h3>
	                        <p class="text-center" style="margin-bottom: 20px;">
	                            "<strong>${searchAccount.accountName}</strong>"님의 아이디는 다음과 같습니다.<br>
	                            아이디 : "<strong>${searchAccount.accountId}</strong>"<br>
	                            로그인 페이지로 이동하시겠습니까?
	                        </p>
	                        <div class="d-flex justify-content-between">
	                            <form action="/login" method="post" style="width: 48%;">
	                                <input type="hidden" value="${searchAccount.accountId}" name="searchIdLogin">
	                                <button class="btn btn-outline-primary" style="width: 100%;">로그인</button>
	                            </form>
	                            <form action="/resetPw" method="post" style="width: 48%;">
	                                <input type="hidden" value="${searchAccount.accountId}" name="searchIdResetPw">
	                                <button class="btn btn-outline-danger" style="width: 100%;">비밀번호 재설정</button>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	
</body>
</html>