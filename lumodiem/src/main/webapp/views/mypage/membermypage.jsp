<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>참여자 마이페이지</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .list-group-item a {
        color: #000;  /* 글자 색상 검은색 강제 변경 */
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
	table {
		background-color: white !important;
	    border: 1px solid #ddd !important;
	    border-spacing: 0 10px !important; /* 간격을 더 넓게 조정 */
	    border-collapse: separate !important; 
	}
	
	tr {
	    background-color: #E8DAEF; /* 행마다 구분감을 주기 위해 화이트 배경 */
	    border-bottom: 2px solid #aaa;
	}
	
	tr:last-child{
		background-color: #ffffff;
	}
	
	td:first-child {
	    text-align: left; /* 첫 번째 <td> 왼쪽 정렬 */
	}
	
	td:last-child {
	    text-align: right; /* 마지막 <td> 오른쪽 정렬 */
	}

    .clickable-row:hover {
	    background-color: #D1B5E0; /* 마우스 오버 시 색상 변경 */
	    cursor: pointer;           /* 커서를 포인터로 변경 */
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
	.mypage-box {
	    background-color: #FFFFFF;
	    border: 1px solid #ddd;
	    border-radius: 10px;
	    padding: 20px;
	    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); /* 은은한 그림자 */
	}
	/* .list-group-item{
		background-color: #E8DAEF !important;
	} */

</style>
</head>
<body style="background-color: #FFFAFF">
    <%@ include file="/views/include/nav.jsp" %>

	<div id="colorlib-main">
		<section class="ftco-section ftco-no-pt ftco-no-pb">
			<div class="container">
				<div class="row d-flex">
				    <div id="colorlib-main" class="container mt-5" style="justify-content: center;">
				        <div class="mypage-box" style="max-width: 100%; margin: 0 auto; border: 1px solid #ddd; border-radius: 10px; padding: 20px; box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1); ">
				            <h3 class="text-primary text-center mb-4">마이페이지</h3>
							<ul class="list-group mb-4">
							    
							    
							    
								<li class="list-group-item">
								<!-- <li class="list-group-item"> -->
								    <table style="width: 100%; border-collapse: collapse;">
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/memberMypageKlass'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">참여 클래스 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/memberMypageReview'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">작성 리뷰 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageLike'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">좋아요 목록 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								        <tr style="border-bottom: 1px solid #ddd;" class="clickable-row" data-url="<c:url value='/mypageCmt'/>" style="cursor: pointer;">
								            <td style="font-weight: bold; padding: 8px;">작성 댓글 조회</td>
								            <td style="padding: 8px;">(+)</td>
								        </tr>
								       	<tr style="font-weight: bold;"> 
									    	<td style=" padding: 8px; ">
										        <a href='<c:url value="/mypageUpdateDelete?val=update"/>' class="btn btn-outline-primary" style="font-weight: bold;">
										            회원정보 수정
										        </a>
										    </td>
										    <td style="padding: 8px; ">
										        <a href='<c:url value="/mypageUpdateDelete?val=delete"/>' class="btn btn-outline-danger" style="font-weight: bold;">
										            회원 탈퇴
										        </a>
										    </td>
										</tr>
							
								    </table>
								</li>

							</ul>
				        </div>
				    </div>
		    	</div>
		    </div>
	    </section>
    </div>
    
<script>
    document.querySelectorAll('.clickable-row').forEach(row => {
        row.addEventListener('click', function() {
            const url = row.getAttribute('data-url');
            if (url) {
                window.location.href = url;
            }
        });
    });
</script>

</body>
</html>
