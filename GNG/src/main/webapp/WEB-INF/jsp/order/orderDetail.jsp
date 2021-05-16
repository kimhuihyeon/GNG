<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  


<html>
<head>

<link rel="stylesheet" href="/MODA/theme/aboki/common.css">
<link rel="stylesheet" href="/MODA/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/MODA/theme/aboki/header.1.css">
<link rel="stylesheet" href="/MODA/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/MODA/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/MODA/theme/aboki/scroll.css">
<link rel="stylesheet" href="/MODA/theme/aboki/menu.1.css">
<link rel="stylesheet" href="/MODA/theme/aboki/order.css">
<link rel="stylesheet" href="/MODA/theme/aboki/order_complete.css">

<body>
<br>
<br>
<br>
<br>

<div id="contentWrapper">
	<div id="contentWrap">
		 <div id="content">
         	<div id="order">        
      			  <dl class="loc-navi">
                        <dt class="blind">현재 위치</dt>
                        <dd><a href="/MODA/main">home</a> &gt; 주문서 완료</dd>
                  </dl>
                  <h2 class="tit-page">
                        <img src="/MODA/theme/pshp/img_MODA/order_page_tit.gif" alt="order sheet" title="order sheet">
                        <span class="dsc">주문정보를 확인하신 후, <em>주문확인</em>을 눌러주세요</span>
                  </h2>
        	<div class="page-body">
        	<form method="post" name="frm" id="frm" action="orderEnd" >
			<c:forEach var="orderForm"  items="${goods}" varStatus="stat">
			<input type="hidden" name="ea[]" value="${orderForm.EA }">
			<input type="hidden" name="kinds[]" value="${orderForm.GOODS_KIND_NUMBER }">
			<input type="hidden" name="goods_total[]" value="${orderForm.TOTALPRICE - usePoint }">
			<input type="hidden" name="GOODS_NUMBER" value="${orderForm.GOODS_NUMBER }">
			<input type="hidden" name="GOODS_THUMBNAIL" value="${orderForm.GOODS_THUMBNAIL}">
			<input type="hidden" name="MEMBER_NUMBER" value="${orderMember.MEMBER_NUMBER }">
			</c:forEach>
			<input type="hidden" name="guestPhone" value="${guestPhone }">
			<input type="hidden" name="guestEmail" value="${guestEmail }">
			<input type="hidden" name="guestName" value="${guestName }">
			<input type="hidden" name="usePoint" value="${usePoint}">
			<input type="hidden" name="RECEIVER_NAME" value="${RECEIVER_NAME }">
			<input type="hidden" name="RECEIVER_ZIPCODE" value="${RECEIVER_ZIPCODE }">
			<input type="hidden" name="RECEIVER_ADDRESS1" value="${RECEIVER_ADDRESS1 }">
			<input type="hidden" name="RECEIVER_ADDRESS2" value="${RECEIVER_ADDRESS2 }">
			<input type="hidden" name="RECEIVER_PHONE" value="${RECEIVER_PHONE }">
			<input type="hidden" name="DELIVERY_MESSAGE" value="${DELIVERY_MESSAGE } ">
			<input type="hidden" name="GOODS_NUMBER" value="${GOODS_NUMBER }">
			
			<c:forEach var="orderDetail"  items="${goods}" varStatus="stat">
			<%-- <c:set var= "sum" value="${sum + orderDetail.TOTALPRICE}"/> --%>
			<%-- <c:set var= "goodsPrice" value="${orderDetail.GOODS_PRICE}"/>
			<c:set var= "goodsDCPrice" value="${orderDetail.GOODS_DCPRICE}"/> --%>
			</c:forEach>
		
		
        		<h3 class="stit"><img src="/MODA/theme/pshp/img_MODA/order_order_prd_tit.gif" alt="주문상품" title="주문상품"></h3>
        
       		    <div class="table-cart table-order-prd">
                    
                    <table class="order-table">
                    <caption>주문할 상품</caption>
                    <colgroup>
                                    <col width="70">
                                    <col width="*">
                                    <col width="70">
                                    <col width="90">
                                    <col width="90">
                                    <col width="90">
                    </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col"><div class="tb-center"></div></th>
                                        <th scope="col"><div class="tb-center" style="text-align:left;">구입 상품명</div></th>
                                        <th scope="col"><div class="tb-right">수량</div></th>
                                        <th scope="col"><div class="tb-right">가격</div></th>
                                        <th scope="col"><div class="tb-right">할인가격</div></th>
                                        <th scope="col"><div class="tb-right">적립</div></th>
                                    </tr>
                                </thead>
                    			<tbody>
                    			<c:forEach var="orderForm"  items="${goods}" varStatus="stat">
								<c:url var="viewURL" value="/goodsDetail">
								<c:param name="GOODS_NUMBER" value="${orderForm.GOODS_NUMBER }" />
								</c:url>
                    				<tr class="nbg">
                    			<td>
                    				<div class="tb-center">
                    				<a href="${viewURL}"><img src="/MODA/file/goodsFile/${orderForm.GOODS_THUMBNAIL}" width="40" /></a>                    			
                    				</div>
                    			</td>
                    			<td>
                    				<div class="tb-left tb-bold">
                    				<a href="${viewURL}" style="font-weight: bold;">[MODA] ${orderForm.GOODS_NAME} ${orderForm.GOODS_COLOR} ${orderForm.GOODS_SIZE}</a>
                    				</div>
                    			</td>
                    			<td>
                    				<div class="tb-right">${orderForm.EA } 개</div>
                    			</td>
                    			<td>
									<div class="tb-right tb-bold"> 
									<c:choose>
									<c:when test="${orderForm.GOODS_DISPRICE ne orderForm.GOODS_PRICE}">
									<del>${orderForm.GOODS_PRICE * orderForm.EA}원</del><br/>
									<span style="font-weight: bold;"><fmt:formatNumber value="${orderForm.GOODS_DISPRICE * orderForm.EA}" type="number" />원</span>
									</c:when>
									<c:otherwise>
									<span style="font-weight: bold;"><fmt:formatNumber value="${orderForm.TOTALPRICE }" type="number" />원</span>
									</c:otherwise>
									</c:choose>
									</div>
								</td>
								<td>
									<div class="tb-right tb-bold" >
							<c:choose>
                           <c:when test="${orderForm.GOODS_DISPRICE ne null}">
                           <span><fmt:formatNumber value="-${(orderForm.GOODS_PRICE * orderForm.EA) - orderForm.TOTALPRICE}" type="number" />원</span>
                           </c:when>
                           <c:otherwise>
                           <span>0원</span>
                           </c:otherwise>
                           </c:choose>
									</div>
								<td>
								<c:if test="${not empty sessionScope.MEMBER_ID}">
									<div class="tb-right">
									<c:choose>
									<c:when test="${orderForm.GOODS_DISPRICE ne orderForm.GOODS_PRICE}">
									<span><fmt:formatNumber value="${orderForm.GOODS_DISPRICE * orderForm.EA / 100}" type="number" />원</span>
									</c:when>
									<c:otherwise>
									<span><fmt:formatNumber value="${orderForm.TOTALPRICE / 100}" type="number" />원</span>
									</c:otherwise>
									</c:choose>
									</div>
								</c:if>
								<c:if test="${empty sessionScope.MEMBER_ID}">
								<div class="tb-right">
								0원
								</div>
								</c:if>
								</td>
								<tr class="nbg">
									<td colspan="6">
									<div class="tb-left">Color : ${orderForm.GOODS_COLOR}, Size : ${orderForm.GOODS_SIZE}</div> 
									</td>
								</tr>
								<td colspan="6" style="background: url(/MODA/theme/pshp/img_MODA/dot_h1_w10.gif) repeat-x 0 0;">
	
                    			</c:forEach>
                    			
                    			</tbody>
                    			<tfoot>
               					<c:forEach var="orderForm"  items="${goods}" varStatus="stat">
								<c:choose>
								<c:when test="${orderForm.GOODS_DISPRICE ne orderForm.GOODS_PRICE}">
								<c:set var= "sum" value="${sum + (orderForm.GOODS_DISPRICE * orderForm.EA)}"/>
								</c:when>
								<c:otherwise>
								<c:set var= "sum" value="${sum + orderForm.TOTALPRICE}"/>
								</c:otherwise>
								</c:choose>
								</c:forEach>
    		                				<tr>
												<td colspan="6">
													<div class="tb-right">
														결제금액 : <strong><fmt:formatNumber value="${sum}" type="number" />원 
														+ 배송료 : <c:choose>
																<c:when test="${sum >= 30000}">
																0원
																</c:when>
																<c:otherwise>		
																2,500원
																</c:otherwise>
																</c:choose>	
														</strong><strong>- 포인트 할인 : <span id="v_coupon">${usePoint}</span>원</strong>
														= <strong id=totalPirce><c:choose>
														<c:when test="${sum >= 30000}">
														<fmt:formatNumber value="${sum - usePoint}" type="number" />원
														<c:set var= "TOTAL" value="${sum - usePoint}"/>
									   					<input type="hidden" name="TOTALPRICE" value="${sum - usePoint}">
														</c:when>
														<c:otherwise>
														<fmt:formatNumber value="${sum + 2500 - usePoint}" type="number" />원
														<c:set var= "TOTAL" value="${sum + 2500 - usePoint}"/>
									   					<input type="hidden" name="TOTALPRICE" value="${sum + 2500 - usePoint}">
														</c:otherwise>
														</c:choose></strong>
													</div>
												</td>
											</tr>
                    			</tfoot>
                    			
                    </table>
                    </div><!-- table-cart table-order-prd -->
                    
                    <h3 class="stit"><img src="/MODA/theme/pshp/img_MODA/order_pay_tit.gif" alt="결제 방법" title="결제 방법"></h3>
                    <div class="cnt-box">
                    <p>무통장 입금 : <span style="color: #0054A6;">농협중앙회 301-0548-7870-42 (예금주:(주)MODA)) <span id="bankname_banker">${orderMember.MEMBER_NAME}</span></span><br>&nbsp;(입금확인후 배송이 됩니다.)</p>
                    </div><!-- .cnt-box -->
        
					<h3 class="stit"><img src="/MODA/theme/pshp/img_MODA/order_user_info_tit.gif" alt="주문자 정보" title="주문자 정보"></h3>
                        <div class="table-order-info">
                            <table summary="">
                                <caption>주문자 정보</caption>
                                	<colgroup>
                                    <col width="90">
                                    <col width="*">
                                    <col width="90">
                                    <col width="*">
                               	    </colgroup>
                                <tbody>
                                    <tr class="nbg">
                                        <th scope="row"><div class="tb-right">이 름</div></th>
                                        <td colspan="3">
                                           
                                            <c:choose>
											<c:when test="${guestName ne null }">
											<div class="tb-left">
											${guestName }
											</div>
											</c:when>
											<c:otherwise>
											<div class="tb-left">
											${orderMember.MEMBER_NAME }
											</div>
											</c:otherwise>
											</c:choose>                                   
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="tb-right">E-mail</div></th>
                                        <td>
                                            
                                            <c:choose>
											<c:when test="${guestEmail ne null }">
											<div class="tb-left">
												${guestEmail }
											</div>
											</c:when>
											<c:otherwise>
											<div class="tb-left">
												${orderMember.MEMBER_EMAIL }
											</div>
											</c:otherwise>
											</c:choose>                     
											
                                        </td>
                                        <th scope="row"><div class="tb-right">연락처</div></th>
                                        <td>
                                           
                                            <c:choose>
											<c:when test="${guestPhone ne null }">
											<div class="tb-left">
												${guestPhone }
											</div>
											</c:when>
											<c:otherwise>
											<div class="tb-left">
												${orderMember.MEMBER_PHONE }
											</div>
											</c:otherwise>
											</c:choose>                                          
											
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div><!-- table-order-info -->
        
        
       				    <h3 class="stit"><img src="/MODA/theme/pshp/img_MODA/order_delivery_info_tit.gif" alt="배송지 정보" title="배송지 정보"></h3>
                        <div class="table-order-info">
                            <table>
                                <caption>배송지 정보</caption>
                                <colgroup>
                                    <col width="90">
                                    <col width="*">
                                    <col width="80">
                                    <col width="*">
                                    <col width="80">
                                    <col width="*">
                                </colgroup>
                                <tbody>
                                 <tr class="nbg">
                                        <th scope="row"><div class="tb-right">이 름</div></th>
                                        <td>
                                            <div class="tb-left">
                                               	${RECEIVER_NAME }
                                            </div>
                                        </td>
                                        <th scope="row"><div class="tb-right">연락처</div></th>
                                        <td>
                                            <div class="tb-left">
                                                ${RECEIVER_PHONE}
                                            </div>
                                        </td>
                                    </tr>
                                <tr>
                                     	<th scope="row"><div class="tb-right">주소</div></th>
                                        <td colspan="5">
                                            <div class="tb-left">
                                            (${RECEIVER_ZIPCODE }) ${RECEIVER_ADDRESS1 } ${RECEIVER_ADDRESS2 }                          
                                            </div>
                                        </td>
								</tr>
                                <tr>
                                        <th scope="row">
                                            <div class="tb-right">
                                         	         주문메시지
                                                <em class="d-block">(100자내외)</em>
                                            </div>
                                        </th>
                                        <td colspan="5">
                                            <div class="tb-left">
                                            ${DELIVERY_MESSAGE }                                                                               </div>
                                        </td>
                                    </tr>
                                
                                </tbody>
                                </table>
                         </div><!-- table-order-info -->
        
        		<div class="admin-msg"><label id="hname2">
        		<c:choose>
				<c:when test="${guestName ne null }">
				${guestName }
				</c:when>
				<c:otherwise>
				${orderMember.MEMBER_NAME }
				</c:otherwise>
				</c:choose> 
        		</label>님의 주문이 완료되었습니다.<br><br>
				<span style="color: #0000a0; font-weight: bold; font-size:18px;">Thank You</span><br>
				입금방법이 무통장입금의 경우 계좌번호를 메모하세요.<br>입금 확인 후 상품을 준비하여 배송해 드리겠습니다.<br><br>
				</div>
                <div class="btn-foot">
                <button type="button" onclick="pay_chk();">
                <img src="/MODA/theme/pshp/img_MODA/btn_h36_order_check.gif" alt="주문확인" title="주문확인"></a>
                </button>
                </div>
        
        
        
        
        
        
        	</form>
        	</div><!-- page-body -->
        	</div><!-- order -->
        </div><!-- content -->
	</div><!-- contentWrapper -->
</div><!-- contentWrap -->
<br>
<br>
<br>
<br>
<br>
<br>




<script type="text/javascript">
function back() {
	history.back();
}
</script>
<script>
function pay_chk(){
		document.frm.submit();
}
</script>
</body>

</head>
</html>