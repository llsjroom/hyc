<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/productGumae.css">

<script>
  function chgBaesong() // 새창으로 띄우기
  {
    open("baesongList?aa=2","","width=520,height=650");
  }
  function selPay(n) 
  {
    var pay=document.getElementsByClassName("pay");
    for(i=0;i<pay.length;i++)
      pay[i].style.display="none";
      pay[n].style.display="block";
  }
  
  function onlyNumber(my) // 숫자만
  {
   my.value=my.value.replace(/[^0-9]/g,"");
  }
  // 적립금 가져와서 총결제금액에서 빼기
  var juk=${mdto.juk};
  var cprice=${totalPrice+totalBaePrice};
  var imsi=0;
  var totalPrice=${totalPrice};
  var baePrice=${totalBaePrice};
  var halinPrice=0;

  function couponCal(halin,usedCode)
  {
    halinPrice=parseInt(totalPrice*(halin/100));
    var newTotalPrice=totalPrice-halinPrice;
    var useJuk=document.getElementById("useJuk").value;
    var result=newTotalPrice+baePrice-useJuk;

    document.getElementById("halinP").innerText=comma(halinPrice)+"원";
    document.getElementById("chongPrice").innerText=comma(result)+"원";

    document.getElementById("usedCode").value=usedCode;
    
  }

  function calPrice(my)
  {
   if(imsi>0)
     document.getElementById("jukPrice").innerText=comma(juk)+"원";
     imsi=parseInt(my.value); // 입력된 숫자
     
   if(juk>=imsi)
   {
     var newPrice=cprice-imsi;
     document.getElementById("chongPrice").innerText=comma(newPrice)+"원";
     document.getElementById("cprice").value=newPrice;
     var newJuk=juk-imsi;
     document.getElementById("jukPrice").innerText=comma(newJuk)+"원";
   }
   else
   {
     alert("적립금을 확인해주세요");
     my.value=0;
   }
  }
  
  function comma(num)
  {
    return new Intl.NumberFormat().format(num);
  }

  function toggleCouponLayer() {
  const couponLayer = document.getElementById('couponLayer');
  if (couponLayer.style.display === 'block') {
    couponLayer.style.display = 'none';
  } else {
    couponLayer.style.display = 'block';
  }
}
</script>
</head>
<body>
  <section id="payment" class="inner">
    <form method="post" action="gumaeOk">
      <input type="hidden" name="usedCode" id="usedCode">
      <input type="hidden" name="baeId" id="baeId" value="${bdto.id}">
      <input type="hidden" name="pcodes" value="${pcodes}">
      <input type="hidden" name="sus" value="${sus}">
      <input type="hidden" name="cprice" id="cprice" value="${totalPrice+totalBaePrice}">
      <input type="hidden" name="totalPrice" id="totalPriceHidden" value="${totalPrice + totalBaePrice}">
      <h3 class="page">주문서</h3>

      <div class="secBox">
        <h4 class="tit">주문 상품</h4>
        <table class="table01">
          <colgroup>
            <col width="*">
          </colgroup>
          <tbody>
            <c:forEach items="${plist}" var="pdto">
            <tr>
              <td class="prodWrap">
                <div class="prodImg"><img src="/static/temp/product/${pdto.pimg}" alt=""></div>
                <div class="prodInfo">
                  <strong class="prodTit">${pdto.title}</strong>
                  <p class="prodPrice"><b>${pdto.price}원</b><span>${pdto.su}개</span></p>
                  <p class="prodDelivery">${pdto.baesongStr}</p>
                  <span class="prodFlag">
                    <c:if test="${pdto.baeprice == 0}">
                      <b>무료배송</b>
                    </c:if>
                    <c:if test="${pdto.baeprice != 0}">
                      배송비: <b><fmt:formatNumber value="${pdto.baeprice}" type="number"/> 원</b>
                    </c:if>
                  </span>
                </div>
              </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="secBox">
        <h4 class="tit">주문자 정보</h4>
        <table class="table02">
          <colgroup>
            <col width="100px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>구매자</th>
              <td>${mdto.name}</td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>${mdto.email}</td>
            </tr>
            <tr>
              <th>연락처</th>
              <td>${mdto.phone}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="secBox">
        <h4 class="tit">
          배송지
          <input class="btn01" type="button" value="배송지 관리" onclick="chgBaesong()">
        </h4>
        <c:set var="imsi" value=""/>
        <c:if test="${bdto==null}">
          <p class="noList">배송지를 선택해주세요.</p>
          <c:set var="imsi" value="style='display:none'"/>
        </c:if>

        <table class="table02" ${imsi}>
          <colgroup>
            <col width="100px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>이름</th>
              <td id="name">${bdto.name}</td>
            </tr>
            <tr>
              <th>주소</th>
              <td id="juso">${bdto.juso}, ${bdto.jusoEtc}</td>
            </tr>
            <tr>
              <th>연락처</th>
              <td id="phone">${bdto.phone}</td>
            </tr>
            <tr>
              <th>요청사항</th>
              <td id="req">${bdto.reqStr}</td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="secBox">
        <h4 class="tit">결제수단</h4>
        <div class="payBox">
          <ul class="payBtn">
            <li><input type="radio" name="sudan" value="0" onclick="selPay(0)" checked> 신용/체크</li>
            <li><input type="radio" name="sudan" value="1" onclick="selPay(1)"> 계좌이체</li>
            <li><input type="radio" name="sudan" value="2" onclick="selPay(2)"> 휴대폰</li>
          </ul>

          <div class="pay" style="display: block;">
            <select name="card">
              <option value="0"> 카드선택 </option>
              <option value="1"> 신한카드 </option>
              <option value="2"> 농협카드 </option>
              <option value="3"> 국민카드 </option>
              <option value="4"> 우리카드 </option>
            </select>
            
            <select name="halbu">
              <option value="0"> 일시불 </option>
              <option value="1"> 3개월 </option>
              <option value="2"> 6개월 </option>
              <option value="3"> 9개월 </option>
              <option value="4"> 12개월 </option>
              <option value="5"> 24개월 </option>
            </select>
          </div>
          
          <div class="pay">
            <select name="bank">
              <option value="0"> 은행선택 </option>
              <option value="1"> 신한은행 </option>
              <option value="2"> 농협은행 </option>
              <option value="3"> 국민은행 </option>
              <option value="4"> 우리은행 </option>
              <option value="5"> 하나은행 </option>
            </select>
          </div>

          <div class="pay">
            <select name="comm">
              <option value="0"> 통신사 </option>
              <option value="1"> SKT </option>
              <option value="2"> KT </option>
              <option value="3"> LG </option>
              <option value="4"> 알뜰폰 </option>
            </select>
          </div>
        </div>
      </div>
      
      <div class="secBox">
        <h4 class="tit">결제금액</h4>
        <table class="table02">
          <colgroup>
            <col width="100px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>상품금액</th>
              <td><fmt:formatNumber value="${totalPrice}" type="number"/>원</td>
            </tr>
            <tr>
              <th>배송비</th>
              <td><fmt:formatNumber value="${totalBaePrice}" type="number"/>원</td>
            </tr>
            <tr>
              <th>적립금</th>
              <td style="padding-top:4px; padding-bottom: 4px;">
                <input type="text" name="useJuk" id="useJuk" value="0" onblur="calPrice(this)" onkeyup="onlyNumber(this)">
                (적립금 : <span id="jukPrice"> <fmt:formatNumber value="${mdto.juk}" type="number"/>원</span>)
              </td>
            </tr>
            <tr>
              <th>쿠폰<input class="btn01" type="button" value="적용" onclick="toggleCouponLayer()"></th>
              <td id="myPay" style="position:relative">
                 <div id="couponLayer">
                    <ul>
                      <c:forEach items="${mlist}" var="mdto">
                        <li>
                          <c:if test="${mdto.chk==0}">
                            <input class="btn02" type="button" value="사용X" disabled>
                          </c:if>
                          <c:if test="${mdto.chk==1}">
                            <input class="btn01" type="button" value="사용" onclick="couponCal(${mdto.halin},'${mdto.code}')">
                          </c:if>
                          <span> ${mdto.gigan} </span>
                          <span> ${mdto.halin}% </span>
                        </li>
                      </c:forEach>
                    </ul>
                    <input class="btn02" type="button" value="닫기" onclick="toggleCouponLayer()">
                 </div>
                 <b id="halinP"></b>
              </td>
            </tr>
            <tr>
              <th>총 결제금액</th>
              <td id="chongPrice"><b class="fontBlue"><fmt:formatNumber value="${totalPrice+totalBaePrice}" type="number"/>원</b></td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btnWrap">
        <input class="btn01" type="submit" value="결제하기">
      </div>
    </form>
  </section>
</body>

</html>