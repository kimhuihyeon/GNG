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
						<h3>�ֹ� ���</h3>
					</div>
					<!--section-head-->
					<div class="section-body calculator">
						<div class="price col-sm-8 col-lg-24">
							<div class="sum">
								<em>�ֹ� �ݾ� �հ�</em>
								
								<strong><fmt:formatNumber value="${TOTALPRICE}" type="number" />��</strong>
							</div>
							<div class="detail">
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>��ǰ �ݾ�</strong>
									</div>
									<div>
										
											<em><fmt:formatNumber value="${TOTALPRICE}" type="number" />��</em>
										
										<%-- <em><fmt:formatNumber value="${orderGoods.TOTALPRICE}" type="number" />��</em> --%>
									</div>
								</div>
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>��ۺ�</strong>
									</div>
									<div>
									
									
									<c:choose>
									<c:when test="${TOTALPRICE >= 30000}">
									<em>0��</em>
									</c:when>
										<c:otherwise>
										<em>2,500��</em>
										</c:otherwise>
									</c:choose>
									
									
								
									
									</div>
								</div>
							</div>
						</div>
						<div class="discount col-sm-8 col-lg-24">
							<div class="sum">
								<em>���� �ݾ� �հ�</em>
								<strong>-<font id="dis_sum">${usePoint}��</font></strong>
							</div>
							<div class="detail">
								<div class="item div-dcMemer col-xs-12">
									<div class="item-label">
										<strong>���� ����Ʈ</strong>
									</div>
									<div>
										<em><fmt:formatNumber value="${TOTALPRICE / 100 }" type="number" />��</em>
									</div>
								</div>
								<div class="item col-xs-12">
									<div class="item-label">
										<strong>����Ʈ ����</strong>
									</div>
									<div>
										<!--em>-0��</em-->
										<strong>-<span class="v_coupon">${usePoint}</span>��</strong>
									</div>
								</div>
							</div>
						</div>
						<div class="total col-sm-8 col-lg-24">
							<div class="sum">
								<em>���� ���� �ݾ�</em> 
								<c:choose>
									<c:when test="${TOTALPRICE >= 30000}">
								<strong><fmt:formatNumber value="${TOTALPRICE - usePoint}" type="number" />��</strong>
								</c:when>
								<c:otherwise>
								<strong><fmt:formatNumber value="${TOTALPRICE - usePoint + 2500}" type="number" />��</strong>
								</c:otherwise>
								</c:choose>
							</div>
							<div class="detail">
								<p>������ �� <strong id="disPer" class="point"><fmt:formatNumber value="${100-((TOTALPRICE - usePoint)*100 / TOTALPRICE)}" type="number" /> %</strong> <strong class="point">����</strong>,<br><strong id="disWon" class="point">${usePoint}��</strong>�� ���� �޾ҽ��ϴ�.</p>
							</div>
						</div>
					</div>
					<!-- calculator//end -->
				</div>

</body>
</html>