<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
     text-align:center;
   }
   section div {
     margin-top:20px;
   }
   section input[type=text] {
     width:600px;
     height:30px;
   }
   section textarea {
     width:600px;
     height:300px;
   }
   section input[type=submit] {
     width:606px;
     height:34px;
   }
 </style>
 <script>
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
<body> <!-- member/review.jsp -->
  <section>
    <form name="rform" method="post" action="reviewOk" onsubmit="return check(this)">
      <input type="hidden" name="pcode" value="${pcode}">
      <input type="hidden" name="gid" value="${gid}">
      <h3> 상품평 쓰기 </h3>
      <div> <input type="text" name="title" id="title"> </div>
      <div> <textarea name="content" id="content"></textarea> </div>
      <div> <input type="submit" value="상품평 쓰기"> </div>
    </form>
  </section>
</body>
</html>