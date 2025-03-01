<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<aside id="colorlib-aside" role="complementary">
    <!-- 네비게이션 메뉴 -->
    <nav id="colorlib-main-menu" role="navigation">
        <ul>
            <li class="colorlib-active"><a href="/">홈</a></li>
            <li><a href="/klassBoardList">클래스 게시판</a></li>
            <li><a href="/reviewBoard">리뷰 게시판</a></li>

            <!-- 로그인 여부에 따라 다르게 표시 -->
            <c:choose>
                <c:when test="${empty account}">
                    <li><a href="/accountCreateSelect">회원가입</a></li>
                    <li><a href="/login">로그인</a></li>
                    <li><a>게스트</a></li>
                </c:when>
                <c:otherwise>
                    <li>
                        <c:choose>
                            <c:when test="${account.accountGrade eq 'M'}">
                                <a href="/memberMyPage">마이페이지</a>
                            </c:when>
                            <c:when test="${account.accountGrade eq 'H'}">
                                <a href="/hostMyPage">마이페이지</a>
                            </c:when>
                            <c:when test="${account.accountGrade eq 'A'}">
                                <a href="/adminPage">관리자 페이지</a>
                            </c:when>
                        </c:choose>
                    </li>
                    <li>
                        <a style="font-weight: bold;">
                            ${fn:escapeXml(account.accountNickname)}
                        </a>
                        <c:choose>
                            <c:when test="${account.accountGrade eq 'M'}">
                                <a style="font-size: small;">(참여자)</a>
                            </c:when>
                            <c:when test="${account.accountGrade eq 'H'}">
                                <a style="font-size: small;">(주최자)</a>
                            </c:when>
                            <c:when test="${account.accountGrade eq 'A'}">
                                <a style="font-size: small;">(관리자)</a>
                            </c:when>
                        </c:choose>
                    </li>
                    <li><a href="/logout">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>

    <!-- 사이드바 하단 (푸터) -->
    <div class="colorlib-footer">
        <h1 id="colorlib-logo" class="mb-4">LumoDiem</h1>
        <p><a href="/" style="background-image: url('/images/bg_1.jpg');">More</a></p>

        <div class="mb-4">
            <h3>Subscribe for newsletter</h3>
            <form action="#" class="colorlib-subscribe-form">
                <div class="form-group d-flex">
                    <input type="text" class="form-control" placeholder="Enter Email Address">
                    <div class="icon"><span class="icon-paper-plane"></span></div>
                </div>
            </form>
        </div>
        <p class="pfooter">
            Copyright &copy;
            <fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy" /> 
            LumoDiem 원데이 클래스
            <i class="icon-heart" aria-hidden="true"></i> by 
            <a href="https://colorlib.com" target="_blank">응애 로켓단</a>
        </p>
    </div>
</aside>
