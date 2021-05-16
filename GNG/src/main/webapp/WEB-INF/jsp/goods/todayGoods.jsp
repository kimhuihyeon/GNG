<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<link rel="stylesheet" href="/gng/theme/aboki/common.css">
<link rel="stylesheet" href="/gng/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/gng/theme/aboki/header.1.css">
<link rel="stylesheet" href="/gng/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/gng/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/gng/theme/aboki/scroll.css">
<link rel="stylesheet" href="/gng/theme/aboki/menu.1.css">
<link rel="stylesheet" href="/gng/theme/aboki/order.css">
<link rel="stylesheet" href="/gng/theme/aboki/today_product.css">


<body>
<script src="/gng/theme/aboki/js/todayGoods.js" type="text/javascript"></script>
<div id="contentWrapper">
   <div id="contentWrap">
      <div id="content">
            <div id="myTodayView">
            
            <h2 class="tit-page-2">
               <img src="/gng/theme/pshp/img_MODA/mytoday_page_tit.gif" alt="today`s view" title="today`s view">
                <span class="dsc">회원님의 오늘 본 상품 내역입니다.</span>
            </h2>
             <div class="page-body">
             <form name="list_form" method="post" action="todayGoodsDelete">
             <input type="hidden" name="sessionGoods" value="${sessionScope.todayGoods}">
                      <!-- <form name="list_form" method="post">  -->
                        <p class="t-box-msg">
                            <strong>
                            <c:if test="${not empty sessionScope.MEMBER_NAME}">                       
                            ${sessionScope.MEMBER_NAME}
                            </c:if>
                            <c:if test="${empty sessionScope.MEMBER_NAME}">
                                                              고객
                            </c:if>
                            </strong>
                                                               님이 쇼핑몰에서 오늘 본 상품 내역입니다.
                        </p>
             <div class="table-d2-list">
             <table>
                                <caption>today view</caption>
                                <colgroup>
                                   <col width="15%">
                                    <col width="150%">
                                    <col width="900%">
                                    <col width="100%">
                                    <col width="100%">
                                    <col width="*">
                                </colgroup>
                                <thead>
                                <tr><th scope="row"><div class="tb-center">
                                          <input type="checkbox" name="all_brchk"
                                             class="MS_input_checkbox" onclick="all_brand_check()"
                                             id="allchk">
                                       </div></th>
                                        
                                        <th scope="row"><div class="tb-center">사진</div></th>
                                        <th scope="row"><div class="tb-left">상품명</div></th>
                                        <th scope="row"><div class="tb-center">가격</div></th>
                                        <th scope="row"><div class="tb-center">적립금</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:choose>
                        <c:when test="${sessionScope.todayGoods eq null}">
                        <tr>
                                        <td colspan="8"><div class="tb-center">오늘 본 상품 내역이 없습니다.</div></td>
                                </tr>
                        </c:when>
                        <c:otherwise>
                        <c:forEach var="todayGoods"  items="${sessionScope.todayGoods}"  begin="0" varStatus="status" end="${fn:length(sessionScope.todayGoods)}">
                                <c:url var="viewURL" value="/goodsDetail">
                        <c:param name="GOODS_NUMBER" value="${todayGoods.G_NUMBER}" />
                        </c:url>
                        <tr>
                        <td><div class="tb-center">
                        <input type="checkbox" name="brchks[]" id="todayGoods"
                        value="${todayGoods.G_NUMBER}" class="MS_input_txt">
                        </div></td>
                                <td><div class="tb-center"><a href="${viewURL}"><img src="/gng/file/goodsFile/${todayGoods.G_THUMBNAIL}" width="60" height="60" alt="상품섬네일" title="상품섬네일"></a></div></td>
                                <td><div class="tb-left">${todayGoods.G_NAME}</div></td>
                                <td><div class="tb-center"><fmt:formatNumber value="${todayGoods.G_PRICE}" type="number"/>원</div></td>
                                
                                <c:if test="${not empty sessionScope.MEMBER_ID}">
                                <td><div class="tb-right">${todayGoods.G_PRICE / 100}원</div></td>
                                </c:if>
                                <c:if test="${empty sessionScope.MEMBER_ID}">
                                <td><div class="tb-right">0원</div></td>
                                </c:if>
                                </tr>
                                </c:forEach>
                                
                                <tr>
                        </c:otherwise>
                        </c:choose>
                                </tbody>
                                </table>
             
             
             </div><!-- table-d2-list -->
                              <div class="btn-del">
                            <button type="submit" onclick="javascript:todayGoodsDelete();"><img
                              src="/gng/theme/pshp/img_MODA/btn_h20_select_del.gif"
                              alt="선택삭제" title="선택삭제"></button>
                        </div>
            </form>
            </div><!-- page-body --> 
        </div><!-- myTodayView -->
   
   
   
   
   
   
   </div><!-- content -->
</div><!-- contentWrap -->
</div><!-- contentWrapper -->

<script>

</script>

</body>
</html>