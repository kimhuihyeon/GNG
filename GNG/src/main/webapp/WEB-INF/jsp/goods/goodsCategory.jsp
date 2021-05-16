<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/GNG/theme/aboki/common.css">
<link rel="stylesheet" href="/GNG/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/header.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/main.css">
<link rel="stylesheet" href="/GNG/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/GNG/theme/aboki/scroll.css">
<link rel="stylesheet" href="/GNG/theme/aboki/shopbrand.387.css">
<link rel="stylesheet" href="/GNG/theme/aboki/pagingcss.css">

</head>
<body>
<br>
<br>
   <div class="viewport">
      <div id="container">
         <div id="page" class="page">
            <section class="hashFilter section eshop container">

               <div class="section-body">	

                  <!-- coordi 페이지 editor's pick 페이지에는 page-category 없어야됨 -->
                  <div class="page-category">
                     <div class="selectboxWrap">

                        <div class="selectbox">
                           <div class="selectbox-data">
                              <strong class="text"> </strong> <span
                                 class="icon icon-dropdown-white"></span>
                           </div>
                   
                        </div>
                        <!--
         <div class="selectbox">
            <div class="selectbox-data">
               <strong class="text"></strong>
               <span class="icon icon-dropdown-white"></span>
            </div>
            <select name="category[]" id="cate02">
            </select>
         </div>
         <div class="selectbox">
            <div class="selectbox-data">
               <strong class="text"></strong>
               <span class="icon icon-dropdown-white"></span>
            </div>
            <select name="category[]" id="cate03">
            </select>
         </div>
         -->

                        <!--
         <a href="#" class="comment">
            <span class="icon icon-speaker-white"></span>
            <span class="text">배송관련 공지사항 안내 드립니다.</span>
         </a>
         -->
                     </div>
                  </div>
                  <!-- 각 카테고리별 타이틀-->
                  <div class="page-title section">
                     <div class="myimg">
                        <img src="/GNG/theme/${isCategory}CATEGORY.gif" width="100%"  style="padding: 15px 5px;"/>
                     </div>
                  </div>
					

            


               </div>

<%-- 
        <div class="globalFooter-supoort container">
        <div>
           
            <div class="support" style="text-align:center;">
              	
              
                <div class="button-group2" style="display:inline-block; display:inline; zoom:1;width: 100%;">
                <c:forEach var="goodsCategory" items="${goodsCategory}" varStatus="stat">
                    
                    <a href="/GNG/goods/goodsCategory?CATEGORY=${isCategory}&SUBCATEGORY=${goodsCategory}">
                    <span class="button-label">${goodsCategory}</span>
                    </a>
                    
                    
                </c:forEach>
                </div> --%>
                
    <div class="class-list">
		<ul class="cboth">
		  <c:forEach var="goodsCategory" items="${goodsCategory}" varStatus="stat">
			<li><a href="/GNG/goods/goodsCategory?CATEGORY=${isCategory}&SUBCATEGORY=${goodsCategory}">${goodsCategory}(${countList[stat.index]})</a></li>
		</c:forEach>
		</ul>
	</div>
              
  <!--              
           </div>
           
        </div>

        </div> -->


        
   

               <%-- <input type="hidden" name="category" value="${isCategory}" /> 
               <input type="hidden" name="searchCheck" id="searchCheck" value="ON" /> --%>
            </form>

            </section>
            

            

   <div class="cboth main_section03">
      <div class="cboth main_title">BEST PRODUCTS</div>
      <br><br>
      <div class="cboth prd-list">
         <table summary="상품이미지, 상품 설명, 가격">
         <caption>특별상품 리스트</caption>
         <colgroup>
            <col width="25%">
            <col width="25%">
            <col width="25%">
            <col width="25%">
         </colgroup>
         
         <tbody>
         <tr class="nopadding"><td></td><td></td><td></td><td></td></tr>
         
         <c:forEach items="${hotCategoryList4}" var="goodsRank" begin="0" varStatus="status" end="${fn:length(hotCategoryList4)}">
   
            <td>
            <div class="tb-center">
            <div class="box">
            <div class="thumb salebox">
                        <a href="/GNG/goodsDetail?GOODS_NUMBER=${goodsRank.GOODS_NUMBER}"><img class="MS_prod_img_s" src="/GNG/file/goodsFile/${goodsRank.GOODS_THUMBNAIL}" alt=""></a>
                        <input type="hidden" name="custom_price" value="${goodsRank.GOODS_PRICE}">
                        <input type="hidden" name="product_price" value="${goodsRank.GOODS_DISPRICE}">
                        <!-- 조건태그시작 -->
                        <c:if test="${goodsRank.GOODS_DISPRICE != goodsRank.GOODS_PRICE}">
                        <span class="sale_text" style="display: block;">
                        -<fmt:formatNumber value="${(goodsRank.GOODS_PRICE - goodsRank.GOODS_DISPRICE)*100 / goodsRank.GOODS_PRICE}" type="number" />%
                        </span>
                        </c:if>
                        <%-- <c:if test="${goodsRank.GOODS_NEWDATE == 1}"> --%> 
							<span class="sale_text" style="display: block;" >
                       		<img src="/GNG/file/NEWtag.jpg"/>
                       		</span>
					<%-- 	</c:if>
						<c:if test="${goodsRank.AMOUNT<20}"> --%> 
                      	<span class="sale_text" style="display: block;">
                       	<img src="/GNG/file/HurryUp.png"/>
                       	</span>
                       	<%-- </c:if> --%>
                     </div>
                     <ul class="info">
                        <li class="dsc"> <a href="/GNG/goodsDetail?GOODS_NUMBER=${goodsRank.GOODS_NUMBER}">${goodsRank.GOODS_NAME}</a></li>
                        <li class="subname">${goodsRank.GOODS_SHORTDESC}<br>(${goodsRank.COLORCOUNT}color)
                        </li>
                     <c:if test="${goodsRank.GOODS_DISPRICE eq goodsRank.GOODS_PRICE}">
                     <li class="price"><fmt:formatNumber value="${goodsRank.GOODS_PRICE}" type="number"/>원</li>
                     </c:if>   
                     <c:if test="${goodsRank.GOODS_DISPRICE ne goodsRank.GOODS_PRICE }">
                     <li class="consumer"><fmt:formatNumber value="${goodsRank.GOODS_PRICE}" type="number"/>원</li><li class="price"><fmt:formatNumber value="${goodsRank.GOODS_DISPRICE}" type="number"/>원</li>
                     </c:if>
                     <li><c:forEach items="${goodsRank.COLORKIND}" var="color">
                        <img src="/GNG/theme/pshp/img/filter-color-${color}.png" width="10px" height="10px">
                        </c:forEach></li>
                     <li class="icon"><span class="MK-product-icons"></span></li>
                     </ul>
                  </div>
                  </div>
                  
               </td>

            </c:forEach>               
            <tr>
            </tr>
      </tbody>
         
      </table>
      </div><!-- //prd-list -->
   </div><!-- //main_section03 -->
   	<center>
 		<div style="background-color: #ffffff;">
 	   <section class="hashFilter section eshop container"
 	   style="margin-top:5px; margin-right: 5px; margin-left: 5px; width:60%;">
               <div class="section-body box-shadow">
                  <div class="form row">

                     <!--
"ranking", "sale", "new"
-->

                    
                     <div class="condition form-item col-sm-12 col-lg-6">
                        <div class="form-item-title">
                           <h4>제품상태</h4>
                        </div>
                        <div class="form-item-wrap">
                           <div class="row">

                              <div class="checkbox col-xs-auto">
                                 <label> <input type="checkbox" name="sale" onclick="javascript:ajaxList();" 
                                    data-text="세일 상품만"> <span class="icon icon-checkbox"></span>
                                    <span class="checkbox-label">세일 상품만</span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto selected">
                                 <label> <input type="checkbox" name="soldOut" onclick="javascrpit : ajaxList()"
                                    data-text="품절상품제외"> <span
                                    class="icon icon-checkbox"></span> <span
                                    class="checkbox-label">품절상품 제외</span>
                                 </label>
                              </div>
                           </div>
                        </div>
                     </div>


                     <div class="price form-item col-sm-24 col-lg-12">
                        <div>
                           <div class="form-item-title">
                              <h4>가격대</h4>
                           </div>
                           <div class="form-item-wrap ui-range row">
                              <div id="price-range" class="col-xs-12">
                                 <div class="col-xs-12">
                                    <input class="xx-control" type="text" name="priceRange[]"
                                       value="7000" size="22">
                                 </div>
                                 <div class="col-xs-12">
                                    <input class="xx-control" type="text" name="priceRange[]"
                                       value="298000" size="22">
                                 </div>
                              </div>
                              <div class="range-slider col-xs-12">
                                 <!-- 슬라이드 -->
                                 <div id="price-range-slider" class="ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                                    <div class="ui-slider-range ui-widget-header ui-corner-all" style="left: 0%; width: 0%;"></div>
                                    <a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 5.03356%;"></a> 
                                    <a class="ui-slider-handle ui-state-default ui-corner-all" href="#" style="left: 100%;"></a>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>

                     <div class="color form-item col-sm-12 col-lg-6">
                        <div class="form-item-title">
                           <h4>색상</h4>
                        </div>
                        <div class="form-item-wrap col-xs-24">
                           <div class="row box-group">
                              <div class="checkbox col-xs-auto black" >
                                 <label> 

                                 <input type="checkbox" name="color[]" onclick="javascript:ajaxList();" value="BLACK" data-text="black">
                                 <span class="icon icon-check-white"></span> 
                                 <span class="checkbox-label">
                                 <img src="/GNG/theme/pshp/img/filter-color-black.png" alt="black">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto gray">
                                 <label> 
                                 <input type="checkbox" onclick="javascript:ajaxList();" name="color[]" value="GRAY" data-text="gray"> 
                                    <span class="icon icon-check-white"></span> 
                                    <span class="checkbox-label"> <img src="/GNG/theme/pshp/img/filter-color-gray.png" alt="gray">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto brown">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="BROWN" data-text="brown"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-brown.png" alt="brown">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto burgundy">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="BURGUNDY" data-text="burgundy"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-burgundy.png"
                                       alt="burgundy">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto pink">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="PINK" data-text="pink"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-pink.png" alt="pink">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto purple">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="PURPLE" data-text="purple"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-purple.png"
                                       alt="purple">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto white">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="WHITE" data-text="white"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-white.png" alt="white">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto navy">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="NAVY" data-text="navy"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-navy.png" alt="navy">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto gradient-silver">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="SKYBLUE" ch data-text="skyblue"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-skyblue.png"
                                       alt="skyblue">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto blue">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="BLUE" data-text="blue"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-blue.png" alt="blue">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto green">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="GREEN" data-text="green"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-green.png" alt="green">
                                 </span>
                                 </label>
                              </div>
                              <div class="checkbox col-xs-auto yellow">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="YELLOW" data-text="yellow"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-yellow.png"
                                       alt="yellow">
                                 </span>
                                 </label>
                              </div>
                              
                              <div class="checkbox col-xs-auto gradient-gold">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="BEIGE" data-text="gradient-gold"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-beige.png"
                                       alt="gradient-gold">
                                 </span>
                                 </label>
                              </div>
                              
                              
                              <div class="checkbox col-xs-auto red">
                                 <label> <input type="checkbox" name="color[]" onclick="javascript:ajaxList();"
                                    value="RED" data-text="red"> <span
                                    class="icon icon-check-white"></span> <span
                                    class="checkbox-label"> <img
                                       src="/GNG/theme/pshp/img/filter-color-red.png" alt="red">
                                 </span>
                                 </label>
                              </div>

                           </div>
                        </div>
                     </div>
   




                     <!-- 검색/필터초기화
                      <div class="reset form-item col-xs-24">
                        <div class="form-item-wrap col-xs-24">
                           <button class="button" id="filterClear">
                              <span class="button-label">검색</span>
                        </button>
                        </div>
                     </div> -->

                  </div>
                      <div class="section-foot more">
                     <a class="button button hidden-md hidden-lg" id="filterMore">
                        <span class="button-label">MORE FILTER</span>
                    </a>
                  </div>
               </div>
	</section>
	</div>
	</center>
<section id="changeList">
  <div class="cboth main_section03" style="margin-top: 5px;">
      <div class="cboth main_title">PRODUCT LIST</div>
      <br>

      <br>
             <div class="catalog-operate">
                  <!--<p class="catalogCounter">전체 <strong><span id="recodeTotal">0</span>개</strong>의 상품</p>-->
                  <div class="sort form-item hidden-xs hidden-sm">
                     <div class="form-item-wrap">
                        <ul class="row">
                           <li class="col-md-auto">
                              <button class="button button-default selected" onclick="javascript:ajaxList(1,${currentPage});" >
                                 <span class="button-label" data-sort="a.sort">신상품</span>
                              </button>
                           </li>
                           <li class="col-md-auto">
                              <button class="button button-default" onclick="javascript:ajaxList(2,${currentPage});">
                                 <span class="button-label" data-sort="goodsno desc">인기순</span>
                              </button>
                           </li>
                           <li class="col-md-auto">
                              <button class="button button-default" onclick="javascript:ajaxList(3,${currentPage});">
                                 <span class="button-label" data-sort="price">낮은가격</span>
                              </button>
                           </li>
                           <li class="col-md-auto">
                              <button class="button button-default" onclick="javascript:ajaxList(4,${currentPage});">
                                 <span class="button-label" data-sort="price desc">높은가격</span>
                              </button>
                           </li>
                           <li class="col-md-auto">
                              <button class="button button-default" onclick="javascript:ajaxList(5,${currentPage});">
                                 <span class="button-label" data-sort="salem desc">할인률</span>
                              </button>
                           </li>
                        </ul>
                     </div>
                  </div>

                  <!--mobile용-->
                  <div class="sort mobile form-item col-xs-12 hidden-md hidden-lg">
                     <div class="form-item-wrap">
                        <div class="selectbox col-xs-24">
                           <div class="selectbox-data">
                              <strong class="text">인기순 </strong> <span
                                 class="icon icon-dropdown-gray-dark"></span>
                           </div>
                           <select name="sort">
                              <option value="goodsno desc"" selected="">신상순</option>
                              <option value="a.sort">인기순</option>
                              <option value="goodsnm">상품명</option>
                              <option value="price">낮은가격</option>
                              <option value="price desc">높은가격</option>
                              <option value="salem desc">할인률</option>
                           </select>
                        </div>
                     </div>
                  </div>
               </div>
      <br>
      

	<br><br>

	
 
   <br>
	
	
      <div class="cboth prd-list">
         <table summary="상품이미지, 상품 설명, 가격">
         <colgroup>
            <col width="25%">
            <col width="25%">
            <col width="25%">
            <col width="25%">
         </colgroup>
         
         <tbody>
         <tr class="nopadding"><td></td><td></td><td></td><td></td></tr>
         
         <tr>
         <c:forEach items="${categoryList}" var="goodsList" begin="0" varStatus="status" end="${fn:length(categoryList)}">
              
            <td>
            <div class="tb-center">
            <div class="box">
            <div class="thumb salebox">
                        <a href="/GNG/goodsDetail?GOODS_NUMBER=${goodsList.GOODS_NUMBER}"><img class="MS_prod_img_s" src="/GNG/file/goodsFile/${goodsList.GOODS_THUMBNAIL}" alt=""></a>
                        <input type="hidden" name="custom_price" value="${goodsList.GOODS_PRICE}">
                        <input type="hidden" name="product_price" value="${goodsList.GOODS_DISPRICE}">
                        <!-- 조건태그시작 -->
                        <c:if test="${goodsList.GOODS_DISPRICE != goodsList.GOODS_PRICE}">
                        <span class="sale_text" style="display: block;">
                        -<fmt:formatNumber value="${(goodsList.GOODS_PRICE - goodsList.GOODS_DISPRICE)*100 / goodsList.GOODS_PRICE}" type="number" />%
                        </span>
                        </c:if>
                        <%-- <c:if test="${goodsRank.GOODS_NEWDATE == 1}"> --%> 
							<span class="sale_text" style="display: block; border:0px;" >
                       		<img src="/GNG/file/NEWtag.jpg"/>
                       		</span>
					<%-- 	</c:if>
						<c:if test="${goodsRank.AMOUNT<20}"> --%> 
                      	<span class="sale_text" style="display: block; border:0px;">
                       	<img src="/GNG/file/HurryUp.png"/>
                       	</span>
                       	<%-- </c:if> --%>
                     </div>
                     <ul class="info">
                        <li class="dsc"> <a href="/GNG/goodsDetail?GOODS_NUMBER=${goodsList.GOODS_NUMBER}">${goodsList.GOODS_NAME}</a></li>
                        <li class="subname">${goodsList.GOODS_SHORTDESC}<br>(${goodsList.COLORCOUNT}color)
                        </li>
                     <c:if test="${goodsList.GOODS_DISPRICE eq goodsList.GOODS_PRICE}">
                     <li class="price"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원</li>
                     </c:if>   
                     <c:if test="${goodsList.GOODS_DISPRICE ne goodsList.GOODS_PRICE }">
                     <li class="consumer"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원</li><li class="price"><fmt:formatNumber value="${goodsList.GOODS_DISPRICE}" type="number"/>원</li>
                     </c:if>
                     <li><c:forEach items="${goodsList.COLORKIND}" var="color">
                        <img src="/GNG/theme/pshp/img/filter-color-${color}.png" width="10px" height="10px">
                        </c:forEach></li>
                     <li class="icon"><span class="MK-product-icons"></span></li>
                     </ul>
                  </div>
                  </div>
                  
               </td>
         <c:if test="${status.index == 3}">
      		<tr>
         </c:if>
         <c:if test="${status.index > 4 && (status.index+1) % 4 == 0}">
      			<tr>
         </c:if>
            </c:forEach>               
            <tr>
            </tr>
      </tbody>
         
      </table>
       <center>
           <input type="hidden" id="currentPage" value="${currentPage}"/>
               ${pagingHtml}
           
        </center>
      </div><!-- //prd-list -->
   </div><!-- //main_section03 -->
   </section>
         </div>
      </div>
   </div>
   
   <script>

   function ajaxList(sort,num){
	      var f = document.fmFilter;
	      //var searchCheck=f.searchCheck.value;
	      var color=document.getElementsByName('color[]');
	      var priceRange = document.getElementsByName('priceRange[]');
	      var sale = document.getElementsByName('sale');
	      var soldOut = document.getElementsByName('soldOut');
	      
	      var isCategory ='${isCategory}';
	      var subCategory ='${subCategory}';
	      var searchCheck='ON';
	      if(sort == null){
	        sort = '${sort}';
	      }
	      console.log("에이작리스트탐");
	      console.log(sort);
	     
      if(num != null){
	      var currentPage = num;
	      console.log('currentPage :' +currentPage);   
	   }else{
	      var currentPage = 1;
	      console.log('currentPagezz :' +currentPage);
	   }

	      
	      //색깔 검색
	      var myColor = new Array();      
	      var j =0;
	      
	      for(var i=0;i<color.length;i++){
	         //console.log("색깔이름 말해라2" + color[i].value );
	         if(color[i].checked == true){
	            //console.log("색깔이름 말해라" + color[i].value );
	            var a = color[i].value;
	            myColor[j] = color[i].value;
	            //console.log("총 색깔들" + j + myColor[j] );
	            j++;
	         }
	      }
	      
	      console.log(myColor.length+"길이");
	      for(var i=0;i<myColor.length;i++){
	         console.log("myColor색깔들" + myColor[i] );
	      }
	      //색검색끝
	      
	    //가격 검색
	      var myPriceRange = new Array();      
	            
	      myPriceRange[0]=priceRange[0].value;
	      myPriceRange[1]=priceRange[1].value;
	      
	      console.log("myPriceRange : " +myPriceRange.length);
	      console.log("myPriceRange1 : " +myPriceRange[0]);
	      console.log("myPriceRange2 : " +myPriceRange[1]);
	      //가격검색 끝
	      
	      //세일상품 검색 시작
	      var mySale=sale[0].checked;
	      console.log("sale 은?? " +mySale);
	      if(mySale==true)
	      {
	         mySale="on";
	         console.log("세일체크"+mySale);
	      }
	      
	      var soldOut=soldOut[0].checked;
	      console.log("soldOut 은?? " +soldOut);
	      if(soldOut==true)
	      {
	        soldOut="on";
	         console.log("솔드아웃체크"+soldOut);
	      } 
	      
	      
	      //세일상품 검색 끝

	      
	       $.ajaxSettings.traditional = true;//배열 형태로 서버쪽 전송을 위한 설정
	       $.ajax({
	            url: "/GNG/goods/goodsCategory",
	            type : "post",
	            data: {"currentPage":currentPage,"CATEGORY":isCategory,"myColor":myColor,"SUBCATEGORY":subCategory,"priceRange":myPriceRange,"searchCheck":searchCheck,"sale":mySale,"sort":sort, "soldOut":soldOut},
	            success:function(data){
	               $("#changeList").html(data);
	               //console.log("date?"+data);
	               //개쩐다
	            }
	         });  
	      
	      
	   }      
      
      //console.log("콘솔내용" + color[0].value );
      
      //if($(color[1]).is(":checked");)
      //   console.log("콘솔내용2");
      
      /*  $.ajax({
            url: "/SIRORAGI/goods/goodsCategory",
            type : "post",
            data: {"sort":i,"category":isCategory},
            success:function(data){
               $("#changeSort").html(data);
            }
         }); */
      
         
         
      /*** ranking 가격bar 마우스를 뗄 경우 이벤트 발생 ***/
      $( "#price-range-slider" ).slider({
           stop: function() {
              ajaxList();
            console.log("다다다");
            //솔트(2);
           }
         });


   


</script>

</body>
</html>