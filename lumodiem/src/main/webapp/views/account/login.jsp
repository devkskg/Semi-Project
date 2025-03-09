<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	
			<%-- <div id="colorlib-main">
				<section class="ftco-section ftco-no-pt ftco-no-pb">
					<div class="container">
						<div class="row d-flex">
							<div class="col-xl-8 py-5 px-md-5">
							
							
							
								<div class="row pt-md-4">
								
									<form action="/loginEnd" method="post">
										<c:choose>
											<c:when test="${not empty searchIdLogin }">
												<label for="login_id">아이디 : </label><input name="login_id" id="login_id" type="text" value="${searchIdLogin }">
											</c:when>
											<c:otherwise>
												<label for="login_id">아이디 : </label><input name="login_id" id="login_id" type="text">
											</c:otherwise>
										</c:choose>
										<label for="login_pw">비밀번호 : </label><input name="login_pw" id="login_pw" type="password">
										<span class="dis" style="vertical-align: middle;"><ion-icon id="openEye" class="eye" name="eye-off-outline" size="large" style=""></span><br>
										<button>로그인하기</button>
									</form>
									
								</div>
								<a href="<c:url value='/searchId'/>">아이디 찾기</a>
								<a href="<c:url value='/resetPw'/>">비밀번호 재설정</a>
								
								
								
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
		                        <form action="/loginEnd" method="post">
		                            <h3 class="text-primary text-center mb-4">로그인</h3>
		                            
            							<c:choose>
										<c:when test="${not empty searchIdLogin }">
											<label for="login_id">아이디 :</label><input name="login_id" id="login_id" type="text" value="${searchIdLogin }" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
										</c:when>
										<c:otherwise>
											<label for="login_id">아이디 :</label><input name="login_id" id="login_id" type="text"" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
										</c:otherwise>
									</c:choose>
		                            
		                            
		
		
		
		
		
		                            <label for="login_pw">비밀번호 :</label>
		                            <div style="position: relative; margin-bottom: 10px;">
		                                <input name="login_pw" id="login_pw" type="password" style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
		                                <span class="dis" style="vertical-align: middle;"><ion-icon id="openEye" class="eye" name="eye-off-outline" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
		                                </ion-icon></span>
		                            </div>
		
		                            <div class="d-flex justify-content-between mt-4">
		                                <button type="submit" class="btn btn-outline-primary" style="width: 48%;">로그인하기</button>
		                                <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
		                            </div>
		                        </form>
		                        <div class="mt-3 text-center">
		                            <a href="/searchId">아이디 찾기</a>
		                            <span> | </span>
		                            <a href="/resetPw">비밀번호 재설정</a>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </section>
		</div>
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
	
	
	<%-- <div id="colorlib-main">	
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
						<div class="mypage-box" style="max-width: 500px; margin: 0 auto;">
						    <form name="update_member_form" action="">
						        <h3 class="text-primary text-center mb-4">회원 정보 수정</h3>
						
						        <label for="account_pw">새로운 비밀번호 :</label>
						        <div style="position: relative; margin-bottom: 10px;">
						            <input name="account_pw" id="account_pw" type="password" 
						                   style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
						            <ion-icon id="openEye" class="eye" name="eye-off-outline" 
						                      style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
						            </ion-icon>
						        </div>
						
						        <label for="account_pw_check">비밀번호 확인 :</label>
						        <input name="account_pw_check" id="account_pw_check" type="password" 
						               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
						
						        <label for="account_nickname">닉네임 :</label>
						        <div style="display: flex; margin-bottom: 10px;">
						            <input name="account_nickname" id="account_nickname" type="text"
						                   value="${account.accountNickname}" 
						                   style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
						            <button type="button" id="duplicate_nickname" 
						                    class="btn btn-outline-primary" 
						                    style="margin-left: 10px;">중복확인</button>
						        </div>
						
						        <label for="account_phone">전화번호 :</label>
						        <div style="display: flex; margin-bottom: 10px;">
						            <input name="account_phone" id="account_phone" type="text"
						                   value="${account.accountPhone}" 
						                   style="flex: 1; padding: 8px; border: 1px solid #ddd; border-radius: 6px;">
						            <button type="button" id="duplicate_phone" 
						                    class="btn btn-outline-primary" 
						                    style="margin-left: 10px;">중복확인</button>
						        </div>
						
						        <label for="account_address">주소 :</label>
						        <input name="account_address" id="account_address" type="text"
						               value="${account.accountAddress}" 
						               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
						
						        <label for="account_email">이메일 :</label>
						        <input name="account_email" id="account_email" type="text"
						               value="${account.accountEmail}" 
						               style="width: 100%; padding: 8px; border: 1px solid #ddd; border-radius: 6px; margin-bottom: 10px;">
						
						        <div class="d-flex justify-content-between mt-4">
						            <button type="button" id="submitBtn" class="btn btn-outline-primary" style="width: 48%;">회원정보 수정하기</button>
						            <a href="/" class="btn btn-outline-danger" style="width: 48%;">홈으로 돌아가기</a>
						        </div>
						    </form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div> --%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
					 
	
	
	<script>
		/* 비밀번호 보이고 안 보이고 */
	    $(function(){
	        $('.eye').click(function(){
	            let pwtype = $('#login_pw').attr('type');
	            if(pwtype == 'text'){
	                $('#login_pw').attr('type', 'password');
	                $('#openEye').attr('name', 'eye-off-outline');
	            } else{
	                $('#login_pw').attr('type', 'text');
	                $('#openEye').attr('name', 'eye-outline');
	            }
	            $('#closeEye').toggleClass('dis');
	            $('#openEye').toggleClass('dis');
	        });
	    })
	
	</script>
	
	
	
	
</body>
</html>