<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>book register</title>
  <link rel="stylesheet" href="../static/css/regist.css">
  <script>

    function getSo(daecode)
    {
      var chk=new XMLHttpRequest();
      chk.onload=function()
      {
        var sos=JSON.parse(chk.responseText);
        document.pform.so.options.length=sos.length+1;
        var i=1;
        for(so of sos)
        {
          document.pform.so.options[i].value=so.code;
          document.pform.so.options[i].text=so.name;
          i++;
        }
      }
      chk.open("get","getSo?daecode="+daecode);
      chk.send();
    }
    
    function getPcode()
    {
      var dae=document.pform.dae.value;
      var so=document.pform.so.value;
      
      var pcode=dae+so;
      
      var chk=new XMLHttpRequest();
      chk.onload=function()
      {
        // alert(chk.responseText); //확인용(3자리)
        pcode=pcode+chk.responseText.trim();
        document.pform.pcode.value=pcode;
      }
      chk.open("get","getPcode?pcode="+pcode);
      chk.send();
    }
    
    function formatNumber(input)
    {    
      let num=input.value.replace(/[^0-9]/g, ''); // 입력값에서 숫자만 추출
    if (num == '') 
    {
      document.getElementById('priceDisplay').textContent = '';
    
    }
        var comma=num.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 숫자를 3자리마다 콤마 찍기    
      document.getElementById('priceDisplay').textContent=comma+"원"; // 원 붙이기
    }
    
    function formatNumber2(input)
    {    
      let num=input.value.replace(/[^0-9]/g, ''); // 입력값에서 숫자만 추출
    if (num == '') 
    {
      document.getElementById('priceDisplay2').textContent = '';
    
    }
        var comma=num.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 숫자를 3자리마다 콤마 찍기    
      document.getElementById('priceDisplay2').textContent=comma+"원"; // 원 붙이기
    }

  </script>
</head>
<body>
  <div id="registBook" class="inner">
    <h3 class="page">상품 등록</h3>
    <form name="pform" method="post" action="/regist/registBookOk" enctype="multipart/form-data">
      <div class="tableBg">
        <table class="table01">
          <tbody>
            <tr>
              <th>상품코드</th>
            </tr>
            <tr>
              <td>
                <div class="flexBox">
                  <select name="dae" onchange="getSo(this.value)">
                    <option value="">대분류</option>
                    <c:forEach items="${dlist}" var="ddto"> <!-- daeDto -->
                    <option value="${ddto.code}">${ddto.name} </option>
                    </c:forEach>
                  </select>
                  <select name="so">
                    <option value="">소분류</option>
                    <c:forEach items="${slist}" var="sdto"> <!-- daeDto -->
                    <option value="${sdto.code}">${sdto.name} </option>
                    </c:forEach>
                  </select>
                  <input class="btn01" type="button" onclick="getPcode()" value="코드생성">
                  <input type="text" name="pcode" readonly>
                </div>
              </td>
            </tr>
            <tr>
              <th>상품 이름</th>
            </tr>
            <tr>
              <td> <input type="text" name="title" placeholder="100자 내"> </td>
            </tr>
            <tr>
              <th>상품 사진</th>
            </tr>
            <tr>
              <td>
                <div class="flexBox">
                  <input type="file" name="pimg1">
                  <input type="file" name="pimg2">
                  <input type="file" name="pimg3">
                </div>
              </td>
            </tr>
            <tr>
              <th>상세 사진</th>
            </tr>
            <tr>
              <td>
                <input type="file" name="dimgEx">
              </td>
            </tr>
            <tr>
              <th>상품 가격</th>
            </tr>
            <tr>
              <td> 
                <input type="text" name="price" oninput="formatNumber(this)"/>
                <span id="priceDisplay" style="margin-left:10px; color:gray"></span>
              </td>
            </tr>
            <tr>
              <th>할인율(%단위)</th>
            </tr>
            <tr>
              <td> <input type="text" name="halin"> </td>
            </tr>
            <tr>
              <th>상품 수량</th>
            </tr>
            <tr>
              <td> <input type="text" name="su"> </td>
            </tr>
            <tr>
              <th>배송비</th>
            </tr>
            <tr>
              <td> 
                <input type="text" name="baeprice" oninput="formatNumber2(this)"/> 
                <span id="priceDisplay2" style="margin-left:10px; color:gray"></span>
              </td>
            </tr>
            <tr>
              <th>배송 기간</th>
            </tr>
            <tr>
              <td> <input type="text" name="baeday"> </td>
            </tr>
            <tr>
              <th>적립률(%단위)</th>
            </tr>
            <tr>
              <td> <input type="text" name="juk"> </td>
            </tr>
          </tbody>
        </table>
      </div>
      
      <div class="btnWrap">
        <input class="btn01" type="submit" value="상품등록">
      </div>
    </form>
  </div>
  
</body>
</html>