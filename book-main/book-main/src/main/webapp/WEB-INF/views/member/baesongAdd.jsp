<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
   section {
     width:500px;
     margin:auto;
   }
   section form div {
     width:480px;
     margin:auto;
     margin-top:8px;
   }
   section input[type=text] {
     width:460px;
     height:30px;
     border:1px solid skyblue;
   }
   section input[type=button] {
     width:93px;
     height:35px;
     vertical-align:middle;
     background:skyblue;
     color:white;
     border:1px solid skyblue;
     font-size:16px;
   }
   section input[type=submit] {
     width:466px;
     height:35px;
     background:skyblue;
     color:white;
     border:1px solid skyblue;
     font-size:16px;
   }
   section select {
     width:466px;
     height:35px;
     border:1px solid skyblue;
   }
   section input[type=checkbox] {
     border:1px solid skyblue;
     width:16px;
     height:16px;
   }
   section #zip {
     width:360px;
     height:30px;
   }
 </style>
 <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>
   function juso_search()
   {
	   document.pkc.style.display="none";
	   
	   var container = document.getElementById('postcodeContainer');
	   container.style.display="block";
	   new daum.Postcode({
		   oncomplete: function(data) {
			   if (data.userSelectedType === 'R') {
				   addr = data.roadAddress;
			   } else {
				   addr = data.jibunAddress;
			   }
			   
			   // 우편번호와 주소 정보를 해당필드에 넣는다.
			   document.pkc.zip.value = data.zonecode; // 우편번호
			   document.pkc.juso.value = addr; // 주소
			   
			   document.pkc.style.display="block";
			   
			   // 커서를 상세주소 필드로 이동한다.
			   document.pkc.jusoEtc.focus();
			   
			   // 검색결과 ui숨기기
			   container.style.display = 'none';
		   },
		   width: '100%', // 검색 ui 너비
		   height: '500px', // 검색 ui 높이
		   autoClose: true // 선택후 자동닫기
	   }).embed(container);
   }
 </script>
</head>
<body> <!-- member/baesongAdd.jsp -->
  <section>
    <form name="pkc" method="post" action="baesongAddOk">
      <h3 align="center"> 배송지 등록 </h3>
      <div> <input type="text" name="name" placeholder="배송지 받는 사람"> </div>
      <div>
        <input type="text" name="zip" id="zip" placeholder="우편번호" readonly>
        <input type="button" value="주소찾기" onclick="juso_search()">
      </div>
      <div> <input type="text" name="juso" placeholder="주소" readonly> </div>
      <div> <input type="text" name="jusoEtc" placeholder="상세주소"> </div>
      <div> <input type="text" name="phone" placeholder="전화번호"> </div>
      <div>
        <select name="req">
          <option value="0"> 문 앞 </option>
          <option value="1"> 직접받고 부재시 문 앞 </option>
          <option value="2"> 경비실 </option>
          <option value="3"> 택배함 </option>
          <option value="4"> 기 타 </option>
        </select>
      </div>
      <div>
       <label>
         <input type="checkbox" name="gibon" value="1"> 기본 배송지로 선택합니다.
       </label>
      </div>
      <div> <input type="submit" value="배송지 등록"> </div>
    </form>
    
    <div id="postcodeContainer" style="display:none"></div>
  </section>
</body>
</html>