<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/MODA/css/qnalist.css">
<script type="text/javascript">    
    function delchk(){
        return confirm("삭제하시겠습니까?");
    }
</script>

	<div class="account-review">
			<section class="review-list section box-shadow">
				<div class="tit-join">
				<input type="hidden" id="currentPage" value="${currentPage }"/>
					<h3>지난 후기</h3>
				</div>
				<!-- heading-title//end -->
				<div class="section-body">
					<div class="table-responsive">
						<table class="table list-dropdown" id="tb01">
							
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
									<th scope="col" class="center_text" style="text-align: left;">상품 정보</th>
									<th scope="col" class="caption" style="text-align: left;">&nbsp;</th>
									<th scope="col" class="subject">내용</th>
									<th scope="col" class="grade">평점</th>
									<th scope="col" class="purchasing-decision">작성 일자</th>
									<th scope="col" class="deadline">적립금</th>
								</tr>
							</thead>
						<c:choose>
						<c:when test="${list eq null}">
						<tbody>
						</tbody>
						</c:when>
						<c:otherwise>
						<c:forEach items="${list}" var="review">
						<tbody>
							<tr class="brief" id="brief"><!-- 문의가 종료되었을때, end클래스명 붙여줌 -->
								<td class="info-imgg" style="text-align: left; padding: 0; !important">
									<a href="/MODA/goodsDetail?GOODS_NUMBER=${review.GOODS_NUMBER }">
									<img src="/MODA/file/goodsFile/${review.GOODS_THUMBNAIL}" class="info-imgg"></a>
								</td>
								<td class="info-caption" style="text-align: left;">
									<strong class="brand">MODA</strong>
									<em class="name">${review.GOODS_NAME}</em>
								</td>
								<td class="subject">
									${review.REVIEW_TITLE}
								</td>
								<td class="grade">
								<c:if test="${review.REVIEW_SCORE == 1 }">
								<font color="#FFBF00" size="5">★</font>
								</c:if>
								<c:if test="${review.REVIEW_SCORE == 2 }">
								<font color="#FFBF00" size="5">★★</font>
								</c:if>
								<c:if test="${review.REVIEW_SCORE == 3 }">
								<font color="#FFBF00" size="5">★★★</font>
								</c:if>
								<c:if test="${review.REVIEW_SCORE == 4 }">
								<font color="#FFBF00" size="5">★★★★</font>
								</c:if>
								<c:if test="${review.REVIEW_SCORE == 5 }">
								<font color="#FFBF00" size="5">★★★★★</font>
								</c:if>
								</td>
								<td class="date-answer">
									${review.REVIEW_REGDATE }
								</td>
								<td class="situation">
									100
								</td>
							</tr>
						<tr class="detail end">
								<td colspan="6">
									<div class="contents">
										<c:if test="${review.REVIEW_IMAGE ne null }">
										<div style="max-width:300px">
										<img src="/MODA/file/reviewFile/${review.REVIEW_IMAGE}" class="img-responsive">
										</div>
										</c:if>
										<br/>
										<div class="description">
											<p>${review.REVIEW_CONTENT }
											<c:url var="viewURL" value="/reviewDelete">
													<c:param name="REVIEW_NUMBER" value="${review.REVIEW_NUMBER }" />
													
												</c:url>
												 <a href="${viewURL}" style="float: right;"><button type="button" class="oto_aaa" onclick="return delchk()">삭제</button></a></p> 
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
				<div class="section-foot account-list-page-navigator">
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
		</div>
	