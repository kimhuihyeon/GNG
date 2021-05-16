<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%-- 
<c:forEach var="orderForm"  items="${goods}" varStatus="stat">
			<c:set var= "sum" value="${sum + orderForm.TOTALPRICE}"/>
</c:forEach> --%>
<div class="box-shadow">
					<div class="section-head left border">
						<h3>주문 요약</h3>
					</div>
					<!--section-head-->
					<div class="section-body calculator">
						<div class="price col-sm-8 col-lg-24">
							<div class="sum">
								<em>주문 금액 합계</em>
								
								<strong><fmt:formatNumber value="${TOTALPRICE}" type="number" />원</strong>
							</div>
							<div class="detail">
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>상품 금액</strong>
									</div>
									<div>
										
											<em><fmt:formatNumber value="${TOTALPRICE}" type="number" />원</em>
										
										<%-- <em><fmt:formatNumber value="${orderGoods.TOTALPRICE}" type="number" />원</em> --%>
									</div>
								</div>
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>배송비</strong>
									</div>
									<div>
									
									
									<c:choose>
									<c:when test="${TOTALPRICE >= 30000}">
									<em>0원</em>
									</c:when>
										<c:otherwise>
										<em>2,500원</em>
										</c:otherwise>
									</c:choose>
									
									
								
									
									</div>
								</div>
							</div>
						</div>
						<div class="discount col-sm-8 col-lg-24">
							<div class="sum">
								<em>할인 금액 합계</em>
								<strong>-<font id="dis_sum">${usePoint}원</font></strong>
							</div>
							<div class="detail">
								<div class="item div-dcMemer col-xs-12">
									<div class="item-label">
										<strong>적립 포인트</strong>
									</div>
									<div>
										<em><fmt:formatNumber value="${TOTALPRICE / 100 }" type="number" />원</em>
									</div>
								</div>
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>포인트 할인</strong>
									</div>
									<div>
										<!--em>-0원</em-->
										<strong>-<span class="v_coupon">${usePoint}</span>원</strong>
									</div>
								</div>
							</div>
						</div>
						<div class="total col-sm-8 col-lg-24">
							<div class="sum">
								<em>최종 결제 금액</em> 
								<c:choose>
									<c:when test="${TOTALPRICE >= 30000}">
								<strong><fmt:formatNumber value="${TOTALPRICE - usePoint}" type="number" />원</strong>
								</c:when>
								<c:otherwise>
								<strong><fmt:formatNumber value="${TOTALPRICE - usePoint + 2500}" type="number" />원</strong>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="detail">
								<p>고객님은 총 <strong id="disPer" class="point"><fmt:formatNumber value="${100-((TOTALPRICE - usePoint)*100 / TOTALPRICE)}" type="number" /> %</strong> <strong class="point">할인</strong>,<br><strong id="disWon" class="point">${usePoint}원</strong>을 할인 받았습니다.</p>
							</div>
						</div>
					</div>
					<!-- calculator//end -->
				</div>

</body>
</html>