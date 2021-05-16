<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<link rel="stylesheet" href="/GNG/theme/aboki/common.css">
<link rel="stylesheet" href="/GNG/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/header.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/main.css">
<link rel="stylesheet" href="/GNG/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/shopdetail(1).css">
<link rel="stylesheet" href="/GNG/theme/aboki/power_review_custom.2.css">
<link rel="stylesheet" href="/GNG/theme/aboki/4_1_1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/base.css">
<link rel="stylesheet" href="/GNG/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/GNG/theme/aboki/button.css">
<link rel="stylesheet" href="/GNG/theme/aboki/detail131031.css">
<link rel="stylesheet" href="/GNG/theme/aboki/shopdetail_color_tab_04.css">
<link rel="stylesheet" href="/GNG/theme/aboki/jquery.mCustomScrollbar.css">
<link rel="stylesheet" href="/GNG/theme/aboki/scroll.css">
<link rel="stylesheet" href="/GNG/theme/aboki/shopdetail.css">
<link rel="stylesheet" href="/GNG/theme/aboki/sorivu_basic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/payco_buttons_pc.css">
<link rel="stylesheet" href="/GNG/theme/aboki/pagingcss.css">

<body>
<script>
var oriimg;
function multi_image_view(obj) {
    var img_obj = document.getElementById('lens_img');
    if (img_obj) {
        oriimg = img_obj.src;
        img_obj.src = obj.src;
    }
}
function multi_image_ori() {
    var img_obj = document.getElementById('lens_img');
    if (img_obj) {
        img_obj.src =oriimg;
    }
}
</script>
	<br><br><br><br>
 <div id="contentWrapper">
        <div id="contentWrap">
            <div id="content">
                <div id="productDetail">
                    <div class="prd-class-hd"> <!-- 카테고리 정렬 -->
                           <dl class="loc-navi">
                            <dt class="blind">현재 위치</dt>
                            <dd>
                            <a href="/GNG/main">home</a>
                                &gt;
                            <a href="/GNG/goods/goodsCategory?CATEGORY=${goodsBasic.GOODS_CATEGORY1}">${goodsBasic.GOODS_CATEGORY1}</a>
                               &gt;
                            <a href="/GNG/goods/goodsCategory?CATEGORY=${goodsBasic.GOODS_CATEGORY1}&SUBCATEGORY=${goodsBasic.GOODS_CATEGORY2}">${goodsBasic.GOODS_CATEGORY2}</a>
                              &gt;
                            <a href="#">${goodsBasic.GOODS_NAME}</a>
                               
                                
                            </dd>
                           </dl>
                          </div>

  <form name="fmOrder">     
  <input type="hidden" name="mode"> 
  <input type="hidden" name="goodsno" value="${goodsBasic.GOODS_NUMBER }">
  
 
  <div class="page-body"> <!-- 상품 정보 -->
      <div class="thumb-info">
      <div class="thumb-wrap">
     <div class="thumb">
     <ul class="multi_image">
     <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="0">
     <li>
     <img class="detail_image" id="lens_img" src="/GNG/file/goodsFile/${goodsImage.IMAGE}" border="0" width="300">   
     </li>
     </c:forEach>
     <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="0" end="4">
     <li>
     <img style="float: left; width: 120px" height="120px" src="/GNG/file/goodsFile/${goodsImage.IMAGE}" onmouseover="multi_image_view(this);">
     </li>
     </c:forEach>
     </ul>  
      </div>
     
                 
      </div>
      <div class="info">
             <h3 class="tit-prd">${goodsBasic.GOODS_NAME}</h3>
                                   <br/>
                 
            <div class="subname">${goodsBasic.GOODS_SHORTDESC}<br></div>
            
            <div class="table-opt">
            <table>
            <tbody>
            <tr>
               <th scope="row">
               <div class="price">상품 조회 수</div>
               </th>
               <td class="price">
                <div class="price">${goodsBasic.GOODS_COUNT}&nbsp;Hit</div>
               </td>
               </tr>
            <tr>
                   <th scope="row">
                    <div class="price">판매 가격</div>
                    </th>
                    <td class="price" style="">
                    <div style="">
                    <span class="item_prc">
                    <c:if test="${goodsBasic.GOODS_PRICE eq goodsBasic.GOODS_DISPRICE}">
               
                  <fmt:formatNumber value="${goodsBasic.GOODS_PRICE}" type="number" />원
                  
               </c:if>
               </span>
               
               <c:if test="${goodsBasic.GOODS_PRICE ne goodsBasic.GOODS_DISPRICE}">
                  
                  <strike style="">
                  <fmt:formatNumber value="${goodsBasic.GOODS_PRICE}" type="number" />원
                  </strike>
                  &nbsp;
                  <span class="item_prc">
                  <fmt:formatNumber value="${goodsBasic.GOODS_DISPRICE}" type="number" />원
                  </span>&nbsp;
                  <font color="red">(<span id="discount_percent_span" style="font-color:red"><fmt:formatNumber value="${(goodsBasic.GOODS_PRICE - goodsBasic.GOODS_DISPRICE)*100 / goodsBasic.GOODS_PRICE}" type="number" /></span>%할인)</font>
                  
               </c:if>
               </div>
                      
                    
                    </td>
                </tr>
                
                <tr class="option">
               <th scope="row">
               <div>상품 옵션</div>
               </th>
               <td>
               <div>
               <span id="MK_opt_0">
               <select id="option" onchange="setOption(this)" style="width:225px">
                     <option value="">-옵션 선택-</option>
               <c:forEach var="goodsDetail" items="${goodsDetail}" varStatus="stat">
                                    
                     <c:if test="${goodsDetail.GOODS_AMOUNT ne 0}">
                     <c:if test="${goodsBasic.GOODS_DISPRICE ne goodsBasic.GOODS_PRICE }">
                     <option
                     value="${goodsDetail.GOODS_COLOR }-${goodsDetail.GOODS_SIZE }"
                     optnm="${goodsDetail.GOODS_COLOR }-${goodsDetail.GOODS_SIZE }"
                     stock="${goodsDetail.GOODS_AMOUNT }"
                     price="${goodsBasic.GOODS_DISPRICE }"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     ${goodsDetail.GOODS_COLOR } - ${goodsDetail.GOODS_SIZE }
                     (${goodsDetail.GOODS_AMOUNT }개)</option>
                     </c:if>
                     <c:if test="${goodsBasic.GOODS_DISPRICE eq goodsBasic.GOODS_PRICE }">
                     <option
                     value="${goodsDetail.GOODS_COLOR }-${goodsDetail.GOODS_SIZE }"
                     optnm="${goodsDetail.GOODS_COLOR }-${goodsDetail.GOODS_SIZE }"
                     stock="${goodsDetail.GOODS_AMOUNT }"
                     price="${goodsBasic.GOODS_PRICE }"
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     ${goodsDetail.GOODS_COLOR } - ${goodsDetail.GOODS_SIZE }
                     (${goodsDetail.GOODS_AMOUNT }개)</option>
                     </c:if>
                     </c:if>
                     <c:if test="${goodsDetail.GOODS_AMOUNT eq 0}">
                     <option
                     value="${goodsDetail.GOODS_COLOR }-${goodsDetail.GOODS_SIZE }"
                     optnm="${goodsDetail.GOODS_COLOR }-${goodsDetail.GOODS_SIZE }"
                     stock="0" price="0" disabled=""
                     kinds="${goodsDetail.GOODS_KIND_NUMBER }">
                     ${goodsDetail.GOODS_COLOR } - ${goodsDetail.GOODS_SIZE }
                     (품절)</option>
                     </c:if>
               </c:forEach>
               </select>
               </span>
               </div>
               <tr>
               <td colspan="2">
               <div>
                  <div class="MK_optAddWrap">
                     <div id="MK_innerOptWrap">
                        <div id="MK_innerOptScroll">
                           <ul class="MK_inner-opt-cm" id="MK_innerOpt_01"></ul>
                           
                           <div id="MK_innerOptTotal" class="">
                              <p class="totalRight">
                              <span class="MK_txt-total">TOTAL</span> 
                               <span id="MK_txt-won" data-price="">0원</span>
                              </p>
                           </div>
                        
                        </div>
                     </div>
                  </div>
               </div>
               
               
            
               
            </tbody>
            </table>
            </div>
            
            <div class="prd-btns" style="width:450px">
         <a href="javascript:_exec('buy');" class="buy">BUY IT NOW</a>
         <a id="cartBtn" href="javascript:_exec('cart');" class="basket" style="width:150px">ADD TO CART</a> 
         <a id="wishBtn" href="/GNG/todayGoods" class="wish">TODAY GOODS</a>
         <div class="cboth pdt20" style="height: 0px;"></div>
         
                 
           </div>
           <div class="popup-btn-wrap">
               <ul class="inline"> 
                  <li><a
                  href="#GNG"
                  class="member-benefit" onclick="return false;">회원등급혜택</a></li>
                  <li><a
                  href="#GNG"
                  class="card-benefit" onclick="return false;">이달의카드혜택</a></li>
                  <li><a
                  href="#GNG"
                  class="size-guide" onclick="return false;">SIZE GUIDE</a></li>
               </ul>
         </div>
         <!-- 팝업 -->
         <div class="popup-wrap">
         <!-- 회원등급혜택 팝업 -->
         <div class="member-benefit popup-layer-to">
            <img src="/GNG/theme/pshp/img_MODA/membership-benefit.jpg"
                alt="회원등급혜택"> <a
                href="http://www.aboki.net/shop/shopdetail.html?branduid=73061&amp;search=%25BF%25A5%25BA%25B8&amp;sort=sellcnt&amp;xcode=387&amp;mcode=001&amp;scode=001&amp;GfDT=bmt%2FW1w%3D#"
                class="btn-popup-close" onclick="return false;"><img
                src="/GNG/theme/pshp/img_MODA/icon-pop-close.png"
                alt="팝업닫기"></a>
         </div>
         <!--// 회원등급혜택 팝업 -->
         <!-- 이달의카드혜택 팝업 -->
         <div class="card-benefit popup-layer-to">
            <img src="/GNG/theme/pshp/img_MODA/card_benefit.gif"
                alt="이달의카드혜택"> <a
                href="http://www.aboki.net/shop/shopdetail.html?branduid=73061&amp;search=%25BF%25A5%25BA%25B8&amp;sort=sellcnt&amp;xcode=387&amp;mcode=001&amp;scode=001&amp;GfDT=bmt%2FW1w%3D#"
                class="btn-popup-close" onclick="return false;"><img
                src="/GNG/theme/pshp/img_MODA/icon-pop-close.png"
                alt="팝업닫기"></a>
           </div>
         <!--// 이달의카드혜택 팝업 -->
         <!-- 사이즈가이드 팝업 -->
         <div class="size-guide popup-layer-to">
         <img src="/GNG/theme/pshp/img_MODA/size-guide.jpg"
             alt="사이즈가이드"> <a
             href="http://www.aboki.net/shop/shopdetail.html?branduid=73061&amp;search=%25BF%25A5%25BA%25B8&amp;sort=sellcnt&amp;xcode=387&amp;mcode=001&amp;scode=001&amp;GfDT=bmt%2FW1w%3D#"
             class="btn-popup-close" onclick="return false;"><img
             src="/GNG/theme/pshp/img_MODA/icon-pop-close.png"
             alt="팝업닫기"></a>
         </div>
         <!--// 사이즈가이드 팝업 -->
         </div>
                              <!--// 팝업 -->
              
              
             
             
             
             
             
             
         </div> <!-- info -->
       
         </div><!-- thumb-info -->
         <div class="prd-detail">
         <div id="page01" class="cboth"></div>
            <div class="detail_menu">
            <ul style="">
            <li><a
            href="#new_detail"
            class="on tab_scroll">DETAIL</a></li>
            <li><a
            href="#powerReview"
            class="tab_scroll">REVIEW</a></li>
            <li><a
            href="#qna"
            class="tab_scroll">Q&amp;A</a></li>
            <li><a
            href="#modelSize"
            class="tab_scroll">MODEL SIZE</a></li>
            </ul>
            </div>
            
            
       
       <div id="new_detail">
                              <!--상품설명 시작-->
                              <!--타이틀시작-->
         <div class="tit_box">
         <span><u>PRODUCT INFORMATION</u></span>
         </div>
         <table class="pro_info_1101">
         <colgroup>
            <col style="WIDTH: 265px">
            <col style="WIDTH: 635px">
         </colgroup>
         <tbody>
            <tr>
            <td id="pro_pi">
            <img src="/GNG/theme/pshp/img_MODA/230.jpg">
            <span>소재</span>&nbsp;폴리95% 스판5%<br></td>
            <td id="pro_ex">
            <span style="font-family: Nanum Gothic,dotum,Arial,sans-serif; FONT-SIZE: 12px; line-height:40px; vertical-align: center; TEXT-ALIGN: center; MARGIN: 0px">${goodsBasic.GOODS_DESC}</span>
            </td>
            </tr>
            
         
         </tbody>
         </table>
         <!--상품설명 끝-->
         <!--착용감-->
         <!--타이틀시작-->
         <div class="tit_box">
            <span><u>CHECK POINT 01</u></span><br>
            <br>
            <p style="MARGIN: 0px">착용감 및 기타 확인사항 입니다.</p>
            </div>
         <table class="fit">
         <colgroup>
            <col style="WIDTH: 225px">
            <col style="WIDTH: 90px">
            <col style="WIDTH: 135px">
            <col style="WIDTH: 90px">
            <col style="WIDTH: 135px">
            <col style="WIDTH: 90px">
            <col style="WIDTH: 135px">
         </colgroup>
         <tbody>
         <tr>
            <th><span>두께</span></th>
            <td class="noline_1101"><font color="#357ccb">●</font></td>
            <td class="line_1101">얇음</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">보통</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">두꺼움</td>
            </tr>
            <tr>
            <th><span>안감</span></th>
            <td class="noline_1101"><font color="#357ccb">●</font></td>
            <td class="line_1101">없음</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">있음</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">기모</td>
            </tr>
            <tr>
            <th><span>신축성</span></th>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">없음</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">살짝있음</td>
            <td class="noline_1101"><font color="#357ccb">●</font></td>
            <td class="line_1101">좋음</td>
            </tr>
            <tr>
            <th><span>비침</span></th>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">있음</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">약간있음</td>
            <td class="noline_1101"><font color="#357ccb">●</font></td>
            <td class="line_1101">없음</td>
            </tr>
            <tr>
            <th><span>핏감</span></th>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">슬림핏</td>
            <td class="noline_1101"><font color="#357ccb">●</font></td>
            <td class="line_1101">보통</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">루즈핏</td>
            </tr>
            <tr>
            <th><span>사이즈</span></th>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">작게나옴</td>
            <td class="noline_1101"><font color="#357ccb">●</font></td>
            <td class="line_1101">정사이즈</td>
            <td class="noline_1101"><span style="COLOR: #e1e1e1">●</span></td>
            <td class="line_1101">크게나옴</td>
            </tr>
         </tbody>
         </table>   
         <!-- 사이즈 표 -->
         <div class="tit_box">
            <span><u>CHECK POINT 02</u></span><br>
            <br>
            <p style="MARGIN: 0px">
            사이즈 측정방법에 따라 1~3cm의 오차가 있을수 있습니다.<br>평소 자신이 입으시는 상품의
            실측과 비교해서 주문해주세요!!
            </p>
         </div>
         <table class="ch03">
            <colgroup>
               <col style="WIDTH: 450px">
               <col style="WIDTH: 450px">
            </colgroup>
            <tbody>
               <tr>
               <td class="che03_01"><img class="f_img"
               src="/GNG/theme/pshp/img_MODA/size_tee02.jpg"></td>
               <td class="che03_01">
            <table id="cmcm">
               <colgroup>
                  <col style="WIDTH: 430px">
               </colgroup>
               <tbody>
               <tr>
               <td>단위:cm</td>
               </tr>
               </tbody>
            </table>
            <table class="ch03_size">
               <colgroup>
               <col style="WIDTH: 86px">
               <col style="WIDTH: 86px">
               <col style="WIDTH: 86px">
               <col style="WIDTH: 86px">
               <col style="WIDTH: 86px">
            </colgroup>
            <thead>
               <tr>
               <td><span>SIZE</span></td>
               <td><span>총장</span></td>
               <td><span>어깨</span></td>
               <td><span>가슴</span></td>
               <td><span>소매</span></td>
               </tr>
            </thead>
            <tbody>
               <tr>
               <td>M</td>
               <td>77</td>
               <td>49.5</td>
               <td>54.5</td>
               <td>25</td>
               </tr>
               <tr>
               <td>L</td>
               <td>78</td>
               <td>51</td>
               <td>56</td>
               <td>26</td>
               </tr>
               <tr>
               <td>XL</td>
               <td>79</td>
               <td>52.5</td>
               <td>57.5</td>
               <td>27</td>
               </tr>
               <tr>
               <td>-</td>
               <td>-</td>
               <td>-</td>
               <td>-</td>
               <td>-</td>
               </tr>
               <tr>
               <td>-</td>
               <td>-</td>
               <td>-</td>
               <td>-</td>
               <td>-</td>
               </tr>
            </tbody>
            </table>
            <table id="wash">
            <tbody>
               <tr>
               <td><img class="f_img"
               src="/GNG/theme/pshp/img_MODA/se01.gif"></td>
               <td><img class="f_img"
               src="/GNG/theme/pshp/img_MODA/se02.gif"></td>
               <td><img class="f_img"
               src="/GNG/theme/pshp/img_MODA/se03.gif"></td>
               <td><img class="f_img"
               src="/GNG/theme/pshp/img_MODA/se04.gif"></td>
               <td><img class="f_img"
               src="/GNG/theme/pshp/img_MODA/se05.gif"></td>
               </tr>
               <tr>
               <td>▲</td>
               <td>▲</td>
               <td><br></td>
               <td><br></td>
               <td>▲</td>
               </tr>
            </tbody>
            </table>
               </td>
               </tr>
               <!-- <tr>
               <td colspan="2"><a
               onclick="#"
               href="#"><img
               src="./대표 남자쇼핑몰 GNGdetail_files/si_ch.gif"></a> <a
               onclick="#"
               href="#"><img
               src="./대표 남자쇼핑몰 GNGdetail_files/wa_ti.gif"></a></td>
               </tr> -->
            </tbody>
            </table>
            <!-- 모델피팅 시작 -->
            <div class="tit_box">
            <span><u>MODEL FITTING</u></span><br>
            <br>
            <p style="MARGIN: 0px">피팅한 모델 사이즈를 확인해주세요!!</p>
            </div>
            <!--타이틀 끝-->
            <table class="model">
               <colgroup>
               <col style="WIDTH: 900px">
               </colgroup>
               <tbody>
                  <tr>
                  <!--이미지 교체해주세요-->
                  <td><img
                  src="/GNG/theme/pshp/img_MODA/GNGMEMBER.png"></td>
                  </tr>
               </tbody>
            </table>
      </div><!-- new_detail -->
      
      <p id="color_tab_01" style="TEXT-ALIGN: center; MARGIN: 0px" align="center">
      <font color="#000066" size="6" face="Arial"><strong>-${goodsBasic.GOODS_NAME}-</strong></font>
      </p><br><br>
    	 <c:forEach var="goodsImage" items="${goodsImage}" varStatus="stat" begin="5">
      <img style="margin-left:10%;" src="/GNG/file/goodsFile/${goodsImage.IMAGE}"><br>
      </c:forEach>
      
      
      <!-- <img
      src="./대표 남자쇼핑몰 GNGdetail_files/170511_3_JEE_H_tee_navy_02.jpg"><br>
      <img
      src="./대표 남자쇼핑몰 GNGdetail_files/170511_3_JEE_H_tee_navy_03.jpg"><br>
      <img
      src="./대표 남자쇼핑몰 GNGdetail_files/170511_3_JEE_H_tee_navy_04.jpg"><br>
      <img
      src="./대표 남자쇼핑몰 GNGdetail_files/170511_3_JEE_H_tee_navy_05.jpg"><br>
       -->
      <c:if test="${!empty relatedGoods}">
      <div id="malltb_video_player"
         style="margin-top: 10px; margin-bottom: 10px; text-align: center; display: none;"></div>
   <!--    <form name="allbasket" method="post"
         action="http://www.aboki.net/shop/basket.html"> -->
         <div class="sub_best_title">RELATION PRODUCTS</div>
      </c:if>
   <div class="related-produdct-wrap prd-list">
      <table>
         <colgroup>
         <col width="20%">
         <col width="20%">
         <col width="20%">
         <col width="20%">
         <col width="20%">
         </colgroup>
      <tbody>
         <tr class="nopadding">
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         <td></td>
         </tr>
         <tr>
         <c:forEach var="relatedGoods" items="${relatedGoods}" varStatus="stat">
         <td>
         <div class="tb-center">
         <div class="box">
           
         <div class="thumb">
         <a href="/GNG/goodsDetail?GOODS_NUMBER=${relatedGoods.GOODS_NUMBER }">
         <img class="MS_prod_img_s" src="/GNG/file/goodsFile/${relatedGoods.GOODS_THUMBNAIL}" alt="상품 섬네일"></a>
         </div>
            <ul class="info">
            <li class="dsc">${relatedGoods.GOODS_NAME}</li>
            <li class="price">
            <c:if test="${relatedGoods.GOODS_PRICE eq relatedGoods.GOODS_DISPRICE}">
               <fmt:formatNumber value="${relatedGoods.GOODS_PRICE}" type="number" />원
            </c:if>
            <c:if test="${relatedGoods.GOODS_PRICE ne relatedGoods.GOODS_DISPRICE}">   
            <strike style="">
            <fmt:formatNumber value="${relatedGoods.GOODS_PRICE}" type="number" />원
            </strike>
            &nbsp;
            <span class="item_prc">
            <fmt:formatNumber value="${relatedGoods.GOODS_DISPRICE}" type="number" />원
            </span>&nbsp;
            <font color="red">(<span id="discount_percent_span"><fmt:formatNumber value="${(relatedGoods.GOODS_PRICE - relatedGoods.GOODS_DISPRICE)*100 / relatedGoods.GOODS_PRICE}" type="number" /></span>%할인)</font>
            </c:if>
            </li>
            </ul>
         </c:forEach>   
         </div>
         </div>
         </td>
         </tr>
      </tbody>
      </table>
   </div>
   </div><!-- prd-detail -->
   
   <div class="cboth pdt40"></div>

   <div id="page02" class="cboth"></div>
   <div class="detail_menu">
      <ul>
         <li><a href="#new_detail" class="tab_scroll">DETAIL</a></li>
         <li><a href="#powerReview" class="on tab_scroll">REVIEW</a></li>
         <li><a href="#qna" class="tab_scroll">Q&amp;A</a></li>
         <li><a href="#modelSize" class="tab_scroll">MODEL SIZE</a></li>
      </ul>
   </div>
   
   <div class="review-banner relative">
      <img src="/GNG/theme/pshp/img_MODA/review-banner.jpg" alt="">
      <a href="http://www.aboki.net/board/power_review.html"></a>
   </div>
         <div class="cboth p_review" id="changeReviewList"> 
                        <div id="powerReview">
                           <div class="hd-t">
                              <c:if test="${sessionScope.MEMBER_ID eq null}">
                                 <a href="#"  data-size="md" data-label="구매 후기 작성"
                                    onClick="alert('로그인을 해주세요.'); return false;">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                 </a>
                              </c:if> 
            				<c:if test="${sessionScope.MEMBER_ID ne null and checkBuy ne goodsBasic.GOODS_NUMBER}">
            					 <a href="#"  data-size="md" data-label="구매 후기 작성"
                                    onClick="alert('구매후 작성 가능합니다..'); return false;">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                 </a>
            				</c:if>
                              <c:if test="${sessionScope.MEMBER_ID ne null and checkBuy eq goodsBasic.GOODS_NUMBER}">
                                 <a href="/GNG/review/reviewForm?GOODS_NUMBER=${goodsBasic.GOODS_NUMBER}"
                                    target="GNGl" data-size="md" data-label="구매 후기 작성">
                                       <div class="hd-t"><h2>POWER REVIEW 작성하기</h2></div>
                                       </a>
                              </c:if>
                           </div>     
                           
                           <div class="PR15N01-hd">
                              <h2>
                                 프리미엄 상품평 <span></span>
                              </h2>
                           </div>
                           
                           <div id="listPowerReview" class="MS_power_review_list">
                           <c:forEach var="goodsReview" items="${goodsReview}" varStatus="stat">
                           <c:if test="${reviewEndPagingNum >= stat.count}">
                           <c:if test="${reviewStartPagingNum < stat.count}">
                           <ul class="PR15N01-review-wrap">
                                 <li id="power_review_block20180711112229"
                                    class="power-review-list-box">
                                 <div class="hd-box">
                                    <ul class="desc">
                                    <li class="pr-list-writer">작성자 : ${goodsReview.MEMBER_NAME}</li><br>
                                    <li class="pr-list-writer"><fmt:formatDate value="${goodsReview.REVIEW_REGDATE}" pattern="YYYY-MM-dd HH:mm" /></li>
                                    </ul>
                                    <div class="star-icon">
                                    <span class="star">
                                   	<c:if test="${goodsReview.REVIEW_SCORE == 20 }">
									<font color="#FFBF00" size="5">★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 40 }">
									<font color="#FFBF00" size="5">★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 60 }">
									<font color="#FFBF00" size="5">★★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 80 }">
									<font color="#FFBF00" size="5">★★★★</font>
									</c:if>
									<c:if test="${goodsReview.REVIEW_SCORE == 100 }">
									<font color="#FFBF00" size="5">★★★★★</font>
									</c:if>
                                    </span>
                                    <span class="icon">
                                    <img src="/GNG/theme/pshp/img_MODA/ico_new_h38.png">
                                    </span>
                                    </div>
                                 </div><!-- hd-box -->
                           <span class="pr-options" style="display: none;">${goodsReview.REVIEW_CONTENT}</span>   
                           <div class="PR15N01-hd">
                           <h2>제목 : ${goodsReview.REVIEW_TITLE }</h2>
                           </div>
                           <div class="content">
                              <p class="content_p"><a class="more-options">내용 : ${goodsReview.REVIEW_CONTENT }</a></p>
                           <div class="ctr">
                           <div class="photo-list">
                                 <ul>
                                    <li>
                                       <div><span></span>
                                       <c:if test="${goodsReview.REVIEW_IMAGE ne null }">
                                       <img src="/GNG/file/reviewFile/${goodsReview.REVIEW_IMAGE}">
                                       </c:if>
                                       </div>
                                    <div class="attach-preview"></div></li>                                    
                                 </ul>
                           </div>   
                                                   
                             <c:if test="${goodsReview.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/reviewDelete">
													<c:param name="REVIEW_NUMBER" value="${goodsReview.REVIEW_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
													<%-- <c:param name="REVIEW_IMAGE" value="${review.REVIEW_IMAGE }" /> --%>
							  </c:url>
							 <a href="${viewURL}" class="delete" onclick="return delchk()">[삭제]</a>
							  </c:if> 
                              
                           </div><!-- ctr -->
                           </div><!-- content -->

                                 </li><!-- power-review-list-box -->
                           </ul><!-- PR15N01-review-wrap -->
                           </c:if>
                           </c:if>
                           </c:forEach>
                           <c:if test="${reviewSize gt 5 }">
                           <div style="text-align:center;">
                           <c:if test="${reviewNowPage ne 1 }">
                           <a class="pg_prev" style="margin-top: -8px;" href="javascript:ajaxReviewPaging(1,${reviewEndPagingNum},${reviewStartPagingNum},${reviewNowPage});"></a>
                           </c:if>
                              <span class="pg_current">${reviewNowPage}</span>
                              <c:if test="${reviewNowPage ne 1 }">
                              <span class="pg_page">
                              ${reviewTotalPage}</span>   
                              </c:if>
                           <c:if test="${reviewNowPage ne reviewTotalPage }">
                           <a class="pg_next" style="margin-top: -8px;" href="javascript:ajaxReviewPaging(2,${reviewEndPagingNum},${reviewStartPagingNum},${reviewNowPage});"></a>
                           </c:if>
                           </div>
                           </c:if>
                           
                           </div><!-- listPowerReview -->
                           
                           
                           </div><!-- powerReview -->    

         </div><!-- cboth p_review -->
         
         <div class="cboth pdt80"></div>
                     <div class="cboth pdt40"></div>

                     <a name="brandqna_list"></a>
                     <div id="page03" class="cboth"></div>
                     <div class="detail_menu">
                        <ul>
                           <li><a
                              href="#new_detail"
                              class="tab_scroll">DETAIL</a></li>
                           <li><a
                              href="#powerReview"
                              class="tab_scroll">REVIEW</a></li>
                           <li><a
                              href="#qna"
                              class="on tab_scroll">Q&amp;A</a></li>
                           <li><a
                              href="#modelSize"
                              class="tab_scroll">MODEL SIZE</a></li>
                        </ul>
                     </div>
                     <div class="cboth"></div>
                     <h3 class="cboth tit-detail">
                        <span class="btns">
                        <a href="/GNG/qna/GNGl_qnaForm" target="GNGl" data-size="md" data-label="1:1상품 문의">Q&amp;A &nbsp;WRITE</a>
                        </span>
                     </h3>
                     <br>
                     <br>
               
                     
                     
         <section class="product-view-qna-list section box-shadow" id="changeQnaList">
         <div class="PR15N01-hd" id="qna">
            <h2>상품문의</h2>
         </div>
         <div>
         
            <!-- ajax_review_list 감싸는 div 삭제 불가 -->
            <div id="ajax_qna_list">
               <div class="section-body">
                  <ul class="list-dropdown">
               
                     <c:forEach var="goodsQna" items="${goodsQna}" varStatus="stat">
                     <c:if test="${qnaEndPagingNum >= stat.count}">
                     <li>
                        <div class="brief">
                        <!-- 질문자 제목 -->
                           <strong class="title">${goodsQna.QNA_TITLE}</strong>
                           <div class="info">
                              <p class="author">${goodsQna.MEMBER_NAME}</p>
                              <p class="date">/ ${goodsQna.QNA_REGDATE}</p>
                           </div>
                        </div>
                        <div class="detail">
                        <!-- 질문자내용 -->
                           <div class="contents">
                              <div class="description">
                                 <p>${goodsQna.QNA_CONTENT} 
                                  <c:if test="${goodsQna.MEMBER_NUMBER eq sessionScope.MEMBER_NUMBER }">
												<c:url var="viewURL" value="/qnaDelete">
													<c:param name="QNA_NUMBER" value="${goodsQna.QNA_NUMBER}" />
													<c:param name="DETAIL" value="1" />
													<c:param name="GOODS_NUMBER" value="${goodsBasic.GOODS_NUMBER}" />
								</c:url>
							    <a href="${viewURL}" style="float:right;" class="delete" onclick="return delchk()">[삭제]</a>
							  </c:if> 
                                 </p>
                                 <c:if test="${goodsQna.IMAGE1 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/GNG/file/qnaFile/${goodsQna.IMAGE1}">
                                    </div>
                                 </c:if>
                                 <c:if test="${goodsQna.IMAGE2 ne null }">
                                    <div class="picture">
                                       <img
                                          src="/GNG/file/qnaFile/${goodsQna.IMAGE2}">
                                    </div>
                                 </c:if>
                                                              
                              
                              </div>
                           </div>
                        <!-- 답변내용 -->
                        <c:if test="${goodsQna.QNA_REPCONTENT ne null}">
                           <div class="answer">
                              <img src="/GNG/theme/admin.png" style="width: 100px;height: 50px;">
                              <p>${goodsQna.QNA_REPCONTENT}</p>
                              
                              <div class="info">
                                 <p class="author">admin</p>
                                 <p class="date">/ ${goodsQna.QNA_REPDATE}</p>
                              </div>
                           </div> 
                        </c:if>
                  
                        </div>
                     </li>
                     </c:if>
                     </c:forEach> 
                     <!-- 반복끝 -->
                  </ul>

				<c:if test ="${qnaSize gt 5}">
                  <div style="text-align:center;">
                     <c:if test="${qnaNowPage ne 1 }">
                     <a class="pg_prev" style="margin-top: -8px;" href="javascript:ajaxQnaPaging(1,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});">-</a>
                     </c:if>   
                        <span class="pg_current">${qnaNowPage}</span>
                        <c:if test="${qnaNowPage ne 1 }">
                        <span class="pg_page">
                        ${qnaTotalPage}   
                        </span>
                        </c:if>   
                     <c:if test="${qnaNowPage ne qnaTotalPage}">   
                     <a class="pg_next" style="margin-top: -8px;" href="javascript:ajaxQnaPaging(2,${qnaEndPagingNum},${qnaStartPagingNum},${qnaNowPage});" >-</a>
                        
                     </c:if>
                     </div>
                  </c:if>           
               </div>
            </div>
         </div>
         
         </section>
         
         <div class="guide-info-wrap">
                        <!-- 탭메뉴 -->
                        <div class="tab-menu">
                           <ul class="inline text-center">
                              <li class="on"><a
                                 href="#goods"
                                 onclick="return false;">일반배송/해외배송 안내</a></li>
                              <li><a
                                 href="#returnGoods"
                                 onclick="return false;">교환 및 반품안내</a></li>
                              <li><a
                                 href="#refund"
                                 onclick="return false;">입금취소 및 환불안내</a></li>
                              <li><a
                                 href="#warranty"
                                 onclick="return false;">품질보증기준</a></li>
                           </ul>
                        </div>
                        <!--// 탭메뉴 -->
                        <!-- 탭컨텐츠 -->
                        <div class="tab-content-wrap">
                           <!-- 배송안내 -->
                           <div class="tab-content on">
                              <div class="paragraph">
                                 <p>[국내 일반 배송]</p>
                                 <p>배송업체 : CJ 대한통운 택배사(문의전화 : 1588-5333)</p>
                                 <p>배송비용 : 2,500원 / 실결제 금액 50,000원 이상 시 무료배송</p>
                                 <p>배송기간 : 입금된 주문서에 한해 1-3일정도 소요, 출고된 상품은 1-2일 후에 수령
                                    가능합니다.(영업일기준)</p>
                              </div>
                              <div class="paragraph">
                                 <p>- 이벤트(세일)기간내 주문의 경우에는 기본 배송일보다 더욱 여유있는 배송기간 예상 부탁드립니다.</p>
                                 <p>- 공급처 사정으로 인하여 지연 및 품절이 발생될 수 있습니다.</p>
                                 <p>- '주문폭주','인기상품'의 경우 상품 입고일에 따라 다르며 약 3-5일정도 소요됩니다.</p>
                                 <p>- 일부상품의 입고지연시 배송비 추가부담 없이 부분발송 해드리고 있습니다.</p>
                                 <p>- 기본 배송기간 이상 소요되는 상품이거나, 품절된 상품은 개별안내 드리고 있습니다.</p>
                              </div>
                              <div class="paragraph">
                                 <p>[해외배송]</p>
                                 <p>1. 주문서 작성</p>
                                 <p>2. 문의게시판 작성 : 주문서 넣은 후 문의 게시판에 받아보실 해외 주소, 연락처, 수취인명을
                                    기재</p>
                                 <p>3. 배송비 측정 : 지역과 무게 확인 후 해외배송비 측정하여 댓글답변</p>
                                 <p>4. 카드, 실시간 계좌이체, 핸드폰 결제 요청시에 고객 개인결제창 생성 후 개인결제창 주문 후
                                    입금</p>
                                 <p>5. 개인결제창 입금 후 게시판 문의</p>
                                 <p>6. 상품 준비 및 배송 결제가 완료되면 상품이 준비되는 대로 발송</p>
                                 <p>- 해외배송시 취소, 반품은 불가합니다.</p>
                              </div>
                              <div class="paragraph">
                                 <p>[통관과 관세]</p>
                                 <p>GNG는 EMS 우체국 배송을 사용하고 있으며 한국에서 직접 배송하고 있습니다.</p>
                                 <p>국가 세관의 규정에 따르면, 배송 과정에서 나라별로 관세가 발생할 수 있으며 관세는 고객님
                                    부담입니다.</p>
                                 <p>상세 문의사항은 EMS 우체국 고객센터 1588-1300을 이용해주시거나 거주하시는 지역 우체국에
                                    문의바랍니다.</p>
                                 <p>반송 과정에서 발생되는 모든 비용 (반품 배송비, 통관비용 및 관세)은 구매자가 부담하며 환불 시
                                    차감됩니다.</p>
                              </div>
                           </div>
                           <!--// 배송안내 -->
                           <div class="tab-content">
                              <div class="paragraph">
                                 <p>[교환/반품 시 유의사항]</p>
                                 <p>상품하자, 또는 받아보신 상품이 상세내용과 다를 경우 그 사실을 안 날 또는 알 수 있었던 날부터
                                    30일 이내로 보내주셔야 합니다.(교환/반품비 GNG부담)</p>
                                 <p>네이버페이 결제주문은 동일상품/동일옵션 교환만 가능합니다.</p>
                              </div>
                              <div class="paragraph">
                                 <p>[반품 불가사항 안내]</p>
                                 <p>- 상품 수령후 3개월이 지난경우</p>
                                 <p>- 고객님의 책임 있는 사유로 제품이 멸실 또는 훼손된 경우</p>
                                 <p>- 상품을 착용하여 사용한 경우(오염, 냄새, 주름 등)</p>
                                 <p>- 시간의 경과에 의하여 재판매가 곤란할 정도로 제품의 가치가 현저히 감소한 경우</p>
                                 <p>- 고객님의 주문에 따라 개별적으로 생산되는 제품의 경우</p>
                                 <p>- 신발 및 수트 상품의 경우 신발박스, 수트 케이스가 분실된 경우</p>
                              </div>
                              <div class="paragraph">
                                 <p>[교환/반품 방법]</p>
                                 <p>반품 주소 : 서울 성북구 종암동 57-39번지 CJ종암대리점 ABOKI 사업부</p>
                                 <p>교환"반품 가능기간 이내에 “GNG 게시판 또는 고객센터 접수” 후 “교환,반품 신청서”와 함께
                                    아래 반품 주소로 보내주셔야 합니다.</p>
                                 <p>보내주실 때 바코드가 붙어있는 폴리백에 넣어 받아보신 그대로 포장 후 CJ
                                    대한통운(1588-5353) 택배를 이용하여 착불로 보내주세요.</p>
                                 <p>교환"반품 배송비 : 단순 변심의 경우 고객님 부담, 상품 하자 및 오배송의 경우 GNG
                                    부담입니다.</p>
                                 <p>- 배송비를 입금하시는 경우 꼭 주문자 성함으로 입금해 주시기 바랍니다.</p>
                                 <p>- CJ택배가 아닌 다른 택배사를 이용해주시는 경우에는 초과배송비는 고객님께서 부담해 주셔야
                                    합니다.</p>
                                 <p>- 하자, 오배송 받으신 상품은 CJ택배(1588-5353)를 이용하여 상품을 착불로 보내주시면
                                    됩니다.</p>
                              </div>
                           </div>
                           <!-- 입금취소 및 환불안내 -->
                           <div class="tab-content">
                              <div class="paragraph">
                                 <p>[입금취소 안내]</p>
                                 <p>- 결제완료 상태에서 취소를 원하실 경우 로그인후 [마이페이지 -&gt; 주문/배송조회-&gt;
                                    주문상세조회] 에서 취소 자동신청</p>
                                 <p>- 주문상품의 배송상태가 [상품준비], [배송준비] 단계일 때에만 고객님께서 직접 취소 가능</p>
                                 <p>- (배송중)으로 확인되는 경우 발송작업이 완료된건으로, GNG 사이트내 게시판 또는
                                    고객센터[1588-8341]로 반품신청</p>
                              </div>
                              <div class="paragraph">
                                 <p>주문금액보다 더 입금한 경우 : 입금은행/은행명/날짜/시간을 기재하여 원하시는 처리방법과 함께
                                    게시판문의 또는 고객센터(1588-8341)로</p>
                                 <p>연락해주시면 해당 과입금(환불 or 예치금)은 처리가 가능합니다.</p>
                                 <p>주문금액보다 덜 입금한 경우 : 기본적으로 입금확인이 되지않으니 위 경우에는 미입금 금액을
                                    입금후에 처음입금해주신 이력과 추후에</p>
                                 <p>입금해주신 이력을 게시판에 문의 또는 고객센터(1588-8341)로 연락해주시면 입금확인이
                                    가능합니다.</p>
                              </div>
                              <div class="paragraph">
                                 <p>[무통장 / 계좌이체시 환불처리]</p>
                                 <p>환불받으실계좌번호,예금주,은행명을 GNG 사이트내 게시판 또는 상담원과 통화하여 안내해주신
                                    경우에는 그날 바로 당일환불이 아닌</p>
                                 <p>다음날 6시이후로 고객님의 계좌로 일괄적으로 이체가 됩니다.</p>
                               <p>간혹 다음날 확인이 되지않으신 경우에는 계좌오류 전산오류로 인해 처리가 어려운경우이니
                                    고객센터[1588-8341] 또는 게시판으로 한번더 문의해주세요.</p>
                                 <p>- 금요일날 환불 접수하신 경우에는 주말을 제외하고 월요일경에 환불이 이루어집니다.</p>
                              </div>
                              <div class="paragraph">
                                 <p>[카드 / 핸드폰 결제시 환불처리]</p>
                                 <p>결제해주신 모든 카드 결제관련 업무는 카드결제 대행업체인 PG사를 통해 처리되고 있습니다.</p>
                                 <p>카드사 간의 전상처리 시간으로 인해 취소완료 후 주말 제외 3-5일 후에 카드사 전산에서 확인이
                                    가능합니다.</p>
                                 <p>(신용카드 결제일자에 맞추어 대금이 청구될 수 있으며 이 경우 익월 신용카드 대금청구시 카드사에서
                                    환급 처리됩니다.)</p>
                                 <p>핸드폰 결제는 당월 취소만 가능하고 부분결제는 불가하여 일부 구매하는 상품금액을 입금해 주시면
                                    전체취소 처리 가능합니다.</p>
                                 <p>핸드폰 결제시 카드취소와 동일하나 해당 통신사에 따라 차이가 있으니 핸드폰 통신사로 문의해주세요.</p>
                              </div>
                              <div class="paragraph">
                                 <p>[적립금, 예치금 사용시 환불처리]</p>
                                 <p>적립금 또는 예치금사용하여 같이 결제시에는 계좌 또는 카드 취소시 사용한 적립금 예치금의 금액까지
                                    한번에 취소가 되지 않습니다.</p>
                                 <p>적립금, 예치금 사용하여 결제후 취소시는 다시 예치금, 적립금으로 복구가 되니 이점 유의해주세요
                                    :)</p>
                                 <p>쿠폰사용하여 주문후 취소시 쿠폰은 복구되지 않습니다.</p>
                                 <p>예치금 취소시 환불도 가능합니다.</p>
                                 <p>적립금은 환불이 불가하며 다시 적립금으로 복구만 가능합니다.</p>
                              </div>
                           </div>
                           <div class="tab-content">
                              <div class="paragraph">
                                 <p>- 본 제품의 수명을 연장시키기 위하여 제품에 부착된 취급주의 사항과 세탁 방법을 필히 확인해
                                    주시기 바랍니다.</p>
                                 <p>- 본 제춤의 품질에 이상이 있을 경우 공정거래위원회 고시에 의거하여 보상해 드리며, 고객센터로
                                    연락주시기 바랍니다.</p>
                                 <p>- 소비자 취급 부주의 또는 품질보증기간이 경과된 제품은 피해 보상의 책임을 지지 않습니다.</p>
                                 <p>- 교환.반품을 원하시는 경우 교환 및 반품 안내를 참조하시기 바랍니다.</p>
                                 <p></p>
                              </div>
                           </div>
                           <!--// 품질보증기준 -->
                           
                        </div>
                        <!--// 탭컨텐츠 -->
                     </div>
                     <!--// 이용안내 영역 -->
                     <div class="cboth pdt70"></div>
                     <div class="cboth pdt20"></div>
                     <div id="page04" class="cboth"></div>
                     <div class="detail_menu">
                        <ul>
                           <li><a
                              href="#new_detail"
                              class="tab_scroll">DETAIL</a></li>
                           <li><a
                              href="#powerReview"
                              class="tab_scroll">REVIEW</a></li>
                           <li><a
                              href="#qna"
                              class="tab_scroll">Q&amp;A</a></li>
                           <li><a
                              href="#modelSize"
                              class="on tab_scroll">MODEL SIZE</a></li>
                        </ul>
                     </div>

                     <!-- 모델사이즈표 -->
                     <div id="modelSize">
                     <center>
                        <img style="margin-left: 100px" src="/GNG/theme/pshp/img_MODA/aboki_model_size.jpg">
                        </center>
                     </div>
               
                     
                     
                     
                     
 </div>

 </form>
 </div>
 </div>
 </div>
 </div>
 


<script>

jQuery(".tab_scroll").click(function(event){
   event.preventDefault();
   jQuery('html,body').animate({scrollTop:jQuery(this.hash).offset().top}, 500);
   });
   jQuery(".tab_scroll_top").click(function(event){
   event.preventDefault();
   jQuery('html, body').animate({ scrollTop: 0 });
});

//이용안내 텝 컨텐츠 동작
(function ($) {
   
   $('.popup-btn-wrap li a').click(function() {
      console.log("들오오니1?");
      var $pop = $(this).attr('class');
      console.log("pop :" +$pop);
      if (!$(this).hasClass('on')) {
         $('.popup-btn-wrap li a').removeClass('on');
         $(this).addClass('on');
         $('.popup-wrap .popup-layer-to').removeClass('on');
         $('.popup-wrap .' + $pop).addClass('on');
      }
   });

   $('.popup-btn-wrap li a').mouseenter(function() {
      console.log("들오오니2?");
      var $pop = $(this).attr('class');
      $('.popup-btn-wrap li a').removeClass('on');
      $(this).addClass('on');
      $('.popup-wrap .popup-layer-to').removeClass('on');
      $('.popup-wrap .' + $pop).addClass('on');
   });
   
   
   $('.popup-wrap .popup-layer-to a.btn-popup-close').click(function() {
      console.log("들오오니3?");
      $('.popup-btn-wrap li a').removeClass('on');
      $('.popup-wrap .popup-layer-to').removeClass('on');
   });

   $('.popup-wrap .popup-layer-to').mouseleave(function() {
      console.log("들오오니4?");
      $('.popup-btn-wrap li a').removeClass('on');
      $('.popup-wrap .popup-layer-to').removeClass('on');
   });
   
 
 $('.guide-info-wrap .tab-menu li').click(function() {
      var $thisIndex = $(this).index();
      $('.guide-info-wrap .tab-menu li').removeClass('on');
      $(this).addClass('on');
      $('.guide-info-wrap .tab-content').removeClass('on');
      $('.guide-info-wrap .tab-content').eq($thisIndex).addClass('on');
  });
 
})(jQuery);


var totprice = 0;
var r_optno = [];
function setOption(obj){
 if (!chkSoldout(obj)) return;
 if ($("#option option:selected").attr("disabled")=="disabled"){
    alert("선택한 옵션은 품절된 상태입니다"); 
    $("#option").get(0).selectedIndex = 0;
    return;
 }
 var optno = $("#option option:selected").val();
 console.log(optno);
 if (!optno || in_array(optno,r_optno)) return;
 var li = "<li class='MK_li_1_1'><span class='MK_p-name'>" + $("#option option:selected").attr("optnm") + "</span><input type='hidden' name='optno[]' value='" + optno + "'><input type='hidden' name='kinds[]' value='" + $("option:selected",$(obj)).attr("kinds") + "'><input type='hidden' class='mstock' value='" + $("option:selected",$(obj)).attr("stock") + "'><div class='MK_qty-ctrl' style='height:50px'><input type='text' name='ea[]' value='1' class='input_ea' size='2' maxlength='3'><span class='ea'><a class='MK_btn-up'><img src='/GNG/theme/pshp/img/btn_num_up.gif' alt='' /></a><a class='MK_btn-dw'><img src='/GNG/theme/pshp/img/btn_num_down.gif' alt='' /></a></span></div><span class='MK_price' data-price='"+$("option:selected",$(obj)).attr("price")+"'>" + comma($("option:selected",$(obj)).attr("price")) + "원</span><a href='#' optno='" + optno + "' class='MK_btn-del'><img src='/GNG/theme/pshp/img/btn_close.gif' alt='' /></a></li>";
 $("#MK_innerOpt_01").append(li);
 r_optno.push(optno);
 var thisIdx = $(".input_ea").index(this);
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
 change_ea(this,1);
 console.log("요기?"+inputEa);
 var price = parseInt($("option:selected",$('#option')).attr("price"));
 price = price*inputEa;
 price = parseInt(price);
 if(totprice != 0){
    totprice = $("#MK_txt-won").data("price");
 }
 totprice = totprice + price;
 console.log(totprice);
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 
 

 

}
function chkSoldout(obj){ 
 if (obj.options[obj.selectedIndex].stock=="0"){
    alert("선택한 항목은 품절된 옵션입니다"); 
    obj.selectedIndex = 0;
    return false;
 }
 return true;
}


$("#MK_innerOpt_01").on("click", "li a.MK_btn-del", function(){
 var ritem = $(this).attr("optno");
 var thisIdx = $(".MK_btn-del").index(this); 
 console.log("음"+thisIdx);
 var price = $(".MK_price").eq(thisIdx).data("price");
 console.log("zz"+price);
 var totprice = $("#MK_txt-won").data("price");
 totprice = totprice - price;
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");
 
 
 r_optno = $.grep(r_optno,function(v){ return v != ritem; });
 $(".MK_li_1_1").eq(thisIdx).remove();
});

$("#MK_innerOpt_01").on("click", "li a.MK_btn-up", function(e) {
 var thisIdx = $(".MK_btn-up").index(this);    
 change_ea(this,1); 
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
 var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
 var price = parseInt($("option:selected",$('#option')).attr("price"));
 $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
 var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
 console.log("오나욜");
 var totprice = $("#MK_txt-won").data("price");
 console.log(totprice);
 totprice = totprice + price;
 $("#MK_txt-won").data("price",totprice);
 $("#MK_txt-won").html(comma(totprice)+"원");


 // 재고 수량 이상 주문 체크
 if(inputEa >= mStock) {
    alert(mStock+"개 이상 주문하실 수 없습니다.");
    change_ea(this,-1);
      inputEa = parseInt($(".input_ea").eq(thisIdx).val());
      var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
 
      
    return false ;
 } 
});

$("#MK_innerOpt_01").on("keyup", "li input.input_ea", function(e){
 var thisIdx = $(".input_ea").index(this); 
 var mStock = parseInt($(".mstock").eq(thisIdx).val()); 
 var price = parseInt($("option:selected",$('#option')).attr("price"));
 var totprice = $("#MK_txt-won").data("price");

 
 $(this).val($(this).val().replace(/[^0-9]/g,""));

 if($(this).val() == "" || parseInt($(this).val()) <= 0) {
    $(this).val("1");
    return false ;
 }

 if(parseInt($(this).val()) > mStock) {
    alert(mStock+"개 이상 주문하실 수 없습니다.");
    $(this).val(mStock);
    var total = $(".MK_price").eq(thisIdx).html(comma(price*parseInt($(this).val()))+"원");

    return false ;
 } else{
      var total = $(".MK_price").eq(thisIdx).html(comma(price*parseInt($(this).val()))+"원");
      totprice = totprice + (price*(parseInt($(this).val())-1));
      $("#MK_txt-won").html(comma(totprice)+"원");
  }
});

$("#MK_innerOpt_01").on("click", "li a.MK_btn-dw", function(e) {
 var thisIdx = $(".MK_btn-dw").index(this); 
 var inputEa = parseInt($(".input_ea").eq(thisIdx).val());
 
 if(inputEa == 1){
    alert("1개 이상 주문하셔야 합니다.");
    $(".input_ea").eq(thisIdx).val() == 1;   
    return false;
 } 
  change_ea(this,-1); 
  inputEa = parseInt($(".input_ea").eq(thisIdx).val());
  var price = parseInt($("option:selected",$('#option')).attr("price"));
  $(".MK_price").eq(thisIdx).data("price",(price*inputEa));
  var total = $(".MK_price").eq(thisIdx).html(comma(price*inputEa)+"원");
  var totprice = $("#MK_txt-won").data("price");
  totprice = totprice - price;
  $("#MK_txt-won").data("price",totprice);
  $("#MK_txt-won").html(comma(totprice)+"원");
 return false ;
});

</script>


<script>
function _exec(mode){
 
 if(mode == 'restock'){

    document.location.href="./restock";

 }
 else if (mode=="buy"){
    if (document.getElementsByName("optno[]").length==0){ alert("옵션을 선택해주세요"); return; }
    
    var fm = document.fmOrder;
    fm.mode.value = mode;
    fm.target = "_self";
    fm.action = "/GNG/order";
    //if (mode=="order") fm.action = "../order";
    fm.submit();
 }
 else if (mode!="wishlist"){
    if (document.getElementsByName("optno[]").length==0){ alert("옵션을 선택해주세요"); return; }

    var fm = document.fmOrder;
    fm.mode.value = mode;
    fm.target = "_self";
    fm.action = "/GNG/cart/cartIn";
    //if (mode=="wishlist") fm.action = "../mypage/wishlist";
    fm.submit();
 }
}
</script>
<script>


function ajaxReviewPaging(i,reviewEndPagingNum,reviewStartPagingNum,reviewNowPage) {
 var pagingReviewOnOff="ON";
 var GOODS_NUMBER=${GOODS_NUMBER};
 
 console.log("수고changeReviewList"+i);
 
  
  $.ajax({
     url: "/GNG/goodsDetail",
       type : "post",
       data: {"reviewNowPage":reviewNowPage,"reviewStartPagingNum":reviewStartPagingNum,"reviewEndPagingNum":reviewEndPagingNum,"pagingReviewOnOff":pagingReviewOnOff,"i":i,"GOODS_NUMBER":GOODS_NUMBER},
       success:function(data){
          console.log("수고3");
          $("#changeReviewList").html(data);
       }
    });     
   
}

function ajaxQnaPaging(i,qnaEndPagingNum,qnaStartPagingNum,qnaNowPage) {
 var pagingQnaOnOff="ON";
 var GOODS_NUMBER=${GOODS_NUMBER};
 
 console.log("야호changeQnaList"+i);
 
  
  $.ajax({
       url: "/GNG/goodsDetail",
       type : "post",
       data: {"qnaNowPage":qnaNowPage,"qnaStartPagingNum":qnaStartPagingNum,"qnaEndPagingNum":qnaEndPagingNum,"pagingQnaOnOff":pagingQnaOnOff,"i":i,"GOODS_NUMBER":GOODS_NUMBER},
       success:function(data){
          $("#changeQnaList").html(data);
       }
    });     
   
} 

</script>                
         
         
<script type="text/javascript">    
    function delchk(){
        return confirm("삭제하시겠습니까?");
    }
</script>
         
</body>