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
  <script defer>
    // alert("현재 URI: ${pageContext.request.requestURI}");
    window.addEventListener('DOMContentLoaded', () => {
      const currentPath = window.location.pathname;

      const topLinks = document.querySelectorAll(".link > li > a");
      const subMenus = document.querySelectorAll(".link > li > .sub");
      const subLinks = document.querySelectorAll(".sub > li > a");

      // 1depth 메뉴
      topLinks.forEach(link => {
        const topLi = link.parentElement;
        const subUl = topLi.querySelector('.sub');
        const windowView = link.getAttribute("href") === currentPath;

        topLi.classList.toggle('now', windowView);
        if (subUl) 
          subUl.classList.toggle('show', windowView);

        // 다른 형제들(.link > li / .sub > li)의 show/now 제거
        if (windowView) {
          const siblings = topLi.parentElement.children;
          for (let i = 0; i < siblings.length; i++) {
            const sibling = siblings[i];
            if (sibling !== topLi) {
              sibling.classList.remove('now');
              const siblingSub = sibling.querySelector('.sub');
              if (siblingSub) 
                siblingSub.classList.remove('show');
            }
          }
        }
      });

      // 2depth 클래스(show/now) 추가/삭제
      subMenus.forEach(subLink => {
        const paths = subLink.dataset.paths.split(",");
        const check = paths.includes(currentPath);

        subLink.classList.toggle('show', check);
        if (check) 
          subLink.parentElement.classList.add('now');
      });

      // 2depth 클릭 >> this 적용
      subLinks.forEach(link => {
        link.addEventListener('click', e => {
          const currentLi = link.parentElement;
          const siblings = currentLi.parentElement.querySelectorAll('li');
          
          siblings.forEach(li => li.classList.remove('this'));
          currentLi.classList.add('this');
        });

        // url 주소 체크 해서 >> this 적용
        if (link.getAttribute('href') === currentPath) {
          const currentLi = link.parentElement;
          const siblings = currentLi.parentElement.querySelectorAll('li');

          siblings.forEach(li => li.classList.remove('this'));
          currentLi.classList.add('this');
        }
      });
    });
    </script>
  <sitemesh:write property="head"/>
</head>
<body>
  <section id="admin">
    <div id="adminWrap">
      <!-- sideBar -->
      <div id="adminSideBar">
        <h3 class="logo" onclick="location='/main/main'"><img src="/static/images/main/logo.png" alt="Book#"></h3>
        <ul class="link">
          <li><a href="/admin/10">회원관리</a></li>
          <li>
            <a href="/regist/registProduct">상품관리</a>
            <ul class="sub" data-paths="/regist/registProduct,/regist/registBook">
              <li><a href="/regist/registProduct">상품목록</a></li>
              <li><a href="/regist/registBook">상품등록</a></li>
            </ul>
          </li>
          <li><a href="/admin/30">주문관리</a></li>
          <li>
            <a href="/admin/40">게시판관리</a>
            <ul class="sub" data-paths="/admin/40,/admin/41,/admin/42,/admin/43,/admin/44,/admin/45">
              <li><a href="/admin/40">공지사항</a></li>
              <li><a href="/admin/41">공지사항 등록</a></li>
              <li><a href="/admin/42">이벤트</a></li>
              <li><a href="/admin/43">이벤트 등록</a></li>
              <li><a href="/admin/44">작가와의만남</a></li>
              <li><a href="/admin/45">작가와의만남 등록</a></li>
            </ul>
          </li>
          <li><a href="/admin/50">상품문의</a></li>
        </ul>
      </div>
      <div id="adminPage">
        <!-- body -->
        <sitemesh:write property="body"/>
      </div>
    </div>
    <!-- footer -->
    <div id="adminFooter">
      <p>Copyright © 2025 Admin. All rights reserved.</p>
    </div>
  </section>
</body>
</html>