<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/lecture.css">
<style></style>
<script></script>
</head>
<body> <!-- lecture/reserveDone.jsp -->
  <div id="lecture" class="inner">
    <div class="reserveInfo">
      <h3>예약을 완료했습니다.</h3>
      <table>
        <colgroup>
          <col width="120px">
          <col width="*">
          <col width="120px">
          <col width="*">
        </colgroup>
        <tbody>
          <tr>
            <th>강연명</th>
            <td colspan="3">강연제목</td>
          </tr>
          <tr>
            <th>신청날짜</th>
            <td colspan="3">2025년 9월 18일 2시</td>
          </tr>
          <tr>
            <th>신청인원</th>
            <td>2명</td>
            <th>신청도서</th>
            <td>2권</td>
          </tr>
          <tr>
            <th>참가비</th>
            <td>10,000원</td>
            <th>도서구입비</th>
            <td>10,000원</td>
          </tr>
          <tr>
            <th>총 결제금액</th>
            <td colspan="3">20,000원</td>
          </tr>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="4">
              <p>* 예약변경은 취소 후, 다시 예약하시기 바랍니다.</p>
              <input type="submit" value="신청취소">
            </td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>
</body>
</html>