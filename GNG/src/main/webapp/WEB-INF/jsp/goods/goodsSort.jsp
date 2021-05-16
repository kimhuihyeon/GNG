<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/gng/theme/aboki/pagingcss.css">

</head>
<body>

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
                           <c:if test="${sort ==1}">
                              <button class="button button-default selected" onclick="javascript:ajaxList(1);">
                                 <span class="button-label" data-sort="goodsno desc">신상품</span>
                              </button>
                           </c:if>
                           
                           <c:if test="${sort !=1}">
                              <button class="button button-default" onclick="javascript:ajaxList(1);">
                                 <span class="button-label" data-sort="goodsno desc">신상품</span>
                              </button>
                           </c:if>
                           </li>
                           
                           <li class="col-md-auto">
                           <c:if test="${sort ==2}">
                              <button class="button button-default selected" onclick="javascript:ajaxList(2);">
                                 <span class="button-label" data-sort="a.sort">인기순</span>
                              </button>
                           </c:if>
                           <c:if test="${sort !=2}">
                              <button class="button button-default" onclick="javascript:ajaxList(2);">
                                 <span class="button-label" data-sort="a.sort">인기순</span>
                              </button>                           
                           </c:if>
                           </li>
                           
                           <li class="col-md-auto">
                           <c:if test="${sort ==3}">
                              <button class="button button-default selected" onclick="javascript:ajaxList(3);">
                                 <span class="button-label" data-sort="price">낮은가격</span>
                              </button>
                           </c:if>
                           <c:if test="${sort !=3}">
                              <button class="button button-default" onclick="javascript:ajaxList(3);">
                                 <span class="button-label" data-sort="price">낮은가격</span>
                              </button>                           
                           </c:if>
                           </li>
                           
                           <li class="col-md-auto">
                              <c:if test="${sort ==4}">
                                 <button class="button button-default selected" onclick="javascript:ajaxList(4);">
                                    <span class="button-label" data-sort="price desc">높은가격</span>
                                 </button>
                              </c:if>
                              
                              <c:if test="${sort !=4}">
                                 <button class="button button-default" onclick="javascript:ajaxList(4);">
                                    <span class="button-label" data-sort="price desc">높은가격</span>
                                 </button>
                              </c:if>
                           </li>
                              
                           <li class="col-md-auto">
                              <c:if test="${sort ==5}">
                                 <button class="button button-default selected" onclick="javascript:ajaxList(5);">
                                    <span class="button-label" data-sort="salem desc">할인률</span>
                                 </button>
                              </c:if>
                              
                              <c:if test="${sort !=5}">
                                 <button class="button button-default" onclick="javascript:ajaxList(5);">
                                    <span class="button-label" data-sort="salem desc">할인률</span>
                                 </button>
                              </c:if>
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
                              <option value="a.sort" selected="">인기순</option>
                              <option value="goodsno desc">신상품</option>
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
         
         <c:forEach items="${categoryList}" var="goodsList" begin="0" varStatus="status" end="${fn:length(categoryList)}">
         
         
            <td>
            <div class="tb-center">
            <div class="box">
            <div class="thumb salebox">
                        <a href="/gng/goodsDetail?GOODS_NUMBER=${goodsList.GOODS_NUMBER}"><img class="MS_prod_img_s" src="/gng/file/goodsFile/${goodsList.GOODS_THUMBNAIL}" alt=""></a>
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
                       		<img src="/gng/file/NEWtag.jpg"/>
                       		</span>
					<%-- 	</c:if>
						<c:if test="${goodsRank.AMOUNT<20}"> --%> 
                      	<span class="sale_text" style="display: block; border:0px;">
                       	<img src="/gng/file/HurryUp.png"/>
                       	</span>
                       	<%-- </c:if> --%>
                     </div>
                     <ul class="info">
                        <li class="dsc"> <a href="/gng/goodsDetail?GOODS_NUMBER=${goodsList.GOODS_NUMBER}">${goodsList.GOODS_NAME}</a></li>
                        <li class="subname">${goodsList.GOODS_SHORTDESC}<br>(${goodsList.COLORCOUNT}color)
                        </li>
                     <c:if test="${goodsList.GOODS_DISPRICE eq goodsList.GOODS_PRICE}">
                     <li class="price"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원</li>
                     </c:if>   
                     <c:if test="${goodsList.GOODS_DISPRICE ne goodsList.GOODS_PRICE }">
                     <li class="consumer"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원</li><li class="price"><fmt:formatNumber value="${goodsList.GOODS_DISPRICE}" type="number"/>원</li>
                     </c:if>
                     <li><c:forEach items="${goodsList.COLORKIND}" var="color">
                        <img src="/gng/theme/pshp/img/filter-color-${color}.png" width="10px" height="10px">
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

  
</body>
</html>