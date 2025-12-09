<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="../static/css/member.css">
<style>
  
</style>
<script>
  function checkEmptyField(field, msgElementId, message) {
    const value = field.value.trim();
    const msgElement = document.getElementById(msgElementId);

    if (value.length === 0) {
      msgElement.innerText = message;
      msgElement.style.color = "#FF1744";
      return false;
    } else {
      msgElement.innerText = ""; // 메시지 초기화
      return true;
    }
  }

  function check(my) {
    let isValid = true; // 전체 유효성 상태 저장

    // 각각 검사 (return false 안 함 → 모두 검사)
    if (!checkEmptyField(my.oldPwd, "oldPwdMsg", "기존 비밀번호를 입력하세요")) isValid = false;
    if (!checkEmptyField(my.email, "emailMsg", "이메일을 입력하세요")) isValid = false;
    if (!checkEmptyField(my.phone, "phoneMsg", "전화번호를 입력하세요")) isValid = false;
    if (!checkEmptyField(my.pwd, "pwdMsg", "비밀번호를 입력하세요")) isValid = false;

    // 비밀번호 확인 검사
    if (my.pwd.value.trim() !== my.pwd2.value.trim()) {
      document.getElementById("pwdMsg2").innerText = "비밀번호가 일치하지 않습니다";
      document.getElementById("pwdMsg2").style.color = "#FF1744";
      isValid = false;
    } else {
      document.getElementById("pwdMsg2").innerText = "";
    }

    return isValid;
  }
</script>
</head>
<body> <!-- member/memberUpdate.jsp -->
  <section id="edit" class="inner">
    <h3 class="page"> 회원정보 수정 </h3>
    <form method="post" action="memberUpdateOk" onsubmit="return check(this)">
      <div class="tableBg">
        <table>
          <colgroup>
            <col width="150px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>아이디</th>
              <td>${mdto.userid}</td>
            </tr>
            <tr>
              <th>이름</th>
              <td>${mdto.name}</td>
            </tr>
            <tr>
              <th>이메일</th>
              <td>
                <input type="text" name="email" value="${mdto.email}">
                <span id="emailMsg" class="msg"></span> 
              </td>
            </tr>
            <tr>
              <th>전화번호</th>
              <td>
                <input type="text" name="phone" value="${mdto.phone}">
                <span id="phoneMsg" class="msg"></span>
              </td>
            </tr>
            <tr>
              <th>기존 비밀번호</th>
              <td>
                <input type="password" name="oldPwd">
                <c:if test="${param.err == 1}">
                  <span id="oldPwdMsg" class="msg">기존 비밀번호가 일치하지 않습니다.</span>
                </c:if>
              </td>
            </tr>
            <tr>
              <th>새 비밀번호</th>
              <td>
                <input type="password" name="pwd">
                <span id="pwdMsg" class="msg"></span>
              </td>
            </tr>
            <tr>
              <th>새 비밀번호 확인</th>
              <td>
                <input type="password" name="pwd2">
                <span id="pwdMsg2" class="msg"></span>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="btnWrap">
        <input type="submit" value="회원정보수정" id="" class="btn01">
      </div>
   </form>
  </section>
</body>
</html>













