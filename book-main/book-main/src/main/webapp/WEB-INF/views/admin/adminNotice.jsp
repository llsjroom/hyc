<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- <title>admin</title> -->
  <link rel="stylesheet" href="../static/css/admin.css">
  <script>
  function checkAll(chk)
  {
    var selChk=document.getElementsByClassName("selChk");
    
    if(chk)
    {
      for(i=0;i<selChk.length;i++)
      {
        selChk[i].checked=chk.checked;
      }
    }
    else
    {
      for(i=0;i<selChk.length;i++)
      {
        selChk[i].checked=false;
      }
    }
  }
  
  function selChk()
  {
    var selChk=document.getElementsByClassName("selChk");
    var chk=0;
    for(i=0;i<selChk.length;i++)
    {
      if(selChk[i].checked)
      {
        chk++;
      }
    }
    
    if(chk==selChk.length)
    {
      document.getElementById("allChk").checked=true;	
    }
    else
    {
      document.getElementById("allChk").checked=false;
    }
  }
  
  function selDel()
  {
    var selChk=document.getElementsByClassName("selChk");
    
    var ids="";
    for(i=0;i<selChk.length;i++)
    {
      if(selChk[i].checked)
      {
        ids=ids+selChk[i].value+",";
      }
    }
    
    if(ids.length!=0)
    {
      location="/admin/delNotice?ids="+ids
    }
  }
  
  
  </script>
</head>
<body>
<form action="/admin/delNotice" method="post" onsubmit="return confirm('정말 삭제하시겠습니까')">
  <div id="list" class="inner">
    <h3 class="page">공지사항 관리</h3>
    <table class="table01">
      <colgroup>
        <col width="80px"><!-- 체크박스 -->
        <col width="80px"><!-- 번호 -->
        <col width="*"><!-- 제목 -->
        <col width="150px"><!-- 작성일 -->
        <col width="150px"><!-- 버튼 -->
      </colgroup>
      <thead>
        <tr>
          <th><input type="checkbox" id="allChk" onclick="checkAll(this)"></th>
          <th>No</th>
          <th>Title</th>
          <th>Date</th>
          <th>Edit</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${not empty noticeList}">
            <c:forEach items="${noticeList}" var="ndto" varStatus="status">
              <tr>
                <td>
                  <input type="checkbox" class="selChk" onclick="selChk()"  value="${ndto.id}">
                </td>
                <td>${ndto.id}</td>
                <td class="tit"><a href="/board/noticeView?id=${ndto.id}">${ndto.title}</a></td>
                <td>${ndto.writeday.substring(0,10)}</td>
                <td>
                  <div class="btnWrap">
                    <!-- <input class="btn01" type="button" value="수정"> -->
                    <a class="btn01" href="noticeModify?id=${ndto.id}">수정</a>
                    <input class="btn02" type="button" value="삭제" onclick="location='delNotice?ids=${ndto.id}'">
                  </div>
                </td>
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
    <div class="btnWrap">
      <a class="btn03" href="/board/noticeList">공지사항보러가기</a>
      <input class="btn02" type="button" value="선택삭제" onclick="selDel()">
      <a class="btn01" href="/admin/noticeRegister">글쓰기</a>
    </div>

    <!--page-->
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
</form>
</body>
</html>