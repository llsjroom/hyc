<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/lecture.css">
<style></style>
<script></script>
</head>
<body> <!-- lecture/lectureList.jsp -->
  <div id="lecture">
    <div class="visual">
      <img src="/static/images/board/lecture.png" alt="">
    </div>
    <div class="inner">
      <h3>나의 신청내역</h3>
      <ul class="lecture">
        <c:forEach items="${lectureList}" var="ldto" varStatus="status">
          <li>
            <img src="/static/temp/lecture/${ldto.limg}" alt="">
            <div class="info">
              <p>${ldto.title}</p>
              <a class="btn01" href="/lecture/reserve?id=${ldto.id}">신청하기</a>
            </div>
          </li>
        </c:forEach>
      </ul>
      <div class="reserveInfo">
        <table>
          <colgroup>
            <col width="120px">
            <col width="*">
            <col width="120px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>강연명</th>
              <td colspan="3">강연제목</td>
            </tr>
            <tr>
              <th>신청날짜</th>
              <td colspan="3">2025년 9월 18일 2시</td>
            </tr>
            <tr>
              <th>신청인원</th>
              <td>2명</td>
              <th>신청도서</th>
              <td>2권</td>
            </tr>
            <tr>
              <th>참가비</th>
              <td>10,000원</td>
              <th>도서구입비</th>
              <td>10,000원</td>
            </tr>
            <tr>
              <th>총 결제금액</th>
              <td colspan="3">20,000원</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>