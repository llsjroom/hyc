// 서브메뉴 보이기
function openMenu(thisMenu) {
  const topMenu = document.querySelectorAll(".menu > li");
  const menuLeft = thisMenu.getBoundingClientRect().left;

  topMenu.forEach(function(li) {
    const subMenu = li.querySelector(".subMenu");

    if (subMenu) {
      if (li === thisMenu) {
        subMenu.classList.add("open");
        subMenu.style.paddingLeft = parseInt(menuLeft) + "px";
      } else {
        subMenu.classList.remove("open");
        subMenu.style.paddingLeft = 0;
      }
    }
  });
}

// 서브메뉴 안보이기
function closeMenu(thisMenu) {
  thisMenu.classList.remove('open');
}


// 검색어 입력 시
function schTxt(txt, event) {
  let len=txt.length;

  if(len>0) {
    document.getElementById("delBtn").style.visibility="visible";

    if(event && event.key === "Enter") // 입력된 키가 엔터키일 땐
      search();
    }
  else {
    document.getElementById("delBtn").style.visibility="hidden";
  }
}

// 검색어 입력 후 X버튼 클릭 시
function schDel() {
  document.getElementById("schTxt").value="";
  document.getElementById("schTxt").focus();
  document.getElementById("delBtn").style.visibility="hidden";
}

// 검색어 입력 화면 열기
function searchOpen() {
  document.getElementById("search").classList.add("show");
  document.body.classList.add("noScroll");
}

// 검색어 입력 화면 닫기
function searchClose() {
  document.getElementById("search").classList.remove("show");
  document.body.classList.remove("noScroll");
}

// 검색하기
function search() {
  var sword=document.getElementById("schTxt").value;
  if(sword.trim().lenght != 0)
    location="../product/productList?sword="+sword;
}

// Top버튼
window.addEventListener("scroll", function () {
    const moveBtn = document.getElementById("move");
    const footer = document.getElementById("footer");

    const scrollTop = document.documentElement.scrollTop;
    const viewH = window.innerHeight;
    const scrollH = scrollTop + viewH;

    const footerTop = footer.getBoundingClientRect().top + scrollTop;

    // 버튼 등장
    if (scrollTop > viewH * (2 / 3)) {
      moveBtn.classList.add("show");

      // footer랑 겹치지 않기
      if (scrollH + 30 >= footerTop) {
        moveBtn.style.bottom = "200px";
        moveBtn.style.transition = "all 0.3s ease";
      } else {
        moveBtn.style.bottom = "50px";
        moveBtn.style.transition = "all 0.3s ease";
      }

    } else {
      // 다시 위로 올라오면 버튼 숨기기
      moveBtn.classList.remove("show");
      moveBtn.removeAttribute("style");
    }
  });

  // 페이지 Top으로 이동
  window.addEventListener("DOMContentLoaded", function () {
    const moveBtn = document.getElementById("btnTop");
    moveBtn.addEventListener("click", function () {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  });