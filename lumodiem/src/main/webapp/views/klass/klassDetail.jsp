.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js">></script>
<title>클래스 상세조회</title>
</head>
<body>
<%@ include file="/views/include/nav.jsp" %>
<div id="colorlib-main">
	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex">
				<div class="col-xl-8 py-5 px-md-5">
					<div class="row pt-md-4">
					
	<div class="klass_detail">
	
		<form action="" name="detail_klass_form">
		<div>
			<c:choose>
				<c:when test="${klass.accountNo eq account.accountNo or account.accountGrade eq 'A' }">
				<button type="button" id="updateBtn" name="updateBtn">
					<a href="/klassBoardUpdate?klass_no=${klass.klassNo }">수정</a>
				</button>
				<button type="button" id="deleteBtn" name="deleteBtn">
					삭제
				</button>
				</c:when>
			
			</c:choose>
			
		</div>
		<div>
			<c:forEach var="list" items="${klassAttach }" varStatus="vs">
				<img src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}">
			</c:forEach>
		</div>
		<hr>
		<input type="hidden" value="${klass.klassNo}" name="klass_no">
			<table>
				<tr>
					<th>클래스명</th>
					<td>${klass.klassName}</td>
				</tr>
				<tr>
					<th>주최자</th>
					<td>${klass.accountNickname}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${fn:substring(klass.klassTxt,0,5)}</td>
					<!--<td>${klass.klassTxt}</td> -->
				</tr>
				<tr>
					<th>일정</th>
					<td>
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${fn:substring(li.klassStart,0,10)}<br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>시간</th>
					<td>
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${fn:substring(li.klassStart,11,19)}<br>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th>최대(예약가능)</th>
					<%-- <td>${klass.klassMax}명(${klass.klassMax - klassDate.klassCount}명)</td> --%>
					<td>
						<c:forEach var="li" items="${klassDate }" varStatus="vs">
							${klass.klassMax}명(${klass.klassMax - li.klassCount}명)<br>
						</c:forEach>
					
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${klass.klassAddress }</td>
				</tr>
				<tr>
					<th>수업료</th>
					<td>${klass.klassPrice }원</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${klass.klassRegDate}</td>
				</tr>
				<%-- <tr>
					<th>상세 내용</th>
					<td>${klass.klassTxt}</td>
				</tr> --%>
				<tr>
					<td colspan="2">
						<c:choose>
							<c:when test="${myLikeCount eq 0 }">
								<div class="icon"><span class="icon-heart-o" id="unlikeToLike">${totalLikeCount }</span></div>
							</c:when>
							<c:otherwise>
								<div class="icon"><span class="icon-heart" id="likeToUnlike">${totalLikeCount }</span></div>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>		
		
		</form>

		<form>
		<c:choose >
			<c:when test="${account.accountGrade eq 'M'}">
			<a>클래스 예약 가능일 : </a>
			<select name="resKlassSelect" id="resKlassSelect">
				<c:forEach var="date" items="${klassDate}" varStatus="vs">
					<option value="${date.klassDateNo}">${date.klassStart} ~ ${fn:substring(date.klassEnd,11,19)}</option>
					${fn:substring(date.klassEnd,11,19)}
				</c:forEach>
			</select><br>
				<span id="minusSpan">➖</span>
				<span id="numberSpan">1</span>
				<span id="plusSpan">➕</span>
				<button type="button" id="resBtn" name="resBtn">예약하기</button>
			</c:when>
			<c:when test="${account.accountGrade eq 'M' or account.accountGrade eq 'H'}">
				<button type="button" id="rptBtn" name="rptBtn">
					<a href="/klassReport">신고하기</a>
				</button>
			</c:when>
		</c:choose>
		
		</form>
		<hr>
		<form>
			<div>
				${klass.klassTxt}
			</div>
		</form>
		<hr>
		<form>
			<table border="1">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>닉네임</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty review }">
						
							<c:forEach var="list" items="${review }" varStatus="vs">
							<tr>
								<td>${vs.count}</td>						
								<td>${list.reviewName}</td>
								<td>${list.reviewTxt}</td>
								<td>${list.accountNickname}</td>
								<td>${list.reviewRegDate}</td>
							</tr>
									
							</c:forEach>
						
						</c:when>
						<c:otherwise>
							<td colspan="5">작성된 리뷰가 없습니다.</td>
						</c:otherwise>					
					
					</c:choose>
				
				</tbody>
			</table>
		</form>
	
	</div>				





































					</div>
				</div>
			</div>
		</div>
	</section>
</div>
<script>
	$('#deleteBtn').click(function(){
		const klassNo = ${klass.klassNo}; 
		const check = confirm("삭제하시겠습니까?");
		if(check){
			$.ajax({
					url : "klassBoardDelete",
					type : "post",
					data : {"klass_no" : klassNo},
					dataType : "JSON",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							alert(data.res_msg);
							location.href="/klassBoardList";
						} else{
							location.href='/klassDetail?klass_no='+klassNo;
						}
					}
			});
		}
	});
	$('#minusSpan').click(function(){
		let downPpl = document.getElementById('numberSpan').innerHTML;
		let downResCnt = Number(downPpl);
		if(downResCnt > 1){
			downResCnt --;
			document.getElementById('numberSpan').innerHTML = downResCnt;
		}
			
	});
	$('#plusSpan').click(function(){
		let upPpl = document.getElementById('numberSpan').innerHTML;
		let upRescnt = Number(upPpl);
		if(upRescnt < 4){
			upRescnt ++;
			document.getElementById('numberSpan').innerHTML = upRescnt;
		}
	});

	$(document).on('click','#resBtn',function(){
		const klassDateNo = $('#resKlassSelect').val();
		const resPpltxt = $('#numberSpan').text();
		resPpl = Number(resPpltxt);
		const dateN = $('#resKlassSelect').val();
		if(dateN != null){
			const ck = confirm("예약하시겠습니까?");
			if(ck){
				$.ajax({
					url : "/klassReservation",
					type : "post",
					data : {"klass_date_no" : klassDateNo
							,"res_ppl" : resPpl},
					dataType:'json',
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/klassBoardList";
						} else{
							location.href='/';
						}
					}
				});
			}
		}else{
			alert('예약할 클래스 날짜를 정해주세요');
			location.href="/klassBoardList";
		}
	});
</script>

	<script>
		$(function(){
			let klassNumber = "${klass.klassNo}";
			let unlikeToLike = "unlikeToLike";
			let likeToUnlike = "likeToUnlike";
			$(document).on('click', '#unlikeToLike', function(){
				$.ajax({
					url : "/klassLikeChange",
					type : "post",
					data : {
						"klass_no" : klassNumber,
						"like" : unlikeToLike
					},
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert('좋아요!');
							$('#unlikeToLike').text(data.newTotalLikeCount);
							$('#unlikeToLike').attr("id", "likeToUnlike").removeClass('icon-heart-o').addClass('icon-heart');
						} else{
							alert('오류. 홈페이지로 이동합니다.');
							location.href="/";
						}
					},
					error : function(){
						alert('ajax 실패1');
					}
				});
			});
			$(document).on('click', '#likeToUnlike', function(){
				$.ajax({
					url : "/klassLikeChange",
					type : "post",
					data : {
						"klass_no" : klassNumber,
						"like" : likeToUnlike
						},
					dataType : 'json',
					contentType: "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						if(data.res_code == "200"){
							alert('좋아요를 취소합니다.');
							$('#likeToUnlike').text(data.newTotalLikeCount);
							$('#likeToUnlike').attr("id", "unlikeToLike").removeClass('icon-heart').addClass('icon-heart-o');
						} else{
							alert('오류. 홈페이지로 이동합니다.');
							location.href="/";
						}
					},
					error : function(){
						alert('ajax 실패2');
					}
				});
			});
		})
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>
</body>
</html>