<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>::: TwoEX ::: 교환 플랫폼</title>
    <!-- 기타 meta 정보 -->
    <meta name="mainPage" content="TwoEx site" />
    <meta name="author" content="TwoEX" />
    <link rel="icon" type="image/png" href="" />

    <!-- LOGO, FONT SOURCE-->
    <script
      src="https://kit.fontawesome.com/1066a57f0b.js"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&family=Russo+One&display=swap"
      rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,800;1,900&display=swap"
      rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap"
      rel="stylesheet"
    />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Exo:wght@800;900&display=swap"
      rel="stylesheet"
    />
    <script>
      function updateEmail() {
        let form = document.createElement("form");
        form.appendChild(document.getElementsByName("buyEmail")[0]);
        form.action = "updateEmail";
        form.method = "post";
        document.body.appendChild(form);
        form.submit();
      }
      function updateRegion() {
        let form = document.createElement("form");
        form.appendChild(document.getElementsByName("buyRegion")[0]);
        form.action = "updateRegion";
        form.method = "post";
        document.body.appendChild(form);
        form.submit();
      }


      function init() {
        postAjaxJson("isSession", null, "isSessionCallBack");

        let json_VHList = JSON.parse('${json_VHList}');


  


        let viewHistoryList= "";

        for(idx=0; idx < json_VHList.length; idx++){
            viewHistoryList += 
            "<div class=\"product__item item" +idx + "\" onClick=\"moveProductInfo(\'"+ json_VHList[idx].prdCteCode +"\',\'"+ json_VHList[idx].prdSelCode  + "\',\'" + json_VHList[idx].prdCode + "\')\">\r\n"
				+ "  <div class=\"product__image__div\">\r\n"
				+ "      <img class=\"product__image\" src=\"" +json_VHList[idx].prfLocation +"\">\r\n"
				+ "  </div>\r\n"
				+ "  <div class=\"product__seller__div\">\r\n"
				+ "      <div>조회시간 : </div>\r\n"
				+ "      <div class=\"sellerShop\">"+ json_VHList[idx].ordDate +"</div>\r\n"
				+ "  </div>\r\n"
				+ "  <div class=\"product__title__div\">\r\n"
				+ "    "+ json_VHList[idx].prdName +"\r\n"
				+ "  </div>\r\n"
				+ "  <div class=\"product__price__div\">\r\n"
				+ "      <span></span>\r\n"
				+ "      <span>\r\n"
				+ "          <span>"+ json_VHList[idx].prdPrice + "</span>\r\n"
				+ "          <span>원</span>\r\n"
				+ "      </span>\r\n"
				+ "  </div>\r\n"
				+ "</div>";
        }

        

        document.getElementsByName("viewHistoryList")[0].innerHTML = viewHistoryList;

        
      }
      function moveProductInfo(prdCteCode, prdSelCode, prdCode){
      alert("moveProductInfo 입구");
   	  //alert("입구 카테고리 코드 : " + prdCteCode +" "+ prdSelCode +" "+ prdCode);
      let form = document.createElement('form');
      form.appendChild(createFormInput("prdCteCode", prdCteCode));
      form.appendChild(createFormInput("prdSelCode", prdSelCode));
      form.appendChild(createFormInput("prdCode", prdCode));
      //alert(form);
    
      form.method="POST";
      form.action="moveProductInfo"
	    document.body.appendChild(form);
      form.submit()
      //alert("moveProductInfo 출구");
    }
    
    function createFormInput(name, value){
      let input = document.createElement('input');
      input.setAttribute('type', 'hidden');
      input.setAttribute('name', name);
      input.setAttribute('value', value);
      return input;
    }
      function isSessionCallBack(ajaxData) {
        	  if(ajaxData != null) {
            	  accessInfo = JSON.parse(ajaxData);
            	  makeHeader(accessInfo);
                if(accessInfo != null) {
                	if(accessInfo.userType = "seller") {
                		selCode = accessInfo.selCode;
                	}
                }
        	  }
          }
    </script>

    <!-- JS, CSS 연결 -->
    <link rel="stylesheet" href="res/css/style.css" />
    <link rel="stylesheet" href="res/css/header.css" />
    <link rel="stylesheet" href="res/css/myPage.css" />
    <script src="res/js/main.js"></script>
    <script src="res/js/header.js"></script>
    <script src="res/js/myPage.js"></script>
    <script src="res/js/main_LSE.js"></script>
  </head>
  <body onload="init()">
    <!-- [Navbar] ------------------------------------------------------->
    <nav id="navbar">
      <div class="navbar__upper">
        <div class="navbar__logo">
          <i class="fa-solid fa-arrow-right-arrow-left"></i>
          <span class="title">Two EX</span>
          <span class="subtitle">Experts Exchange</span>
        </div>
        <div class="header__right">
          <input
            class="header__search"
            type="text"
            placeholder="  상품을 검색하세요."
          />
          <!-- 헤더 navbar 메뉴 버튼 -->
          <ul class="navbar__menu">
            <li class="navbar__menu__item myPage" data-link="#contact">
              마이페이지
            </li>
            <li class="navbar__menu__item myShop" data-link="#contact" onclick="moveMyshop()">
              마이샵
            </li>
            <div class="navbar__menu__item profile"></div>
            <li class="navbar__menu__item login" data-link="login">로그아웃</li>
          </ul>
          <!-- Toggle button 향후 사용 예비버튼-->
          <button class="navbar__toggle-btn">
            <i class="fas fa-bars"></i>
          </button>
        </div>
      </div>
    </nav>
    <!-- [Navbar] 끝 -->
    <section id="common__zone__lse">
      <div id="common__wrapper__lse">
        <!--[공통 메뉴 시작] ------------------------------>
        <nav class="common__menu__Zone">
          <div class="common__menu">
            <div class="common__menu__title">마이페이지</div>
            <div class="common__menu__list">
              <div
                class="common__menu__item parentItem"
                onclick="moveAccountInfo()"
              >
                계정 정보
              </div>
              <div
                class="common__menu__item parentItem"
                onclick="moveViewHistory()" style="color:red ;"
              >
                조회 상품
              </div>
              <div
                class="common__menu__item parentItem"
                onclick="moveWishList()"
              >
                찜한 상품
              </div>
              <div
                class="common__menu__item parentItem"
                onclick="moveOrderHistory()"
              >
                주문 목록
              </div>
              <div
                class="common__menu__item parentItem"
                onclick="moveMyClass()"
              >
                마이클래스
              </div>
            </div>
          </div>
        </nav>
        <!-- 공통 메뉴 끝 -->
        <!--[공통 컨텐츠 시작] ------------------------------>
        <div class="common__content__zone lse myPage">
          <div class="content__title">
            <h3>조회 목록</h3>
          </div >
            <div class="listZone" name="viewHistoryList">
              <div>안녕하세요</div>
            

                              
              
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>



<!-- <div class="product__item item1" onclick="">
  <div class="product__image__div">
      <img class="product__image" src="json_VHList[idx].prfLocation">
  </div>
  <div class="product__seller__div">
      <span>상품번호 : </span>
      <span class="sellerShop">json_VHList[idx].prdCode</span>
  </div>
  <div class="product__title__div">
    json_VHList[idx].prdName
  </div>
  <div class="product__price__div">
      <span></span>
      <span>
          <span>json_VHList[idx].prdPrice</span>
          <span>원</span>
      </span>
  </div>
  <div class="product__etc__div">
      <div>json_VHList[idx].prdInfo</div>
  </div>
</div> -->

