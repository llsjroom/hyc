<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/baesongUp.css">
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
{
document.pkc.style.display="none";
  
var container = document.getElementById('postcodeContainer');
container.style.display="block";
  new daum.Postcode({
      oncomplete: function(data) {
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
            addr = data.jibunAddress;
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.pkc.zip.value = data.zonecode; // 우편번호
        document.pkc.juso.value = addr;  // 주소
        
        document.pkc.style.display="block";
        
        // 커서를 상세주소 필드로 이동한다.
        document.pkc.jusoEtc.focus();
        
        // 검색 결과 UI를 숨기기 (검색 후 다시 닫기)
        container.style.display = 'none';
        
    },
    width: '100%',  // 검색 UI의 너비
    height: '500px',  // 검색 UI의 높이
    autoClose: true  // 선택 후 자동으로 닫기
  }).embed(container);
  
  window.onload=function()
  {
    document.pkc.req.value=${bdto.req};
  }
}
</script>
</head>
<body>
<section id="baesongUp">
  <form name="pkc" method="post" action="baesongUpOk">
    <input type="hidden" name="id" value="${bdto.id}">
    <h3 class="page">배송지 수정</h3>
    <table>
      <colgroup>
        <col width="100px">
        <col width="*">
      </colgroup>
      <tbody>
        <tr>
          <th>받으실 분</th>
          <td>
            <input type="text" name="name" value="${bdto.name}" placeholder="받는 사람">
          </td>
        </tr>
        <tr>
          <th>주소</th>
          <td>
            <div class="flexBox">
              <input type="text" name="zip" id="zip" value="${bdto.zip}" placeholder="주 소" readonly>
              <input class="btn02" type="button" value="주소찾기" onclick="juso_search()">
            </div>
            <input type="text" name="juso" value="${bdto.juso}" placeholder="주 소" readonly>
            <input type="text" name="jusoEtc" value="${bdto.jusoEtc}" placeholder="상세 주소">
          </td>
        </tr>
        <tr>
          <th>연락처</th>
          <td><input type="text" name="phone" value="${bdto.phone}" placeholder="전화번호"></td>
        </tr>
        <tr>
          <th>요청사항</th>
          <td>
            <select name="req">
              <option value="0"> 문 앞 </option>
              <option value="1"> 직접수령 </option>
              <option value="2"> 경비실 </option>
              <option value="3"> 택배함 </option>
              <option value="4"> 기 타 </option>
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <c:if test="${bdto.gibon==1}">
              <c:set var="chk" value="checked"/>
            </c:if>
            <div class="flexBox start">
              <input type="checkbox" ${chk} name="gibon" value="1">기본 배송지로 선택
            </div>
          </td>
        </tr>
      </tbody>
    </table>
    <div class="btnWrap">
      <input class="btn01" type="submit" value="배송지 수정">
    </div>
  </form>
   <div id="postcodeContainer" style="display:none"></div>
</section>

</body>
</html>