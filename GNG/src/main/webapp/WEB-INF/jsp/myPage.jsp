<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/GNG/css/mypage.css">
<style type="text/css">
u {color: #FF4500;}
</style> 

<script>

$(function () {
    $(".tab_content").hide();
    $(".tab_content:first").show();

    $(".account-nav li").click(function () {
        $(".account-nav li").removeClass("selected");

        $(this).addClass("selected");
    });
});

$(document).ready(function(){
var link = document.location.href;
var tab = link.split('mypage').pop();
if(tab == ""){
   $('a[href=#orderlist]').trigger("click");   
}else{
$('a[href$='+tab+']').trigger("click");
}
});

$(documnet).ready(function(){
   fn_selectBoardList(1);
});

function paging(num){
   var currentPage = num;
   var url = window.location.href;
   var index = url.indexOf("#");
   url = url.substring(index+1);
   console.log(url);
   console.log(currentPage);
   console.log(index);
   console.log(url);
   $.ajax({
      url: "/GNG/"+url,
      type : "get",
      data: {"currentPage":currentPage, "url":url},
      success:function(data){
         $("#account-contentsWrap").html(data);
   
         /* comData.set(("#account-contentsWrap").html(data)); */
      }
   });
   
}

function tab(num){
      if(num == 1){
         var currentPage = $("#currentPage").val();
         if(currentPage > 1){
            var currentPage = 1;
         }else{
         var currentPage = $("#currentPage").val();
         }
         var url = 'orderlist';
         console.log(currentPage);   
         console.log(url);
          $.ajax({
             url: "/GNG/orderlist",
             type : "get",
             data: {"currentPage":currentPage, "url":url},
             success:function(data){
                $("#account-contentsWrap").html(data);
                
             }
          });
      }
      if(num == 2){
         var currentPage = $("#currentPage").val();
         if(currentPage > 1){
            var currentPage = 1;
         }else{
         var currentPage = $("#currentPage").val();
         }
         var url = 'exchangelist';
         console.log(currentPage);   
         console.log(url);
          $.ajax({
         url: "/GNG/exchangelist",
         type : "get",
         data: {"currentPage":currentPage, "url":url},
         success:function(data){
            $("#account-contentsWrap").html(data);
         }
      });
      }
      if(num == 3){
         var currentPage = $("#currentPage").val();
         if(currentPage > 1){
            var currentPage = 1;
         }else{
         var currentPage = $("#currentPage").val();
         }
         var url = 'returnlist';
         console.log(currentPage);   
         console.log(url);
          $.ajax({
         url: "/GNG/returnlist",
         type : "get",
         data: {"currentPage":currentPage, "url":url},
         success:function(data){
            $("#account-contentsWrap").html(data);
         }
      });
      }
      if(num == 4){
         var currentPage = $("#currentPage").val();
         if(currentPage > 1){
            var currentPage = 1;
         }else{
         var currentPage = $("#currentPage").val();
         }
         var url = 'review';
         console.log(currentPage);   
         console.log(url);
          $.ajax({
         url: "/GNG/review",
         type : "get",
         data: {"currentPage":currentPage, "url":url},
         success:function(data){
            $("#account-contentsWrap").html(data);
         }
      });
      }
      if(num == 5){
         var currentPage = $("#currentPage").val();
         if(currentPage > 1){
            var currentPage = 1;
         }else{
         var currentPage = $("#currentPage").val();
         }
         var url = 'qna';
         console.log(currentPage);   
         console.log(url);
          $.ajax({
         url: "/GNG/qna",
         type : "get",
         data: {"currentPage":currentPage, "url":url},
         success:function(data){
            $("#account-contentsWrap").html(data);
      
            /* comData.set(("#account-contentsWrap").html(data)); */
         }
      });
      }
      if(num == 6){
         var currentPage = $("#currentPage").val();
         if(currentPage > 1){
            var currentPage = 1;
         }else{
         var currentPage = $("#currentPage").val();
         }
         var url = 'oneToOne';
         $.ajax({
         url: "/GNG/oneToOne",
         type : "get",
         data: {"currentPage":currentPage, "url":url},
         success:function(data){
            $("#account-contentsWrap").html(data);
         }
      });
      }
      if(num == 7){
          $.ajax({
         url: "/GNG/myinfo",
         type : "get",
         success:function(data){
            $("#account-contentsWrap").html(data);
         }
      });
      }
      return false;
};


</script>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<br><br><br><br>
<section class="page-category container">
   <div class="selectboxWrap">
      <div class="selectbox">
         <div class="selectbox-data">
            <strong class="text">마이페이지 </strong>
            <span class="icon icon-dropdown-white"></span>
         </div>
         <select name="category[]" id="cate02">
            <option value="">마이페이지</option>
         </select>
      </div>
      
   </div>
</section>

<section class="page-title section container">
   <h2>
      <strong>my GNG</strong>
   </h2>
</section>
<div class="personal-account-info container">
   <div class="my-account row">
      <section class="col-xs-24 my-info">
      
         
            <div class="info">
                            <dl class="order1" style="text-align: center; float:left;">
                             <span class="level" >${sessionScope.MEMBER_NAME }</span>
                               (<span class="level">${sessionScope.MEMBER_ID}</span>)님
                           <br/>
                              <a href="#myinfo" onclick="javascript:tab(7)" class="button small button-dimmed">
                                 <span class="button-label">내 정보 수정</span>
                              </a>
                            <br/><br/>
                            <dt style="text-align: left; padding-left: 20px;">전화번호 : </dt><dd><span>${sessionScope.MEMBER_PHONE }</span></dd>
                            <dt style="text-align: left; padding-left: 20px;">이메일 : </dt><dd><span>${sessionScope.MEMBER_EMAIL }</span></dd>
                            
                           </dl>
                            
                            <dl class="order"  style="float: center;">
                             <c:choose>
            <c:when test="${totalMoney eq null }">
            <dt class="tot">총  구입금액 : </dt>
           <dd class="tot"><strong>0</strong>원</dd>
             </c:when>
             <c:otherwise>
            <dt class="tot">총  구입금액 :</dt>
             <dd class="tot"><strong><fmt:formatNumber value="${totalMoney}" type="number"/></strong>&nbsp;원</dd>
             </c:otherwise>
            </c:choose>
            <dt>&nbsp;</dt>
            <dd>&nbsp;</dd>
                   <dt class="sss">포인트 :</dt>
                                <dd>
                             <em class="sss"><fmt:formatNumber  value="${sumPoint}" type="number" />&nbsp원</em><br>
               <button type="button" onclick="location.href='/GNG/member/myPoint'" class="button small" target="modal" data-size="md"  data-label="나의 적립금">
                  <span class="button-label">자세히 보기</span>
               </button>
               </dd>
               </dl>
                 <dl class="order" style="float: right;">
            <dt class="sss">  주문진행중 : </dt>
        <dd class="sss"> ${buyCount }건</dd>
        <dt>&nbsp</dt>
            <dd>&nbsp</dd>
       <dt class="sss">반품진행중 : </dt>
          <dd class="sss">${ReCount }건</dd>
          <dt >&nbsp</dt>
            <dd>&nbsp</dd>
          <dt class="sss">교환진행중 : </dt>
          <dd class="sss">${ExCount }건</dd>
                
                 </dl>
                        </div>
      </section>
<style>
.account-nav {display:block;}
.account-nav ul li {width:14.285%;}
@media (max-width: 767px){
   .account-nav ul li {width:25%; float:left; border:1px solid #000; margin-right:-1px; margin-bottom:-1px; border-radius:0 !important; padding:5px 0;}
   .account-nav ul li.m-1 {margin-left:-1px;}
   .account-nav ul li.xx {width:33.333%;}
}

</style>
      <section class="col-xs-24 account-navWrap">
         <nav class="account-nav">
            <ul>
               <!--
               <li class=" col-sm-3">
                  <a href="../mypage/">마이팬콧 홈</a>
               </li>
               -->
               <li class=" col-sm-3 xx">
                  <a href="#orderlist" onclick="javascript:tab(1)">주문조회/취소
                     <!-- 글이 있을 경우 exist라는 클래스명 붙임 -->
                     <em class="badge badge-point"></em>
                  </a>
               </li>

               <li class="col-sm-3 xx">
                  <a href="#exchangelist" onclick="javascript:tab(2)">교환신청/조회<span></span></a>
               </li>
               <li class="col-sm-3 xx m-1">
                  <a href="#returnlist" onclick="javascript:tab(3)">반품신청/조회<span></span></a>
               </li>

               <li class=" col-sm-3">
                  <a href="#review" onclick="javascript:tab(4)">구매 후기
                     <!-- 글이 있을 경우 exist라는 클래스명 붙임 -->
                     <em class="badge badge-point"></em>
                  </a>
               </li>
               <li class=" col-sm-3">
                  <a href="#qna" onclick="javascript:tab(5)">상품 문의 <em class="badge">${newAlarm }</em></a>
               </li>
               <li class=" col-sm-3">
                  <a href="#oneToOne" onclick="javascript:tab(6)"   >1:1 문의 <em class="badge">${selectOtoCount}</em></a>
               </li>
               <li class=" col-sm-3">
                  <a href="#myinfo" onclick="javascript:tab(7)">내 정보 수정</a>
               </li>
               <!--<li class="">
                  <a href="../mypage/myinfo">내 정보</a>
                  &lt;!&ndash; 로그인후 내정보 클릭시 뜨는 패스워드 모달창 trigger
                  <a href="#" data-toggle="modal" data-target="#popup-privacy-confirm">내 정보<span></span></a>
                  &ndash;&gt;
               </li>-->
            </ul>
         </nav>
         <!--
         <nav class="account-nav-mobile">
            <div class="selectbox">
               <div class="selectbox-data">
                  <strong class="text"></strong>
                  <span class="icon icon-dropdown-gray-dark"></span>
               </div>
               <select>
                  <option>마이팬콧 홈</option>
                  <option>주문 조회/취소</option>
                  <option>구매 후기</option>
                  <option>나의 상품문의</option>
                  <option>1:1 문의</option>
               </select>
            </div>
         </nav>
         -->
      </section>
   </div>
   <div id="account-contentsWrap"class="account-contentsWrap">
   
   </div>
</div>
<script>
$(".account-individual-list tr.brief").click(function(){
   $(this).next().toggle();
});

function ajaxReviewPaging(i,reviewEndPagingNum,reviewStartPagingNum,reviewNowPage) {
   var pagingReviewOnOff="ON";
   var QNA_NUMBER=${QNA_NUMBER};
   
   /* console.log("수고changeReviewList"+i); */
   
    
    $.ajax({
       url: "/GNG/mypage#qna",
         type : "post",
         data: {"reviewNowPage":reviewNowPage,"reviewStartPagingNum":reviewStartPagingNum,"reviewEndPagingNum":reviewEndPagingNum,"pagingReviewOnOff":pagingReviewOnOff,"i":i,"QNA_NUMBER":QNA_NUMBER},
         success:function(data){
            /* console.log("수고3"); */
            $("#account-contentsWrap").html(data);
         }
      });     
     
}
</script>