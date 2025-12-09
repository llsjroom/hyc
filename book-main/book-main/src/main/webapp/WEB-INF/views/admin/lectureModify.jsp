<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- <title>admin</title> -->
  <link rel="stylesheet" href="/static/css/admin.css">
  <script>
    window.onload=function() {
      const fileAdd=document.getElementById("fileAdd");
      const fileDel=document.getElementById("fileDel");
      const fileList=document.getElementById("fileList");
      let fileIndex=1;

      fileAdd.addEventListener("click", function() {
        const fileListInput=document.querySelectorAll("#fileList > input[type=file]");
        if( fileListInput.length < 3 ) {
          let newInput=document.createElement("input");
          newInput.type="file";
          newInput.name="file"+fileIndex;

          fileList.appendChild(newInput);
          
          fileIndex++;
        }
        else {
          alert("첨부파일은 최대 3개까지 등록이 가능합니다.")
        }
      });
      fileDel.addEventListener("click", function() {
        const fileListInput=document.querySelectorAll("#fileList > input[type=file]");
        if( fileListInput.length > 0 ) {
          fileList.removeChild(fileListInput[fileListInput.length - 1]);
        }
        else {
          alert("추가된 첨부파일이 없습니다.")
        }
      });
    }

    // 파일 목록 삭제
    document.addEventListener("click", function(e) {
      if (e.target.classList.contains("btnRemove")) {
        e.target.parentElement.remove();

      }
    });
  </script>
</head>
<body>
  <div id="register" class="inner">
    <h3 class="page">작가와의만남 수정</h3>
    <form enctype="multipart/form-data" method="post" action="lectureModifyOk">
      <input type="hidden" name="id" value="${ldto.id}">
      <div class="tableBg">
        <table class="table01">
          <colgroup>
            <col width="50%">
            <col width="50%">
          </colgroup>
          <tbody>
            <tr>
              <th colspan="2">제목</th>
            </tr>
            <tr>
              <td colspan="2"><input type="text" name="title" id="title" value="${ldto.title}"></td>
            </tr>
            <tr>
              <th>기간</th>
              <th>모집인원</th>
            </tr>
            <tr>
              <td>
                <div class="dateWrap">
                  <input type="date" name="sday" id="sday" value="<fmt:formatDate value='${ldto.sday}' pattern='yyyy-MM-dd'/>">~
                  <input type="date" name="eday" id="eday" value="<fmt:formatDate value='${ldto.eday}' pattern='yyyy-MM-dd'/>">
                  <select name="time" id="time">
                    <option value="시간선택" disabled <c:if test="${ldto.time == null}">selected</c:if>>시간선택</option>
                    <option value="1회차" <c:if test="${ldto.time == '1회차'}">selected</c:if>>1회차</option>
                    <option value="2회차" <c:if test="${ldto.time == '2회차'}">selected</c:if>>2회차</option>
                    <option value="3회차" <c:if test="${ldto.time == '3회차'}">selected</c:if>>3회차</option>
                    <option value="4회차" <c:if test="${ldto.time == '4회차'}">selected</c:if>>4회차</option>
                  </select>

                </div>
              </td>
              <td>
                <input type="text" name="max" id="max" value="${ldto.max}">
              </td>
            </tr>
            <tr>
              <th>참가비</th>
              <th>도서구입비</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="price01" id="price01" value="${ldto.price01}">
              </td>
              <td>
                <input type="text" name="price02" id="price02" value="${ldto.price02}">
              </td>
            </tr>
            <tr>
              <th colspan="2">첨부파일</th>
            </tr>
            <tr>
              <td colspan="2">
                <div id="fileList">
                  <!-- 기존 파일 목록 -->
                  <c:forEach var="limg" items="${fileList}">
                    <p>
                      <a href="/static/temp/lecture/${limg}" target="_blank">${limg}</a>
                      <button type="button" class="btnRemove">삭제</button>
                      <!-- 기존 파일을 hidden으로 전송 -->
                      <input type="hidden" name="fileOri" value="${limg}">
                    </p>
                  </c:forEach>
                  <!-- 새 파일 추가 영역 -->
                  <input type="file" name="file1">
                </div>
              </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="btnWrap">
        <a class="btn02" href="/admin/adminLecture">취소</a>
        <input class="btn01" type="submit" value="저장">
      </div>
    </form>
  </div>
</body>
</html>