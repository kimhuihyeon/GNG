<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<link rel="stylesheet" href="/GNG/css/mypoint.css">
<c:set var="TOTALPOINT" value="${sumPoint}" />
<c:set var="PREPOINT" value="0" />

<div class="modal-body">
<div class="modal-status-possessions modal-possessions modal-status-milage">
   <section class="status box-shadow">
      <div class="section-body table-shell-sm">
         <div class="col-sm-24 cell">
            <em>현금처럼 사용 가능한 적립금</em>
            <strong><fmt:formatNumber value="${sumPoint}" type="number" />원</strong>
         </div>
         <!--
         <div class="col-sm-12 cell">
            <em>2015년 05월 07일 소멸 예정</em>
            <strong>0원</strong>
         </div>
         -->
      </div>
   </section>
   <section class="detail box-shadow">
      <div class="tit-join">
         <h3>상세 내역</h3>
      </div>
      <!-- section-head//end -->
      <div class="section-body">
      
         <div class="table-responsive" style="width:100%; height:200px; overflow:auto">
            <table class="table">
               <thead>
               <tr>
                  <th class="date">발생 일자</th>
                  <th class="subject">내용</th>
                  <th class="give">포인트</th>
                  <th class="rest">잔여 포인트</th>
               </tr>
               </thead>
               <c:choose>
                  <c:when test="${myPoint eq null}">
                  <tbody>
                     <tr><td colspan="9" style="text-align:center;">적립 내역이 없습니다.</td></tr>
                  </tbody>
                  </c:when>
                  <c:otherwise>
                  <c:set var="fl" value="${firstLine}"/>
                  
                  <c:forEach items="${myPoint}" var="point">
                
                  <tbody>
               <tr>
                  <td class="date">${point.POINT_DATE}</td>
                  <td class="subject">${point.POINT_CONTENT}</td>
                  <td class="give"><fmt:formatNumber value="${point.POINT_POINT}" type="number" /></td>
                  <td><c:set var="TOTALPOINT" value="${TOTALPOINT-PREPOINT}" /><fmt:formatNumber value="${TOTALPOINT }" type="number" /></td>
               <c:set var="PREPOINT" value="${point.POINT_POINT}" />
                     </tbody>
           </c:forEach>
                  </c:otherwise>
                  </c:choose>
            </table>
         </div>
      </div>
      
   </section>
</div>

<div class="modal-button">
   <button class="btn-close">
      <span class="button-label">닫기</span>
   </button>
</div></div>