<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 네비게이션 -->
<div id="nav-container">
    <aside id="colorlib-aside" role="complementary" class="js-fullheight">
        <nav id="colorlib-main-menu" role="navigation">
            <ul>
                <li class="colorlib-active"><a href="${pageContext.request.contextPath}/">홈</a></li>
                <li><a href="${pageContext.request.contextPath}/klassBoardList">클래스 게시판</a></li>
                <li><a href="${pageContext.request.contextPath}/reviewBoard">리뷰 게시판</a></li>
                <c:choose>
                    <c:when test="${empty account}">
                        <li><a href="${pageContext.request.contextPath}/accountCreateSelect">회원가입</a></li>
                        <li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
                        <li><a>게스트</a></li>
                    </c:when>
                    <c:when test="${account.accountGrade eq 'M'}">
                        <li><a href="${pageContext.request.contextPath}/memberMyPage">마이페이지</a></li>
                        <li><a style="font-weight: bold;">${account.accountNickname}</a>
                            <a style="font-size: small;">(참여자)</a>
                        </li>
                    </c:when>
                    <c:when test="${account.accountGrade eq 'H'}">
                        <li><a href="${pageContext.request.contextPath}/hostMyPage">마이페이지</a></li>
                        <li><a style="font-weight: bold;">${account.accountNickname}</a>
                            <a style="font-size: small;">(주최자)</a>
                        </li>
                    </c:when>
                    <c:when test="${account.accountGrade eq 'A'}">
                        <li><a href="${pageContext.request.contextPath}/adminPage">관리자 페이지</a></li>
                        <li><a style="font-weight: bold;">관리자</a></li>
                    </c:when>
                </c:choose>
                <c:if test="${not empty account}">
                    <li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
                </c:if>
            </ul>
        </nav>
    </aside>
</div>
