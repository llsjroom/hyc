<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/productContent.css">
<script>
  function upSu()
  {
    var su=parseInt(document.getElementById("su").value);
    if(su<10)
    {
      su++;
      document.getElementById("su").value=su;
    }
    updatePrice();
  }
  
  function downSu()
  {
    var su=parseInt(document.getElementById("su").value);
    if(su>1)
    {
      su--;
      document.getElementById("su").value=su;
    }
    updatePrice();
  }

  /* 최종 가격 표시 */
  function updatePrice() {
    var price = ${pdto.price};
    var halin = ${pdto.halin};

    var su = parseInt(document.getElementById("su").value);
    if (su < 1) su = 1;

    var discountedPrice = price - (price * halin / 100);
    var total = discountedPrice * su;

    // 숫자 포맷 (천 단위 콤마)
    var formatted = total.toLocaleString();

    document.getElementById("totalPrice").innerHTML = formatted+"<span> 원</span>";
  }
  
  function selMenu(my)
  {
    var subMenu=document.getElementsByClassName("subMenu");
    for(i=0;i<subMenu.length;i++)
    {
      subMenu[i].classList.remove("now");
    }
    my.classList.add("now");
  }
  
  function jjimOk()
  {
    <c:if test="${userid==null}">
      location="../login/login";
    </c:if>
    <c:if test="${userid!=null}">
    
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="1")
      {
        document.getElementById("jImg").src="../static/jjim2.png";
        document.getElementById("jImg").setAttribute("onclick","jjimDel()");
      }
      else
      {
        alert("잠시후 시도해주세요");
      }
    }
    chk.open("get","jjimOk?pcode=${pdto.pcode}");
    chk.send();
    </c:if>
  }
  
  function jjimDel()
  {
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      if(chk.responseText=="1")
      {
        document.getElementById("jImg").src="../static/jjim1.png";
        document.getElementById("jImg").setAttribute("onclick","jjimOk()");
      }
      else
      {
        alert("잠시후 시도해주세요");
      }
    }
    chk.open("get","jjimDel?pcode=${pdto.pcode}");
    chk.send();
  }
  
  function addCart()
  {
	  var su = document.getElementById("su").value;

	    var chk = new XMLHttpRequest();
	    chk.onload = function() {
	        if (chk.responseText == "1") {
	            // 장바구니 메시지 보이기
	            document.getElementById("cartMsg").style.visibility = "visible";

	            // 3초 후 메시지 숨기기
	            setTimeout(function() {
	                document.getElementById("cartMsg").style.visibility = "hidden";
	            }, 3000);

	            // getCartNum() 호출 제거
	        } else {
	            alert("잠시후 시도해주세요");
	        }
	    };

	    // 장바구니 추가 요청
	    chk.open("GET", "addCart?pcode=${pdto.pcode}&su=" + su);
	    chk.send();
	}
  function viewCookie()
  {
    var chk=new XMLHttpRequest();
    chk.onload=function()
    {
      document.getElementById("cook").innerText=chk.responseText;
    }
    chk.open("get","viewCookie");
    chk.send();
  }
  
  
  function reviewUp(id,title,content)
  {
	  const mask=document.createElement("div");
    mask.className="mask";
    document.getElementById("reviewUpForm").after(mask);
    document.getElementById("reviewUpForm").style.visibility = "visible";
    document.body.classList.add("noScroll");
    
    var w=window.innerWidth;
    var h=window.innerHeight;
    
    w=w/2;
    h=h-165;
    
    document.uform.id.value=id;
    document.uform.title.value=title;
    document.uform.content.value=content.replace(/<br/g,"\r");
  }
  function reviewClose()
  {
    document.body.classList.remove("noScroll");
    document.getElementById("reviewUpForm").style.visibility="hidden";
    document.querySelector(".mask").remove();
  }
  
  function inquiryView()
  {
    const mask=document.createElement("div");
    mask.className="mask";
    document.getElementById("inquiryForm").after(mask);
    document.getElementById("inquiryForm").style.visibility = "visible";
    document.body.classList.add("noScroll");
  }
  function inquiryClose()
  {
    document.body.classList.remove("noScroll");
    document.getElementById("inquiryForm").style.visibility="hidden";
    document.querySelector(".mask").remove();
  }

  
  function numCheck(len)
  {
    document.getElementById("num").innerText=len;
  }
  
  window.onscroll=function()
  {
    var top=document.documentElement.scrollTop;
    
    document.querySelector("#menuUl>li.now")?.classList.remove("now");

    var h1=document.querySelector("#content").getBoundingClientRect().top - 150;
    var h2=document.querySelector("#review").getBoundingClientRect().top - 150;
    var h3=document.querySelector("#inquiry").getBoundingClientRect().top - 150;
    var h4=document.querySelector("#guide").getBoundingClientRect().top - 150;
    if (h2 > 0) {
      document.querySelector("#menuUl>li:nth-child(1)").classList.add("now");
    }
    else if (h3 > 0) {
      document.querySelector("#menuUl>li:nth-child(2)").classList.add("now");
    }
    else if (h4 > 0) {
      document.querySelector("#menuUl>li:nth-child(3)").classList.add("now");
    }
    else {
      document.querySelector("#menuUl>li:nth-child(4)").classList.add("now");
    }
  }
  
  function chgImg(src)
  {
    document.getElementById("mainPimg").src=src;
  }
  
  function commentInquiry() 
  {
    
  }
  function commentClose(boxId) 
  {
    document.getElementById(boxId).classList.remove("show");
  }
  
  function delComment(id)
  {
    if(confirm("정말 삭제하시겠습니까?"))
    {
      var chk=new XMLHttpRequest();
      chk.open("POST","/product/delComment");
      chk.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      chk.onload=function()
      {
        if(chk.responseText=="1")
        {
        	alert("삭제되었습니다");
        	location.reload();
        }
        else
        {
          alert("잠시후 시도해주세요");
        };
        
      }
      chk.send("id="+id); 
    }
  }
  
</script>
</head>
<body>
  <section id="productContent">
    <div class="topBox inner">
      <div class="imgBox">
        <img id="mainPimg" src="../static/temp/product/${pimgs[0]}" alt="큰사진">
        <ul id="subImages">
          <c:forEach items="${pimgs}" var="pimg">
          <li><img onclick="chgImg(this.src)" src="../static/temp/product/${pimg}" alt="작은사진"></li>
          </c:forEach>
        </ul>
      </div>
      <div class="infoBox">
        <div class="titBox">
          <h3 class="tit">${pdto.title}</h3>
          <c:if test="${ok==0}">
            <img id="jImg" onclick="jjimOk()" src="../static/jjim1.png">
          </c:if>
          <c:if test="${ok==1}">
            <img id="jImg" onclick="jjimDel()" src="../static/jjim2.png">
          </c:if>
        </div>
        <div class="hprice">
          <span class="discount"> ${pdto.halin}% </span>
          <div class="price">
            <strong class="disPrice"><fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/><span>원</span></strong>
            <span id="oriPrice"><fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/></span>
          </div>
        </div>
        <dl class="info">
          <dt>혜택안내</dt>
          <dd>
            <div id="juk">
              적립금 : <fmt:formatNumber value="${pdto.price*pdto.juk/100}" type="number" pattern="#,###"/>원
            </div>
          </dd>
        </dl>
        <dl class="info">
          <dt>배송정보</dt>
          <dd>
            <div id="baesongStr">배송안내 : ${pdto.baesongStr}</div>
            <div>
              배송비 : 
              <c:if test="${pdto.baeprice != 0}">
                <span id="baeprice"><fmt:formatNumber value="${pdto.baeprice}" type="number" pattern="#,###"/>원</span>
              </c:if>
              <c:if test="${pdto.baeprice==0}">
                <span id="baeprice"> 무료배송 </span>
              </c:if>
            </div>
          </dd>
        </dl>
        <div id="gumae">
          <form method="post" action="productGumae">
            <input type="hidden" name="pcodes" value="${pdto.pcode}">
            <div id="cartMsg">
              <p>장바구니에 담았습니다.</p>
              <input class="btn01" type="button" value="장바구니 이동" onclick="location='../member/cartView'">
            </div>
            <div class="total">
              <div id="number">
                <span class="minus" onclick="downSu()"></span>
                <input type="text" name="sus" value="1" id="su" readonly>
                <span class="plus" onclick="upSu()"></span>
              </div>
              <div id="totalPrice">
                <fmt:formatNumber value="${pdto.price-(pdto.price*pdto.halin/100)}" type="number" pattern="#,###"/>
                <span>원</span>
              </div>
            </div>
            <div class="btnWrap">
              <input class="btn04" type="button" value="장바구니" onclick="addCart()">
              <input class="btn01" type="submit" value="구매하기">
            </div>
          </form>
        </div>
      </div>
    </div>
    
    <!--  상품 그림,정보,상세,평,문의,교환/반품 -->
    <div id="menu"><!-- 책 상세 밑에 -->
      <ul id="menuUl" class="inner">
        <li onclick="selMenu(this)" class="subMenu"> <a href="#content"> 상품상세 </a>
        <li onclick="selMenu(this)" class="subMenu"> <a href="#review"> 리뷰 </a>
        <li onclick="selMenu(this)" class="subMenu"> <a href="#inquiry"> 문의 </a>
        <li onclick="selMenu(this)" class="subMenu"> <a href="#guide"> 배송/교환/반품 </a>
      </ul>
    </div>
    
    <div id="content" class="inner secView"> <!-- 상세페이지 -->
      <h3 class="secTit">상품상세<span id="aaa"></span></h3> <br/>
      <c:if test="${pdto.dimg != null && fn:length(pdto.dimg) > 0}">
        <img src="../static/temp/product/${pdto.dimg}" width="1100">
      </c:if>
      <c:if test="${pdto.dimg == null || fn:length(pdto.dimg) == 0}">
        이미지가 없습니다.
      </c:if>
    </div>
    
    <div id="review" class="inner secView">
      <div id="reviewUpForm" class="reviewUpForm">
        <form name="uform" method="post" action="reviewUpOk">
          <input type="hidden" name="id">
          <input type="hidden" name="pcode" value="${pdto.pcode}">
          <h3> 리뷰 수정 </h3> <!-- 수정필요 -->
          <div class="inputBox">
            <input type="text" name="title" id="title">
            <textarea name="content" id="reviewContent"></textarea>
          </div>
          <input class="btn01" type="submit" value="수정하기">
        </form>
        <input class="btnClose" type="button" value="닫기" onclick="reviewClose();">
      </div>
    
      <div id="reviewHeader">
        <span id="reviewLabel"><h3>리뷰</h3></span>
        <span id="star">(${pdto.review})</span>
      </div>
      <c:forEach items="${rlist}" var="rdto">
        <div class="reviewList">
          <div class="listUser">
            ${rdto.userid2}
            <span>${rdto.writeday.substring(0, 10)}</span>
          </div>
          <div class="reviewBox">
            <div class="listTit"><b>${rdto.title}</b></div>
            <div class="listCont">${rdto.content}</div>
            <div class="btnWrap">
              <c:if test="${userid == rdto.userid}">
                <a class="btn04" href="javascript:reviewUp(${rdto.id},'${rdto.title}','${rdto.content}')"> 수정 </a>
                <a class="btn02" href="reviewDel?id=${rdto.id}&gid=${rdto.gid}&pcode=${pdto.pcode}">삭제</a>
              </c:if>
              <c:if test="${userid!=rdto.userid && userid!='admin'}">
                <span class="btn02">신고하기</span> 
              </c:if>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>

    <!-- 상품 평 -->
    <div id="inquiry" class="inner secView">
      <h3 class="secTit">
        문의
        <c:if test="${userid!='admin'}">
          <input class="btn02" type="button" value="문의하기" class="inquiryBtn" onclick="inquiryView()">
        </c:if>
      </h3>
      
      <ul id="inquiryList">
        <c:forEach items="${ilist}" var="idto">
          <c:choose>
            <c:when test="${idto.qna==1}">
              <li>
                <span class="label01">질문</span>
                <div class="inquiryBox">
                  <div class="top">
                    <span class="user">${idto.userid}</span>
                    <span class="title">${idto.title}</span>
                  </div>
                  <div class="cont">${idto.content}</div>
                  <p class="date">${fn:substring(idto.writeday,0,10)}</p>
                </div>
              </li>
              <!-- 문의글 답변 입력 -->
              <c:if test="${ (!idto.chkAnswer && userid == 'admin') && idto.qna==1}">
                <li  class="reply">
                <form id="aform_${idto.id}" method="post" action="answer">
                  <input type="hidden" name="ref" value="${idto.id}">
                  <input type="hidden" name="pcode" value="${pdto.pcode}">
                  <input type="hidden" name="qna" value="2">
                  <c:if test="${!idto.chkAnswer}">
                  <div id="commentBox_${idto.id}">
                    <textarea name="answer" placeholder="답글을 입력하세요"></textarea>
                    <input type="submit" class="btn01" value="저장">
                  </div>
                  </c:if>
                </form>
                </li>
              </c:if>
              <!-- // 문의글 답변 입력 -->
            </c:when>
            <c:when test="${idto.qna==2}">
              <li class="reply">
                <span class="label02">답변</span>
                <div class="inquiryBox">
                  <div class="top">
                    <span class="title">${idto.title}</span>
                    <!-- 답변 삭제 버튼: 관리자만 -->
                    <c:if test="${userid=='admin'}">
                      <input class="btn02" type="button" value="삭제" onclick="delComment(${idto.id})">
                    </c:if>
                  </div>
                  <div class="cont">${idto.content}</div>
                  <p class="date">${fn:substring(idto.writeday,0,10)}</p>
                </div>
                <c:if test="${ (!idto.chkAnswer && userid == 'admin')}">
              </c:if>
              </li>
            </c:when>
          </c:choose>
        </c:forEach>
      </ul>
      
      <!-- 문의란 -->
      <div id="inquiryForm">
        <form method="post" action="inquiryOk">
          <input type="hidden" name="pcode" value="${pdto.pcode}">
          <h3> ${pdto.title} </h3>
          <div class="inputBox">
            <textarea name="content" maxlength="200" onkeyup="numCheck(this.value.length)"></textarea>
            <p>(<span id="num">0</span>) : 200자 내</p>
          </div>
          <input class="btn01" type="submit" value="문의저장">
        </form>
        <input class="btnClose" type="button" value="닫기" onclick="inquiryClose();">
      </div>
    </div>
    
    <div id="guide" class="inner secView">
      <h3 class="secTit">배송/교환/반품</h3>
      <img src="../static/change.png" width="1100">
    </div>
  </section>

</body>
</html>