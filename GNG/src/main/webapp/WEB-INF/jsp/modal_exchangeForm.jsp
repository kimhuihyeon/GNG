<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="/MODA/css/memberDelete.css">
<div class="modal-body">
<form method="post" action="/MODA/exchangelist/write">
<input type="hidden" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">
<input type="hidden" name="ORDER_NUMBER" value="${ORDER_NUMBER }">
<input type="hidden" name="ORDER_CODE" value="${ORDER_CODE}">
<input type="hidden" name="CANCEL_TITLE" value="교환신청합니다.">		<!-- 테스트용으로 넣음 -->
<input type="hidden" name="CANCEL_CATEGORY" value="교환신청">	<!-- 테스트용으로 넣음 -->
<div class="modal-inquiry">
	<section class="guide box-shadow">
		<div class="tit-join">
			<h3>알려드립니다</h3>
		</div>
		<!-- section-head//end -->
		<div class="section-body">
			<ul class="list">
				<li>교환 신청을 진행 하실수 있습니다.</li>
			</ul>
		</div>
		<!-- section-body//end -->
	</section>
	<section class="inquiry box-shadow">
		<div class="tit-join">
			<h3>교환신청</h3>
		</div>
		<!-- section-head//end -->
		<div class="section-body list-horizontal">
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="id_subject"><strong>작성 방법</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
	① 주문번호,주문자 성함,ID,입금자명
<br> 

	②교환하실 제품명 (사이트에 명시된 상품명, 컬러, 사이즈)
<br>
④ 교환 환불 사유 (EX; 사이즈미스로 인한 사이즈교환, 단순변심, 업체 측 오배송 등)
<br>


⑤ 결재 방법(무통장입금)
 환불 받을 '계좌주명,은행명,계좌번호,금액'을 기재하여 주셔야 합니다.
<br>
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="pw-contents"><strong>반품 사유</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<input rows="16" class="xx-control" name="CANCEL_CONTENT" required="" style="height:150px;">
				</div>
			</div>
		</div>
	</section>
</div>
<div class="modal-button">
	<button type="submit" class="oto_bb">
		<span class="button-label">확인</span>
	</button>
	<button class="btn-close">
		<span class="button-label">닫기</span>
	</button>
</div>
</form>
<div id="reText" style="display:none">
</div>
<script>
$('.btn-add').bind("click", function(){

	var contents = '';
	contents += '<li class="ui-state-default clearfix" style="padding-bottom:10px;"><div class="pull-left"><input type="file" name="QNA_IMAGE1"/></div></li>';
	$('#sortable').append(contents);
	$('.btn-add').unbind("click");
});

</script></div>
<div class="modal-foot">
		</div>