<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../static/css/member.css">
 <script>
   var uchk=0;
   function ucheck()
   {
	   var userid=document.getElementById("userid").value;
	   
	   if(userid.length>0)
	   {
		   var chk=new XMLHttpRequest();
		   chk.onload=function()
		   {
			   if(chk.responseText=="1")
			   {
				   document.getElementById("umsg").innerText="사용하고 있는 아이디입니다.";
				   document.getElementById("umsg").style.color="#FF1744";
				   uchk=0;
			   }
			   else
			   {
				   document.getElementById("umsg").innerText="사용 가능한 아이디입니다.";
				   document.getElementById("umsg").style.color="#2962FF";
				   uchk=1;
			   }
		   }
		   chk.open("get","useridCheck?userid="+userid);
		   chk.send();
	   }
	   else
	   {
		   uchk=0;
	   }
   }
   var pchk=0;
   function pwdCheck()
   {
	   var pwd=document.getElementById("pwd").value;
	   var pwd2=document.getElementById("pwd2").value;
	   
	   if(pwd==pwd2)
	   {
		   document.getElementById("pmsg").innerText="비밀번호가 일치합니다.";
		   document.getElementById("pmsg").style.color="#2962FF";
		   pchk=1;
	   }
	   else
	   {
		   document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다.";
		   document.getElementById("pmsg").style.color="#FF1744";
		   pchk=0;
	   }
   }
   
   function formCheck()
   {
	   var userid=document.getElementById("userid").value.trim();
	   var name=document.getElementById("name").value.trim();
	   var pwd=document.getElementById("pwd").value.trim();
	   var pwd2=ducument.getElementById("pwd2").value.trim();
	   
	   if(userid.length==0 || uchk==0)
	   {
		   alert("아이디가 비었거나 중복체크를 하세요");
		   return false;
	   }
	   else if(name.length==0)
		    {
		         alert("이름이 비었습니다");
		         return false;
		    }
	        else if(pwd.length==0 || pwd2.length==0 || pchk==0)
	        	 {
	        	      alert("비밀번호가 비었거나 일치하지 않습니다");
	        	      return false;
	        	 }
	             else if(document.getElementById("email").value.trim().length == 0)
	            	  {
	            	       alert("이메일이 비었습니다");
	            	       return false;
	            	  }
	                  else if(document.getElementById("phone").value.trim().length == 0)
	                       {
	                	       alert("전화번호가 비었습니다");
	                	       return false;
	                       }
	                       else
	                    	   return true;
   }
 </script>
</head>
<body> <!-- memberInput.jsp -->
  <section id="join" class="inner">
    <h3 class="page"> 회원가입 </h3>
    <form method="post" action="memberInputOk" onsubmit="return formCheck()">
      <div class="tableBg">
        <table>
          <colgroup>
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>아이디</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="userid" onblur="ucheck()" placeholder="아이디" id="userid" class="ff">
                <span id="umsg"></span>
              </td>
            </tr>
            <tr>
              <th>이름</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="name" placeholder="이름" id="name" class="ff">
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
            </tr>
            <tr>
              <td>
                <input type="password" name="pwd" onkeyup="pwdCheck()" placeholder="비밀번호" id="pwd" class="ff">
              </td>
            </tr>
            <tr>
              <th>비밀번호 확인</th>
            </tr>
            <tr>
              <td>
                <input type="password" name="pwd2" onkeyup="pwdCheck()" placeholder="비밀번호확인" id="pwd2" class="ff">
                <span id="pmsg"></span>
              </td>
            </tr>
            <tr>
              <th>이메일</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="email" placeholder="이메일" id="email" class="ff">
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="phone" placeholder="전화번호" id="phone" class="ff">
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btnWrap">
        <input type="submit" value="회원가입" id="submit" class="btn01">
      </div>
    </form>
  </section>
</body>
</html>