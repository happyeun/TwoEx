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
        function init() {
          /* 세션 확인 */
          postAjaxJson("isSession", null, "isSessionCallBack");
    
          if ("${message}" != null && "${message}" != "") {
            alert("${message}");
          }
    
          let today = new Date();   
          let year = today.getFullYear(); // 년도
          document.getElementById("age").value = year - '${buyAge}' + 1 ;
          if('${buyGender}' == 'M'){
            document.getElementById("sex").value = '남성';
            
          }
          if('${buyGender}' == 'F'){
            document.getElementById("sex").value = '여성';
            
          }

        }
        
        function isSessionCallBack(ajaxData) {
          //alert("isSessionCallBak 함수");
          if(ajaxData != null) {
                accessInfo = JSON.parse(ajaxData);
                makeHeader(accessInfo);
          }
        }

        /////////////////////////////////////////////////////////
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

      
    
    </script>

    <!-- JS, CSS 연결 -->
    <link rel="stylesheet" href="res/css/style.css" />
    <link rel="stylesheet" href="res/css/header.css" />
    <link rel="stylesheet" href="res/css/myPage.css" />
    <script src="res/js/main.js"></script>
    <script src="res/js/header.js" async></script>
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
            <li class="navbar__menu__item myShop" data-link="#contact">
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
    <main id="common__zone__lse">
      <div id="common__wrapper__lse">
        <!--[공통 메뉴 시작] ------------------------------>
        <nav class="common__menu__Zone">
          <div class="common__menu">
            <div class="common__menu__title">마이페이지</div>
            <div class="common__menu__list">
              <div
                class="common__menu__item parentItem"
                onclick="moveAccountInfo()" style="color:var(--color-dark-pink);"
              >
                계정 정보
              </div>
              <div
                class="common__menu__item parentItem"
                onclick="moveViewHistory()"
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
            <h3>계정 정보</h3>
          </div>
          <div class="accountInfo__container">
            <div class="profilePhoto__container">
                <img class="profilePhoto" src="${buyProFile}" alt="" />
            </div>
            <div class="accountInfo__item__container">
         
              <div class="accountInfo__item_wrapper">
                <div class="name__container">
                    <div class="item__title">
                        <h2>이름 : </h2>
                    </div>
                    <div  class="item__input__div">
                        <input name="buyNickname" value="${buyNickname}" class="account__input" type="text" disabled>
                    </div>
                    <div class="item__btn__div">
                 
                    </div>
                </div>
                <div class="age__container">
                    <div class="item__title">
                        <h2>연령 : </h2>
                    </div>
                    <div class="item__input__div">
                        <input id="age" name="birthdata__input"
                        value="${buyAge}" class="account__input" type="text" disabled>
                    </div>
                    <div class="item__btn__div">
                     
                    </div>
                </div>
                <div class="gender__container">
                    <div class="item__title">
                        <h2>성별 : </h2>
                    </div>
                    <div class="item__input__div">
                        <input name="gender__input"  id="sex" value="${buyGender}" class="account__input" type="text" disabled>
                    </div>
                    <div class="item__btn__div"></div>

                </div>
                <div class="email__container">
                    <div class="item__title">
                        <h2>이메일 : </h2>
                    </div>
                    <div class="item__input__div">
                        <input name="buyEmail"
                        value="${buyEmail}" class="account__input" type="text">
                    </div>
                    <div class="item__btn__div">
                        <input type="button" class="account__btn" value="수 정"  onclick="updateEmail()">
                    </div>                                
                </div>
                <div class="region__container">
                    <div class="item__title">
                        <h2>지역 : </h2>
                    </div>
                    <div class="item__input__div select">
                        <select class="account__input selectInput" name="buyRegion">
                            <option style="color:var(--color-dark-pink);" value="">${buyRegion}</option>
                            <option value="서울특별시">서울특별시</option>
                            <option value="부산광역시">부산광역시</option>
                            <option value="인천광역시">인천광역시</option>
                            <option value="대구광역시">대구광역시</option>
                            <option value="광주광역시">광주광역시</option>
                            <option value="대전광역시">대전광역시</option>
                            <option value="울산광역시">울산광역시</option>
                            <option value="세종특별자치시">세종특별자치시</option>
                            <option value="경기도">경기도</option>
                            <option value="강원도">강원도</option>
                            <option value="충청북도">충청북도</option>
                            <option value="충청남도">충청남도</option>
                            <option value="경상북도">경상북도</option>
                            <option value="경상남도">경상남도</option>
                            <option value="전라북도">전라북도</option>
                            <option value="전라남도">전라남도</option>
                            <option value="제주특별자치도">제주특별자치도</option>
                        </select>
                    </div>
                    <div class="item__btn__div">
                        <input type="button" class="account__btn" onclick="updateRegion()" value="수 정">
                    </div>
                </div>
              </div>




            </div>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>
