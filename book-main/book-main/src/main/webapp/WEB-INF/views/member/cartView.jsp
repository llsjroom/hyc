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
	   
	   if(chk) // 전체선택 체크스박스가 체크되었다
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
	   
	   totalPrice();
   }
   function subCheck() // 상품별 체크박스가 전부 선택되면 전체선택 체크하기
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
	   
	   if(chk==subChk.length) // 전체가 선택되었다면
	   {
		   document.getElementById("mainChk").checked=true;
	   }
	   else
	   {
		   document.getElementById("mainChk").checked=false;
	   }
	   
	   totalPrice();
   }
   
   function selCartDel()
   {
	   // 삭제할 상품의  id를 구분자(,)를 이용하여 생성하기 // 1,2,5
	   var subChk=document.getElementsByClassName("subChk");
	   
	   var ids=""; // 삭제할 상품의 집합
	   for(i=0;i<subChk.length;i++)
	   {
		   if(subChk[i].checked)
		   {
			   ids=ids+subChk[i].value+",";
		   }
	   }
	   
	   if(ids.length!=0)
		   location="cartDel?ids="+ids
   }
   function upSu(n, id, pcode)
   {
	   var su=parseInt(document.getElementsByClassName("su")[n].value);
	   if(su<10)
	   {
		   su++;
		   document.getElementsByClassName("su")[n].value=su;
		   
		   // 비동시박식으로 변경
		   var chk=new XMLHttpRequest();
		   chk.onload=function()
		   {
			   if(chk.responseText=="0")
				   alert("잠시후 시도해주세요");
			   else
				   totalPrice();
		   }
		   chk.open("get","upSu?id="+id+"&pcode="+pcode);
		   chk.send();
	   }
   }
   function downSu(n, id, pcode)
   {
	   var su=parseInt(document.getElementsByClassName("su")[n].value);
	   if(su>1)
	   {
		   su--;
		   document.getElementsByClassName("su")[n].value=su;
		   
		   var chk=new XMLHttpRequest();
		   chk.onload=function()
		   {
			   if(chk.responseText=="0")
				   alert("잠시후 시도해주세요");
			   else
				   totalPrice();
		   }
		   chk.open("get","downSu?id="+id+"&pcode="+pcode);
		   chk.send();
	   }
   }
   
   window.onpageshow=function()
   {
	   totalPrice();
	   
	   var subChk=document.getElementsByClassName("subChk");
	   chk=0;
	   for(i=0;i<subChk.length;i++)
	   {
		   if(subChk[i].checked)
			   chk++;
	   }
	   
	   if(chk==subChk.length)
		   document.getElementById("mainChk").checked=true;
   }
   
   function totalPrice()
   {
	   var subChk=document.getElementsByClassName("subChk");
	   var proPrice=document.getElementsByClassName("proPrice");
	   var proBaeprice=document.getElementsByClassName("proBaeprice");
	   var su=document.getElementsByClassName("su");
	   
	   // 상품금액
	   // 배송비
	   var allPrice=0;
	   var allBaesong=0;
	   
	   for(i=0;i<subChk.length;i++)
	   {
		   if(subChk[i].checked)
		   {
			   var p=parseInt(proPrice[i].value);
			   var s=parseInt(su[i].value);
			   var b=parseInt(proBaeprice[i].value);
			   
			   allPrice=allPrice+(p*s);
			   allBaesong=allBaesong+b;
		   }
		   
		   document.getElementById("chongPrice").innerText=comma(allPrice);
		   document.getElementById("chongBae").innerText=comma(allBaesong);
		   document.getElementById("allPay").innerText=comma(allPrice+allBaesong);
	   }
   }
   
   function comma(number)
   {
	   return new Intl.NumberFormat().format(number);
   }
   
   function selGumae()
   {
	   var su=document.getElementsByClassName("su");
	   var pcode=document.getElementsByClassName("pcode");
	   var subChk=document.getElementsByClassName("subChk");
	   
	   var pcodes="";
	   var sus="";
	   for(i=0;i<subChk.length;i++)
	   {
		   if(subChk[i].checked)
		   {
			   pcodes=pcodes+pcode[i].value+",";
			   sus=sus+su[i].value+",";
		   }
	   }
	   if(pcodes=="")
		   alert("상품을 선택해주세요")
	   
	   document.gform.pcodes.value=pcodes;
	   document.gform.sus.value=sus;
	   //alert(pcodes+" "+sus);
	   document.gform.submit();
   }
 </script>
</head>
<body> <!-- member/cartView.jsp -->
  <section id="list" class="inner cartWrap">
    <h3 class="page">장바구니 현황</h3>
    <form name="gform" method="post" action="../product/productGumae">
      <input type="hidden" name="pcodes">
      <input type="hidden" name="sus">
    </form>
    <table>
      <colgroup>
        <col width="80px">
        <col width="100px">
        <col width="*">
        <col width="150px">
        <col width="100px">
        <col width="100px">
        <col width="150px">
        <col width="100px">
      </colgroup>
      <thead>
        <tr>
          <th><input type="checkbox" id="mainChk" onclick="mainCheck(this.checked)"></th>
          <th colspan="2">상품</th>
          <th>배송예정일</th>
          <th>가격</th>
          <th>배송비</th>
          <th>수량</th>
          <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${plist}" var="pdto" varStatus="sts">
          <input type="hidden" class="proPrice" value="${pdto.price-(pdto.price*pdto.halin/100)}">
          <input type="hidden" class="proBaeprice" value="${pdto.baeprice}">
          <c:set var="aa" value=""/>
          <c:if test="${pdto.wchk==1}">
            <c:set var="aa" value="checked"/>
          </c:if>
          <tr>
            <td>
            <c:if test="${userid != null}">
              <input type="hidden" class="pcode" value="${pdto.pcode}">
              <input type="checkbox" ${aa} class="subChk" onclick="subCheck()" value="${pdto.id}">
            </c:if>
            <c:if test="${userid == null}">
              <input type="checkbox" checked class="subChk" onclick="subCheck()" value="${pdto.pcode}">
            </c:if>
            </td>
            <td> <img src="../static/temp/product/${pdto.pimg}" width="60" height="60"> </td>
            <td> ${pdto.title} </td>
            <td> ${pdto.baesongStr} </td>
            <td align="right"> <fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/>원 </td>
            <td align="right"> <fmt:formatNumber value="${pdto.baeprice}" type="number"/>원 </td>
            <td>
              <div id="number">
                <img src="../static/minus.png" valign="middle" onclick="downSu(${sts.index},${pdto.id},'${pdto.pcode}')">
                <input type="text" name="su" value="${pdto.su}" class="su" readonly>
                <img src="../static/plus.png" valign="middle" onclick="upSu(${sts.index},${pdto.id},'${pdto.pcode}')">
              </div>
            </td>
            <td>
            <c:if test="${userid != null}">
              <input class="btn02" type="button" value="삭제" onclick="location='cartDel?ids=${pdto.id}'">
            </c:if>
            <c:if test="${userid ==null}">
              <input class="btn02" type="button" value="삭제" onclick="location='cartDel?ids=${pdto.pcode}'">
            </c:if>
            </td>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="8">
            <ul class="total">
              <li>상품금액 <b id="chongPrice"></b>원</li>
              <li>배송비 <b id="chongBae"></b>원</li>
              <li>총결제금액 <b id="allPay"></b>원</li>
            </ul>
          </td>
        </tr>
      </tfoot>
    </table>
    <div class="btnWrap">
      <input class="btn02" type="button" value="선택삭제" onclick="selCartDel()">
      <c:if test="${userid != null}">
        <input class="btn01" type="button" value="선택구매" onclick="selGumae()">
      </c:if>
      <c:if test="${userid == null}">
        <input class="btn01" type="button" value="선택구매" onclick="location='../login/login?cart=1'">
      </c:if>
    </div>
  </section>
</body>
</html>