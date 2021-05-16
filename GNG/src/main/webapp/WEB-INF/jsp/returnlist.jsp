<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/MODA/css/returnlist.css">
<div class="account-order-list">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$( document ).ready(function() {
	$('#tb01').rowspan(2);
	$('#tb01').rowspan(3);
	$('#tb01').rowspan(4);
	$('#tb01').rowspan(5);
	$('#tb01').rowspan(6);
	$('#tb01').rowspan(7);
	$('#tb01').rowspan(8);
});
$.fn.rowspan = function(colIdx, isStats) {       
	return this.each(function(){      
		var that;     
		$('tr', this).each(function(row) {      
			$('td:eq('+colIdx+')', this).filter(':visible').each(function(col) {
				
				if ($(this).html() == $(that).html()
					&& (!isStats 
							|| isStats && $(this).prev().html() == $(that).prev().html()
							)
					) {            
					rowspan = $(that).attr("rowspan") || 1;
					rowspan = Number(rowspan)+1;

					$(that).attr("rowspan",rowspan);
					
					// do your action for the colspan cell here            
					$(this).hide();
					
					//$(this).remove(); 
					// do your action for the old cell here
					
				} else {            
					that = this;         
				}          
				
				// set the that if not already set
				that = (that == null) ? this : that;      
			});     
		});    
	});  
}; 
</script>
	<div class="account-order-list">
			<section class="order-list section box-shadow">
				<div class="tit-join">
				<input type="hidden" id="currentPage" value="${currentPage }"/>
					<h3>주문 내역</h3>
				</div>
				<!-- section-head//end -->
				<div class="section-body">
					<div class="table-responsive">
						<table class="table" id="tb01">
						  <colgroup>
                                    <col width="63">
                                    <col width="290">
                                    <col width="116">
                                    <col width="144">
                                    <col width="121">
                                    <col width="63">
                                    <col width="63">
                                    <col width="63">
                                    <col width="106">
                  		 </colgroup>
                   
							<thead>   
								<tr>
									<th scope="col" class="center_text">상품 정보</th>
									<th scope="col"  class="caption"></th>
									<th scope="col" class="payment">결제 금액/방법</th>		
									<th scope="col" class="date">주문 일자</th>
									<th scope="col" class="number">주문 번호</th>
							
									<th scope="col" class="delivery">배송 정보</th>
									<th scope="col" class="situation">결제 상태</th>
									<th scope="col" class="situation">주문 상태</th>
									<th scope="col" class="situation">반품 신청</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
							<c:when test="${list eq null }">
							<tbody>
							</tbody>
							</c:when>
							<c:otherwise>
							<tbody>
							<c:forEach items="${list }" var="order">
									<tr>
									<td class="info-imgg"><a href="/MODA/goodsDetail?GOODS_NUMBER=${order.GOODS_NUMBER }">
									<img src="/MODA/file/goodsFile/${order.GOODS_THUMBNAIL}" class="info-imgg"></a>
									<input type="hidden" id="order" value="${order.ORDER_NUMBER}" name="order">
									</td>
									<td class="info-caption">
									<strong class="brand">MODA</strong>
									<em class="name">${order.GOODS_NAME}*${order.ORDER_AMOUNT}개</em>
									</td>
									<td class="payment">${order.ORDER_TOTAL_PRICE }원/무통장입금</td>
									<td class="date">${order.ORDER_DATE}</td>
									<td class="number" id="order">${order.ORDER_CODE }</td>

									<td class="delivery">${order.ORDER_DELIVERY_STATE }</td>
									<td class="situation">${order.ORDER_PAY_STATE }</td>
									<c:choose>
									<c:when test="${order.ORDER_STATE eq '주문취소'}">
									<td class="situation"><font color='red'>${order.ORDER_STATE }</font></td>
									</c:when>
									<c:when test="${order.ORDER_STATE eq '반품신청' or order.ORDER_STATE eq '교환신청'}">
									<td class="situation"><font color='orange'>${order.ORDER_STATE }</font></td>
									</c:when>
									<c:otherwise>
									<td class="situation"><font color='green'>${order.ORDER_STATE }</font></td>
									</c:otherwise>
									</c:choose>
									<c:choose>
									<c:when test="${order.ORDER_STATE eq '구매확정' }">
									<td>
									<div class="section-foot">
									<a class="oto_aaaa" target="modal" data-size="md" data-label="반품신청" href="/MODA/returnlist/form?ORDER_CODE=${order.ORDER_CODE}">
									<span >반품신청</span>
									</a>
									</div>
									</td>
									</c:when>
									<c:otherwise>
										<td>
										</td>
									</c:otherwise>
									</c:choose>
									</tr>
							</c:forEach>	
							</tbody>
							</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>

					<!-- table-responsive//end -->
				</div>
				<!-- section-body//end -->

				<div class="section-foot">
					<div class="cs-pagination text-center">
			 <div class="paging">
			<ul class="inline">
			
					${pagingHtml}
			
						</ul>
						</div>
					</div>
				</div>

				<!-- account-list-page-navigator//end -->
			</section>
			<!-- order-list//end -->
			
				<div class="tit-join">
					<h3>도움이 필요하세요?</h3>
				</div>
				<!-- section-head//end -->
				<div class="section-body guide-list">
					<div class="guide-arlet">
						<strong>[반품이용안내]</strong>
						<ul>
							<li><b class="red">1. 마이페이지▶ 반품신청/조회▶ 상품 선택 후 [반품신청]</b> click (동일업체 상품별 신청 가능)</li>
							<li>2. 반품 정보 입력 후 <b class="red">배송비 결제</b> 진행</li>
							<li>3. 회수된 상품을 확인 후 환불 진행 (수거 서비스 신청 시 택배기사 2~3일 이내 방문)</li>
						</ul>	
					</div>
					<div class="guide-situation">
						<ul>
							<li>배송 완료일로부터 <b class="blue">7일 이내 신청, 14일 이내 도착</b> 시 처리 가능합니다.</li>
							<li>반품, 교환 시 업체 별 배송비는 5,000원입니다.<br>(도서, 산간 지역은 추가 배송비가 발생될 수 있습니다.)</li>
							<li>배송비는 반품/교환 신청 시 안내에 따라 결제해 주시기 바랍니다.<br><b class="red">반품 박스 내 배송비를 동봉하여 분실된 경우에는 쇼핑몰에서 책임지지 않습니다.</b></li>
							<li>신발이나 시계 등 정품 박스가 있는 상품의 경우, 박스가 훼손되면 교환/반품이 불가합니다.</li>
							<li>반품/교환 신청 3영업일 이후에도 회수되지 않을 경우 고객센터로 연락주세요.<br>전담 택배를 통해 신속하게 회수하도록 하겠습니다.</li>
						</ul>
					</div>
				</div>
	
		</div>
		</div>
