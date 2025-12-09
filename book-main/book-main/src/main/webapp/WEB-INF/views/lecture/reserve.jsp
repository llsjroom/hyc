<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../static/css/lecture.css">
<style></style>
<script>
  document.addEventListener("DOMContentLoaded", function() {
    var reserveBtn = document.querySelectorAll(".reserveBtn");
    for (var i = 0; i < reserveBtn.length; i++) {
      reserveBtn[i].addEventListener("click", function(e) {
        e.preventDefault();

        // 날짜 넣기
        var thisDay = this.getAttribute("data-date");
        document.getElementById("reserveDay").innerText = thisDay;
        document.getElementById("reserveDayInput").value = thisDay;

        // 회차 넣기
        var times = this.getAttribute("data-time").split(",");
        var maxPerTime = parseInt(this.getAttribute("data-max"));
        var reservedPerTime = parseInt(this.getAttribute("data-reserved"));

        var select = document.getElementById("timeSelect");
        select.innerHTML = "";

        for (var j = 0; j < times.length; j++) {
          var option = document.createElement("option");
          option.value = times[j];
          option.text = times[j]+"회차";

          // 예약마감이면 disabled
          if (reservedPerTime >= maxPerTime) option.disabled = true;

          select.appendChild(option);
        }

        // 첫 번째 활성화 옵션 hidden input에 세팅
        for (var k = 0; k < select.options.length; k++) {
          if (!select.options[k].disabled) {
            select.selectedIndex = k;
            // document.getElementById("reserveTimeInput").value = select.options[k].value;
            break;
          }
        }

        // select 변경 시 hidden input 값 업데이트
        select.onchange = function() {
          document.getElementById("reserveTimeInput").value = this.value;
        };
      });
    }
  });
  
</script>
</head>
<body> <!-- lecture/lectureCal.jsp -->
  <div id="lecture" class="inner">
    <form method="post" action="/lecture/reserveOk">
      <input type="hidden" name="lecture_id" value="${ldto.id}">
      <input type="hidden" name="userid" value="${userid}">
      <div class="calwrap">
        <div class="info">
          <h3>${ldto.title}</h3>
          <img src="/static/temp/lecture/${ldto.limg}" alt="">
        </div>  
        <div class="calendar">
          <div class="top">
            <a href="reserve?year=${year}&month=${month-1}">◀ 이전 달</a>
            <b>${year}년 ${month}월 </b>
            <a href="reserve?year=${year}&month=${month+1}">다음 달 ▶</a>
          </div>
          <div class="cal">
            <table>
              <colgroup>
                <col width="100px">
                <col width="100px">
                <col width="100px">
                <col width="100px">
                <col width="100px">
                <col width="100px">
                <col width="100px">
              </colgroup>
              <thead>
                <tr>
                  <th class="sat">sat</th>
                  <th>mon</th>
                  <th>tue</th>
                  <th>wen</th>
                  <th>thu</th>
                  <th>fri</th>
                  <th class="sun">sun</th>
                </tr>
              </thead>
              <tbody>
                <c:set var="day" value="1"/>
                <c:forEach begin="1" end="${week}" var="i">
                  <tr>
                    <c:forEach begin="0" end="6" var="j">
                      <c:if test="${(i==1 && j<days) || day>fullDay}">
                        <td></td>
                      </c:if>
                      <c:if test="${!((i==1 && j<days) || day>fullDay)}">
                        <td class="${j==0 ? 'sat' : (j==6 ? 'sun' : '')}">
                          <b>${day}</b>
                          <!-- <div class="status">
                            < !-- 예약가능하면 -- >
                            <a href="">예약가능</a>
                            < !-- 예약마감이면 -- >
                            <span>예약마감</span>
                            <p><i>30</i>/${ldto.max}</p>
                          </div> -->
                          <div class="status">
                            <c:choose>
                              <c:when test="${reserved lt totalMax}">
                                <c:set var="timeNum" value="${fn:replace(ldto.time,'회차','')}" />
                                <c:set var="timeList" value="" />
                                <c:forEach begin="1" end="${timeNum}" var="t">
                                    <c:set var="timeList" value="${timeList}${t},"></c:set>
                                </c:forEach>
                                <c:set var="timeList" value="${fn:substring(timeList,0,fn:length(timeList)-1)}" /> <!-- 마지막 ',' 제거 -->

                                <fmt:formatNumber value="${month}" pattern="00" var="month" />
                                <fmt:formatNumber value="${day}" pattern="00" var="day" />
                                <input type="button" class="reserveBtn" 
                                      data-date="${year}-${month}-${day}" 
                                      data-time="${timeList}" 
                                      data-max="${ldto.max}" 
                                      value="예약가능">
                              </c:when>
                              <c:otherwise>
                                <span>예약마감</span>
                              </c:otherwise>
                            </c:choose>
                            <c:set var="timeNum" value="${fn:replace(ldto.time, '회차', '')}" />
                            <p><i>${reserved}</i> / ${ldto.max * timeNum}</p>
                          </div>
                        </td>
                        <c:set var="day" value="${day+1}"/>
                      </c:if>
                    </c:forEach>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>

      <input type="hidden" name="date" id="reserveDayInput">
      <input type="hidden" name="time" id="reserveTimeInput">

      <!-- 예약정보 -->
      <div class="reserveInfo">
        <table>
          <colgroup>
            <col width="120px">
            <col width="*">
            <col width="120px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th>예약날짜</th>
              <td><span id="reserveDay">예약날짜를 선택해주세요</span></td>
              <th>예약시간</th>
              <td>
                <select id="timeSelect" name="time"></select>
              </td>
            </tr>
            <tr>
              <th>참석인원</th>
              <td>
                <select name="people">
                  <option value="1">1명</option>
                  <option value="2">2명</option>
                  <option value="3">3명</option>
                  <option value="4">4명</option>
                </select>
              </td>
              <th>도서구매</th>
              <td>
                <select name="book">
                  <option value="1">1권</option>
                  <option value="2">2권</option>
                  <option value="3">3권</option>
                  <option value="4">4권</option>
                </select>
              </td>
            </tr>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="4">
                <p>위 내용으로 신청하시겠습니까?</p>
                <input type="submit" value="신청완료">
              </td>
            </tr>
          </tfoot>
        </table>
      </div>
    </form>
  </div>
</body>
</html>