<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.lumodiem.account.vo.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="/resources/js/jquery-3.7.1.js"></script>

<%-- <link href="<%=request.getContextPath()%>/resources/css/include/nav.css" rel="stylesheet" type="text/css"> --%>
<%-- <% session.setAttribute("act", "H"); %> --%>
<nav>
	<div id="nav_wrap">
		<div class="menu">
			<ul>
				<li>
					<a href="/klassBoard">클래스 게시판</a>
				</li>
				<li>
					<a href="/reviewBoard">리뷰 게시판</a>
				</li>
				<c:choose>
					<c:when test="${empty act}">
						<li>
							<a href="/accountCreate">회원가입</a>
						</li>
						<li>
							<a href="/accountLogin">로그인</a>
						</li>
						<li>
							<a>게스트</a>
						</li>
					</c:when>
					
					<c:when test="${act.accountGrade eq  'M'}">
						<li>
							<a href="/memberMyPage">마이페이지</a>
						</li>
						<li>
							<a>참여자</a>
						</li>
					</c:when>
					
					<c:when test="${act.accountGrade eq 'H' }">
						<li>
							<a href="/hostMyPage">마이페이지</a>
						</li>
						<li>
							<a>주최자</a>
						</li>
					</c:when>
					
					<c:when test="${act.accountGrade eq 'A' }">
						<li>
							<a href="/hostMyPage">마이페이지</a>
						</li>
						<li>
							<a>주최자</a>
						</li>
					</c:when>
					
					<c:otherwise>
						<li>
							<a href="/memberLogout">로그아웃</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>