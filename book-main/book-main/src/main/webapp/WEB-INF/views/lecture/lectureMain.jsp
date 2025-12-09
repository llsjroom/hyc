<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/lecture.css">
<script></script>
</head>
<body> <!-- lecture/lectureMain.jsp -->
  <div id="lecture">
    <div class="visual">
      <img src="/static/images/board/lecture.png" alt="">
    </div>
    <div class="inner">
      <h3>신청중</h3>
      <ul class="lecture">
        <c:forEach items="${lectureList}" var="ldto" varStatus="status">
          <li>
            <img src="/static/temp/lecture/${ldto.limg}" alt="">
            <div class="info">
              <p>${ldto.title}</p>
              <c:if test="${userid==null}">
                <a class="btn01" href="/login/login">신청하기</a>
              </c:if>
              <c:if test="${userid!=null}">
                <a class="btn01" href="/lecture/reserve?id=${ldto.id}">신청하기</a>
              </c:if>
            </div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</body>
</html>