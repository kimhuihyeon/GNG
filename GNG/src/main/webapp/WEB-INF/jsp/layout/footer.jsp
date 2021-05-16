<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/GNG/theme/aboki/common.css">
<link rel="stylesheet" href="/GNG/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/header.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/okdgg_layer.css">
<script type="text/javascript" src="/GNG/theme/aboki/footer.1.js"></script>
<script type="text/javascript">
   function top_sendmail() {
      window.open('/GNG/footerFunction/email', 'email', 'width=100, height=100');
   }

   function view_join_terms() {
      window.open('/GNG/footerFunction/ToS', 'join_terms', 'height=570,width=590,scrollbars=yes');
   }

   function bottom_privacy() {
      window.open('/GNG/footerFunction/privercy', 'privacy', 'height=570,width=590,scrollbars=yes');
   }
</script>
</head>
<body>
   <script>
      function getItems(mode, page_num) {
         $.getJSON("../store/ajax", {
            mode : "items_" + mode,
            stxt : "",
            page : 1,
            page_num : page_num,
            recodeTotal : 1,
            mainpage : 1
         }, function(data) {
            $(".catalog.ajax-list").append(data.body);
            $("div.lazy").lazyload({
               container : $("#page"),
               threshold : 400
            });
         });
      }
      /***************************/
      /* Slider Common Functions */
      /***************************/
      function slideWidth(element, slideLen, fullWidth) {
         var contentsWidth = element.width(), contentsLength = slideLen.length;
         slideLen.css('width', contentsWidth);
         fullWidth.css('width', contentsWidth * contentsLength);
      }
      function slideTab(selector, slideVar) {
         selector.each(function() {
            $(this).click(function() {
               slideVar.scrollToPage($(this).data('page'));
               return false;
            });
         });
      }
      function slideArrow(button, selector) {
         $('[name=' + button + ']').on('click', function() {
            selector.scrollToPage(this.hash.replace(/^#/, ''));
            return false;
         });
      }
      /****************************/
      /* Ajax Sample :: Billboard */
      /****************************/
      function getAjaxBillboardItems(targetEL, code, code2) {
         var targetWrap = $('#' + targetEL);
         var preLoadWrap = targetWrap.next();
         if (targetWrap.hasClass('ready')) {
            $.ajax({
               type : "GET",
               url : "/main/billboard_list",
               data : {
                  code : code
               },
               success : function(data) {
                  targetWrap.html(data).removeClass('ready');
               }
            });
         }
         if (preLoadWrap.hasClass('ready')) {
            $.ajax({
               type : "GET",
               url : "/main/billboard_list",
               data : {
                  code : code2
               },
               success : function(data) {
                  preLoadWrap.html(data).removeClass('ready');
               }
            });
         }
      }
      /************************************/
      /* Ajax Sample :: Ranking - Product */
      /************************************/
      function getAjaxRankingItems(targetEL, code) {
         var targetWrap = $('#' + targetEL);
         if (targetWrap.hasClass('ready')) {
            $.ajax({
               type : "GET",
               url : "/main/product_ranking_list2",
               data : {
                  codecd : code
               },
               success : function(data) {
                  targetWrap.html(data).removeClass('ready');
               }
            });
         }
      }
      /****************************/
      /* Slider Call :: Billboard */
      /****************************/
      $(function() {
         slideWidth($('.start-billboard'),
               $('.start-billboard .catalog-item'),
               $('.start-billboard .catalog'));
         var tabSelector = $('.start-billboard .slide-dots li');
         tabSelector.first().addClass('active');
      });
      $(function() {
         getItems('blookbook', 6);
         getItems('article', 6);
         //getItems('news', 2); getItems('article', 4); 
      });

      $(window).resize(
            function() {
               slideWidth($('.start-billboard'),
                     $('.start-billboard .catalog-item'),
                     $('.start-billboard .catalog'));
               //slideWidth($('.start-rankCatalog .section-body'), $('.start-rankCatalog .catalog'), $('.start-rankCatalog .catalog-wrap'));
            });
   </script>

   <script type="text/javascript">
      $(".store-locator-search .xx-control").keyup(function() {
         var _this = $(this);
         _this.siblings(".search-layer").addClass("active");
         if (_this.val() === "") {
            _this.siblings(".search-layer").removeClass("active");
         }
      });
   </script>

   <!-- 검색어 입력시 해당 검색어 출력 START -->
   <script type="text/javascript">
      $("#global-search")
            .keyup(
                  function() {
                     $
                           .getJSON(
                                 "../about/ajax",
                                 {
                                    mode : "store_locator",
                                    stxt : $(this).val()
                                 },
                                 function(data) {
                                    $("#search-result").empty();
                                    var r = [];
                                    $(data)
                                          .each(
                                                function(k, v) {
                                                   r
                                                         .push("<li><a href='/about/store_locator_view?vid="
                                                               + v.storeLocate_sn
                                                               + "'>"
                                                               + v.storeName
                                                               + "</a></li>");
                                                });
                                    $("#search-result").append(r)
                                          .addClass("active");
                                 });
                  });
   </script>
   <!-- 검색어 입력시 해당 검색어 출력 END -->

<style>
.popup-layer .pl-bottom {
   background: #333;
   color: #fff;
   padding: 3px 8px;
   text-align: right;
}

.popup-layer p {
   margin: -2px;
}

.mMODAl {
   display: none;
   position: fixed;
   top: 0;
   left: 0;
   right: 0;
   bottom: 0;
   width: 100%;
   height: 100%;
   -webkit-overflow-scrolling: touch;
   z-index: 1000;
   overflow-x: hidden;
   overflow-y: auto;
}

.mMODAl .MODAl-mask {
   position: fixed;
   left: 0;
   top: 0;
   right: 0;
   bottom: 0;
   width: 100%;
   height: 100%;
   background-color: #000;
   filter: alpha(opacity = 70);
   -ms-filter: alpha(opacity = 70);
   -moz-opacity: 0.7;
   -khtml-opacity: 0.7;
   opacity: 0.7;
}

.mMODAl .MODAl-content {
   position: relative;
   background-color: #fff;
   margin: 50px;
}

.mpopup-layer .pl-bottom {
   border: 1px solid #ccc;
   background: #fefefe;
   width: 80%;
   height: 40px;
   padding: 10px;
   color: #000;
   text-align: center;
   border-bottom-left-radius: 10px;
   border-bottom-right-radius: 10px;
}

.mpopup-layer .pl-bottom .pl-close-day {
   border-right: 1px solid #ccc;
}

.popup-outer img {
   width: 80%;
   border-top-left-radius: 10px;
   border-top-right-radius: 10px;
}

@media ( min-width : 320px) {
   .mMODAl .MODAl-content {
      width: 700px;
      margin: 50px 15px;
   }
}

@media ( min-width : 360px) {
   .mMODAl .MODAl-content {
      width: 700px;
      margin: 100px 35px;
   }
}

@media ( min-width : 375px) {
   .mMODAl .MODAl-content {
      width: 700px;
      margin: 110px 40px;
   }
}

@media ( min-width : 412px) {
   .mMODAl .MODAl-content {
      width: 700px;
      margin: 170px 70px;
   }
}

@media ( min-width : 414px) {
   .mMODAl .MODAl-content {
      width: 700px;
      margin: 170px 70px;
   }
}

@media ( min-width : 600px) {
   .mMODAl .MODAl-content {
      width: 700px;
      margin: 220px 150px;
   }
   .mpopup-layer .pl-bottom {
      width: 300px;
   }
   .popup-outer img {
      width: 300px;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
   }
}

@media ( min-width : 768px) {
   .mMODAl .MODAl-content {
      width: 1200px;
      margin: 280px 250px;
   }
   .mpopup-layer .pl-bottom {
      width: 300px;
   }
   .popup-outer img {
      width: 300px;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
   }
}
</style>

<script>
   $(function() {
      popupLayer();
   });
</script>

<script>
   
</script>

   <div id="ftWrap">
      <div id="footer">
         <div class="section cboth">
            <ul>
               <li><a href="/GNG/faq/faqList">고객센터</a></li>
               <li><a href="/GNG/main/#">정품인증</a></li>
               <li><a href="/GNG/footerFunction/info">이용안내</a></li>
               <li><a href="javascript:view_join_terms();">이용약관</a></li>
               <li><a href="javascript:bottom_privacy();" class="black">개인정보처리방침</a></li>
            </ul>
         </div>
         <!-- //section -->

         <div class="section1 cboth">
            <div class="ft_info01 fleft">
               <div class="ft_logo">
                  <a href="/GNG/main">
                     <img src="/GNG/theme/pshp/img_MODA/logo.png">
                  </a>
               </div>
               <div class="ft_copy">
                  COMPANY : (주)GNG / OWNER : 걸스 앤 걸스<br> CALL CENTER : GNG
                  (1588-6666) / FAX : 070-1234-5678<br> ADDRESS : 서울특별시 종로구 미려빌딩6층 이젠아카테미<br> 개인정보관리책임자 : 아시겠조(<a href="javascript:top_sendmail();">khiclass@gmail.com</a>)<br>
                  사업자등록번호 : 123-45-6789 <a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank"><b>[사업자정보확인]</b></a><br> 
                  통신판매업 신고번호 : 2021-서울종로-0777호
               </div>
            </div>
            <div class="ft_info02 fleft">
               <div class="area01">
                  <!-- 하단 고객센터 정보 수정 -->
                  <div class="ft_title">CS CENTER</div>
                  <div class="ft_num">1588-6666</div>
                  <div class="ft_copy">
                     MON - FRI 10:00 - 17:00<br> SAT.SUN.HOLIDAY OFF<br>
                     LUNCH PM 13:00 - 14:00<br>
                  </div>
               </div>
               <!-- 하단 반품주소 정보 수정 -->
               <div class="ft_title02">RETURN / EXCHANGE</div>
               <div class="ft_copy2">서울특별시 종로구 미려빌딩6층 이젠아카테미</div>
            </div>
            <div class="ft_info02 fleft mrl48">
               <div class="area01">
                  <!-- 하단 은행 정보 수정 -->
                  <div class="ft_title">BANK ACCOUNT</div>
                  <div class="ft_copy">
                     국민 123456-78-901234<br> 
                     농협 301-0060-0962-41<br> 
                     우리 1005-601-703012<br> 
                     신한 140-010-830632<br> 
                     예금주 : (주)GNG
                  </div>
                  <div class="cboth bt_bank">
                     <div class="bt_bank_list">인터넷 뱅킹 바로가기</div>
                     <div class="bt_bank_btn">
                        <img src="/GNG/theme/pshp/img_MODA/banking_icon.gif">
                     </div>
                     <div id="banking_menu">
                        <ul>
                           <!--은행 정보수정-->
                           <li><a href="https://www.kbstar.com/" target="_blank">- 국민은행</a></li>
                           <li><a href="https://www.ibk.co.kr/" target="_blank">- 기업은행</a></li>
                           <li><a href="https://www.shinhan.com/" target="_blank">- 신한은행</a></li>
                           <li><a href="https://www.wooribank.com/" target="_blank">- 우리은행</a></li>
                           <li><a href="https://www.kebhana.com/" target="_blank">- 하나은행</a></li>
                           <li><a href="http://www.standardchartered.co.kr/" target="_blank">- 스탠다드차타드은행</a></li>
                           <li><a href="https://banking.nonghyup.com/" target="_blank">- 농협</a></li>
                           <li><a href="https://www.epostbank.go.kr/" target="_blank">- 우체국</a></li>
                        </ul>
                     </div>
                  </div>
                  <!-- //bt_bank -->
               </div>
               <div class="ft_title02">FOLLOW US</div>
               <div class="ft_copy2">
                  <div class="ft_sns">
                     <!-- 하단 인스타그램 링크 수정 -->
                     <a href="https://www.facebook.com/profile.php?id=100004961892959" target="_blank">
                        <img src="/GNG/theme/pshp/img_MODA/ft_sns02.gif">
                     </a> 
                     <a href="https://www.instagram.com/aboki_korea/" target="_blank">
                        <img src="/GNG/theme/pshp/img_MODA/ft_sns01.gif">
                     </a> 
                     <a href="https://pf.kakao.com/_UxbpJu" target="_blank">
                        <img src="/GNG/theme/pshp/img_MODA/ft_sns03.gif">
                     </a> 
                     <a href="http://www.arooki.net/" target="_blank">
                        <img src="/GNG/theme/pshp/img_MODA/ft_sns04.gif">
                     </a>
                  </div>
                  <!-- //ft_sns -->
               </div>
               <!-- //ft_copy2 -->
            </div>
            <div class="ft_info02 fleft mrl48">
               <div class="ft_title">CS CENTER</div>
               <div class="ft_comm">
                  <ul>
                     <!-- 하단 커뮤니티 링크 수정 -->
                     <li><a href="/GNG/faq/faqList">고객센터</a></li>
                     <li><a href="/GNG/mypage#orderlist" target="_blank">주문조회</a></li>
                     <li><a href="https://www.cjlogistics.com/ko/main" target="_blank">CJ반품접수</a></li>
                  </ul>
               </div>
            </div>
            <!-- //ft_info02 -->
         </div>
         <!-- //section1 -->
         <div class="section2 cboth">
            <div class="inner">Copyright by GNG. All rights reserved.</div>
         </div>
         <!-- //section2 -->
      </div>
      <!-- //footer -->
   </div>
   <!-- #ftWrap-->
   <div class="page-mask"></div>
   
   <!--  
   <!--contents//end (여기 닫아주세여--)
   <div id="MODAl" class="MODAl">
      <div class="MODAl-mask"></div>
      <div class="MODAl-content">
         <div class="MODAl-head">
            <h4>-</h4>
            <button class="button">
               <span class="icon icon-dismiss-white"></span> 
               <span class="sr-only">이 창 닫기</span>
            </button>
         </div>
         <div class="MODAl-body"></div>
         <div class="MODAl-foot"></div>
      </div>
   </div>

   <div id="MODAl-inner" class="MODAl">
      <div class="MODAl-mask"></div>
      <div class="MODAl-content">
         <div class="MODAl-head">
            <h4>-</h4>
            <button class="button">
               <span class="icon icon-dismiss-white"></span> 
               <span class="sr-only">이 창 닫기</span>
            </button>
         </div>
      <div class="MODAl-body"></div>
      <div class="MODAl-foot"></div>
      </div>
   </div>-->

   <div id="ajaxLoader" class="ajax-loading">
      <div class="ajaxLoader-mask"></div>
      <span class="ajaxLoader-spinner">
         <img src="/GNG/theme/pshp/img/ajax-loader.gif" width="30" height="30">
      </span>
   </div>
   <script src="/GNG/dist/bootstrap/js/bootstrap.min.js"></script>
   <script src="/GNG/dist/jquery/plugin/jquery.placeholder.js"></script>
   <script src="/GNG/dist/js/common.js"></script>
   <script src="/GNG/dist/js/event.js"></script>
   <script src="/GNG/theme/pshp/js/event.js"></script>
   <script src="/GNG/theme/pshp/js/plugins.min.js"></script>
   <script src="/GNG/theme/pshp/js/main.min.js"></script>
   <script src="/GNG/theme/pshp/js/vendor/fastclick.min.js"></script>
   <script>
      window.addEventListener('load', function() {
         FastClick.attach(document.body);
      }, false);
   </script>

   <script>
      $('.owl').owl({
         autoplay : true,
         autoplayTimeout : 3000,
         autoplayHoverPause : true
      });
   </script>


   <iframe name="process" style="display: none; width: 100%; height: 100px"></iframe>

   <!-- 구글 관련 스크립틑 들은 모바일과 PC가 나눠진것이 없다 모두(공통스크립트, 전환스크립트) 모바일 PC 에서 모두공용으로 사용함 -->
   <!-- 구글GA start -->
   <!-- Google analyticstracking 코드 start -->
   <script>
      (function(i, s, o, g, r, a, m) {
         i['GoogleAnalyticsObject'] = r;
         i[r] = i[r] || function() {
            (i[r].q = i[r].q || []).push(arguments)
         }, i[r].l = 1 * new Date();
         a = s.createElement(o), m = s.getElementsByTagName(o)[0];
         a.async = 1;
         a.src = g;
         m.parentNode.insertBefore(a, m)
      })(window, document, 'script',
            '//www.google-analytics.com/analytics.js', 'ga');

      ga('create', 'UA-38120605-1', 'pancoatshop.com');
      ga('send', 'pageview');
   </script>
   <!-- Google analyticstracking 코드 end -->
   <!-- 구글GA end -->

   <!-- 구매완료 전환 스크립트 START -->
   <!-- 구매완료 전환 스크립트 END -->


   <!-- PC페이지인 경우 -->
   <!-- 공통스크립트 START -->

   <!--네이버 PC 공통 스크립트 START-->
   <!--네이버 전환 값은 모바일 PC 공통으로 위에서 설정함 -->
   <!-- 공통 적용 스크립트 , 모든 페이지에 노출되도록 설치. 단 전환페이지 설정값보다 항상 하단에 위치해야함 -->
   <script type="text/javascript" src="http://wcs.naver.net/wcslog.js">
      
   </script>
   <script type="text/javascript">
      if (!wcs_add)
         var wcs_add = {};
      //wcs_add["wa"] = "s_2652f57f9fec";
      wcs_add["wa"] = "s_52e5f4cb584b";
      if (!_nasa)
         var _nasa = {};
      wcs.inflow();
      wcs_do(_nasa);
   </script>
   <!--네이버 PC 공통 스크립트 END-->

   <!-- 팬콧로거 공통스크립트 START -->
   <!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 38137 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
   <script type="text/javascript">
      var _TRK_LID = "38137";
      var _L_TD = "ssl.logger.co.kr";
      var _TRK_CDMN = ".pancoat.com";
   </script>
   <script type="text/javascript">
      var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net"
            : "http://fs.bizspring.net";
      (function(b, s) {
         var f = b.getElementsByTagName(s)[0], j = b.createElement(s);
         j.async = true;
         j.src = '//fs.bizspring.net/fs4/bstrk.1.js';
         f.parentNode.insertBefore(j, f);
      })(document, 'script');
   </script>
   <noscript>
      <img alt="Logger Script" width="1" height="1"
         src="http://ssl.logger.co.kr/tracker.tsp?u=38137&amp;js=N" />
   </noscript>
   <!-- END OF LOGGER TRACKING SCRIPT -->
   <!-- 팬콧로거 공통스크립트 END -->


   <!--애드인사이트 공통 스크립트 START-->
   <!-- adinsight 공통스크립트 start -->
   <script type="text/javascript">
      var TRS_AIDX = 5876;
      var TRS_PROTOCOL = document.location.protocol;
      document.writeln();
      var TRS_URL = TRS_PROTOCOL
            + '//'
            + ((TRS_PROTOCOL == 'https:') ? 'analysis.adinsight.co.kr'
                  : 'adlog.adinsight.co.kr') + '/emnet/trs_esc.js';
      document
            .writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
   </script>
   <!-- adinsight 공통스크립트 end -->
   <!--애드인사이트 공통 스크립트 END-->

   <!-- DDN 리마케팅코드 START -->
   <script type="text/javascript">
      var roosevelt_params = {
         retargeting_id : 'OugTocd2Pl-lpT_8YyUwmQ00',
         tag_label : 'wGoqX1dFR7CMUf54L7-utg'
      };
   </script>
   <script type="text/javascript"
      src="//adimg.daumcdn.net/rt/roosevelt.js" async></script>
   <!-- DDN 리마케팅코드 END -->
   <!-- 공통스크립트 END -->
</body>
</html>