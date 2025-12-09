<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- <title>admin</title> -->
  <link rel="stylesheet" href="../static/css/admin.css">
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
  </script>
</head>
<body>
  <div id="register" class="inner">
    <h3 class="page">공지사항 등록</h3>
    <form method="post" action="noticeRegisterOk" enctype="multipart/form-data">
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
              <td><input type="text" placeholder="제목을 입력해주세요" name="title" id="title"></td>
            </tr>
            <tr>
              <th>내용</th>
            </tr>
            <tr>
              <td>
                <textarea name="content" id="content" ></textarea>
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
                  <!-- <input type="file" name="file1"> -->
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="btnWrap">
        <a href="/admin/adminNotice" class="btn02">취소</a>
        <input type="submit" value="저장" id="submit" class="btn01">
      </div>
    </form>
  </div>
</body>
</html>