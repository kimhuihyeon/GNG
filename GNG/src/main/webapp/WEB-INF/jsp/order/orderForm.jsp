<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="/GNG/theme/aboki/common.css">
<link rel="stylesheet" href="/GNG/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/header.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/GNG/theme/aboki/scroll.css">
<link rel="stylesheet" href="/GNG/theme/aboki/menu.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/order.css">

<body>



<br>
<br>
<br>
<br>

<div id="wrap">
   <div id="contentWrapper" >
        <div id="contentWrap">
           <div id="content">
                <div id="order">
               <dl class="loc-navi">
                        <dt class="blind">현재 위치</dt>
                        <dd>
                            <a href="/GNG/main">home</a> &gt; 주문서 작성
                        </dd>
                    </dl>
                    <h2 class="tit-page">
                        <img src="/GNG/theme/pshp/img_MODA/order_page_tit.gif" alt="order sheet" title="order sheet">
                        <span class="dsc">주문정보를 작성하신 후, <em>주문하기</em>를 눌러주세요</span>
                    </h2>
                    <div class="page-body">
                    <form method="post" id="frmOrder" name="frmOrder" action="orderDetail" >
               <c:forEach var="orderForm"  items="${goods}" varStatus="stat">
               <input type="hidden" id="ea[]" name="ea[]" value="${orderForm.EA }">
               <input type="hidden" id="kinds[]" name="kinds[]" value= "${orderForm.GOODS_KIND_NUMBER }">
               <input type="hidden" name="GOODS_NUMBER" value="${orderForm.GOODS_NUMBER }">
               </c:forEach>
               <input type="hidden" name="MEMBER_ID" value="${orderMember.MEMBER_ID }">
                    
                    <h3 class="stit"><img src="/GNG/theme/pshp/img_MODA/order_prd_tit.gif" alt="주문할 상품" title="주문할 상품"></h3>
                   
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
                                <a href="${viewURL}"><img src="/GNG/file/goodsFile/${orderForm.GOODS_THUMBNAIL}" width="40" /></a>                             
                                </div>
                             </td>
                             <td>
                                <div class="tb-left tb-bold">
                                <a href="${viewURL}" style="font-weight: bold;">[GNG] ${orderForm.GOODS_NAME} ${orderForm.GOODS_COLOR} ${orderForm.GOODS_SIZE}</a>
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
                           <span ><fmt:formatNumber value="-${orderForm.TOTALPRICE - (orderForm.GOODS_DISPRICE * orderForm.EA)}" type="number" />원</span>
                           </c:when>
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
                           <c:choose>
                           <c:when test="${orderForm.GOODS_DISPRICE ne orderForm.GOODS_PRICE}">
                           <span>0원</span>
                           </c:when>
                           <c:otherwise>
                           <span>0원</span>
                           </c:otherwise>
                           </c:choose>
                           </div>
                        </c:if>
                        </td>
                        <tr class="nbg">
                           <td colspan="6">
                           <div class="tb-left">Color : ${orderForm.GOODS_COLOR}, Size : ${orderForm.GOODS_SIZE}</div> 
                           </td>
                        </tr>
                        <td colspan="6" style="background: url(/GNG/theme/pshp/img_MODA/dot_h1_w10.gif) repeat-x 0 0;" >
   
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
                             <input type="hidden" id="MEMBER_NUMBER" name="MEMBER_NUMBER" value="${MEMBER_NUMBER}">
                                          결제금액 : <fmt:formatNumber value="${sum}" type="number" />원 
                                          + 배송료 : <c:choose>
                                                <c:when test="${sum >= 30000}">
                                                0원
                                                </c:when>
                                                <c:otherwise>      
                                                2,500원
                                                </c:otherwise>
                                                </c:choose>   
                                                <strong>- 포인트 할인 : <span id="v_coupon">0</span>원</strong>
                                          = <strong id=totalPirce><c:choose>
                                          <c:when test="${sum >= 30000}">
                                          <fmt:formatNumber value="${sum }" type="number" />원
                                          </c:when>
                                          <c:otherwise>
                                          <fmt:formatNumber value="${sum + 2500}" type="number" />원
                                          </c:otherwise>
                                          </c:choose></strong>
                                       </div>
                                    </td>
                                 </tr>
                             </tfoot>
                    
                    </table>
                    </div><!-- table-cart table-order-prd -->
                    
               <c:if test="${guestEmail eq null}">
                    <div class="mem-lvl">
                     <div class="lvl-img">
                        <img src="/GNG/theme/pshp/img_MODA/royalimg_SP01.gif">
                     </div>
                     <p>
                     ${orderMember.MEMBER_NAME }님은 <em>[GNG BEGINNER]</em>회원입니다.<br> <span
                     class="username">${orderMember.MEMBER_NAME }님</span>이 <span class="MS_group_maxmoney">상품</span> <span class="MS_group_condition"></span>구매시, 구매금액의 <font
                     color="#F26622">10</font>%를 <font color="#F26622">추가 할인</font>해
                     드립니다.
                     </p>
                     </div><!-- mem-lvl -->
               </c:if>
                    
                     <fieldset>
                           <legend>주문 폼</legend>
                           <h3 class="stit">
                              <img src="/GNG/theme/pshp/img_MODA/order_user_info_tit.gif"
                                 alt="주문자 정보" title="주문자 정보">
                           </h3>
                           <div class="table-order-info table-user">
                              <table class="order-table">
                                 <caption>주문자 정보</caption>
                                    <colgroup>
                                       <col width="90">
                                       <col width="*">
                                       <col width="70">
                                       <col width="*">
                                    </colgroup>
                                    <tbody>
                                       <tr class="nbg">
                                          <th scope="row"><div class="tb-right">이 름</div></th>
                                       <td>
                                          <div class="tb-left">
                                          <c:choose>
                                             <c:when test="${guestEmail ne null }">
                                          <input type="text" style="width:100px;" id="order-name" name="guestName" value="${guestName }" class="xx-control" alt="주문하시는 분 성명을 입력하세요.">
                                          
                                          </c:when>
                                          <c:otherwise>
                                          ${orderMember.MEMBER_NAME }                                    
                                          <input type="text" name="MEMBER_NAME"
                                                id="order-name" class="MS_input_txt txt-input2 width100"
                                                value="${orderMember.MEMBER_NAME}">
                                          </c:otherwise>
                                          </c:choose>
                                          </div>
                                       </td>
                                       <th scope="row"><div class="tb-right">연락처</div></th>   
                                       <td>
                                          <div class="tb-left">
                                        <c:choose>
                                           <c:when test="${guestEmail eq null }">
                                             <select 
                                                id="emergency11" name="guestPhone1" class="MS_select MS_tel">
                                                <option value="">선택</option>
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                                <option value="02">02</option>
                                                <option value="031">031</option>
                                                <option value="032">032</option>
                                                <option value="033">033</option>
                                                <option value="041">041</option>
                                                <option value="042">042</option>
                                                <option value="043">043</option>
                                                <option value="044">044</option>
                                                <option value="051">051</option>
                                                <option value="052">052</option>
                                                <option value="053">053</option>
                                                <option value="054">054</option>
                                                <option value="055">055</option>
                                                <option value="061">061</option>
                                                <option value="062">062</option>
                                                <option value="063">063</option>
                                                <option value="064">064</option>
                                                <option value="0502">0502</option>
                                                <option value="0503">0503</option>
                                                <option value="0504">0504</option>
                                                <option value="0505">0505</option>
                                                <option value="0507">0507</option>
                                                <option value="070">070</option>
                                                <option value="080">080</option>
                                                
                                                
                                                </select>
                                                - <input type="text" 
                                                 id="emergency12" size="4" name="guestPhone2"
                                                maxlength="4" class="MS_input_txt" value=""> 
                                                - <input
                                                type="text" name="guestPhone3"
                                                id="emergency13" size="4" maxlength="4"
                                                class="MS_input_txt" value="">
                                          </c:when>
                                          <c:otherwise>
                                                   <select name="guestPhone1"  
                                                id="emergency11" class="MS_select MS_tel">
                                                <option value="">선택</option>
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                                <option value="02">02</option>
                                                <option value="031">031</option>
                                                <option value="032">032</option>
                                                <option value="033">033</option>
                                                <option value="041">041</option>
                                                <option value="042">042</option>
                                                <option value="043">043</option>
                                                <option value="044">044</option>
                                                <option value="051">051</option>
                                                <option value="052">052</option>
                                                <option value="053">053</option>
                                                <option value="054">054</option>
                                                <option value="055">055</option>
                                                <option value="061">061</option>
                                                <option value="062">062</option>
                                                <option value="063">063</option>
                                                <option value="064">064</option>
                                                <option value="0502">0502</option>
                                                <option value="0503">0503</option>
                                                <option value="0504">0504</option>
                                                <option value="0505">0505</option>
                                                <option value="0507">0507</option>
                                                <option value="070">070</option>
                                                <option value="080">080</option>
                                                
                                                
                                                </select>
                                                - <input type="text" 
                                                id="emergency12" name="guestPhone2"  size="4"
                                                maxlength="5" class="MS_input_txt" value=""> 
                                                - <input
                                                type="text"
                                                id="emergency13" name="guestPhone3" size="4" maxlength="5"
                                                class="MS_input_txt" value="">
                                          
                                          </c:otherwise>
                                          </c:choose>
                                          </div>
                                          </td>
                                       </tr>
                                       <tr>
                                       <th scope="row"><div class="tb-right">E-mail</div></th>
                                       <td colspan="3">
                                          <div class="tb-left">
                                          <c:choose>
                                          <c:when test="${guestEmail ne null }">
                                          <input type="email" id="input-mail" name="guestEmail" value="${guestEmail }" readonly class="xx-control" required="" alt="이메일을 입력하세요." style="width:200px">
                                          </c:when>
                                          <c:otherwise>
                                          <input type="email" id="input-mail" name="MEMBER_EMAIL" value="${orderMember.MEMBER_EMAIL }" class="xx-control" required="" alt="이메일을 입력하세요." style="width:200px">
                                          </c:otherwise>
                                          </c:choose>   
                                          
                                          
                                          </div><!-- tb-left -->
                                          </td>
                                          </tr>
                                    </tbody>
                              </table><!-- order-table -->
                           </div><!-- table-order-info table-user -->
                           
                           <c:if test="${guestEmail eq null }">
                           <h3 class="stit">
                              <img
                                 src="/GNG/theme/pshp/img_MODA/order_delivery_info_tit.gif"
                                 alt="배송지 정보" title="배송지 정보"> <label> <input
                                 type="checkbox" name="same" id="same"
                                 onclick="javascript:copydata();"> 주문자 정보 입력
                              </label>
                           </h3>
                           </c:if>
                           <c:if test="${guestEmail ne null}">
                           <h3 class="stit">
                              <img
                                 src="/GNG/theme/pshp/img_MODA/order_delivery_info_tit.gif"
                                 alt="배송지 정보" title="배송지 정보"> <label> <input
                                 type="checkbox" name="same2" id="same2"
                                 onclick="javascript:copydata2();"> 주문자 정보 입력
                              </label>
                           </h3>
                           </c:if>
                           <div class="table-order-info">
                              <table class="order-table">
                                 <caption>배송지 정보</caption>
                                 <colgroup>
                                    <col width="85">
                                    <col width="135">
                                    <col width="70">
                                    <col width="*">
                                    <col width="70">
                                    <col width="*">
                                 </colgroup>
                                 <tbody>
                                    <tr class="nbg">
                                       <th scope="row"><div class="tb-right">이 름</div></th>
                                       <td>
                                          <div class="tb-left">
                                             <input type="text" name="RECEIVER_NAME"
                                                id="receiver" class="MS_input_txt txt-input2 width100"
                                                value="">
                                          </div>
                                       
                                       </td>
                                       
                                       <th scope="row"><div class="tb-right">연락처</div></th>
                                       <td>
                                          <div class="tb-left2">
                                             <select name="emergency31"
                                                id="emergency31" class="MS_select MS_tel">
                                                <option value="" selected="selected">선택</option>
                                                <option value="010" selected="selected">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                                <option value="017">017</option>
                                                <option value="018">018</option>
                                                <option value="019">019</option>
                                                <option value="02">02</option>
                                                <option value="031">031</option>
                                                <option value="032">032</option>
                                                <option value="033">033</option>
                                                <option value="041">041</option>
                                                <option value="042">042</option>
                                                <option value="043">043</option>
                                                <option value="044">044</option>
                                                <option value="051">051</option>
                                                <option value="052">052</option>
                                                <option value="053">053</option>
                                                <option value="054">054</option>
                                                <option value="055">055</option>
                                                <option value="061">061</option>
                                                <option value="062">062</option>
                                                <option value="063">063</option>
                                                <option value="064">064</option>
                                                <option value="0502">0502</option>
                                                <option value="0503">0503</option>
                                                <option value="0504">0504</option>
                                                <option value="0505">0505</option>
                                                <option value="0507">0507</option>
                                                <option value="070">070</option>
                                                <option value="080">080</option>
                                             </select> - <input type="text" name="emergency32"
                                                id="emergency32" size="4"
                                                maxlength="4" class="MS_input_txt" value=""> - <input
                                                type="text" name="emergency33"
                                                id="emergency33" size="4" maxlength="4"
                                                class="MS_input_txt" value="">
                                          </div><!-- tb-left2 -->
                                       </td>
                                    </tr>
                                    <!-- 주소 시작 -->
                                    <tr>
                                       <th scope="row"><div class="tb-right">주소</div></th>
                                       <td colspan="5">
                                          <div class="tb-left tb-label-r10">
                                          <ul>
                                          <li>
                                          <input style="width:100px;" type="text" id="sample6_postcode" name="RECEIVER_ZIPCODE" value="${orderMember.MEMBER_ZIPCODE }" disabled="disabled" class="MS_input_txt" placeholder="우편번호" maxlength="3">
                                          <a class="button button-dimmed" onclick="sample6_execDaumPostcode()" style="background:white; border-style: hidden;"><img
                                                      src="/GNG/theme/pshp/img_MODA/btn_h20_zipcode_sch.gif"
                                                      alt="우편번호 검색" title="우편번호 검색"></a>
                                          
                                          </li>
                                          <li>
                                          <input type="text" id="sample6_address" name="RECEIVER_ADDRESS1" value="${orderMember.MEMBER_ADDRESS1 }" disabled="disabled" class="MS_input_txt txt-input2 width350" placeholder="주소"> [기본주소]
                                          </li>
                                          <li>
                                          <input type="text" id="sample6_address2" name="RECEIVER_ADDRESS2" value="${orderMember.MEMBER_ADDRESS2 }" class="MS_input_txt txt-input2 width350" placeholder="상세주소"> [나머지주소]
                                          </li>
                                          </ul>
                                          
                                          </div><!-- tb-left tb-label-r10 -->
                                          </td>
                                          </tr>
                                          <tr>
                                             <th scope="row">
                                             <div class="tb-right">
                                             주문메시지 <em class="d-block">(100자내외)</em>
                                             </div>
                                          </th>
                                          <td colspan="5">
                                             <div class="tb-left">
                                             <textarea name="DELIVERY_MESSAGE" id="message"
                                             cols="50" rows="5" class="MS_textarea"></textarea>
                                             </div>
                                          </td>
                                          </tr>
                                          
                                          <tr>
                                       <th scope="row"><div class="tb-right">안내메세지</div></th>
                                       <td colspan="5">
                                          <div class="new-privercy-contract">
                                             <p>개인정보 수집·이용</p>
                                             <div class="privercy-contract">
                                                <table class="tbl" summary="목적, 항목, 보유기간">
                                                   <caption>개인정보 수집/이용</caption>
                                                   <colgroup>
                                                      <col width="*">
                                                      <col width="30%">
                                                      <col width="20%">
                                                   </colgroup>
                                                   <thead>
                                                      <tr>
                                                         <th scope="col">목적</th>
                                                         <th scope="col">항목</th>
                                                         <th scope="col">보유기간</th>
                                                      </tr>
                                                   </thead>
                                                   <tbody>
                                                      <tr>
                                                         <td class="purpose"><div class="txt-l">서비스
                                                               제공에 따른 요금정산, 콘텐츠 제공, 구매 및 요금결제, 물품배송, 금융거래 본인 인증 및
                                                               금융서비스</div></td>
                                                         <td class="items"><div class="txt-l">주문자
                                                               정보(이름, 연락처), 받는분 정보(이름, 연락처, 주소)</div></td>
                                                         <td class="holding"><div class="txt-l">목적
                                                               달성 후 5일까지(관계법률로 인해 필요 시, 일정기간 보존)</div></td>
                                                      </tr>
                                                   </tbody>
                                                </table>
                                                <div style="margin-top: 5px;">* 동의하셔야 서비스를 이용하실 수
                                                   있습니다.</div>
                                                <div class="privercy-agree">
                                                   <label><input type="radio" id="agree"
                                                      name="new_privacy_agree" value="Y"> 정보수집에
                                                      동의합니다.</label> <label><input type="radio"
                                                      name="new_privacy_agree" value="N" checked="">
                                                      동의하지 않습니다.</label>
                                                </div>
                                             </div>
                                          </div>
                                       </td>
                                    </tr>
                                       
                                          
                                    </tbody>
                                    </table>
                                    </div><!-- table-order-info -->
                        
                        <!-- 포인트 -->
                        <c:if test="${not empty sessionScope.MEMBER_ID}">
                        <h3 class="stit">
                              <img
                                 src="/GNG/theme/pshp/img_MODA/order_mileage_use_tit.gif"
                                 alt="적립금 사용" title="적립금 사용">
                        </h3>
                        <div class="table-order-info">
                           <table>
                           <colgroup>
                                    <col width="90">
                                    <col width="90">
                                    <col width="90">
                                    <col width="*">
                                    <col width="70">
                                    <col width="*">
                           </colgroup>
                           <tbody>
                              <tr class="nbg">
                              <th scope="row"><div class="tb-right">적립 포인트</div></th>
                              <td>
                                 <div class="tb-left">
                                 
                                 <input type="text" id="order-name" name="nameOrder" disabled="disabled"  value="<fmt:formatNumber value="${sum / 100 }" type="number" />원" class="MS_input_txt txt-input2 width100">
                                 </div>
                              </td>
                              </tr>
                              <tr class="nbg">
                              <th scope="row"><div class="tb-right">누적 포인트</div></th>
                              <td colspan="6" style="background: url(/GNG/theme/pshp/img_MODA/dot_h1_w10.gif) repeat-x 0 0;">
                                 <div class="tb-left">
                                 <input type="text" id="myPoint" name="myPoint" disabled="disabled"  value="${orderMember.MEMBER_POINT }원" class="MS_input_txt txt-input2 width100" required="" alt="휴대폰번호를 입력하세요." maxlength="14">
                                 </div>
                              </td >
                              </tr>
                              <tr class="nbg">
                              <th scope="row"><div class="tb-right">포인트 사용</div></th>
                              <td colspan="6" style="background: url(/GNG/theme/pshp/img_MODA/dot_h1_w10.gif) repeat-x 0 0;">
                                 <div class="tb-left">
                                 <input type="text" id="POINT_POINT" name="POINT_POINT"  class="MS_input_txt txt-input2 width100">
                                 <span class="button button-dimmed" onclick="javascript:ajaxChangePoint();" style="cursor:pointer">사용하기</span>
                                 </div>
                              </td >
                              </tr>
                              
                              
                           </tbody>
                           </table>
                        </div><!-- table-order-info -->
                        </c:if>
            
                         <h3 class="stit"><img src="/GNG/theme/pshp/img_MODA/order_pay_tit.gif" alt="결제 방법" title="결제 방법"></h3>
                               <div class="cnt-box">
                                 <p>무통장 입금 : <span style="color: #0054A6;">농협중앙회 301-0548-7870-42 (예금주:(주)GNG)) <span id="bankname_banker">${orderMember.MEMBER_NAME}</span></span><br>&nbsp;(입금확인후 배송이 됩니다.)</p>
                                 </div><!-- .cnt-box -->
                        
                        
                        <div class="btn-foot">
                              <button type="button" onclick="javaScript:sendGoods();"><img
                                 src="/GNG/theme/pshp/img_MODA/btn_h36_order.gif"></button> 
                              <a href="goodsDetail?GOODS_NUMBER=${GOODS_NUMBER }">
                              <img src="/GNG/theme/pshp/img_MODA/btn_h36_order_cancel.gif"></a>
                        </div>
                        
               </fieldset>
                    
                   
                    
                    </form>
                    </div><!-- page-body -->
        
        
        





            </div><!-- order -->
         </div><!-- content -->
      </div><!-- contentWrap -->
   </div><!-- contentWrapper -->

</div><!-- wrap -->

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<script src="/GNG/theme/aboki/js/sendGoods.js" type="text/javascript"></script>
<script src="/GNG/theme/aboki/js/copyright2.js" type="text/javascript"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

window.onload = function (){
    var phone = '${orderMember.MEMBER_PHONE}';
    if(phone != "" && phone != null){
    var firstNumber = phone.substring(0,3);
    var secondNumber = phone.substring(3,7);
    var finalNumber = phone.substring(7,11);
    $("#emergency11").val(firstNumber);
    $("#emergency12").attr('value',secondNumber);
    $("#emergency13").attr('value',finalNumber);
   }
 }
 
function guestPhone(){
   var guestPhone = ($("#emergency11").val()) + ($("#emergency12").val()) + ($("#emergency13").val());
   alert(guestPhone);
   
}
 

function ajaxChangePoint() {
   var myPoint= ${orderMember.MEMBER_POINT};
   var usePoint = document.getElementById("POINT_POINT").value;
   var pointCheck ="ON";
   var GOODS_NUMBER='${GOODS_NUMBER}';//확인됨
   var EA2=document.getElementsByName("ea[]");
   var kinds = document.getElementsByName("kinds[]");
   var goods_kind_number = new Array();
   var EA = new Array();
   
   for (var i = 0, len = kinds.length; i < len; i++) {
      goods_kind_number.push(kinds[i].value);
      EA.push(EA2[i].value);
   }

   var sum='${sum}';//확인됨
   
   console.log("goods_kind_number :"+goods_kind_number+"\n GOODS_NUMBER"+GOODS_NUMBER +"\n EA"+EA+"\n ");
   
   var nowPoint;
   
   if(myPoint>=usePoint)
   {//

      nowPoint=myPoint-usePoint;
      document.getElementById("myPoint").value = myPoint-usePoint +"원";
      //console.log("나우포인트"+nowPoint);
      

      jQuery.ajaxSettings.traditional = true;

       $.ajax({
            url: "/GNG/orderPoint",
            type : "post",
            data: {"myPoint":myPoint,"usePoint":usePoint,"pointCheck":pointCheck,"EA":EA,"GOODS_NUMBER":GOODS_NUMBER,"GOODS_KIND_NUMBER":goods_kind_number},
            dataType:"json",
            success:function(data){
               $("#v_coupon").html(data.usePoint);
               
               sum = parseInt(sum);
               var usePoint = parseInt(data.usePoint);
               if(sum<30000){
                  sum = sum+parseInt('2500');
               }
               var total = sum-usePoint;
               total = comma(total);
            
               $("#totalPirce").html(total+"원");
               
               
            }
         });   
   }
   
      else{
         document.getElementById("myPoint").value = myPoint+"원";
         document.getElementById("POINT_POINT").value =null;
         alert("포인트가 부족합니다.");
      }
   
   
   
   

   
   console.log("내포인트 : "+myPoint+"사용할포인트"+usePoint);
   
}

function copydata() {
    if ($('input[name="same"]').prop('checked') === true) {
       $('input[name="RECEIVER_NAME"]').val($('input[name="MEMBER_NAME"]').val());
         if ('select' == 'select') {
            if ($('select[name="emergency21"]').length > 0 && document.frmOrder.tempemergency21) $('select[name="emergency21"] option[value='+document.frmOrder.tempemergency21.value+']').attr("selected",true);
        } else {
            if ($('select[name="emergency21"]').length > 0 && document.frmOrder.tempemergency21) $('select[name="emergency21"]').val(document.frmOrder.tempemergency21.value);
        }
        if ($('input[name="emergency22"]').length > 0 && document.frmOrder.tempemergency22) $('input[name="emergency22"]').val(document.frmOrder.tempemergency22.value);
        if ($('input[name="emergency23"]').length > 0 && document.frmOrder.tempemergency23) $('input[name="emergency23"]').val(document.frmOrder.tempemergency23.value);
        if ('select' == 'select') {
            if ($('select[name="emergency31"]').length > 0 && $('select[name="guestPhone1"]').length > 0) $('select[name="emergency31"] option[value='+$('select[name="guestPhone1"]').val()+']').attr("selected",true); 
        } else {
            if ($('select[name="emergency31"]').length > 0 && $('select[name="guestPhone1"]').length > 0) $('select[name="emergency31"]').val($('select[name="guestPhone1"]').val()); 
        }
        if ($('input[name="emergency32"]').length > 0 && $('input[name="guestPhone2"]').length > 0) $('input[name="emergency32"]').val($('input[name="guestPhone2"]').val()); 
        if ($('input[name="emergency33"]').length > 0 && $('input[name="guestPhone3"]').length > 0) $('input[name="emergency33"]').val($('input[name="guestPhone3"]').val()); 
        if ($('input[name="guestPhone2"]').length > 0 && document.frmOrder.tempemergency2) $('input[name="emergency2"]').val(document.frmOrder.tempemergency2.value);
        if ($('input[name="guestPhone3"]').length > 0 && $('input[name="emergency"]').length > 0) $('input[name="emergency3"]').val($('input[name="emergency"]').val());
        
    } else {
       $('input[name="RECEIVER_NAME"]').val('');
        if ('select' == 'select') {
            if ($('select[name="emergency21"]')) $('select[name="emergency21"] option[value=""]').attr("selected",true);
        } else {
            if ($('select[name="emergency21"]')) $('select[name="emergency21"]').val('');
        }
        if ($('input[name="emergency22"]')) $('input[name="emergency22"]').val('');
        if ($('input[name="emergency23"]')) $('input[name="emergency23"]').val('');
        if ('select' == 'select') {
            if ($('select[name="emergency31"]')) $('select[name="emergency31"] option[value=""]').attr("selected",true);
        } else {
            if ($('select[name="emergency31"]')) $('select[name="emergency31"]').val('');
        }
        if ($('input[name="emergency32"]')) $('input[name="emergency32"]').val('');
        if ($('input[name="emergency33"]')) $('input[name="emergency33"]').val('');
        if ($('input[name="emergency2"]')) $('input[name="emergency2"]').val('');
        if ($('input[name="emergency3"]')) $('input[name="emergency3"]').val('');
        
    }
}


</script>
<script>

function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample6_address').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('sample6_address2').focus();
        }
    }).open();
}
</script>

</body>
</head>
</html>