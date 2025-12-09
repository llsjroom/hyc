<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   section {
     width:1100px;
     min-height:500px;
     margin:auto;
   }
   section table {
     border-spacing:0px;
   }
   section table tr th {
     border-top:2px solid skyblue;
     height:60px;
     border-bottom:1px solid skyblue;
   }
   section table tr td {
     height:60px;
     border-bottom:1px solid skyblue;
     text-align:center;
   }
   section table tr:last-child td {
     border-bottom:2px solid skyblue;
   }
 </style>
 <script>
   function addJuso()
   {
	   open("baesongAdd","","width=520,height=650");
   }
   function upJuso(id)
   {
	   open("baesongUp?id="+id,"","width=520,height=650");
   }
 </script>
</head>
<body> <!-- member/baesongList.jsp[ -->
  <section>
    <table width="1100" align="center">
      <caption> <h3> 배송지 정보  <input type="button" onclick="addJuso()" value="배송지추가"> </h3> </caption>
      <tr>
        <th> 받는 사람 </th>
        <th> 받는 주소 </th>
        <th> 전화번호 </th>
        <th> 요청사항 </th>
        <th> 기본배송지 </th>
        <th> 수정/삭제 </th>
      </tr>
     <c:forEach items="${blist}" var="bdto">
      <tr>
        <td> ${bdto.name} </td>
        <td> (${bdto.zip}) ${bdto.juso} ${bdto.jusoEtc} </td>
        <td> ${bdto.phone} </td>
        <td> ${bdto.reqStr} </td>
        <td>
          <c:if test="${bdto.gibon==1}">
            O
          </c:if>
          <c:if test="${bdto.gibon!=1}">
            X
          </c:if>
        </td>
        <td>
          <input type="button" value="수정" onclick="upJuso(${bdto.id})">
          <input type="button" value="삭제" onclick="location='baesongDel?id=${bdto.id}'">
        </td>
      </tr>
     </c:forEach>
    </table>
  </section>
</body>
</html>