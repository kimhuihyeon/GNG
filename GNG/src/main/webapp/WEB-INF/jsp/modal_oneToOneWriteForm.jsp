<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/GNG/css/memberDelete.css">
    
    <style>
@CHARSET "UTF-8";

.tit-join h3{
	font-family: "crn-md", "NanumBarunGothicBold", Dotum, sans-serif;
	font-size: 15px;
	margin-bottom: 10px;
	padding-bottom: 3px;
	display: inline-block; 
	border-bottom: 4px solid #3a4452; !important
	
}

.center_text{
	text-align: center ; !important
}

/*  페이징 */

.oto_bb{
	display:inline-block;
    width: 50.98px;
    height: 30px;
   /*  line-height: 29px; */
    margin: 0 auto;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
 	background-color: #434343;
    border: 1px solid #434343;
}
.btn-close{
	display:inline-block;
    width: 50.98px;
    height: 30px;
   /*  line-height: 29px; */
    margin: 0 auto;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
 	background-color: #808080;
    border: 1px solid #808080;
}
.oto_aaaa{
	display: block;
    width: 140px;
    height: 35px;
    line-height: 29px;
    margin: 0 auto;
    font-size: 15px;
    font-weight: bold;
    color: #fff;
 	background-color: #2D2D2D;
    border: 1px solid #2D2D2D;
}
.modal .modal-content .modal-head {
	position: relative;
	background-color: #2D2D2D; !important;
	border-radius: 5px 5px 0 0;
	padding: 2px 15px 0 15px
}

</style>
    
<script>
$(document).ready(function(){


});

</script>
<div class="modal-body">
<form method="post" action="/GNG/oneToOne/write" enctype="multipart/form-data">
<input type="hidden" name="MEMBER_NUMBER" value="${sessionScope.MEMBER_NUMBER }">
<div class="modal-inquiry">
	<section class="guide box-shadow">
		   <div class="tit-join">
			<h3>알려드립니다</h3>
		</div>
		<!-- section-head//end -->
		<div class="section-body">
			<ul class="list">
				<li>주문취소/환불은 주문조회/취소 메뉴에서 진행하실 수 있습니다.</li>
			</ul>
		</div>
		<!-- section-body//end -->
	</section>
	<section class="inquiry box-shadow">
		<div class="tit-join">
			<h3>1:1 문의</h3>
		</div>
		<!-- section-head//end -->
		<div class="section-body list-horizontal">
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<strong>문의 분류</strong>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<div class="radio col-xs-auto selected">
						<label for="qncode0">
							<input type="radio" name="QNA_CATEGORY" value="회원문의" required="">
							<span class="icon icon-radio"></span>
							<span class="radio-label">회원</span>
						</label>
					</div>
					<div class="radio col-xs-auto">
						<label for="qncode2">
							<input type="radio" id="qncode2" name="QNA_CATEGORY" value="입금문의">
							<span class="icon icon-radio"></span>
							<span class="radio-label">주문결제</span>
						</label>
					</div>
					<div class="radio col-xs-auto">
						<label for="qncode3">
							<input type="radio" id="qncode3" name="QNA_CATEGORY" value="교환&반품문의">
							<span class="icon icon-radio"></span>
							<span class="radio-label">교환</span>
						</label>
					</div>
					<div class="radio col-xs-auto">
						<label for="qncode6">
							<input type="radio" id="qncode6" name="QNA_CATEGORY" value="배송문의">
							<span class="icon icon-radio"></span>
							<span class="radio-label">배송</span>
						</label>
					</div>
					<div class="radio col-xs-auto">
						<label for="qncode11">
							<input type="radio" id="qncode11" name="QNA_CATEGORY" value="기타문의">
							<span class="icon icon-radio"></span>
							<span class="radio-label">기타</span>
						</label>
					</div>
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="id_subject"><strong>제목</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<input type="text" id="id_subject" class="xx-control" name="QNA_TITLE" required="">
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="is-title"><strong>사진첨부</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<a class="btn btn-primary btn-xs btn-add">이미지추가</a>
					<ul id="sortable" style="padding-top:10px;"></ul>
				</div>
			</div>
			<div class="list-item">
				<div class="item-title col-xs-24 col-md-6">
					<label for="pw-contents"><strong>문의 내용</strong></label>
				</div>
				<div class="item-contents col-xs-24 col-md-18">
					<input rows="16" class="xx-control" name="QNA_CONTENT" required="" style="height:150px;">
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
<div id="reText" style="display:none">① 주문번호,주문자 성함,ID,입금자명
▶ 

② 교환/환불 중 해당하는 사항 체크
▶ 

③ 교환하실 제품명 (사이트에 명시된 상품명, 컬러, 사이즈)
▶ 
▶ 

④ 교환 환불 사유 (EX; 사이즈미스로 인한 사이즈교환, 단순변심, 업체 측 오배송 등)
▶ 


⑤ 결재 방법(EX;무통장(가상계좌),신용카드,핸드폰,적립금결제,상품권
무통장입금일 경우 환불 받을 '계좌주명,은행명,계좌번호,금액'을 기재하여 주셔야 합니다.
▶ 
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