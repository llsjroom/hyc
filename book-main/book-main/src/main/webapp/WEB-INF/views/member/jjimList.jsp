<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/member.css">
 <script>
   function mainCheck(chk)
   {
	   var subChk=document.getElementsByClassName("subChk");
	   
	   if(chk)
       {
		   for(i=0;i<subChk.length;i++)
		   {
			   subChk[i].checked=true;
		   }
       }
	   else
	   {
		   for(i=0;i<subChk.length;i++)
		   {
			   subChk[i].checked=false;
		   }
	   }
   }
   function subCheck()
   {
	   var subChk=document.getElementsByClassName("subChk");
	   var chk=0;
	   for(i=0;i<subChk.length;i++)
	   {
		   if(subChk[i].checked)
		   {
			   chk++;
		   }
	   }
	   
	   if(chk==subChk.length)
	   {
		   document.getElementById("mainChk").checked=true;
	   }
	   else
	   {
		   document.getElementById("mainChk").checked=false;
	   }
   }
   
   function selJjimDel()
   {
	   var subChk=document.getElementsByClassName("subChk");
	   
	   var ids="";
	   for(i=0;i<subChk.length;i++)
	   {
		   if(subChk[i].checked)
		   {
			   ids=ids+subChk[i].value+",";
		   }
	   }
	   
	   if(ids.length!=0)
		   location="jjimDel?ids="+ids
   }
   
   function toCart(pcode)
   {
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   if(chk.responseText=="1")
		   {
			  // 장바구니 메시지 보이기
        document.getElementById("cartMsg").style.visibility = "visible";

        // 3초 후 메시지 숨기기
        setTimeout(function() {
            document.getElementById("cartMsg").style.visibility = "hidden";
        }, 3000);
		   }
		   else
		   {
			   alert("잠시후 시도해주세요");
		   }
	   };
	   chk.open("get","toCart?pcode="+pcode);
	   chk.send();
   }
  //  function hideMsg()
  //  {
	//    document.getElementById("cartMsg").style.visibility="hidden";
  //  }
 </script>
</head>
<body> <!-- member/jjimList.jsp -->
  <section id="list" class="inner cartWrap">
    <h3 class="page">찜 리스트</h3>
    <table>
      <colgroup>
        <col width="80px">
        <col width="100px">
        <col width="*">
        <col width="200px">
        <col width="200px">
        <col width="200px">
      </colgroup>
      <thead>
        <tr>
          <th><input type="checkbox" id="mainChk" onclick="mainCheck(this.checked)"></th>
          <th colspan="2">상품</th>
          <th>배송예정일</th>
          <th>가격</th>
          <th>삭제/장바구니</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${plist}" var="pdto">
          <tr>
            <td><input type="checkbox" class="subChk" value="${pdto.id}" onclick="subCheck()"></td>
            <td><img src="../static/temp/product/${pdto.pimg}" width="60" height="60"></td>
            <td> ${pdto.title} </td>
            <td> ${pdto.baesongStr} </td>
            <td> <fmt:formatNumber value="${pdto.price}" type="number"/>원 </td>
            <td>
              <div class="btnWrap">
                <input class="btn02" type="button" value="삭제" onclick="location='jjimDel?ids=${pdto.id}'">
                <input class="btn01" type="button" value="장바구니 담기" onclick="toCart('${pdto.pcode}')">
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div class="btnWrap">
      <input class="btn02" type="button" value="선택삭제" onclick="selJjimDel()">
    </div>
    <div id="cartMsg">
      <!-- <span class="btnClose" onclick="hideMsg()"> X </span> -->
      장바구니에 담았습니다 <p>
      <input class="btn01" type="button" value="장바구니 이동" onclick="location='../member/cartView'">
    </div>
  </section>
</body>
</html>