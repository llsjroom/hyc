<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon">
  <link rel="icon" href="/static/images/favicon.png" type="image/x-icon">
  <title>Book</title>
  <link rel="stylesheet" href="/static/css/style.css">
  <script src="/static/js/layout.js" defer></script>
  <sitemesh:write property="head"/>
</head>
<body>
  <!-- header -->
  <div id="header">
    <div class="inner">
      <h1 class="logo"><a href="/main/main"></a></h1>
      <ul class="menu">
        <li onmouseenter="openMenu(this)">
          <a href="/product/productList?pcode=A1">도서정보</a>
          <div class="subMenu" onmouseleave="closeMenu(this)">
            <ul class="menuList">
              <li><a href="/product/productList?pcode=A1">소설/문학</a></li>
              <li><a href="/product/productList?pcode=B1">비소설/에세이</a></li>
            </ul>
          </div>
        </li>
        <li onmouseenter="openMenu(this)">
          <a href="/board/eventList">이벤트</a>
          <div class="subMenu" onmouseleave="closeMenu(this)">
            <ul class="menuList">
              <li><a href="/board/eventList">진행중이벤트</a></li>
              <li><a href="/board/eventList">원데이클래스</a></li>
              <li><a href="/lecture">작가와의 만남</a></li>
              <!-- <li><a href="/board/pastEvent">지난이벤트</a></li> -->
            </ul>
          </div>
        </li>
        <li onmouseenter="openMenu(this)">
          <a href="/board/noticeList">고객센터</a>
          <div class="subMenu" onmouseleave="closeMenu(this)">
            <ul class="menuList">
              <li><a href="/board/noticeList">공지사항</a></li>
              <li><a href="/board/faqList">FAQ</a></li>
              <!-- <li><a href="/board/inquiryList">1:1문의</a></li> -->
            </ul>
          </div>
        </li>
      </ul>
      <div class="myLink">
        <ul class="linkList">
          <!-- 로그인을 안했을때 -->
          <c:if test="${userid==null}">
            <li><a href="/login/login">로그인</a></li>
            <li><a href="/member/memberInput">회원가입</a></li>
          </c:if>
          <!-- // 로그인을 안했을때 -->
          <!-- 로그인을 했을때 -->
          <c:if test="${userid!=null}">
            <!-- 관리자가 아닐 때 -->
            <c:if test="${userid!='admin'}">
              <li>${name}님</li>
              <li><a href="/member/memberInfo" class="iconUser">마이페이지</a></li>
              <li><a href="/member/cartView?userid=${mdto.userid}" class="iconCart">장바구니</a></li>
            </c:if>
            <!-- // 관리자가 아닐 때 -->
            <!-- 관리자일 때 -->
            <c:if test="${userid=='admin'}">
              <li><a href="/admin/10" class="iconAdmin">관리자페이지</a></li>
            </c:if>
            <!-- // 관리자일 때 -->
            <li><a href="/login/logout"> 로그아웃 </a></li>
          </c:if>
          <!-- // 로그인을 했을때 -->
        </ul>
        <input class="searchBtn" type="button" value="검색" onclick="searchOpen()">
        <div id="search">
          <div class="searchField">
            <input type="text" name="sword" value="${sword}" id="schTxt" onkeyup="schTxt(this.value, event)" placeholder="검색어를 입력하세요">
            <input type="button" name="" id="delBtn" onclick="schDel()">
            <input type="button" name="" id="schBtn" onclick="search()">
          </div>
          <input type="button" name="" id="closeBtn" onclick="searchClose()">
        </div>
      </div>
    </div>
  </div>
  <!-- // header -->

  <!-- body -->
  <sitemesh:write property="body"/>
  <div id="move">
    <c:if test="${userid!='admin'}">
      <a href="" class="btnKakao">kakaotalk 바로가기</a>
    </c:if>
    <input type="button" value="top" id="btnTop">
  </div>
  <!-- // body -->

  <!-- footer -->
  <div id="footer">
    <div class="inner">
      <div class="logo">
        <img src="/static/images/main/logo.png" alt="Book#">
      </div>
      <ul class="info">
        <li>경기도 의정부시 신흥로 258번길 25 해태프라자 2층</li>
        <li>대표자 : 홍길동</li>
        <li>사업자등록번호 : 127-91-97773</li>
        <li>개인정보보호책임자 : 관리자(admin@bookshop.co.kr)</li>
        <li>TEL : 031-846-5888</li>
        <li>FAX : 031-846-6198</li>
        <li>Copyright by Book#. All rights reserved.</li>
      </ul>
    </div>
  </div>
  <!-- // footer -->
</body>
</html>