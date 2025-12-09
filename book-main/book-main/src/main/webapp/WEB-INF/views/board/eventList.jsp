<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- <title>admin</title> -->
  <link rel="stylesheet" href="../static/css/board.css">
  <script>
    
  </script>
</head>
<body>
  <div id="list" class="inner">
    <h3 class="page">이벤트</h3>
    <table class="table01">
      <colgroup>
        <col width="80px">
        <col width="*"><!-- 제목 -->
        <col width="150px">
        <col width="80px">
      </colgroup>
      <thead>
        <tr>
          <th>No</th>
          <th>Title</th>
          <th>Date</th>
          <th>Views</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${not empty eventList}">
            <c:forEach items="${eventList}" var="edto" varStatus="status">
              <tr>
                <td>${edto.id}</td>
                <td class="tit">
                  <!-- 조회수는 목록에서 상세페이지로 들어갈 때만 올라야 함 -->
                  <a href="/board/eventReadnum?id=${edto.id}">${edto.title}</a>
                </td>
                <td>${fn:substring(edto.writeday,0,10)}</td>
                <td>${edto.readnum}</td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="4">
                <p class="noList">등록된 글이 없습니다.</p>
              </td>
            </tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
    <!-- 관리자계정일 때 -->
    <c:if test="${userid!=null && userid=='admin'}">
    <div class="btnWrap">
      <a class="btn01" href="/admin/adminEvent">관리자 목록</a>
    </div>
    </c:if>
    <!-- // 관리자계정일 때 -->

    <!--page-->
    <c:set var="currentPage" value="${currentPage}" />
    <c:set var="totalPage" value="${totalPage}" />
    
    <div class="paging">
      <!-- 첫 페이지 이동 -->
      <c:if test='${currentPage == 1}'>
        <a href="?page=1" class="prev02 disabled"></a>
      </c:if>
      <c:if test='${currentPage != 1}'>
        <a href="?page=1" class="prev02"></a>
      </c:if>

      <!-- 이전 페이지 이동 -->
      <c:if test='${currentPage == 1}'>
        <a href="?page=${currentPage - 1}" class="prev01 disabled"></a>
      </c:if>
      <c:if test='${currentPage != 1}'>
        <a href="?page=${currentPage - 1}" class="prev01"></a>
      </c:if>

      <ul class="pageList">
        <c:forEach var="i" begin="1" end="${totalPage}">
          <c:if test='${i == currentPage}'>
            <li class="now">
          </c:if>
          <c:if test='${i != currentPage}'>
            <li>
          </c:if>
              <a href="?page=${i}">${i}</a>
            </li>
        </c:forEach>
      </ul>

      <!-- 다음 페이지 이동 -->
      <c:if test='${currentPage == totalPage}'>
        <a href="?page=${currentPage + 1}" class="next01 disabled"></a>
      </c:if>

      <c:if test='${currentPage != totalPage}'>
        <a href="?page=${currentPage + 1}" class="next01"></a>
      </c:if>

      <!-- 마지막 페이지 이동 -->
      <c:if test='${currentPage == totalPage}'>
        <a href="?page=${totalPage}" class="next02 disabled"></a>
      </c:if>
      <c:if test='${currentPage != totalPage}'>
        <a href="?page=${totalPage}" class="next02"></a>
      </c:if>
      
    </div>
  </div>
</body>
</html>