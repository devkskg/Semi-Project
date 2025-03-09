<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
</head>
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
<body>
	<%@ include file="/views/include/nav.jsp" %>




	<%-- <div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
					<div class="col-xl-8 py-5 px-md-5">
						<div class="row pt-md-4">
							일치하는 회원 정보가 없습니다.<br>
							아이디와 비밀번호를 확인해주세요.<br>
						</div>
						<div class="row pt-md-4">
							<a href='<c:url value="/login" />' id="loginBtn"><button>로그인 하러 가기</button></a>
							<a href='<c:url value="/searchId" />' id="searchIdBtn"><button>아이디 찾기</button></a>
							<a href='<c:url value="/" />'><button>홈페이지</button></a>
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
	                    <div class="mypage-box" style="max-width: 500px; margin: 0 auto;">
	                        <h3 class="text-primary text-center mb-4">알림</h3>
	                        <p class="text-center" style="margin-bottom: 20px;">일치하는 회원 정보가 없습니다.<br>아이디와 비밀번호를 확인해주세요.</p>
	
	                        <div class="d-flex justify-content-between mt-4">
	                            <a href="/login" id="loginBtn" class="btn btn-outline-primary" style="width: 30%;">로그인</a>
	                            <a href="/searchId" id="searchIdBtn" class="btn btn-outline-primary" style="width: 30%;">아이디 찾기</a>
	                            <a href="/" class="btn btn-outline-danger" style="width: 30%;">홈페이지</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>