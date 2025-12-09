<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/member.css">
 <style>
   /* section {
     width:800px;
     height:600px;
     margin:auto;
   }
   section table {
       border-spacing:0px;
    }
    section  table tr td {
       height:40px;
       border-bottom:1px solid skyblue;
       padding-top:6px;
       padding-bottom:6px;
    }
    section table tr:first-child td {
       border-top:2px solid skyblue;
    }
    section table tr:last-child td {
       border-bottom:2px solid skyblue;
    }
    section input[type=button] {
      height:40px;
      width:100px;
      background:skyblue;
      color:white;
    }
    ul.jumun {
    list-style: none;      / * 기본 점 없애기 * /
    padding: 0;
    margin: 20px 0 0 0;    / * 위쪽 여백 추가 * /
    text-align: center;    / * 가운데 정렬 * /
}

ul.List li {
    display: inline-block; / * 가로로 나란히 * /
    margin: 0 10px;        / * 좌우 간격 * /
}

ul.List li a {
    text-decoration: none; / * 밑줄 제거 * /
    padding: 8px 16px;     / * 버튼 패딩 * /
    background: skyblue;   / * 배경색 * /
    color: white;          / * 글자색 * /
    border-radius: 5px;    / * 둥근 모서리 * /
    transition: 0.3s;      / * 호버 효과 부드럽게 * /
}

ul.List li a:hover {
    background: deepskyblue; / * 마우스 오버 시 색 변경 * /
} */
  #couponLayer {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: white;
    border: 1px solid #ccc;
    padding: 20px;
    z-index: 9999;
    width: 500px;
    max-height: 500px;
    overflow: auto;
  }
 </style>
 
 <script>
  function mainClick(chk)
  {
    var couSub=document.getElementsByClassName("couSub");

    if(chk)
    {
      for(i=0;i<couSub.length;i++)
      {
        couSub[i].checked=true;
      }  
    }
    else
    {
      for(i=0;i<couSub.length;i++)
      {
        couSub[i].checked=false;
      }
    }
  }

  function subClick()
  {
    var couSub=document.getElementsByClassName("couSub");
    var num=0;
    for(i=0;i<couSub.length;i++)
    {
      if(couSub[i].checked)
     {
       num++;
     }
    }
    if(num==couSub.length)
    {
      document.getElementById("couMain").checked=true;
    }
    else
    {
      document.getElementById("couMain").checked=false;
    }
  }

  function couponDown2()
  {
    var couSub=document.getElementsByClassName("couSub");

    var ids="";
    for(i=0;i<couSub.length;i++)
    {
      if(couSub[i].checked)
      {
        ids=ids+couSub[i].value+",";
      }
    } 
    if(ids!="")
      location="couponDown2?ids="+ids+"&pcode=${pdto.pcode}";
  }

   // ✅ 레이어 열기
  function openCouponLayer() {
    document.getElementById("couponLayer").style.display = "block";
  }

  // ✅ 레이어 닫기
  function closeCouponLayer() {
    document.getElementById("couponLayer").style.display = "none";
  }
</script>
 </script>
</head>
<body> <!-- member/memberInfo.jsp -->
  <section id="list" class="inner">
    <h3 class="page"> 마이페이지 </h3>
    <div class="mypage">
      <div class="sec">
        <!-- <strong class="secTit">My Info</strong> -->
        <table>
          <colgroup>
            <col width="150px">
            <col width="*">
          </colgroup>
          <tbody>
            <tr>
              <th> 아이디 </th>
              <td>${bdto.userid}</td>
            </tr>
            <tr>
              <th> 이 름 </th>
              <td>${bdto.name}</td> 
            </tr> 
            <tr>
              <th> 이메일 </th>
              <td>${mdto.email}</td>
            </tr>
            <tr>
              <th> 전화번호 </th>
              <td>${bdto.phone}</td>
            </tr>
            <tr>
              <td> 주 소 </td>
              <td>${bdto.juso}</td>
            </tr>
            <tr>
              <th> 적립금</th>
              <td><fmt:formatNumber value='${mdto.juk}' type='number'/></td>
            </tr>
          </tbody>
        </table>
        <div class="btnWrap">
          <input type="button" value="회원정보수정" onclick="location='memberUpdate'" class="btn01">
        </div>
      </div>

      <div class="sec tableBg">
        <!-- <strong class="secTit">My Link</strong> -->
        <dl class="mypageLink">
          <dt>장바구니</dt>
          <dd><a href="/member/cartView?userid=${mdto.userid}" class="moveBtn">보러가기</a></dd>
        </dl>

        <dl class="mypageLink">
          <dt>주문 내용</dt>
          <dd><a href="/member/jumunList?userid=${mdto.userid}" class="moveBtn">보러가기</a></dd>
        </dl>

        <dl class="mypageLink">
          <dt>리뷰 내용</dt>
          <dd><a href="/member/reviewList?userid=${mdto.userid}" class="moveBtn">보러가기</a></dd>
        </dl>

        <dl class="mypageLink">
          <dt>문의 내용</dt>
          <dd><a href="/member/myInquiry?userid=${mdto.userid}" class="moveBtn">보러가기</a></dd>
        </dl>

        <dl class="mypageLink">
          <dt>찜 내용</dt>
          <dd><a href="/member/jjimList?userid=${mdto.userid}" class="moveBtn">보러가기</a></dd>
        </dl>
         <!-- ✅ 쿠폰목록 버튼 -->
        <dl class="couponLink">
          <dt></dt>
          <dd><a href="javascript:void(0);" onclick="openCouponLayer()" class="moveBtn">쿠폰목록</a></dd>
        </dl>

        <!-- ✅ 레이어 팝업 쿠폰 목록 -->
        <div id="couponLayer">
          <div style="text-align:right;">
            <button onclick="closeCouponLayer()" style="background:red; color:white; border:none; padding:5px 10px;">닫기</button>
          </div>
          <table width="100%">
            <caption><h3> 쿠폰 목록</h3></caption>
            <tr align="center">
              <td align="left"><input type="checkbox" id="couMain" onclick="mainClick(this.checked)"> 전체선택</td>
              <td colspan="3"><input type="button" value="쿠폰받기" onclick="couponDown2()"> </td>
            </tr>
            <tr align="center">
              <td> </td>
              <td>사용범위</td>
              <td>할인율</td>
              <td>사용기간</td>
              <td>등록일</td>
            </tr>
            <c:forEach items="${clist}" var="cdto">
              <tr align="center">
                <td><input type="checkbox" value="${cdto.id}" class="couSub" onclick="subClick()"></td>
                <td>${cdto.scopeStr}</td>
                <td>${cdto.halin}%</td>
                <c:if test="${cdto.afterDay==0}">
                  <td>${cdto.gigan}</td>
                </c:if>
                <c:if test="${cdto.afterDay!=0}">
                  <td>다운 후 ${cdto.afterDay}일</td>
                </c:if>
                <td>${cdto.writeday}</td>
              </tr>
            </c:forEach>
          </table>
          </div>
        </dl>
      </div>
    </div>
  </section>
</body>
</html>