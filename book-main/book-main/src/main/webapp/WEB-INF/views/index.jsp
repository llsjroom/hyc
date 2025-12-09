<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book</title>
<style>
  * {margin: 0; padding: 0; font-size: 14px; color: #000;}
  *:last-child {
    margin-bottom: 30px;
  }
  pre {font-family: inherit;}

  .flex {
    margin: 0 auto;
    width: 1280px;
    display: flex;
    align-items: start;
    justify-content: space-between;
  }
  .flex + .flex {
    margin-top: 30px;
  }
  .flex table + table {
    margin-top: 0;
    margin-left: 30px;
  }
  * + h3 {
    margin: 30px auto 0;
    width: 1280px;
    padding: 10px;
    font-size: 16px;
    font-weight: 700;
    text-align: left;
  }

  table {
    table-layout: fixed; 
    border-collapse: collapse;
    margin: 0 auto;
    width: 1280px;
    border-top: 2px solid #000;
    border-right: 2px solid #000;
  }
  table caption {
    padding: 10px;
    font-size: 16px;
    font-weight: 700;
    text-align: left;
  }
  table th,
  table td {
    padding: 2px 5px;
    height: 24px;
    border-bottom: 1px solid #000;
    border-left: 1px solid #000;
  }
  table th {
    background-color: #eee;
    border-bottom: 2px solid #000;
  }
  table th:first-child,
  table td:first-child {
    border-left: 2px solid #000;
  }

  table + table {
    margin-top: 30px;
  }


  table.type01 td {
    padding: 10px;
    text-align: center;
  }
  table.type01 td.arrow,
  table.type01 td.arrow + td {
    border-left: none;
  }
  table.type01 tr:only-child td {
    border-bottom: 2px solid #000;
  }

  table.type02 tr:last-child td {
    border-bottom: 2px solid #000;
  }
  table.type02 tr.last td {
    border-bottom: 2px solid #000;
  }
  table.type02 tr.last td a {
    text-decoration: underline;
  }
  table.type02 tr.last td a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>
  <!-- 시스템 구성 -->
  <table class="type01">
    <caption>시스템 구성 설계</caption>
    <colgroup>
      <col width="*">
      <col width="100px">
      <col width="*">
      <col width="100px">
      <col width="*">
      <col width="100px">
      <col width="*">
      <col width="100px">
      <col width="*">
    </colgroup>
    <tbody>
      <tr>
        <td>
          Client
          (Browser)
        </td>
        <td class="arrow">
          →
        </td>
        <td>
          Controller
        </td>
        <td class="arrow">
          →
        </td>
        <td>
          Service
        </td>
        <td class="arrow">
          →
        </td>
        <td>
          DTO
        </td>
        <td class="arrow">
          →
        </td>
        <td>
          MariaDB
        </td>
      </tr>
    </tbody>
  </table>

  <table class="type02">
    <caption>[사용자] 페이지목록</caption>
    <colgroup>
      <col width="200px">
      <col width="200px">
      <col width="200px">
      <col width="200px">
      <col width="200px">
      <col width="*">
    </colgroup>
    <thead>
      <tr>
        <th>PAGE</th>
        <th colspan="2">URL</th>
        <th>FILE</th>
        <th>BRANCH(NAME)</th>
        <th>DESCRIPTION</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>공통</td>
        <td>decorators</td>
        <td></td>
        <td>layout.jsp</td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>메인</td>
        <td>views</td>
        <td>main</td>
        <td><a href="/main/main">main.jsp</a></td>
        <td>dev03</td>
        <td>더보기 이동(dev01)</td>
      </tr>
      <tr>
        <td>로그인</td>
        <td>views</td>
        <td>user</td>
        <td><a href="/login/login">login.jsp</a></td>
        <td>dev02</td>
        <td></td>
      </tr>
      <tr>
        <td>회원가입</td>
        <td>views</td>
        <td>user</td>
        <td><a href="/member/memberInput">memberInput.jsp</a></td>
        <td>dev02</td>
        <td>회원가입</td>
      </tr>
      <tr>
        <td>마이페이지</td>
        <td>views</td>
        <td>user</td>
        <td><a href="/member/memberInfo">memberInfo.jsp</a></td>
        <td>dev02</td>
        <td>개인정보, 배송지 관리</td>
      </tr>
      <tr>
        <td>도서목록</td>
        <td>views</td>
        <td>books</td>
        <td><a href="/product/productList?pcode=A1">productList.jsp</a></td>
        <td>dev01</td>
        <td></td>
      </tr>
      <tr>
        <td>도서상세보기</td>
        <td>views</td>
        <td>books</td>
        <td><a href="/product/productContent?pcode=A101001">productContent.jsp</a></td>
        <td>dev01</td>
        <td>
          장바구니/찜 가능
          <br>{id}
        </td>
      </tr>
      <tr>
        <td>도서검색</td>
        <td>views</td>
        <td>books</td>
        <td><a href="/">layout.jsp</a></td>
        <td>dev01</td>
        <td>
          검색 결과 출력
          <br>search?sword=xxx
        </td>
      </tr>
      <tr>
        <td>주문창</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/product/productGumae">productGumae.jsp</a></td>
        <td>dev01</td>
        <td>로그인 필요/productContent에서 이동</td>
      </tr>
      <tr>
        <td>배송지 목록</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/product/baesongList">baesongList.jsp</a></td>
        <td>dev01</td>
        <td>로그인 필요</td>
      </tr>
      <tr>
        <td>배송지 추가</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/product/baesongAdd">baesongAdd.jsp</a></td>
        <td>dev01</td>
        <td></td>
      </tr>
      <tr>
        <td>배송지 수정</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/product/baesongUp">baesongUp.jsp</a></td>
        <td>dev01</td>
        <td>로그인 필요</td>
      </tr>
      <tr>
        <td>장바구니</td>
        <td>views</td>
        <td>cart</td>
        <td><a href="/member/cartView">cartView.jsp</a></td>
        <td>dev02</td>
        <td>
          조회/수정/삭제
        </td>
      </tr>
      <tr>
        <td>장바구니</td>
        <td>views</td>
        <td>cart</td>
        <td><a href="/member/jjimList">jjimList.jsp</a></td>
        <td>dev02</td>
        <td>
          찜 목록
        </td>
      </tr>
      <tr>
        <td>주문하기</td>
        <td>views</td>
        <td>order</td>
        <td><a href="/member/baesongList">baesongList.jsp</a></td>
        <td>dev02</td>
        <td>
          배송지 입력, 주문 요약
        </td>
      </tr>
      <tr>
        <td>주문완료</td>
        <td>views</td>
        <td>order</td>
        <td><a href="/product/jumunContent?jumuncode=j20250822002">jumunContent.jsp</a></td>
        <td>dev01</td>
        <td>
          주문이 완료되었습니다.
        </td>
      </tr>
      <tr>
        <td>주문내역</td>
        <td>views</td>
        <td>order</td>
        <td><a href="/member/jumunList">jumunList.jsp</a></td>
        <td>dev02</td>
        <td>
          주문목록
        </td>
      </tr>
      <tr>
        <td>리뷰목록</td>
        <td>views</td>
        <td>review</td>
        <td><a href="/member/reviewList">reviewList.jsp</a></td>
        <td>dev02</td>
        <td>
          리뷰목록
        </td>
      </tr>
      <tr>
        <td>개인문의목록</td>
        <td>views</td>
        <td>Inquiry</td>
        <td><a href="/member/myInquiry">myInquiry.jsp</a></td>
        <td>dev02</td>
        <td>
          개인문의목록
        </td>
      </tr>
      <tr>
        <td>공지사항</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/board/noticeList">noticeList.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>공지사항 보기</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/board/noticeView">noticeDetail.jsp</a></td>
        <td>dev03</td>
        <td>{id}</td>
      </tr>
      <tr>
        <td>이벤트</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/">eventList.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>공지사항 보기</td>
        <td>views</td>
        <td>board</td>
        <td><a href="/">eventDetail.jsp</a></td>
        <td>dev03</td>
        <td>{id}</td>
      </tr>
    </tbody>
  </table>

  <table class="type02">
    <caption>[관리자] 페이지목록</caption>
    <colgroup>
      <col width="200px">
      <col width="200px">
      <col width="200px">
      <col width="200px">
      <col width="200px">
      <col width="*">
    </colgroup>
    <thead>	
      <tr>
        <th>PAGE</th>
        <th colspan="2">URL</th>
        <th>FILE</th>
        <th>BRANCH(NAME)</th>
        <th>DESCRIPTION</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>메인</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/adminMain">adminMain.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>도서등록</td>
        <td>views</td>
        <td>regist</td>
        <td><a href="/regist/registBook">registBook.jsp</a></td>
        <td>dev01</td>
        <td></td>
      </tr> 
      <tr>
        <td>도서삭제</td>
        <td>views</td>
        <td>regist</td>
        <td><a href="/regist/delBook">delBook.jsp</a></td>
        <td>dev01</td>
        <td></td>
      </tr>
      <tr>
        <td>도서목록</td>
        <td>views</td>
        <td>regist</td>
        <td><a href="/regist/registProduct">registProduct.jsp</a></td>
        <td>dev01</td>
        <td></td>
      </tr>
      <tr>
        <td>회원관리</td> 
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/adminUser">adminUser.jsp</a></td>
        <td>dev01</td>
        <td>회원목록</td>
      </tr>
      <tr>
        <td>전체문의관리</td> 
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/adminInquiry">adminInquiry.jsp</a></td>
        <td>dev01</td>
        <td>전체문의목록</td>
      </tr>
      <tr>
        <td>주문관리</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/adminOrder">adminOrder.jsp</a></td>
        <td>dev01</td>
        <td>주문상태변경</td>
      </tr>
      <tr>
        <td>공지사항관리</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/adminNotice">adminNotice.jsp</a></td>
        <td>dev03</td>
        <td>공지사항관리</td>
      </tr>
      <tr>
        <td>공지사항등록</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/noticeRegister">noticeRegister.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>공지사항수정</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/admin/noticeModify">noticeEdit.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>이벤트등록</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/">eventRegistr.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
      <tr>
        <td>이벤트수정</td>
        <td>views</td>
        <td>admin</td>
        <td><a href="/">eventEdit.jsp</a></td>
        <td>dev03</td>
        <td></td>
      </tr>
    </tbody>
  </table>

  <h3>DB 테이블 정보</h3>
  <div class="flex">
    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>Dae</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key,
    name      char(10),
    code      char(2)
            </pre>
          </td>
        </tr>
      </tbody>
    </table>

    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>so</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key,
    name      char(10),
    daecode   char(2),
    code      char(2)
            </pre>
          </td>
        </tr>
      </tbody>
    </table>

    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>product</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key,
    pcode     char(7),
    pimg      varchar(400),
    dimg      varchar(100),
    title     varchar(100),
    price     int,
    halin     int,
    su        int,
    baeprice  int,
    baeday    int,
    juk       int,
    writeday  datetime,
    pansu     int,
    sales     int,
    salesDay  datetime
            </pre>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="flex">
    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>cart</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key, 
    userid    varchar(20),
    bookid    varchar(20),
    su        int
            </pre>
          </td>
        </tr>
      </tbody>
    </table>

    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>wish</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key, 
    userid    varchar(20),
    bookid    varchar(20)
            </pre>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="flex">
    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>order</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key, 
    userid    varchar(20),
    orderDate datetime,
    total     int,
    status    varchar(50),
    address   text,
    baeprice  int defalut 0
            </pre>
          </td>
        </tr>
      </tbody>
    </table>

    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>orderDetail</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key, 
    orderid   int,
    bookid    int,
    su        int,
    price     int
            </pre>
          </td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="flex">
    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>notice</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key, 
    title     varchar(200),
    content   text,
    writeday  datetime,
    readnum   int default 0
            </pre>
          </td>
        </tr>
      </tbody>
    </table>

    <table class="type02">
      <colgroup>
        <col width="*">
      </colgroup>
      <thead>
        <tr>
          <th>event</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>
            <pre>

    id        int auto_increment primary key, 
    title     varchar(200),
    content   text,
    cimg      varchar(100),
    startday  datetime,
    endday    datetime,
    status    boolean
            </pre>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
  
</body>
</html>