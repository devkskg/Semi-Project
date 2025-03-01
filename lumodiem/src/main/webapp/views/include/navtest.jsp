<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<aside id="colorlib-aside" role="complementary" class="js-fullheight">
    <nav id="colorlib-main-menu" role="navigation">
        <ul>
            <li class="colorlib-active"><a href="/">홈</a></li>
            <li><a href="/klassBoardList">클래스 게시판</a></li>
            <li><a href="/reviewBoard">리뷰 게시판</a></li>
            
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
                    <li><a href="/logout">로그아웃</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav>

    <!-- 푸터 -->
    <div class="colorlib-footer">
        <h1 id="colorlib-logo" class="mb-4">
            <a href="/" style="background-image: url('/images/bg_1.jpg');">
                LumoDiem<span>More</span>
            </a>
        </h1>
        <p class="pfooter">
            Copyright &copy;
            <script>document.write(new Date().getFullYear());</script> 
            LumoDiem 원데이 클래스
            <i class="icon-heart" aria-hidden="true"></i> by 
            <a href="https://colorlib.com" target="_blank">응애 로켓단</a>
        </p>
    </div>
</aside>
