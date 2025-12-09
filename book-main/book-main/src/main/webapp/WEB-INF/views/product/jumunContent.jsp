<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/jumunContent.css">
</head>
<body>
  <section>
    <table width="900" align="center">
      <caption><h2>주문이 완료되었습니다!</h2></caption>
      <tr>
        <td colspan="2">
          <c:forEach items="${plist}" var="pdto">
            <div>
              <span style="display:inline-block;width:600px"> ${pdto.title} </span>
              <span> ${pdto.baesongStr} </span>
            </div>
          </c:forEach>
        </td>
      </tr>
      <tr>
        <td>
          <h4> 수령 정보 </h4>
          <div><span class="ff"> 수령인 </span> ${bdto.name}/${bdto.phone} </div>
          <div><span class="ff"> 수령지 </span> ${bdto.juso} ${bdto.jusoEtc} </div>
          <div><span class="ff"> 요청사항 </span> ${bdto.reqStr} </div>
        </td>
        <td>
          <h4> 결제 정보 </h4>
          <div><span class="ff"> 주문 금액 </span> <fmt:formatNumber value="${cprice}" type="number"/>원</div>
          <div><span class="ff"> 사용 적립금 </span><fmt:formatNumber value="${useJuk}" type="number"/>원</div>
          <div><span class="ff"> 총 결제금액 </span><fmt:formatNumber value="${cprice+useJuk}" type="number"/>원</div>
        </td>
      </tr>
    </table>
  </section>

</body>
</html>