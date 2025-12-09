<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/baesongList.css">
 <script>
   function moveBaesong(n, baeId)
   {
     // 부모창의 class="op"의 style의 display=> table-row
     var op=opener.document.getElementsByClassName("op");
     for(i=0;i<op.length;i++)
     {
       op[i].style.display="table-row";
     }     
     
     if( opener.document.getElementById("baeGibon") != null)
     opener.document.getElementById("baeGibon").style.display="none";
     
     // 부모창의 요소의 값 = 자식창의 요소의 값
     opener.document.getElementById("name").innerText=document.getElementsByClassName("name")[n].innerText;
     opener.document.getElementById("juso").innerText=document.getElementsByClassName("juso")[n].innerText;
     opener.document.getElementById("phone").innerText=document.getElementsByClassName("phone")[n].innerText;
     opener.document.getElementById("req").innerText=document.getElementsByClassName("req")[n].innerText;
     
     // 배송테이블의 id도 변경
     opener.document.getElementById("baeId").value=baeId;
     
     // 창닫기
     close();
   }
 </script>
</head>
<body>
  <div class="baesongWrap">
   <c:forEach items="${blist}" var="bdto" varStatus="sts">
     <div class="baesong">
       <div class="baesongTop"> 
          <span  class="name"> ${bdto.name} </span>
          <c:if test="${bdto.gibon==1}">
            <span id="gibon"> 기본배송지 </span>
          </c:if>
       </div>
      
       <div class="juso"> ${bdto.juso} ${bdto.jusoEtc}</div>
       <div class="phone"> ${bdto.phone}</div>
       <div class="req"> ${bdto.reqStr} </div>
       <div class="btnWrap"> 
         <input class="btn03" type="button" value="수정" onclick="location='baesongUp?id=${bdto.id}'">
         <i></i>
         <input class="btn02" type="button" value="삭제" onclick="location='baesongDel?id=${bdto.id}'">
       </div>
       <input class="btn01" type="button" value="선택" onclick="moveBaesong(${sts.index},${bdto.id})">
     </div>
   </c:forEach>
   <div class="fixBtn">
    <input type="button" id="baeBtn" value="배송지추가" onclick="location='baesongAdd'">
   </div>
  </div>
</body>
</html>