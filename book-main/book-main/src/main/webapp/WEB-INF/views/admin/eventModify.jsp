<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- <title>admin</title> -->
  <link rel="stylesheet" href="/static/css/admin.css">
  <script>
    window.onload = function() {
      const fileAdd = document.getElementById("fileAdd");
      const fileDel = document.getElementById("fileDel");
      const fileList = document.getElementById("fileList");
      let fileIndex=1;

      fileAdd.addEventListener("click", function() {
        const fileListOri = document.querySelectorAll("#fileList p").length;  // 기존 파일 개수
        const fileListNew = document.querySelectorAll("#fileList input[type=file]").length; // 새로 추가된 파일 input 개수
        const fileListAll = fileListOri + fileListNew;

        if (fileListAll < 3) {
          let newInput = document.createElement("input");
          newInput.type = "file";
          newInput.name = "file" + (fileListAll + 1); // file1, file2, file3 순서
          fileList.appendChild(newInput);
        } 
        else {
          alert("첨부파일은 최대 3개까지 등록이 가능합니다.");
        }
      });

      fileDel.addEventListener("click", function() {
        const fileListNew = fileList.querySelectorAll("input[type=file]");
        if (fileListNew.length > 0) {
          fileListNew[fileListNew.length - 1].remove();
        } 
        else {
          alert("새로 추가된 첨부파일이 없습니다.");
        }
      });
    };

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
    <h3 class="page">이벤트 수정</h3>
    <form enctype="multipart/form-data" method="post" action="eventModifyOk">
      <input type="hidden" name="id" value="${edto.id}">
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
              <td><input type="text" name="title" id="title" value="${edto.title}"></td>
            </tr>
            <tr>
              <th>내용</th>
            </tr>
            <tr>
              <td>
                <textarea name="content" id="content" >${edto.content}</textarea>
              </td>
            </tr>
            <tr>
              <th>
                첨부파일
                <span class="fileBtn"><input id="fileAdd" type="button" value=""><input id="fileDel" type="button" value=""></span>
              </th>
            </tr>
            <tr>
              <td>
                <div id="fileList">
                  <!-- 기존 파일 목록 -->
                  <c:forEach var="file" items="${fileList}">
                    <p>
                      <a href="/static/temp/event/${file}" target="_blank">${file}</a>
                      <button type="button" class="btnRemove">삭제</button>
                      <!-- 기존 파일을 hidden으로 전송 -->
                      <input type="hidden" name="fileOri" value="${file}">
                    </p>
                  </c:forEach>
                  <!-- 새 파일 추가 영역 -->
                  <!-- <input type="file" name="" id=""> -->
                </div>
              </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="btnWrap">
        <a class="btn02" href="/admin/adminEvent">취소</a>
        <input class="btn01" type="submit" value="저장">
      </div>
    </form>
  </div>
</body>
</html>