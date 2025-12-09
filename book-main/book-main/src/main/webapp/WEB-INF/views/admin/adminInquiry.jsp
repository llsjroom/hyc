<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../static/css/admin.css">
<style>
  .table01 tbody tr:nth-child(odd):hover td {
    background-color: #eff7ff;
  }
  .table01 tbody tr:nth-child(even):hover td {
    background-color: #f8f8f8;
  }
  .table01 tbody td a {
    text-decoration: underline;
  }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
  <sitemesh:write property="head"/>
</head>
<body>
  <section id="list" class="inner">
    <!-- <div id="answerForm">
      <form name="aform" method="post" action="answer">
        <input type="hidden" name="ref">
        <input type="hidden" name="pcode">
        <div id="content"></div>
      </form>
    </div> -->
    <h3 class="page">상품 문의 목록</h3>
    <table class="table01">
      <colgroup>
        <col width="100px">
        <col width="300px">
        <col width="150px">
        <col width="*">
        <col width="150px">
      </colgroup>
      <thead>
        <tr>
          <th> 구 분 </th>
          <th> 상품명 </th>
          <th> 문의자 </th>
          <th> 문의내용 </th>
          <th> 작성일 </th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${not empty ilist}">
            <c:forEach items="${ilist}" var="idto">
              <tr class="${idto.qna == 1 ? 'question' : 'answer'}">
                <td>${idto.qna == 1 ? '질문' : '답변'}</td>
                <td><a href="/product/productContent?pcode=${idto.pcode}#inquiry">${idto.title}</a></td>
                <td>${idto.userid}</td>
                <td>
                  <c:if test="${idto.qna==1}">
                    <a href="/product/productContent?pcode=${idto.pcode}#inquiry">${idto.content}</a>
                  </c:if>
                  <c:if test="${idto.qna==2}">
                    ${idto.content}
                  </c:if>
                </td>
                <td>${fn:substring(idto.writeday,0,10)}</td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="5">
                <p class="noList">등록된 글이 없습니다.</p>
              </td>
            </tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </section>
</body>
</html>