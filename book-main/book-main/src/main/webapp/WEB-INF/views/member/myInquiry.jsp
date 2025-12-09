<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/member.css">
<style>
  #list table td[onclick] {
    cursor: pointer;
  }
</style>
 <script>
   function inquiryUp(id,content)
   {
    const mask=document.createElement("div");
    mask.className="mask";
    document.getElementById("inquiryUpForm").after(mask);
    document.getElementById("inquiryUpForm").style.visibility = "visible";
    document.body.classList.add("noScroll");

    var w=window.innerWidth;
    var h=window.innerHeight;
    
    w=w/2;
    h=h-165;
    
    document.uform.id.value=id;
    document.uform.content.value=content.replace(/<br>/g,"\r");
   }

   function formClose()
   {
    document.body.classList.remove("noScroll");
    document.getElementById("inquiryUpForm").style.visibility="hidden";
    document.querySelector(".mask").remove();
   }
 </script>
</head>
<body> <!-- member/myInquiry.jsp -->
  <section id="list" class="inner cartWrap">
    <h3 class="page">나의 문의</h3>
    <table>
      <colgroup>
        <col width="300px">
        <col width="300px">
        <col width="*">
        <col width="200px">
        <col width="200px">
      </colgroup>
      <thead>
        <tr>
          <th>상 품</th>
          <th>질문</th>
          <th>답변</th>
          <th>작성일</th>
          <th>수정/삭제</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${ilist}" var="idto">
          <tr>
            <td onclick="location='/product/productContent?pcode=${idto.pcode}#inquiry'">${idto.title}</td>
            <td onclick="location='/product/productContent?pcode=${idto.pcode}#inquiry'">${idto.content}</td>
            <td>
              <c:if test="${idto.answer != ''}">
                ${idto.answer}
              </c:if>
              <c:if test="${idto.answer == ''}">
                <span style="color:red;"> 답변 준비중 </span>
              </c:if>
            </td>
            <td>${fn:substring(idto.writeday,0,10)}</td>
            <td>
              <div class="btnWrap">
                <input class="btn02" type="button" value="삭제" onclick="location='inquiryDel?ref=${idto.ref}'">
                <input class="btn01" type="button" value="수정" onclick="inquiryUp(${idto.id},'${idto.content}')">
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div id="inquiryUpForm">
      <form name="uform" method="post" action="inquiryUpOk">
        <input type="hidden" name="id">
        <c:forEach items="${ilist}" var="idto">
          <h3>${idto.title}</h3>
        </c:forEach>
        <div class="inputBox">
          <textarea name="content" in="content" maxlength="200" onkeyup="numCheck(this.value.length)"></textarea>
          <p>(<span id="num">0</span>) : 200자 제한있음</p>
        </div>
        <div class="btnWrap">
          <input class="btn02" type="button" value="취소" onclick="formClose()">
          <input class="btn01" type="submit" value="문의수정하기">
        </div>
      </form>
    </div>
  </section>
</body>
</html>