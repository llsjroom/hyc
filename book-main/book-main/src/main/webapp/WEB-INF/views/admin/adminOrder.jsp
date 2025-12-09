<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../static/css/adminOrder.css"> -->
<link rel="stylesheet" href="../static/css/admin.css">
<script>
  function chgState(id, state)
  {
    if(!confirm("상태를 변경하시겠습니까?")) return;
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="1")
        location.reload();
      else
    	alert("잠시후 시도해주세요");
    }
    chk.open("get","/admin/chgState?id="+id+"&state="+state);
    chk.send();
  }
</script>
</head>
<body>
<section id="list" class="inner orderWrap">
  <h3 class="page">주문관리</h3>
  <table>
    <colgroup>
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="150px">
      <col width="100px">
      <col width="*">
    </colgroup>
    <thead>
      <tr>
        <th>주문번호</th>
        <th>아이디</th>
        <th>주문자</th>
        <th>전화번호</th>
        <th>총금액</th>
        <th>주문일</th>
        <th colspan="2">상태</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${glist}" var="gdto">
        <tr>
          <td>${gdto.jumuncode}</td>
          <td>${gdto.userid}</td>
          <td>${gdto.name}</td>
          <td>${gdto.phone}</td>
          <td><fmt:formatNumber value="${gdto.cprice}" type="Number" pattern="#,###"/></td>
          <td>${gdto.writeday.substring(0,10)}</td>
          <td>${gdto.state}</td>
          <td>
            <div class="stateBox">
              <select onchange="chgState(${gdto.id}, this.value)">
                <option value="0" <c:if test="${gdto.state==0}">selected</c:if>>결제완료</option>
                <option value="1" <c:if test="${gdto.state==1}">selected</c:if>>배송준비중</option>
                <option value="2" <c:if test="${gdto.state==2}">selected</c:if>>취소신청중</option>
                <option value="3" <c:if test="${gdto.state==3}">selected</c:if>>취소완료</option>
                <option value="4" <c:if test="${gdto.state==4}">selected</c:if>>배송중</option>
                <option value="5" <c:if test="${gdto.state==5}">selected</c:if>>배송완료</option>
                <option value="6" <c:if test="${gdto.state==6}">selected</c:if>>반품신청</option>
                <option value="7" <c:if test="${gdto.state==7}">selected</c:if>>반품완료</option>
                <option value="8" <c:if test="${gdto.state==8}">selected</c:if>>교환신청</option>
                <option value="9" <c:if test="${gdto.state==9}">selected</c:if>>교환완료</option>
              </select>

              <c:if test="${gdto.state==0}">
                <input type="button" class="btn01" value="배송준비중" onclick="chgState(${gdto.id},1)">
              </c:if>
              <c:if test="${gdto.state==1}">
                <input type="button" class="btn01" value="배송중" onclick="chgState(${gdto.id},4)">
              </c:if>
              <c:if test="${gdto.state==4}">
                <input type="button" class="btn01" value="배송완료" onclick="chgState(${gdto.id},5)">
              </c:if>
              <c:if test="${gdto.state==2}">
                <input type="button" class="btn02" value="취소완료" onclick="chgState(${gdto.id},3)">
              </c:if>
              <c:if test="${gdto.state==6}">
                <input type="button" class="btn02" value="반품완료" onclick="chgState(${gdto.id},7)">
              </c:if>
              <c:if test="${gdto.state==8}">
                <input type="button" class="btn02" value="교환완료" onclick="chgState(${gdto.id},9)">
              </c:if>
            </div>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</section>

</body>
</html>