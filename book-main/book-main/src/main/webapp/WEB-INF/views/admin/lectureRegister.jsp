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
    <h3 class="page">작가와의 만남 등록</h3>
    <form method="post" action="lectureRegisterOk" enctype="multipart/form-data">
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
              <td colspan="2"><input type="text" placeholder="제목을 입력해주세요" name="title" id="title"></td>
            </tr>
            <tr>
              <th>기간</th>
              <th>모집인원</th>
            </tr>
            <tr>
              <td>
                <div class="dateWrap">
                  <input type="date" name="sday" id="sday">~<input type="date" name="eday" id="eday">
                  <select name="time" id="time">
                    <option value="시간선택" disabled>시간선택</option>
                    <option value="1회차">1회차</option>
                    <option value="2회차">2회차</option>
                    <option value="3회차">3회차</option>
                    <option value="4회차">4회차</option>
                  </select>
                </div>
              </td>
              <td>
                <input type="text" name="max" id="max">
              </td>
            </tr>
            <tr>
              <th>참가비</th>
              <th>도서구입비</th>
            </tr>
            <tr>
              <td>
                <input type="text" name="price01" id="price01">
              </td>
              <td>
                <input type="text" name="price02" id="price02">
              </td>
            </tr>
            <tr>
              <th colspan="2">첨부파일</th>
            </tr>
            <tr>
              <td colspan="2">
                <div id="fileList">
                  <input type="file" name="file1">
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