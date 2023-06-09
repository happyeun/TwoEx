<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>::: TwoEX ::: 교환 플랫폼 </title>
    <!-- 기타 meta 정보 -->
      <meta
        name="mainPage"
        content="TwoEx site"
      />
      <meta name="author" content="TwoEX" />
      <link rel="icon" type="image/png" href="" />

    <!-- LOGO, FONT SOURCE-->
    <script src="https://kit.fontawesome.com/1066a57f0b.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600;700&family=Russo+One&display=swap" 
    rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,800;1,900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@900&display=swap" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Exo:wght@800;900&display=swap" rel="stylesheet">

    <!-- JS, CSS 연결 --------------------------------------------------------------------------------------------------->
    <link rel="stylesheet" href="res/css/style.css" />
    <link rel="stylesheet" href="res/css/header.css" />
    <link rel="stylesheet" href="res/css/categoryPage.css">
    <script src="res/js/main.js"></script>
    <script src="res/js/main_LSE.js"></script>
    <script src="res/js/common_LSE.js"></script>
    <script src="res/js/header.js" async></script>  
	<!-- <script src="res\js\categoryPage_LSE.js"></script>-->   
	<!-- 스타일 ---------------------------------------------------------------------------------------------------------->
	<style>
	/*font-family: 'Russo One', sans-serif;  -- 400 */
	@import url('https://fonts.googleapis.com/css2?family=Russo+One&display=swap');
	
	/** 로고2 대안
	font-family: 'Orbitron', sans-serif; weight 800, 900 */
	@import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@800;900&display=swap');
	
	/** 로고3
	 font-family: 'Exo', sans-serif;  */
	@import url('https://fonts.googleapis.com/css2?family=Exo:wght@800;900&display=swap'); 
	
	/** 본문1
	font-family: 'Noto Sans KR', sans-serif;  --- 300, 400, 700 */
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&display=swap');
	
	/** 본문2
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';*/
	@import url('https://spoqa.github.io/spoqa-han-sans/css/SpoqaHanSans-kr.css');
	</style>
	
	
<!-- 스크립트 ----------------------------------------------------------------------------------------------------->
<script>
	function init(){
	/* 세션 확인 */
  postAjaxJson("isSession", null, "isSessionCallBack");
    
    /* 카테고리 제목 */
    let json_titleCteName = '${json_titleCteName}'; /* 단일 변수 JSON*/
    makeTitleCategoryName(json_titleCteName);
    
    /* 카테고리 메뉴*/ 
    //alert("카테고리 메뉴");
    let json_cteList = JSON.parse('${json_cteList}');
    makeCategoriesMenu(json_cteList);

    /* 페이징 */
    let json_paging = JSON.parse('${json_paging}');
    makePaging(json_paging);

    /* 상품 리스트 */
    let json_pbList = JSON.parse('${json_pbList}');	
    makeProductList(json_pbList);
    
    
    }

  function isSessionCallBack(ajaxData) {
    	  if(ajaxData != null) {
        	  accessInfo = JSON.parse(ajaxData);
        	  makeHeader(accessInfo);
    	  }
  }
  
    
  function moveIndexPageCallBack(ajaxData){
    	//alert("moveIndexPageCallBack 입구");
    //alert("moveIndexPageCallBack ajaxData : " + ajaxData);

    //let json_pagingAndpbList = JSON.parse(ajaxData).split("&");
    let array = ajaxData.split("&");
    let json_paging = JSON.parse(array[0]);
    let json_pbList = JSON.parse(array[1]);
    //alert("어레이 안 json" +  json_paging +" "+json_pbList);

    //alert("콜백 json_paging : " + json_paging);
    makePaging(json_paging);
    makeProductList(json_pbList);
  }
  /*
  function createDiv(id, className, value, text){
    let div = document.createElement("div");
    if(id != "") div.setAttribute("id", id);
    if(className != "") div.setAttribute("class", className);
    if(value != "") div.setAttribute("value", value);
    if(text != "") div.innerHTML = text;
    
    return div;
  }
  */


  /** 카테고리 메뉴존 생성 **/
  /* -- 카테고리 제목 */
  function makeTitleCategoryName(json_titleCteName){
			//alert("makeTitleCategoryName 입구");
    let common__menu__title = document.querySelector(".common__menu__title");
    		//alert("카테고리 타이틀 : " + '${json_titleCteName}');
    common__menu__title.innerHTML = json_titleCteName;
  
  }

  /** 카테고리 메뉴항목 **/
  function makeCategoriesMenu(json_cteList){
      let common__menu__list = document.querySelector(".common__menu__list");
      //alert("json_cteList.length :  "+ json_cteList.length);
      for(idx=0; idx<json_cteList.length; idx++){
          let item = createDiv("","common__menu__item parentItem","",json_cteList[idx].cteName);
          									/*item.setAttribute("data-cteCode", json_cteList[idx].cteCode);*/
          let cteCode = json_cteList[idx].cteCode;
          										/*alert("cteCode : " + cteCode);*/
          item.addEventListener("click", ()=> moveCategory(cteCode));
          common__menu__list.appendChild(item);
    }
  }
  
  /*
  public class CategoriesBean {
	private String cteCode;
	private String cteName;
	
	추가 index 
	private int totalNum;
	private int numInPage;
	private int pageCount;
	private int pageIndex;
	private int numStart;
	private int numEnd;
}
  */
  function makePaging(json_paging){
    //alert("makePaging 입구");
    let cteCode = json_paging.cteCode;
    /**/
    let currentPage = json_paging.currentPage;
    let totalNum = json_paging.totalNum;
    let numInPage = json_paging.numInPage;
    let totalPage = json_paging.totalPage;
    let groupSize=5;
    let startPage = json_paging.startPage;
    let endPage = json_paging.endPage;
    let prev;
    let next;
      /*
        alert("currentPage : " + currentPage);
        alert("totalNum : " + totalNum);
        alert("numInPage : " + numInPage);
        alert("totalPage : " + totalPage);
            alert("startPage : "+  startPage);
    alert("endPage : "+  endPage);
      */
      /* 자바 문법
      totalPage = ( (totalNum - 1) / numInPage ) + 1;
      startPage = ((currentPage-1)/groupSize) * groupSize + 1;
      endPage = (((currentPage-1)/groupSize)+1) * groupSize;
      */
    if(totalNum <= 0){
      alert("검색된 상품이 없음");

      return
    }


    if(totalPage < endPage){
      //alert("if문 otalPage < endPage");
        endPage = totalPage;
      //alert("최종 endPage : " + endPage);
    }


    //let paging__div = createDiv("","paging__div","","")
    // 이전 ul 삭제
    document.querySelector(".paging__ul").remove();
    // ul 생성
    let ul = document.createElement("ul");
    ul.setAttribute('class','paging__ul');

    if(totalPage == 1){
        // 인덱스 1개만
        let li = document.createElement("li");
        li.setAttribute('class','index currentPage '+'1');
        li.setAttribute('data-index', '1');
        li.innerText = '1';
          //alert("moveIndexPage에 들어가는 인덱스 : " + cteCode+" "+(idx+1));
          //li.addEventListener('click', (event)=>moveIndexPage(cteCode,event));
        li.style.cursor ="default";
        ul.appendChild(li);
    }else{
        //alert("li넣는 else문");
        if(startPage == 1){
          prev = false;

        }else{
          prev = true;
          let li = document.createElement("li");
          li.setAttribute('class','index prev');
          li.setAttribute('data-index', startPage-1);
          li.innerText = '<';
            //alert("moveIndexPage에 들어가는 인덱스 : " + cteCode+" "+(idx+1));
          li.addEventListener('click', (event)=>moveIndexPage(cteCode,event));
          li.style.cursor ="pointer";
          ul.appendChild(li);
        }

        for(idx=startPage; idx<=endPage; idx++){
          let li = document.createElement("li");
            //alert("li넣는 for문");
            if(idx==currentPage){
                //alert("li넣는 for문 안 if문");
                li.setAttribute('class','index currentPage '+(idx));
                li.setAttribute('data-index', (idx));
                li.innerText = (idx);
                  //alert("moveIndexPage에 들어가는 인덱스 : " + cteCode+" "+(idx+1));
                  //li.addEventListener('click', (event)=>moveIndexPage(cteCode,event));
                li.style.cursor ="default";
                ul.appendChild(li);
            }else{
                //alert("li넣는 for문 안 else문");
                li.setAttribute('class','index '+(idx));
                li.setAttribute('data-index', (idx));
                li.innerText = (idx);
                  //alert("moveIndexPage에 들어가는 인덱스 : " + cteCode+" "+(idx+1));
                li.addEventListener('click', (event)=>moveIndexPage(cteCode,event));
                li.style.cursor ="pointer";
                ul.appendChild(li);
            }
        }

        if(endPage == totalPage){
          next=false;

        }else{
          let li = document.createElement("li");
          li.setAttribute('class','index next');
          li.setAttribute('data-index', endPage+1);
          li.innerText = '>';
            //alert("moveIndexPage에 들어가는 인덱스 : " + cteCode+" "+(idx+1));
          li.addEventListener('click', (event)=>moveIndexPage(cteCode,event));
          li.style.cursor ="pointer";
          ul.appendChild(li);

        }
    }
    //alert("ul" + ul);
    console.log("ul : " +ul);
    console.log(ul);
    let paging__div = document.querySelector(".paging__div");
    paging__div.appendChild(ul);
  }


  function moveIndexPage(cteCode,event){
    //alert("moveIndexPage 입구");
    console.log("이벤트타켓"+event.target);
    	//alert("이벤트타겟 내부 정보" + event.target.innerText);
      //alert("data-index 번호 : " + event.target.getAttribute("data-index"));
      //pageIndex = event.target.innerText;
    currentPage = event.target.getAttribute("data-index");
    //alert("innerText번호 : " + currentPage);
    //alert("moveIndexPage : " + cteCode +" "+currentPage);
    /*Ajax*/
    
    let clientData = "cteCode=" + cteCode +"&"+"currentPage="+currentPage;
    postAjaxJson("moveIndexPage", clientData, "moveIndexPageCallBack");

  }



  /** 상품리스트 생성 **/
    /* -- 상품리스트 생성 함수 1 */
    function makeProductList(json_pbList){
      //alert("makeProductList() 입구");	
      //alert(json_pbList.length);
      
      let sample_img = "\res\imgs\product__default.jpg";
      // 삭제
      document.querySelector(".productList__container").remove();
      // 재생성
      let productList__container = createDiv("","productList__container","","");
      for(idx=0; idx<json_pbList.length; idx++){
        productList__container.appendChild(makeItem(json_pbList[idx].prfLocation, json_pbList[idx].prdCteCode, json_pbList[idx].prdSelCode, json_pbList[idx].prdCode, json_pbList[idx].prdName, json_pbList[idx].prdPrice, json_pbList[idx].prdType, json_pbList[idx].selShopName));
        //alert("사진파일주소 : " + json_pbList[idx].prfLocation);
      }

      /* html에 넣기*/
      console.log(productList__container);
      let productList__wrapper = document.querySelector(".productList__wrapper");
      productList__wrapper.appendChild(productList__container);
    }	

    /* -- 상품리스트 생성 함수 1 (상품아이템 생성) */
    function makeItem(prfLocation, prdCteCode, prdSelCode, prdCode, prdName, prdPrice, prdType, selShopName){
      let productItem = createDiv("","product__item item1", "", "");
      
      /** image **/
      let productImageDiv = productItem.appendChild(createDiv("", "product__image__div", "", ""));
      let productImage = document.createElement("img");
          productImage.setAttribute("class","product__image");
          productImage.setAttribute("src", prfLocation);
      productImageDiv.appendChild(productImage);
      productItem.appendChild(productImageDiv);
      /** 상품정보 페이지 이동 함수 **/
      /**
       * 카테고리 코드 : prdCteCode
       * 셀러 코드 : prdSelCode
       * 상품 코드 : prdCode
       */

      productItem.addEventListener("click", ()=> moveProductInfo(prdCteCode, prdSelCode, prdCode));

      /** 나머지 정보 **/ 
      /* 판매자 */
      let product__seller__div = createDiv("","product__seller__div","","");
      product__seller__div.innerHTML = "<span class=\"info_span\">판매자 : </span><span class=\"+ selShopName +\">" + selShopName +"</span>";
      productItem.appendChild(product__seller__div); /* 샵 네임으로 바꿔야함 */

      /* 상품명 */
      productItem.appendChild(createDiv("","product__title__div","",prdName));
      /* 가격 */
      let product__price__div = createDiv("","product__price__div","","");
          product__price__div.innerHTML ="<span></span><span>"
            + "<span class=\"product__price\">"+ prdPrice +"</span>"
            + "<span class=\"won__span\">원</span></span>";
      productItem.appendChild(product__price__div);
      /* 기타 정보 */
      let classOption;
      if(prdType == "C"){
        classOption = "클래스룸 상품";
      }else if(prdType="N"){
        classOption = "일반 상품";
      }else{}
      let product__etc__div = createDiv("","product__etc__div","","");
      product__etc__div.innerHTML ="<span class=\"classOption\">"+classOption+"</span>"
      productItem.appendChild(product__etc__div);

      // return
      return productItem;
    }

    ///////////////////////////////////////////////////////////////////////////////////////////
    /*** 상품정보 페이지 이동 함수 **********************************/
    function moveProductInfo(prdCteCode, prdSelCode, prdCode){
      //alert("moveProductInfo 입구");
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
    
	</script>
	<style>
	</style>
  </head>
  <body onload="init()">
    <!-- [Navbar] --------------------------------------------------------------------->
    <nav id="navbar">
      <div class="navbar__upper">
        <div class="navbar__logo" onclick="showChat()">
          <i class="fa-solid fa-arrow-right-arrow-left"></i>
          <span class="title" onClick="moveMainPage()">Two EX</span>
          <span class="subtitle">Experts Exchange</span>
        </div>
        <div class="header__right">
          <!-- 상품 검색 기능 -->
          <form class="search_form">
            <div class="search__input__div">
              <input type="text" class="search__input text" name="keyword"
                onkeyup="if(window.event.keyCode==13){searchProduct();}" placeholder="상품을 검색하세요."
                onfocus="this.placeholder=''" onblur="this.placeholder='상품을 검색하세요.'">
              <input text="text" name="" style="display:none;">
              <span><i class="fa-solid fa-magnifying-glass" onClick="searchProduct()"></i></span>
              <!--<input type="button" class="search__input__button " onClick="searchProduct()" value="검색" style="margin-right: 5px;"> -->
            </div>
          </form>
          <!-- 헤더 navbar 메뉴 버튼-->
          <ul class="navbar__menu">
            <li class="navbar__menu__item login" data-link="login" onclick="loginDiv(event)">로그인
              <!-- [ 로그인 모달 ] ******************************-->
            </li>
            <li class="navbar__menu__item join" data-link="join" onclick="moveJoin()">회원가입</li>
          </ul>
        </div>
      </div>
    </nav> <!-- [Navbar] 끝 -->
    <section id="common__zone__lse">
          <!--
          <div class="banner__zone">
            <div class="banner__div">
              <h2>카테고리 별 상품리스트</h2>
            </div>
          </div> 
          -->
      <div id="common__wrapper__lse">
        <!--[공통 메뉴 시작] ------------------------------>
        <nav class="common__menu__Zone">
          <div class="common__menu">
            <div class="common__menu__title">
              특정 카테고리
            </div>
            <div class="common__menu__list">    
              <!--
                <div class="common__menu__item parentItem">카테고리1</div>
                <div class="common__menu__item parentItem">카테고리2</div>
                <div class="common__menu__item parentItem">카테고리3</div>
                <div class="common__menu__item parentItem">카테고리4</div>
                <div class="common__menu__item parentItem">카테고리5</div>
              -->
            </div>
          </div>
        </nav><!-- 공통 메뉴 끝 -->
        <!--[공통 컨텐츠 시작] ------------------------------>
        <div class="common__content__zone lse">
	        <div class="productList__zone">
              <div class="zone__title">
                  <h3>상품 리스트</h3>
              </div>
              <div class="productList__wrapper">
                <div class="productList__container"> 
                  <!-- [ 상품 리스트 공간 ] -->
                </div>
              </div>
                <!--페이징 --------------------->
              <div class="paging__zone">
                <div class="paging__div">
                  <ul class="paging__ul"></ul>
                </div>
              </div><!--페이징 끝------------->
	        </div>
        </div>
      </div>
    </section>
    <!-- footer 
    <section id="footer__section" class="section">
      <div class="footer__container">
        <h1 class="footer__title">Let's talk</h1>
        <h2 class="footer__contact__email">admin@twoex.com</h2>
        <div class="footer__contact__links">
        </div>
        <p class="footer__description">
          (주)투엑스 인천시 미추홀구 학인동, 5층대표 : 안뇽 개인정보관리책임자 : 안뇽 사업자등록번호 : 123-45-67890
          <br>
          통신판매업신고 : 2018-인천미추홀-1234 유료직업소개사업등록번호 : 제2022-12345-12-1-00012호 고객센터 : 1544-6254 help@twoex.com
          <br>
          (주)투엑스는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 상품, 상품정보, 거래에 관한 의무와 책임은 판매회원에게 있습니다.
          <br>
          (주)투엑스 사이트의 상품/판매회원/중개 서비스/거래 정보, 콘텐츠, UI 등에 대한 무단복제, 전송, 배포, 스크래핑 등의 행위는 저작권법, 콘텐츠산업 진흥법 등 관련법령에 의하여 엄격히 금지됩니다.
        </p>
        <p class="footer__contact__rights">
          </br>
          Copyright © 2022 twoEx Inc. All rights reserved.
        </p>
      </div>
    </section>
    -->
  </body>
</html>

