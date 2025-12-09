<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/productList.css">
<script>
  window.onpageshow=function()
  {
    document.getElementsByClassName("order")[${order-1}].classList.add("now");
  }
  
  function over(my)
  {
    my.style.animationName="overImg";
    my.style.animationDuration="0.5s";
    my.style.animationFillMode="forwards";
  }
  function out(my)
  {
  my.style.animationName="outImg";
  my.style.animationDuration="0.5s";
  my.style.animationFillMode="forwards";
  }
  function moveContent(pcode)
  {
    location="productContent?pcode="+pcode;
  }
 </script>
</head>
<body>
  <section id="prodList" class="inner">
    <div id="home"> ${homeStr} </div>
    <div id="content">
      <div id="orderList">
        <a href="productList?pcode=${pcode}&sword=${sword}&order=1" class="order">판매량순</a>   <!--  order by pansu desc -->
        <a href="productList?pcode=${pcode}&sword=${sword}&order=2" class="order">가격낮은순</a>  <!--  order by price asc -->
        <a href="productList?pcode=${pcode}&sword=${sword}&order=3" class="order">가격높은순</a>  <!--  order by price desc -->
        <a href="productList?pcode=${pcode}&sword=${sword}&order=4" class="order">최신상품순</a>  <!--  order by writeday desc -->
      </div> <!-- 정렬 -->

      <div id="list">
        <ul>
          <c:forEach items="${plist}" var="pdto" varStatus="sts">
            <li>
              <div class="imgDiv" onclick="moveContent('${pdto.pcode}')">
                <img src="/static/temp/product/${pdto.pimg}" onmouseover="over(this)" onmouseout="out(this)"> 
              </div>
              <div class="title" onclick="moveContent('${pdto.pcode}')"> ${pdto.title}</div>
              <c:if test="${pdto.halin!=0}">
                <div class="halinPrice">
                  <span class="halin"> ${pdto.halin}% </span> 
                  <span class="hprice">
                    <fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/>원
                  </span> <!-- 할인된 상품금액 -->
                  <span class="price"> <fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/>원 </span>
                </div>
              </c:if>
              <div class="baesongWrap">
                <c:if test="${pdto.baeprice==0}"> 
                  <div id="baesong"> 무료배송 </div>
                </c:if>
                <div class="baeStr"> ${pdto.baesongStr} </div>
              </div>
              <div class="juk"> 
                <div class="jukInner">
                  최대 <fmt:formatNumber value="${pdto.price*pdto.juk/100}" type="number" pattern="#,###"/>원 적립
                </div> 
              </div>
            </li>
          </c:forEach>
        </ul>

        <div class="paging">
          <!-- 이전 5페이지 이동 -->
          <c:if test="${pstart != 1}"> 
            <a href="productList?pcode=${pcode}&page=${pstart-1}&sword=${sword}&order=${order}" class="arrow">
              <img src="/static/images/common/pageP_02.png" valign="middle">
            </a>
          </c:if>

          <c:if test="${pstart == 1}">
            <a class="arrow not"> <img src="/static/images/common/pageP_02.png" valign="middle"> </a>
          </c:if>
              
          <!-- 이전페이지 이동 -->
          <c:if test="${page != 1}">
            <a href="productList?pcode=${pcode}&page=${page-1}&sword=${sword}&order=${order}" class="arrow">
              <img src="/static/images/common/pageP_01.png" valign="middle">
            </a>
          </c:if>
          
          <c:if test="${page == 1}">
            <a class="arrow not"> <img src="/static/images/common/pageP_01.png" valign="middle"> </a>
          </c:if>

          <div class="page">
            <c:forEach begin="${pstart}" end="${pend}" var="i">
              <c:if test="${page==i}">
                <a href="productList?pcode=${pcode}&page=${i}&sword=${sword}&order=${order}" id="thisPage"> ${i} </a>
              </c:if>
              <c:if test="${page!=i}">
                <a href="productList?pcode=${pcode}&page=${i}&sword=${sword}&order=${order}"> ${i} </a>
              </c:if>
            </c:forEach>
          </div>
              
          <!-- 다음페이지 이동 -->
          <c:if test="${page != chong}">
            <a href="productList?pcode=${pcode}&page=${page+1}&sword=${sword}&order=${order}" class="arrow">
              <img src="/static/images/common/pageN_01.png" valign="middle">
            </a>
          </c:if>
          
          <c:if test="${page == chong}">
            <a class="arrow not"> <img src="/static/images/common/pageN_01.png" valign="middle"> </a>
          </c:if>
              
          <!-- 다음 5페이지 이동 -->
          <c:if test="${pend != chong}">
            <a href="productList?pcode=${pcode}&page=${pend+1}&sword=${sword}&order=${order}" class="arrow">
              <img src="/static/images/common/pageN_02.png" valign="middle">
            </a>
          </c:if>
          
          <c:if test="${pend == chong}">
            <a class="arrow not"> <img src="/static/images/common/pageN_02.png" valign="middle"> </a>
          </c:if>
        </div>
      </div>
    </div>
  </section>
</body>
</html>