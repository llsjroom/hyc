<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Book</title>
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
  <link rel="stylesheet" href="../static/css/main.css">
  <script>

  </script>
</head>
<body>
  <div id="main">
    <div id="visual">
      <!-- Swiper -->
      <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide"><img src="../static/images/main/visual_01.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_02.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_03.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_04.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_05.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_06.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_07.jpg"></div>
          <div class="swiper-slide"><img src="../static/images/main/visual_08.jpg"></div>
        </div>
        <div class="swiper-pagination"></div>
      </div>

      <!-- Swiper JS -->
      <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

      <!-- Initialize Swiper -->
      <script>
        var swiper = new Swiper(".mySwiper", {
          pagination: {
            el: ".swiper-pagination",
            // type: "fraction",
            dynamicBullets: true,
          },
        });
      </script>
    </div>

    <div class="section inner">
      <h3 class="secTit">새로 들어온 도서</h3>
      <div class="secCont">
        <a href="/product/productList?pcode=&sword=&order=4" class="moveBtn">더보기</a>
        <ul class="bookList">
          <c:forEach items="${nlist}" var="pdto" varStatus="sts">
            <li>
              <div class="prod">
              <p class="img">
                 <a href="/product/productContent?pcode=${pdto.pcode}"><img src="/static/temp/product/${pdto.pimg}"></a>
              </p>
              <p class="tit">${pdto.title}</p>
              <div class="info">
              <span class="price01"> <!-- 할인된 상품금액 -->
                <fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/>원
              </span>  <!-- 할인가 -->
              <s class="price02"><fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/>원</s>  <!-- 정가 -->
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <div class="section inner">
      <h3 class="secTit">가격 낮은순</h3>
      <div class="secCont">
        <a href="/product/productList?pcode=&sword=&order=2" class="moveBtn">더보기</a>
        <ul class="bookList">
          <c:forEach items="${llist}" var="pdto" varStatus="sts">
            <li>
              <div class="prod">
              <p class="img">
                 <a href="/product/productContent?pcode=${pdto.pcode}"><img src="/static/temp/product/${pdto.pimg}"></a>
              </p>
              <p class="tit">${pdto.title}</p> 
              <div class="info">
              <span class="price01"> <!-- 할인된 상품금액 -->
                <fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/>원
              </span>  <!-- 할인가 -->
              <s class="price02"><fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/>원</s>  <!-- 정가 -->
              </div>
            </li>
          </c:forEach>  
        </ul>
      </div>
    </div>
    <div class="section inner">
      <h3 class="secTit">가격 높은순</h3>
      <div class="secCont">
        <a href="/product/productList?pcode=&sword=&order=3" class="moveBtn">더보기</a>
        <ul class="bookList">
          <c:forEach items="${hlist}" var="pdto" varStatus="sts">
            <li>
              <div class="prod">
              <p class="img">
                 <a href="/product/productContent?pcode=${pdto.pcode}"><img src="/static/temp/product/${pdto.pimg}"></a>
              </p>
              <p class="tit">${pdto.title}</p>
              <div class="info">
              <span class="price01"> <!-- 할인된 상품금액 -->
                <fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/>원
              </span>  <!-- 할인가 -->
              <s class="price02"><fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/>원</s>  <!-- 정가 -->
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
    </div>
</body>
</html>