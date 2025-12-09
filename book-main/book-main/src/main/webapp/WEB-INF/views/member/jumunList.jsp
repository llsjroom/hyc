<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/member.css">
<style>
  table td span + .btnWrap {
    margin-top: 10px;
  }
</style>
 <script>
   function calEx(y,m,n)
   {
	  if(!y)
	   {
		   var today=new Date();
		   y=today.getFullYear();
		   m=today.getMonth();
	   }
	   
	   if(m==-1)
	   {
		   y--;
		   m=11;
	   }
	   
	   if(m==12)
	   {
		   y++;
		   m=0;
	   }
	   
	   var xday=new Date(y,m,1);
	   
	   var yoil=xday.getDay();
	   
	   var months=[31,28,31,30,31,30,31,31,30,31,30,31];
	   
	   var chong=months[m];
	   
	   if(m==1)
	   {
		   if( (y%4==0 && y%100!=0) || y%400==0)
			   chong++;
	   }
	   
	  var ju=Math.ceil((chong+yoil)/7);
	   
	  var cal="<div id='calEx'>";
    cal=cal="  <table> ";
    cal=cal+"    <caption>";
    cal=cal+"    <div class='topBox'>";
    cal=cal+"      <a class='prevB' href='javascript:calEx("+y+","+(m-1)+","+n+")'></a> ";
    cal=cal+       y+"년 "+(m+1)+"월";
    cal=cal+"      <a class='nextB' href='javascript:calEx("+y+","+(m+1)+","+n+")'> </a> ";
    cal=cal+"    </div>";
    cal=cal+"    </caption>";
    cal=cal+"    <colgroup><col width='*'></colgroup>";
    cal=cal+"    <thead> ";
    cal=cal+"      <tr> ";
    cal=cal+"        <th> 일 </th> ";
    cal=cal+"        <th> 월 </th> ";
    cal=cal+"        <th> 화 </th> ";
    cal=cal+"        <th> 수 </th> ";
    cal=cal+"        <th> 목 </th> ";
    cal=cal+"        <th> 금 </th> ";
    cal=cal+"        <th> 토 </th> ";
    cal=cal+"      </tr>";
    cal=cal+"    </thead> ";
    cal=cal+"    </tbody> ";
    var day=1;
    for(i=0;i<ju;i++)
    {
      cal=cal+" <tr> ";
      
      for(j=0;j<7;j++)
      {
        if( (j<yoil && i==0) || day>chong)
        {
          cal=cal+" <td> </td>";
        }
        else
          {
            cal=cal+" <td onclick='sendNalja("+y+","+m+","+day+","+n+")'> "+day+" </td> ";
            
            day++;
          }
      }
      
      cal=cal+"   </tr> ";
    }

    cal=cal+"    </tbody> ";
    cal=cal+"  </table>";
    cal=cal+"</div>";
    document.getElementById("calendar").classList.add("show");
    document.getElementById("calendar").innerHTML=cal;
   }
   
   function sendNalja(y,m,d,n)
   {
	   var nalja=document.getElementsByClassName("nalja");
	   
	   m=m+1;
	   m=m+"";
	   m=m.padStart(2,"0");
	   
	   d=d+"";
	   d=d.padStart(2,"0");
	   
	   var imsi=y+"-"+m+"-"+d;
	   
	   nalja[n].value=imsi;
	   
	   var first=nalja[0].value;
	   var second=nalja[1].value;
	   if( !(first=="" || second=="") )
	   {
		   var aday=new Date(first);
		   var bday=new Date(second);
		   
		   if(aday>bday)
		   {
			   alert("시작일이 최종일 보다 이후 날짜입니다");
			   nalja[n].value="";
		   }
	   }
	   
	   document.getElementById("calendar").innerHTML="";
     document.getElementById("calendar").classList.remove("show");
   }
   
   function chgState(id,state)
   {
	   var chk=new XMLHttpRequest();
	   chk.onload=function()
	   {
		   if(chk.responseText=="1")
			   location.reload();
		   else
			   alert("오류발생");
	   }
	   chk.open("get","chgState?id="+id+"&state="+state);
	   chk.send();
   }
 </script>
</head>
<body> <!-- member/jumunList.jsp -->
  <section id="list" class="inner cartWrap">
    <h3 class="page">주문 내역</h3>
    <div class="calBox">
      <div id="calendar"></div>
      <div class="btnWrap">
        <input class="btn04" type="button" value="3개월" onclick="location='jumunList?month=3'">
        <input class="btn04" type="button" value="6개월" onclick="location='jumunList?month=6'">
        <input class="btn04" type="button" value="12개월" onclick="location='jumunList?month=12'">
      </div>
      <form method="get" action="jumunList">
       <input type="hidden" name="month" value="1">
       <input type="text" class="nalja" readonly autocomplete="off" name="start" onclick="calEx(0,0,0)" placeholder="시작일">
       <input type="text" class="nalja" readonly autocomplete="off" name="end" onclick="calEx(0,0,1)" placeholder="최종일">
       <input class="btn01" type="submit" value="기간검색">
      </form>
    </div>
    <table>
      <colgroup>
        <col width="150px">
        <col width="150px">
        <col width="*">
        <col width="300px">
      </colgroup>
      <thead>
        <tr>
          <th>주문일</th>
          <th colspan="2">상품</th>
          <th>이름</th>
          <th>주문상태</th>
        </tr>
      </thead>
      <tbody>
        <c:choose>
          <c:when test="${not empty mapAll}">
            <c:forEach items="${mapAll}" var="map">
              <tr>
                <td>${map.writeday} </td>
                <td><img src="../static/temp/product/${map.pimg}" width="70"> </td>
                <td>${map.title} </td>
                <td>${map.name} </td>
                <td>
                  <c:if test="${map.state==0 || map.state==1}">
                    <div class="btnWrap">
                      <input class="btn02" type="button" value="취소신청" onclick="chgState(${map.gid},2)">
                    </div>
                  </c:if>
                  <c:if test="${map.state==2}">
                    <span> 취소 신청중</span>
                  </c:if>
                  <c:if test="${map.state==3}">
                    <span> 취소 완료</span>
                  </c:if>
                  <c:if test="${map.state==4}">
                    <span> 배송중 </span>
                  </c:if>
                  <c:if test="${map.state==5}">
                    <span> 배송완료 </span>
                    <div class="btnWrap">
                      <input class="btn01" type="button" value="교환신청" onclick="chgState(${map.gid},8)">
                      <input class="btn02" type="button" value="반품신청" onclick="chgState(${map.gid},6)">
                      <c:if test="${map.review==1}">
                        <input class="btn01" type="button" disabled value="리뷰쓰기" onclick="location='review?pcode=${map.pcode}&gid=${map.gid}'">
                      </c:if>
                      <c:if test="${map.review==0}">
                        <input class="btn01" type="button" value="리뷰쓰기" onclick="location='review?pcode=${map.pcode}&gid=${map.gid}'">
                      </c:if>
                    </div>
                  </c:if>
                  <c:if test="${map.state==6}">
                    <span> 반품 신청중 </span>
                  </c:if>
                  <c:if test="${map.state==7}">
                    <span> 반품완료 </span>
                  </c:if>
                  <c:if test="${map.state==8}">
                    <span> 교환신청중 </span>
                  </c:if>
                  <c:if test="${map.state==9}">
                    <span> 교환완료 </span>
                  </c:if>
                </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="5">
                <p class="noList">주문내역이 없습니다.</p>
              </td>
            </tr>
          </c:otherwise>
        </c:choose>
      </tbody>
    </table>
  </section>
</body>
</html>