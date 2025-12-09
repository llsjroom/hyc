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
  <div id="view" class="inner">
    <h3 class="page">공지사항</h3>
    <table class="table01">
      <colgroup>
        <col width="*">
      </colgroup>
      <tbody>
        <tr>
          <td>
            <div class="titBox">${ndto.title}</div>
            <div class="flexBox"><span class="dateBox">작성일: ${ndto.writeday}</span><span class="viewsBox">조회수: ${ndto.readnum}</span></div>
          </td>
        </tr>
        <tr>
          <td>
            <c:if test="${not empty fileList}"> <!-- 첨부파일이 있으면 보여주기 -->
              <div class="fileBox"> <!-- 이미지 외 파일은 목록으로 -->
                <c:forEach items="${fileList}" var="filename">
                  <c:set var="ext" value="${fn:toLowerCase(filename.substring(filename.lastIndexOf('.') + 1))}" />
                  <c:if test="${!(ext == 'jpg' || ext == 'jpeg' || ext == 'png' || ext == 'gif')}">
                    <p><a href="/static/temp/notice/${filename}" target="_blank">${filename}</a></p>
                  </c:if>
                </c:forEach>
              </div>

              <div class="imgBox"> <!-- 이미지파일은 화면으로 -->
                <c:forEach items="${fileList}" var="filename">
                  <c:set var="ext" value="${fn:toLowerCase(filename.substring(filename.lastIndexOf('.') + 1))}" />
                  <c:if test="${ext == 'jpg' || ext == 'jpeg' || ext == 'png' || ext == 'gif'}">
                    <img src="/static/temp/notice/${filename}" alt="${filename}" />
                  </c:if>
                </c:forEach>
              </div>
            </c:if>
            <div class="txtBox">
              ${ndto.content}
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="btnWrap">
      <a class="btn01" href="/board/noticeList">목록</a>
    </div>
    <!-- 관리자계정일 때 -->
    <c:if test="${userid!=null && userid=='admin'}">
    <div class="btnWrap">
      <a class="btn03" href="/admin/noticeModify?id=${ndto.id}">수정</a>
      <input class="btn02" type="button" value="삭제" onclick="location='delNotice?ids=${ndto.id}'">
      <a class="btn01" href="/admin/adminNotice">관리자 목록</a>
    </div>
    </c:if>
    <!-- // 관리자계정일 때 -->
  </div>
</body>
</html>