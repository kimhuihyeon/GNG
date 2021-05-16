<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/MODA/css/qnalist.css">
<style type="text/css">
u {color: #FF4500;}
</style> 
<script type="text/javascript">    
    function delchk(){
        return confirm("삭제하시겠습니까?");
    }
</script>
	<div class="account-qna">
		<section class="qna-past-list account-qna-list section box-shadow">
			 <div class="tit-join">
				<h3>진행중인 상품문의</h3>
			</div>
			<!-- heading-title//end -->
			<div class="section-body">
				<div >
					<table class="table list-dropdown">
								  <colgroup>
                                    <col width="63">
                                    <col width="336">
                                    <col width="237">
                                    <col width="125">
                                    <col width="150">
                                    <col width="50">
                                   
               				    </colgroup>
						<thead>
							<tr>
								<th scope="col" class="center_text">상품 정보</th>
								<th scope="col" class="caption">&nbsp;</th>
								<th scope="col" class="category">제목</th>
								<th scope="col" class="date-write">등록일</th>
								<th scope="col" class="date-answer">답변일</th>
								<th scope="col" class="situation">진행 현황</th>
							</tr>
						</thead>
						<c:choose>
						<c:when test="${qnalist eq null}">
						<tbody>
						</tbody>
						</c:when>
						<c:otherwise>
						<c:forEach items="${qnalist}" var="qna">
						<tbody>
							<tr class="brief" id="brief" onclick="javascript:gg()">
							
							
							
							<!-- 문의가 종료되었을때, end클래스명 붙여줌 -->
								<td class="info-imgg" style="padding: 0; !important">
									<input type="hidden" id="currentPage" value="${currentPage }"/>
									<a href="/MODA/goodsDetail?GOODS_NUMBER=${qna.GOODS_NUMBER }">
									 <img img_layer="/MODA/file/goodsFile/${qna.GOODS_THUMBNAIL}" goodsno="${qna.GOODS_NUMBER }" src="/MODA/file/goodsFile/${qna.GOODS_THUMBNAIL}" class="info-imgg"></a> 
									<input type="hidden" id="qna_number" name="qna_number" value="${qna.QNA_NUMBER}">
									<input type="hidden" id="qna_state" name="qna_state" value="${qna.QNA_REPSTATE}">
								</td>
								<td class="info-caption">
									<strong class="brand">MODA</strong>
									<em class="name">${qna.GOODS_NAME}</em>
								</td>
								<td class="category">
									${qna.QNA_TITLE}
								</td>
								<td class="date-write">
									${qna.QNA_REGDATE }
								</td>
								<td class="date-answer">
									${qna.QNA_REPDATE }
								</td>
								<td class="situation1">
									${qna.QNA_REPSTATE}
								</td>
							</tr>
						<tr class="detail end">
								<td colspan="6">
									<div class="contents">
										<div class="description">
											<p>${qna.QNA_CONTENT }
										</div>
									</div>
									<c:if test="${qna.QNA_REPSTATE eq '답변완료' }">
									<div class="answer">
										<p>[고객님 안녕하세요! 문의사항에 대한 답변입니다.]<br>
										
										${qna.QNA_REPCONTENT}
										
									</div>
									</c:if>
									<c:url var="viewURL" value="/qnaDelete">
											<c:param name="QNA_NUMBER" value="${qna.QNA_NUMBER }" />
										</c:url>
										<a href="${viewURL}" style="float: right;"><button type="button" class="oto_aaa" onclick="return delchk()">삭제</button></a></p> 
								</td>
							</tr>
						</tbody>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<!-- table-responsive//end -->
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
				<section class="qna-past-list account-qna-list section box-shadow">
			 <div class="tit-join">
				<h3>지난 상품문의</h3>
			</div>
			<!-- heading-title//end -->
			<div class="section-body">
				<div class="table-responsive">
					<table class="table list-dropdown">
						<thead>
							<tr>
								<th class="center_text">상품 정보</th>
								<th class="info-caption">&nbsp;</th>
								<th class="category">제목</th>
								<th class="date-write">등록일</th>
								<th class="date-answer">답변일</th>
								<th class="situation">진행 현황</th>
							</tr>
						</thead>
						<c:choose>
						<c:when test="${qnalist2 eq null}">
						<tbody>
						</tbody>
						</c:when>
						<c:otherwise>
						<c:forEach items="${qnalist2}" var="qna">
						<tbody>
							<tr class="brief end"><!-- 문의가 종료되었을때, end클래스명 붙여줌 -->
								<td class="info-imgg" style="padding: 0; !important">
									<a href="/goods/1495095716"><img img_layer="http://pic.styleindex.co.kr/g/s/149/1495095716" goodsno="1495095716" src="http://pic.styleindex.co.kr/g/s/149/1495095716" class="info-imgg"></a>
								</td>
								<td class="info-caption">
									<strong class="brand">MODA</strong>
									<em class="name">[MODA] POPDOGGY TRIPLE STANDARD T-SHIRT (MIDNIGHT BLACK)_PPOEURS92PC6</em>
								</td>
								<td class="category" >
									${qna.QNA_TITLE}
								</td>
								<td class="date-write">
									${qna.QNA_REGDATE }
								</td>
								<td class="date-answer">
									${qna.QNA_REPDATE }
								</td>
								<td class="situation">
									${qna.QNA_REPSTATE}
								</td>
							</tr>
						<tr class="detail end">
								<td colspan="6">
									<div class="contents">
										<div class="description">
											<p>${qna.QNA_CONTENT }</p>
										</div>
									</div>
									<div class="answer">
										<p>고객님 안녕하세요!<br>
										${qna.QNA_REPCONTENT}
										<div class="info">
										<p class="date">${qna.QNA_REPDATE}</p>
										</div>
									</div>
								</td>
							</tr>
						</tbody>
						</c:forEach>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<!-- table-responsive//end -->
			<div class="section-foot">
				<div class="page-navigator-horizon">
					
				</div>
			</div>
			<!-- account-list-page-navigator//end -->
		</section>
		<!-- past-list//end -->
	
			<div class="tit-join">
				<h3>도움이 필요하세요?</h3>
			</div>
			<!-- section-head//end -->
			<div class="section-body guide-list">
				<div class="guide-arlet">
					<strong>알려드립니다</strong>
					<ul>
						<li>상품 문의는 각 상품의 상품문의를 이용하시면 가장 빠르게 답변을 얻으실 수 있습니다.</li>
						<li>받으신 답변에 대해 평가를 해주시면, 향후 답변 서비스 향상에 많은 도움이 됩니다.</li>
					</ul>
				</div>
				<div class="guide-situation">
					<strong>문의 진행 현황 가이드</strong>
					<ul>
						<li><span>답변 대기 :</span> 문의가 정상적으로 접수되었고, 담당자가 답변을 준비하는 상태. 진행중인 1:1 문의에서 확인 가능</li>
						<li><span>답변 완료 :</span> 문의에 대한 답변이 등록된 상태. 진행중인 1:1 문의에서 확인 가능</li>
						<li><span>문의 종료 :</span> 답변에 대한 평가가 완료되어 해당 문의가 종료된 상태. 지난 1:1 문의에서 확인 가능</li>
					</ul>
				</div>
			</div>
			<!-- guide-list//end -->
			<div class="section-foot">
				<a class="oto_aaaa" href="#oneToOne" onclick="javascript:tab(6)">
					<span class="button-label">1:1 문의 바로가기</span>
				</a>
			</div>
		
		
		<!-- asking-list-guide//end -->
	</div>
