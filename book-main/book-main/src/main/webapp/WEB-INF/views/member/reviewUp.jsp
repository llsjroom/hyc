<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/member.css">
 <script>
   function chgStar(n)
   {
	   var star=document.getElementsByClassName("star");
	   
	   for(i=0;i<=n;i++)
	   {
		   star[i].src="../static/star1.png";
	   }
	   
	   // 노란별로 변경된 내용을 회색별로 바꿔야된다
	   for(i=n+1;i<star.length;i++)
	   {
		   star[i].src="../static/star2.png";
	   }
	   
	   document.rform.star.value=n+1;
   }
   
   function check(my)
   {
	   if(my.star.value=="0")
	   {
		   alert("별점을 선택하세요");
		   return false;
	   }
	   else
		   return true;
   }
 </script>
</head>
<body> <!-- member/reviewUp.jsp -->
  <section id="register" class="inner">
    <h3 class="page">상품평 수정</h3>
    <form name="rform" method="post" action="reviewUpOk" onsubmit="return check(this)">
      <input type="hidden" name="id" value="${rdto.id}">
      <input type="hidden" name="pcode" value="${rdto.pcode}">
      <div class="tableBg">
        <table class="table01">
          <colgroup>
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>제목</th>
            </tr>
            <tr>
              <td><input type="text" name="title" id="title" value="${rdto.title}"></td>
            </tr>
            <tr>
              <th>내용</th>
            </tr>
            <tr>
              <td>
                <textarea name="content" id="content">${rdto.content}</textarea>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btnWrap">
        <input type="submit" value="상품평 수정" class="btn01">
      </div>
    </form>
  </section>
</body>
</html>