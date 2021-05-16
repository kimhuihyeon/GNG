<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/GNG/css/OTO.css">
<script type="text/javascript">    
    function delchk(){
        return confirm("삭제하시겠습니까?");
    }
</script>
<div class="account-1to1">
		<section class="individual-progress-list account-individual-list section box-shadow">
	       <div class="tit-join">
				<h3>진행중인 1:1문의</h3>
			</div>
			<!-- heading-title//end -->
			<div class="section-body">
				<div class="table-responsive">
					<table class="table list-dropdown">
							  <colgroup>
                                    <col width="117">
                                    <col width="382">
                                    <col width="190">
                                    <col width="191">
                                    <col width="81">
                                    
                                   
               				    </colgroup>
						<thead>
							<tr>
								<th scope="col" class="category">분류</th>
								<th scope="col" class="subject">내용</th>
								<th scope="col" class="date-write">등록일</th>
								<th scope="col" class="date-answer">답변일</th>
								<th scope="col" class="situation">진행 현황</th>
							</tr>
						</thead>
						<c:choose>
						<c:when test="${list ne null}">
						<tbody>
						<c:forEach items="${list}" var="list">
							<!--  -->
								<tr class="brief answer-yes">
								<td class="category">
									${list.QNA_CATEGORY }
								</td>
								<td class="subject">
									<p>${list.QNA_TITLE } </p>
								</td>
								<td class="date-write">
									${list.QNA_REGDATE }
								</td>
								<td class="date-answer">
									${list.QNA_REPDATE }
								</td>
								<td class="situation">
									${list.QNA_REPSTATE }
								</td>
							</tr>
							<tr class="detail answer-yes">
								<td colspan="5">
									<div class="contents">
										<div class="description">
											<p>${list.QNA_CONTENT }
										</div>
										<c:if test="${list.QNA_IMAGE1 ne '이미지없음' }">
											<div style="max-width:300px">
											<img src="/GNG/file/qnaFile/${list.QNA_IMAGE1}" class="img-responsive">
											</div>
										</c:if>
									</div>
									<c:if test="${list.QNA_REPDATE ne null }">
									<div class="answer">
										<p>[고객님 안녕하세요! 문의사항에 대한 답변입니다.]<br>
											
											${list.QNA_REPCONTENT}
										<!--
										<div class="alert">
											<p>이 상품의 문의가 종료되었습니다. 감사합니다.</p>
										</div>
										-->
										<!-- info//end -->
									</div>
									</c:if>
									<c:url var="viewURL" value="/oneToOneDelete">
											<c:param name="QNA_NUMBER" value="${list.QNA_NUMBER }" />
										</c:url>
										<a href="${viewURL}" style="float: right;"><button type="button" class="oto_aaa" onclick="return delchk()">삭제</button></a></p>
									<!-- answer//end -->
								</td>
							</tr>
							<!--  -->
							</c:forEach>
						</tbody>
						</c:when>
						<c:otherwise>
							<tbody>
							</tbody>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			
					 
			<!--section-body//end-->
			<div class="section-foot">
				<div class="cs-pagination text-center">
			 <div class="paging">
			<ul class="inline">
			<li>
						${pagingHtml}
						</li>
						</ul>
					</div>
					</div>
				<button class="oto_aaaa" type="button" onclick="location.href='/GNG/oneToOne/form'" target="modal" data-size="md" data-label="1:1 문의 작성하기">
					<span class="button-label">1:1 문의 작성하기</span>
				</button>
			</div>
			<!-- table-responsive//end -->
		</section>
		<!-- progress-list//end -->

		<section class="individual-past-list account-individual-list section box-shadow">
			       <div class="tit-join">
			<input type="hidden" id="currentPage" value="${currentPage }"/>
				<h3>지난 1:1 문의</h3>
			</div>
			<!-- heading-title//end -->
			<div class="section-body">
				<div class="table-responsive">
					<table class="table list-dropdown">
						<thead>
							<tr>
								<th class="category">분류</th>
								<th class="subject">내용</th>
								<th class="date-write">등록일</th>
								<th class="date-answer">답변일</th>
								<th class="situation">진행 현황</th>
							</tr>
						</thead>
						<c:choose>
						<c:when test="${list2 ne null}">
						<tbody>
						<c:forEach items="${list2}" var="list">
							<!--  -->
								<tr class="brief answer-yes">
								<td class="category">
									${list.QNA_CATEGORY }
								</td>
								<td class="subject">
									<p>${list.QNA_TITLE } </p>
								</td>
								<td class="date-write">
									${list.QNA_REGDATE }
								</td>
								<td class="date-answer">
									${list.QNA_REPDATE }
								</td>
								<td class="situation1">
									${list.QNA_REPSTATE }
								</td>
							</tr>
							<tr class="detail answer-yes">
								<td colspan="6">
									<div class="contents">
										<div class="description">
											<p>${list.QNA_CONTENT }</p>
										</div>
										<c:if test="${list.QNA_IMAGE1 ne null }">
											<div style="max-width:300px">
											<img src="/GNG/file/qnaFile/${list.QNA_IMAGE1}" class="img-responsive">
											</div>
										</c:if>
									</div>
									<c:if test="${list.QNA_REPDATE ne null }">
									<div class="answer">
										<p><span class="icon"></span>[고객님 안녕하세요! 문의사항에 대한 답변입니다.]<br>
											${list.QNA_REPCONTENT}
										</p>
										<div class="info">
											<p class="date">[${list.QNA_REPDATE}]</p>
										</div>
										<!--
										<div class="alert">
											<p>이 상품의 문의가 종료되었습니다. 감사합니다.</p>
										</div>
										-->
										<!-- info//end -->
									</div>
									</c:if>
									<!-- answer//end -->
								</td>
							</tr>
							<!--  -->
							</c:forEach>
						</tbody>
						</c:when>
						<c:otherwise>
							<tbody>
							</tbody>
						</c:otherwise>
						</c:choose>
					</table>
				</div>
			</div>
			<!-- table-responsive//end -->
			
			<!--  -->
			<div class="section-foot">
				<div class="page-navigator-horizon">
				<!-- 페이징하는 부분 -->
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
			<!-- list//end -->
	
		<!-- asking-list-guide//end -->
	</div>