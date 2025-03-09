<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.List" %>
<%@ page import="com.lumodiem.board.hostboard.vo.Klass" %>    

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>클래스 게시판</title>
  
  <!-- 필요한 스크립트/라이브러리 있으면 추가 -->
  <!-- <script src="<%=request.getContextPath()%>/views/jquery-3.7.1.js"></script> -->
  
  <style>
  /* ================================
     1) 톤온톤 컬러 팔레트 설정
     ================================ */
  :root {
    /* 메인 컬러(base-500) 기준: #D1B5E0 (원하시는 값) */
    --base-100: #F4ECF8;
    --base-200: #EBE0F2;
    --base-300: #E2D5ED;
    --base-400: #D8C9E7;
    --base-500: #D1B5E0; /* 메인 컬러 */
    --base-600: #BFA3CE;
    --base-700: #AD91BC;
    --base-800: #9B7FAA;
    --base-900: #8A6E99;

    /* 텍스트/테두리 등 */
    --text-color: #333;
    --border-color: #CABED1;
  }

  /* 전역 기본 스타일 */
  * {
    box-sizing: border-box; /* 테두리·패딩 계산 일관성 위해 추가 권장 */
  }
  body {
    margin: 0;
    padding: 0;
    background-color: var(--base-100);
    color: var(--text-color);
    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트 */
  }

  /* ================================
     2) 테이블 스타일 (톤온톤)
     ================================ */
  table {
    width: 100%;
    border-collapse: collapse;  /* 테두리 겹침 제거 */
    background-color: var(--base-200);
    margin: 16px 0;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    border: 1px solid var(--border-color);
  }
  thead {
    background-color: var(--base-400);
    color: var(--text-color);
  }
  thead th {
    padding: 12px;
    border-bottom: 1px solid var(--border-color);
    text-align: left;
  }
  tbody tr {
    border-bottom: 1px solid var(--border-color);
  }
  tbody td {
    padding: 12px;
  }
  tbody tr:nth-child(even) {
    background-color: var(--base-300); /* 짝수 행에 다른 톤 적용 */
  }

  /* ================================
     3) select, input, button
        모서리/높이 통일
     ================================ */
  select, input[type="text"], button {
    /* 모서리 둥글기 통일 */
    border-radius: 6px;
    /* 테두리 색 통일 */
    border: 1px solid var(--border-color);
    /* 높이·패딩 통일 */
    padding: 6px 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.2;
    transition: border-color 0.2s ease, box-shadow 0.2s ease,
                background-color 0.2s ease, transform 0.2s ease;
  }

  /* select, input은 흰 배경 + 기본 텍스트 */
  select, input[type="text"] {
    background-color: #fff;
    color: var(--text-color);
  }
  select:focus, input[type="text"]:focus {
    outline: none;
    border-color: var(--base-500);
    box-shadow: 0 0 0 2px rgba(209,181,224,0.2);
  }

  /* 버튼은 메인 컬러(기본 상태) */
  button {
    background-color: var(--base-500);
    color: #fff;
    cursor: pointer;
  }
  /* 버튼 호버 */
  button:hover {
    background-color: var(--base-600);
  }
  /* 버튼 클릭(액티브) */
  button:active {
    background-color: var(--base-700);
    transform: translateY(1px);
  }

  /* ================================
     4) 한 줄 정렬: .inline-form-group
     ================================ */
  .inline-form-group {
    display: flex;
    align-items: center;
    gap: 8px; /* 요소 간 간격 */
    margin: 8px 0; /* 위아래 여백 */
  }

  /* =============== (필요시) 나머지 스타일 =============== */
  /* 예전 .btn-pastel, .select-rounded 등 필요 없으면 삭제 */
  </style>
</head>

<body>
  <div id="colorlib-main">
    <section class="ftco-section ftco-no-pt ftco-no-pb">
      <div class="container">
        <div class="row d-flex">
          <div class="col-xl-8 py-5 px-md-5"> 
            <div class="row pt-md-4">

         <div class="klass_list">
                <!-- 정렬하기 + 작성하기 (한 줄 정렬) -->
                <form action="/klassBoardList" id="arrangeKlass" name="arrangeKlass"
                      class="inline-form-group"
                      style="justify-content: space-between; width: 100%;">
                  <select name="order_type" id="order_type">
                    <option value="x">정렬하기</option>
                    <option value="a">최신순</option>
                    <option value="b">오래된순</option>
                    <option value="c">좋아요순</option>
                  </select>

                  <c:choose>
                    <c:when test="${account.accountGrade eq 'H' or account.accountGrade eq 'A'}">
                      <button type="button" id="insertBtn" name="insertBtn"
                              onclick="location.href='/klassBoardCreate'" style="border-radius: 6px;">
                        작성하기
                      </button>
                    </c:when>
                  </c:choose>
                </form>

                <!-- 게시글 리스트 (resultList) -->
                <c:choose>
                  <c:when test="${not empty resultList }">
                    <c:forEach var="list" varStatus="vs" items="${resultList }">
                      <div class="col-md-12">
                        <div class="blog-entry ftco-animate d-md-flex">
                          <c:choose>
                            <c:when test="${list.attachNo > 0}">
                              <a href="/klassDetail?klass_no=${list.klassNo}"
                                 class="img img-2"
                                 style="display: flex; justify-content: center; align-items: center;
                                        width: 244px; height: 244px;">
                                <img alt="사진"
                                     src="<%=request.getContextPath()%>/klassFilePath?attach_no=${list.attachNo}"
                                     style="max-width: 100%; max-height: 100%;">
                              </a>
                            </c:when>
                            <c:otherwise>
                              <a href="/klassDetail?klass_no=${list.klassNo}" class="img img-2"
                                 style="width: 244px; height: 244px;">
                                NoImage
                              </a>
                            </c:otherwise>
                          </c:choose>

                          <div class="text text-2 pl-md-4">
                            <h3 class="mb-2">
                              <a href="/klassDetail?klass_no=${list.klassNo}">
                                ${list.klassName}
                              </a>
                            </h3>
                            <div class="meta-wrap">
                              <p class="meta">
                                <span><i class="icon-user mr-2"></i>${list.accountNickname}</span>
                                <c:choose>
                                  <c:when test="${not empty list.dateList }">
                                    <c:forEach var="d" items="${list.dateList }">
                                      <span><i class="icon-users mr-2"></i>${d.klassCount}명/${list.klassMax}명</span>
                                    </c:forEach>
                                  </c:when>
                                  <c:otherwise>
                                    <span>미정</span>
                                  </c:otherwise>
                                </c:choose>
                                <span>
                                  <a href="single.html">
                                    <i class="icon-heart mr-2" style="color: #FF4848;"></i>
                                    ${list.klassLikeCount}
                                  </a>
                                </span>
                              </p>
                            </div>
                            <p>
                              <a href="/klassDetail?klass_no=${list.klassNo}" class="btn-custom" 
                              	style="text-decoration: none; color: #724AA9">
                                더 보기..
                                <span class="ion-ios-arrow-forward"></span>
                              </a>
                            </p>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </c:when>
                  <c:otherwise>
                    <p>해당 게시글이 없습니다.</p>
                  </c:otherwise>
                </c:choose>

                <!-- 페이징 위치 예시 -->
                <form>
                  <p style="text-align: center;">페이징 위치</p>
                </form>

                <!-- 검색 (한 줄 정렬) -->
                <div style="text-align: center; margin-top: 20px;">
                  <form action="/klassBoardList" id="searchKlassList" method="post"
                        class="inline-form-group"
                        style="display: inline-flex;">
                    <select name="search_type" id="search_type">
                      <option value="0">선택</option>
                      <option value="1">클래스명</option>
                      <option value="2">닉네임</option>
                      <option value="3">내용</option>
                    </select>
                    <input type="text" name="search_txt" placeholder="검색어를 입력하세요.">
                    <button name="searchBtn" id="searchBtn" style="border-radius: 6px;">검색</button>
                  </form>
                </div>

              </div><!-- .klass_list -->
            </div><!-- .row pt-md-4 -->
          </div><!-- .col-xl-8 -->
        </div><!-- .row d-flex -->
      </div><!-- .container -->
    </section>
  </div><!-- #colorlib-main -->

  <!-- 정렬 select 변경 시 submit -->
  <script>
    const orderType = document.getElementById('order_type');
    if(orderType){
      orderType.onchange = function(){
        document.getElementById('arrangeKlass').submit();
      }
    }
  </script>

  <%@ include file="/views/include/nav.jsp" %>
</body>
</html>
