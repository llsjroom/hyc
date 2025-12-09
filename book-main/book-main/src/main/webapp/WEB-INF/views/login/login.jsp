<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="../static/css/login.css">
<script>
  function formCheck()
  {
    var userid=document.getElementById("userid").value.trim();
    var pwd=document.getElementById("pwd").value.trim();
    
    if(userid.length==0)
    {
      alert("아이디를 입력하세요");
      document.getElementById("userid").focus();
      return false;
    }	   
    else if(pwd.length==0)
      {
          alert("비밀번호를 입력하세요");
          document.getElementById("pwd").focus();
          return false;
      }
        else
          return true;
  }
  
  function useridSearch()
  {
    var name=document.getElementById("name").value;
    var email=document.getElementById("email").value;
    
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="0")
      {
        document.getElementById("msg").innerText="입력정보가 일치하지 않습니다";
      }	
      else
      {
        document.getElementById("msg").innerText="아이디는 "+chk.responseText+"입니다";
        document.getElementById("name").value="";
        document.getElementById("email").value="";
      }	   
      document.getElementById("useridSearch").style.display="none";
    }
    chk.open("get","useridSearch?name="+name+"&email="+email);
    chk.send();
  }
  function pwdSearch()
  {
    var name=document.getElementById("name2").value;
    var email=document.getElementById("email2").value;
    var userid=document.getElementById("userid2").value;
    
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="0")
      {
        document.getElementById("msg").innerText="입력정보가 일치하지 않습니다";
      }
      else
      {
        document.getElementById("msg").innerText="비밀번호는 "+chk.responseText+"입니다";
          document.getElementById("name2").value="";
          document.getElementById("email2").value="";
          document.getElementById("userid2").value="";
      }
      document.getElementById("pwdSearch").style.display="none";
    }
    chk.open("get","pwdSearch?name="+name+"&email="+email+"&userid="+userid);
    chk.send();
  }
  
  function viewUserid() // 아이디찾기 보이기
  {
    document.getElementsByClassName("form")[0].style.display="flex";
    document.getElementsByClassName("form")[1].style.display="none";
  }
  function viewPwd() // 비밀번호찾기 보이기
  {
    document.getElementsByClassName("form")[1].style.display="flex";
    document.getElementsByClassName("form")[0].style.display="none";
  }
  function closeForm(element) {
    if(element.parentNode.classList.contains('form')) {
      element.parentNode.style.display="none";
    }
    }
</script>
</head>
<body> <!-- login.jsp -->
  <section id="login">
    <div class="inner">
      <form id="form" method="post" action="loginOk" onsubmit="return formCheck()">
        <input type="hidden" name="cart" value="${cart}">
        <div> <input type="text" name="userid" id="userid" placeholder="아이디"> </div>
        <div> <input type="password" name="pwd" id="pwd" placeholder="비밀번호"> </div>
        <div> <input class="btn01" type="submit" value="로그인"> </div>
      </form>
      
      <div align="center"> 
        <span onclick="viewUserid()">아이디 찾기 </span>
        <span onclick="viewPwd()">비밀번호 찾기 </span>
      </div>
      
      <div align="center" id="msg"></div>
      
      <div id="useridSearch" class="form"> <!-- css작업용 class이름 부여 -->
        <strong>아이디찾기</strong>
        <form>
          <input type="text" name="name" id="name" placeholder="이름을 입력해주세요."> <br>
          <input type="text" name="email" id="email" placeholder="이메일을 입력해주세요."> <br>
          <input class="btn01" type="button" value="아이디찾기" onclick="useridSearch()">
        </form>
        <input type="button" value="아이디찾기 닫기" onclick="closeForm(this)" class="close">
      </div>
      <div id="pwdSearch" class="form">
        <strong>비밀번호찾기</strong>
        <form>
          <input type="text" name="userid" id="userid2" placeholder="아이디를 입력해주세요."> <br>
          <input type="text" name="name" id="name2" placeholder="이름을 입력해주세요."> <br>
          <input type="text" name="email" id="email2" placeholder="이메일을 입력해주세요."> <br>
          <input class="btn01" type="button" value="비밀번호찾기" onclick="pwdSearch()">
        </form>
        <input type="button" value="비밀번호찾기 닫기" onclick="closeForm(this)" class="close">
      </div>
    </div>
  </section>
</body>
</html>










