<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.lumodiem.account.vo.Account" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="/css/animate.css">
    
    <link rel="stylesheet" href="/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/css/magnific-popup.css">

    <link rel="stylesheet" href="/css/aos.css">

    <link rel="stylesheet" href="/css/ionicons.min.css">

    <link rel="stylesheet" href="/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="/css/flaticon.css">
    <link rel="stylesheet" href="/css/icomoon.css">
    <link rel="stylesheet" href="/css/style.css">
    

<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight" >


<nav id="colorlib-main-menu" role="navigation">
	<ul>
		<li class="colorlib-active">
			<a href="/">홈</a>
		</li>
		<li>
			<a href="/klassBoard">클래스 게시판</a>
		</li>
		<li>
			<a href="/reviewBoard">리뷰 게시판</a>
		</li>
		<c:choose>
			<c:when test="${empty account}">
				<li>
					<a href="/accountCreateSelect">회원가입</a>
				</li>
				<li>
					<a href="/accountLogin">로그인</a>
				</li>
				<li>
					<a>게스트</a>
				</li>
			</c:when>
			
			<c:when test="${account.accountGrade eq  'M'}">
				<li>
					<a href="/memberMyPage">마이페이지</a>
				</li>
				<li>
					<a>참여자</a>
				</li>
			</c:when>
			
			<c:when test="${account.accountGrade eq 'H' }">
				<li>
					<a href="/hostMyPage">마이페이지</a>
				</li>
				<li>
					<a>주최자</a>
				</li>
			</c:when>
			
			<c:when test="${account.accountGrade eq 'A' }">
				<li>
					<a href="/adminPage">관리자 페이지</a>
				</li>
				<li>
					<a>관리자</a>
				</li>
			</c:when>
			
			<c:otherwise>
				<li>
					<a href="/memberLogout">로그아웃</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</nav>