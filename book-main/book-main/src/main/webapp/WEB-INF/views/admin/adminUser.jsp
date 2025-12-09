<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="../static/css/adminUser.css"> -->
<link rel="stylesheet" href="../static/css/admin.css">
<script>
  function upMember(userid)
  {
    var name=document.getElementById("name_"+userid).value;
    var juk=document.getElementById("juk_"+userid).value;
    
    if(!confirm("정보를 수정하시겠습니까?"))
      return;
    
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="1")
      {
        alert("수정 완료");  
        location.reload();
      }
      else
      {
        alert("잠시후 시도해주세요");
      }
    };
    chk.open("get","/admin/upMember?update&userid="+userid+"&name="+name+"&juk="+juk);
    chk.send();
  }
  
  function delMember(userid)
  {
    if(!confirm("정말 삭제하시겠습니까?"))
      return;
    
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="1")
      {
        alert("삭제완료");
        location.reload();
      }
      else
      {
        alert("잠시후 시도해주세요");
      }
    };
    chk.open("get","/admin/delMember?userid="+userid);
    chk.send();
  }
</script>
</head>
<body>
  <section id="list" class="inner userWrap">
    <h3 class="page">회원관리</h3>
    <table>
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>아이디</th>
          <th>이름</th>
          <th>비밀번호</th>
          <th>전화번호</th>
          <th>적립금</th>
          <th>가입일</th>
          <th>수정/삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${mlist}" var="mdto">
          <tr>
            <td>${mdto.userid}
              <input type="hidden" name="userid" id="userid_${mdto.userid}" value="${mdto.userid}">
            </td>
            <td><input type="text" name="name" id="name_${mdto.userid}" value="${mdto.name}"></td>
            <td>${mdto.pwd}</td>
            <td>${mdto.phone}</td>
            <td><input type="number" name="juk" id="juk_${mdto.userid}" value="${mdto.juk}"></td>
            <td>${mdto.writeday.substring(0,10)}</td>
            <td>
              <div class="btnWrap">
                <span class="btn01" onclick="upMember('${mdto.userid}')">수정</span>
                <span class="btn02" onclick="delMember('${mdto.userid}')">삭제</span>
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </section>
</body>
</html>