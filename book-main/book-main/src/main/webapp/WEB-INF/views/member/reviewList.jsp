<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/member.css">
</head>
<body> <!-- member/reviewList.jsp -->
  <section id="list" class="inner cartWrap">
    <h3 class="page">나의 상품평</h3>
    <table>
      <colgroup>
        <col width="300px">
        <col width="200px">
        <col width="*">
        <col width="200px">
      </colgroup>
      <thead>
        <tr>
          <th>상 품</th>
          <th>제 목</th>
          <th>내 용</th>
          <th>작성일</th>
          <th>수정/삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${rlist}" var="map">
          <tr>
            <td>${map.ptitle}</td>
            <td>${map.title}</td>
            <td>${map.content}</td>
            <td>${fn:substring(map.writeday,0,10)}</td>
            <td>
              <div class="btnWrap">
                <input class="btn01" type="button" value="수정" onclick="location='reviewUp?id=${map.id}'">
                <input class="btn02" type="button" value="삭제" onclick="location='reviewDel?id=${map.id}&pcode=${map.pcode}&gid=${map.gid}'">
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </section>
</body>
</html>