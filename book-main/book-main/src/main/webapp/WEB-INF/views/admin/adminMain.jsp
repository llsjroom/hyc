<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Main</title>
  <link rel="stylesheet" href="../static/css/admin.css">
  <script>

  </script>
</head>
<body>
  <div id="admin" class="inner">
    <div class="tab now">
      <a class="tabTit" href="">상품(도서)</a> 
      <ul class="tabList">
        <li><a href="/regist/registProduct">상품 목록</a></li>
        <li><a href="/regist/registBook">상품 등록</a></li>
        <li><a href="/admin/adminOrder">상품 상태변경</a></li>
        <li><a href="/admin/adminInquiry">문의 답변</a></li>
      </ul>
    </div>
    <div class="tab">
      <a class="tabTit" href="">회원</a>
      <ul class="tabList">
        <li><a href="/admin/adminUser">회원 목록</a></li>
      </ul>
    </div>
    <div class="tab">
      <a class="tabTit" href="">공지사항</a>
      <ul class="tabList">
        <li><a href="/admin/adminNotice">공지사항 목록</a></li>
        <li><a href="/admin/noticeRegister">공지사항 등록</a></li>
      </ul>
    </div>
    <div class="tab">
      <a class="tabTit" href="">이벤트</a>
      <ul class="tabList">
        <li><a href="/admin/adminEvent">이벤트 목록</a></li>
        <li><a href="/admin/eventRegister">이벤트 등록</a></li>
      </ul>
    </div>
  </div>
</body>
</html>