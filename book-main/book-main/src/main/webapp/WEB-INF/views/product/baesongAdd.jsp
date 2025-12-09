<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/baesongAdd.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  function juso_search()
  {
    document.pkc.style.display="none";
    
    var container=document.getElementById('postcodeContainer');
    container.style.display="block";
    new daum.Postcode({
      oncomplete:function(data){
        if(data.userSelectedType=='R') {
        	addr=data.jibunAddress;
        } else {
           addr=data.jibunAddress;
        	
        }
    	  document.pkc.zip.value=data.zonecode;
    	  document.pkc.juso.value=addr;
    	  document.pkc.style.display="block";
    	  document.pkc.jusoEtc.focus();
    	  container.style.display='none';
       
      }	,
      width:'100%',height:'500px',autoClose:true
    }).embed(container);
  }
</script>
</head>
<body>
<section>
  <form name="pkc" method="post" action="baesongAddOk">
    <h3 align="center"> 목 록 </h3>
    <div> <input type="text" name="name" placeholder="받는 사람"> </div>
    <div>
      <input type="text" name="zip" id="zip" placeholder="우편번호" readonly>
      <input type="button" value="주소찾기" onclick="juso_search()">
    </div>
    <div> <input type="text" name="juso" placeholder="주 소" readonly> </div>
    <div> <input type="text" name="jusoEtc" placeholder="상세 주소"> </div>
    <div> <input type="text" name="phone" placeholder="전화번호"> </div>
    <div>
      <select name="req">
        <option value="0"> 문 앞 </option>
        <option value="1"> 직접수령 </option>
        <option value="2"> 경비실 </option>
        <option value="3"> 택배함 </option>
        <option value="4"> 기 타 </option>
      </select>
    </div>
    <c:if test="${not chkBae}">
    <div>
      <label> 
      <input type="checkbox" name="gibon" value="1">
      기본 배송지로 선택
      </label>
    </div>
    </c:if>
    <div> <input type="submit" value="배송지 등록"> </div>
   
  </form>
   <div id="postcodeContainer" style="display:none"></div>
</section>
</body>
</html>