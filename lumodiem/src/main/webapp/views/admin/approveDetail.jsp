<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<tr>
					<th>상세 내용</th>
					<td>${klass.klassTxt}</td>
				</tr>
			
			</table>		
		
		</form>

		<form class="approveUpdate">
		<c:choose >
			<c:when test="${klass.accountNo eq account.accountNo or account.accountGrade eq 'A' }">
				<button type="button" id="updateBtn" name="updateBtn">승인</button>
				<button type="button" id="rejectBtn" name="rejectBtn">반려</button>
			</c:when>
		
		</c:choose>
		</form>
	
	</div>				
		<script type="text/javascript">
			$('#updateBtn').click(function(){
		const klassNo = ${klass.klassNo}; 
		const check = confirm("승인하시겠습니까?");
		if(check == true){
		const approveCode = 'A';
			$.ajax({
					url : "approveUpdate?klass_no=${klass.klassNo }",
					type : "post",
					data : {"klass_no" : klassNo,
							"approve_code" :approveCode
							},
					dataType : "JSON",
					contentType : "application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
						alert(data.res_msg);
						if(data.res_code == "200"){
							location.href="/arreoveList";
						} else{
							location.href="/arreoveList";
						}
					}
			});
		}
	});
			$('#rejectBtn').click(function(){
				const klassNo = ${klass.klassNo}; 
				const approveFb = prompt("반려사유");
				console.log(approveFb);
				const check = confirm("반려하시겠습니까?");
				if(check == true){
				const approveCode = 'D';
					$.ajax({
							url : "approveUpdate?klass_no=${klass.klassNo }",
							type : "post",
							data : {"klass_no" : klassNo,
									"approve_code" :approveCode,
									"approve_fb" : approveFb
									},
							dataType : "JSON",
							contentType : "application/x-www-form-urlencoded; charset=UTF-8",
							success : function(data){
								alert(data.res_msg);
								if(data.res_code == "200"){
									location.href="/arreoveList";
								} else{
									location.href="/arreoveList";
								}
							}
					});
				}
			});
			
			
		</script>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

</body>
</html>