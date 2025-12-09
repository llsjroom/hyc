<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>book List</title>
  <link rel="stylesheet" href="../static/css/regist.css">
<style>
  #list {
    padding-bottom: 60px;
  }
  #list table + .btnWrap {
    position: fixed;
    bottom: 29px;
    left: 50%;
    transform: translateX(-50%);
    margin-left: 93px;
    width: 1260px;
    padding: 10px;
    background: #ffffffcc;
    border-top: 1px solid #1c1c1c;
  }
</style>
<script>

window.onload=function()
{
  document.getElementById("allChk").onclick=function()
  {
    var checkboxes=document.getElementsByName("pcode");
    for(var i=0; i<checkboxes.length;i++)
    {
      checkboxes[i].checked=this.checked;
    }
  };
};
</script>
</head>
<body>
<form action="/regist/delBook" method="post" onsubmit="return confirm('정말 삭제하시겠습니까')">
  <section id="list" class="inner">
    <h3 class="page">상품 목록</h3>
    <table class="table01">
      <colgroup>
        <col width="80px">
        <col width="*">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <col width="150px">
        <col width="150px">
      </colgroup>
      <thead>
        <tr>
          <th><input type="checkbox" id="allChk" onclick="checkAll(this)"></th>
          <th>상품명</th>
          <th>상품가격</th>
          <th>배송비</th>
          <th>할인율</th>
          <th>적립률</th>
          <th>재 고</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${not empty plist}">
            <c:forEach items="${plist}" var="pdto">
              <tr>
                <td><input type="checkbox" name="pcode" value="${pdto.pcode}"></td>
                <td class="tit"> ${pdto.title} </td>
                <td> ${pdto.price} </td>
                <td> ${pdto.baeprice} </td>
                <td> ${pdto.halin} </td>
                <td> ${pdto.juk} </td>
                <td> ${pdto.su} </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="4">
                <p class="noList">등록된 상품이 없습니다.</p>
              </td>
            </tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
    <div class="btnWrap">
      <input type="submit" class="btn01" value="선택삭제">
      <a class="btn01" href="/regist/registBook">상품등록</a>
    </div>
  </section>
</form>
</body>
</html>