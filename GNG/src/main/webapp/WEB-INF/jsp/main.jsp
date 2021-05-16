<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>WELCOME TO GNG</title>
<link rel="shortcut icon" type="image⁄x-icon" href="/GNG/theme/pshp/img_MODA/logo.png">

<script src="//code.jquery.com/jquery-3.3.1.js"></script>


<link rel="stylesheet" href="/GNG/theme/pshp/css/main.min.css">
<link rel="stylesheet" href="/GNG/theme/aboki/common.css">
<link rel="stylesheet" href="/GNG/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/header.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/main.css">
<link rel="stylesheet" href="/GNG/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/okdgg_layer.css">
<script type="text/javascript" src="/GNG/theme/aboki/footer.1.js"></script>
<script src="/GNG/theme/pshp/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="/GNG/theme/pshp/js/vendor/selector.min.js"></script>
<script src="/GNG/theme/pshp/js/vendor/webfont.min.js"></script>
<script src="/GNG/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/GNG/dist/jquery/jquery-ui.js"></script>
<script src="/GNG/dist/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="/GNG/dist/jquery/plugin/jquery.cookie.js"></script>
<script src="/GNG/dist/js/taxonomy.js"></script>
<script src="/GNG/dist/owl/owl.carousel.min.js"></script>
<script src="/GNG/dist/owl/owl.js"></script>
	
<script type="text/javascript">
function top_sendmail() {
    window.open('/GNG/footerFunction/email', 'email', 'width=100, height=100');
}

function view_join_terms() {
    window.open('/GNG/footerFunction/ToS','join_terms','height=570,width=590,scrollbars=yes');
}

function bottom_privacy() {
    window.open('/GNG/footerFunction/privercy', 'privacy', 'height=570,width=590,scrollbars=yes');
}

</script>
<script>
$( document ).ready( function() {
    var jbOffset = $( '#comment_top' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '#comment_top' ).addClass( 'fixed' );
      }
      else {
        $( '#commend_top' ).removeClass( 'fixed' );
      }
    });
  } );
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

</head>
<body>
	<div class="fixed_quick">
		<div class="sm_right_bn"><!-- 퀵메뉴 아이콘 -->
			<div class="cboth sm_btn" style="border-top:1px solid #dbdbdb;">
				<a href="javascript:CreateBookmarkLink(&#39;/GNG/main&#39;, &#39;GNG&#39;);">
					<img src="/GNG/theme/pshp/img_MODA/quick_fav.gif">
				</a>
				<div class="sm_btn_text">즐겨찾기</div>
			</div>
			<div class="cboth sm_btn">
				<a href="https://www.doortodoor.co.kr/" target="_blank&quot;">
					<img src="/GNG/theme/pshp/img_MODA/r_quick03_on.gif">
				</a>
				<div class="sm_btn_text">배송조회</div>
			</div>
			<div class="cboth sm_btn">
				<a href="/GNG/cartList">
					<img src="/GNG/theme/pshp/img_MODA/r_quick04_on.gif">
				</a>
				<div class="sm_btn_text">장바구니</div>
			</div>
			<div class="cboth sm_btn">
				<a href="/GNG/todayGoods">
					<img src="/GNG/theme/pshp/img_MODA/r_quick05_on.gif">
				</a>
				<div class="sm_btn_text">오늘 본 상품</div>
			</div>
			<div class="cboth sm_btn">
				<a href="/GNG/mypage#review">
					<img src="/GNG/theme/pshp/img_MODA/r_quick06_on.gif">
				</a>
				<div class="sm_btn_text">상품 리뷰</div>
			</div>
			<div class="cboth">
				<a href="#cherrypicker_scroll" class="scroll">
					<img src="/GNG/theme/pshp/img_MODA/r_quick07_off.gif">
				</a>
			</div>
		</div><!-- //sm_right_bn -->
	</div><!-- //fixed_quick -->

	
	<div id="cherrypicker_scroll"></div>
		<div class="cycle-slideshow" cycle-slideshow data-cycle-loader="wait" data-cycle-timeout=5000>
			<!-- 광고 -->
    		<c:forEach var="adList" items="${adList}" varStatus="stat">
    			<img src="/GNG/file/adFile/${adList.AD_IMAGE}" style="max-width: 100%; width: 1903px; height: auto;">
    		</c:forEach>
		</div>

	
	<div id="hdWrap">
		<div class="top_space"></div>
		<div id="comment_top">
			<div id="header"> 
	   			<div class="top_logo"><a href="/GNG/main"><img src="/GNG/theme/pshp/img_MODA/logo.png"></a></div>
	   			<div class="section1">
					<ul id="left_menu">
	         		<!-- 카테고리 자동출력 -->
	         			<li><a href="/GNG/goods/goodsCategory?CATEGORY=OUTER">OUTER</a></li>
	         			<li><a href="/GNG/goods/goodsCategory?CATEGORY=TOP" style="">TOP</a></li>
	                    <li><a href="/GNG/goods/goodsCategory?CATEGORY=PANTS">PANTS</a></li>
						<li><a href="/GNG/goods/goodsCategory?CATEGORY=SHOES">SHOES</a></li>
	                  	<li><a href="/GNG/goods/goodsCategory?CATEGORY=ACC">ACCESSORY</a></li>
	                 </ul><!-- //sub1 -->
	   			</div><!-- //section1 -->
	   			
	   			<div class="btn_ham">
	      			<img src="/GNG/theme/pshp/img_MODA/btn_ham.png">
	      			<div class="top_login_area">
			        <c:choose>
                    <c:when test="${sessionScope.MEMBER_ADMIN == 0}">
                       <div class="top_btn_login01">
                          <a href="/GNG/logout">LOGOUT</a>
                       </div>
                    </c:when>
                    <c:when test="${sessionScope.MEMBER_ADMIN == 1}">
                       <div class="top_btn_login01">
                          <a href="/GNG/admin/adminPage">ADMIN-PAGE</a>
                          <a href="/GNG/logout">LOGOUT</a>
                       </div>
                    </c:when>
                    <c:otherwise>
                       <div class="top_btn_login01"><a href="/GNG/loginForm">LOGIN</a></div>
                       <div class="top_btn_login01"><a href="/GNG/joinStep1">JOIN + 3000P</a></div>
                       <div style="text-align:center; color:#fff; margin-top:20px; font-size:11px; "><a style ="color:#fff;" href="/GNG/login/findForm" target="GNGl" data-size="sm" data-label="아이디/비밀번호 찾기">아이디 찾기 / 비밀번호 찾기</a></div>
                    </c:otherwise>
                 </c:choose>
			        
			        <div class="top_comm">
	        			<ul class="fleft">
			            	<li><a href="/GNG/cartList">CART</a></li>
			                <li><a href="/GNG/mypage">MYPAGE</a></li>
			                <li><a href="/GNG/mypage#orderlist">ORDER</a></li>
			            </ul>
			            <ul class="fright"><!-- 상단 커뮤니티 링크 수정 -->
			            	<li><a href="/GNG/notify/notifyList">NOTICE</a></li>
			               	<li><a href="/GNG/mypage#qna">Q&A</a></li>
			               	<li><a href="/GNG/faq/faqList">FAQ</a></li>
			            </ul>
	         		</div><!-- //top_comm -->
	         		
					<div class="cboth search_form">
	            		<div class="search">
	            			<form action="/GNG/Search" method="post" name="search">
		            			<fieldset>
		                		<legend>검색 폼</legend>
			                  	<input type="image" class="search_btn" src="/GNG/theme/pshp/img_MODA/icon_search.png" alt="검색"/>
		                  		<input name="isSearch" type="text" value="" class="MS_search_word"/>
		                		</fieldset>
		            		</form>            
	           			</div>
	         		</div><!-- //search_form -->
	         		<div class="cboth color_box">
	            		<ul class="color_b_ul">
	               			<li class="left_area_li"><span class="tit_color">QUICK FILTER</span></li>
	               			<!-- 컬러 아이콘 링크 수정 -->
	               			<li class="right_area_li">
	                  			<ul class="color_s_ul1">
			                    	<li>
				                    	<a href="/GNG/goods/goodsColorSearch?searchColor=white">
					                    	<img src="/GNG/theme/pshp/img_MODA/color_icon1.png" class="menuoff">
					                    	<img src="/GNG/theme/pshp/img_MODA/color_icon1_on.png" class="menuon">
				                    	</a>
			                    	</li>
			                     	<li>
				                     	<a href="/GNG/goods/goodsColorSearch?searchColor=black">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon2.png" class="menuoff">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon2_on.png" class="menuon">
				                     	</a>
			                     	</li>
			                     	<li>
				                     	<a href="/GNG/goods/goodsColorSearch?searchColor=gray">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon3.png" class="menuoff">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon3_on.png" class="menuon">
				                     	</a>
			                     	</li>
			                     	<li>
				                     	<a href="/GNG/goods/goodsColorSearch?searchColor=beige">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon4.png" class="menuoff">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon4_on.png" class="menuon">
				                     	</a>
			                     	</li>
			                     	<li>
				                     	<a href="/GNG/goods/goodsColorSearch?searchColor=brown">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon5.png" class="menuoff">
					                     	<img src="/GNG/theme/pshp/img_MODA/color_icon5_on.png" class="menuon">
				                     	</a>
			                     	</li>
			                  	</ul>
	                  			<ul class="color_s_ul">
				                	<li>
					                	<a href="/GNG/goods/goodsColorSearch?searchColor=green">
						                	<img src="/GNG/theme/pshp/img_MODA/color_icon6.png" class="menuoff">
						                	<img src="/GNG/theme/pshp/img_MODA/color_icon6_on.png" class="menuon">
					                	</a>
				                	</li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=blue">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon7.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon7_on.png" class="menuon">
					                    </a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=red">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon8.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon8_on.png" class="menuon">
						            	</a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=yellow">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon9.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon9_on.png" class="menuon">
					                    </a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=pink">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon10.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon10_on.png" class="menuon">
					                    </a>
				                    </li>
				                </ul>
	                  			<ul class="color_s_ul">
	                     			<li>
		                     			<a href="/GNG/goods/goodsColorSearch?searchColor=purple">
			                     			<img src="/GNG/theme/pshp/img_MODA/color_icon11.png" class="menuoff">
			                     			<img src="/GNG/theme/pshp/img_MODA/color_icon11_on.png" class="menuon">
		                     			</a>
	                     			</li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=stripe">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon12.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon12_on.png" class="menuon">
					                    </a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=check">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon13.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon13_on.png" class="menuon">
					                    </a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=XL">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon14.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon14_on.png" class="menuon">
					                    </a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsColorSearch?searchColor=XXL">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon15.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon15_on.png" class="menuon">
					                    </a>
				                    </li>
	                  			</ul>
	               			</li>
	            		</ul>
	         		</div>
	      		</div>
			</div><!-- //btn_ham -->
	   		<div class="top_cart"><a href="/GNG/cartList">BAG<span id="user_basket_quantity" class="user_basket_quantity"></span></a></div>
		</div><!-- #header -->
	</div><!-- //comment_top -->
	</div><!-- #hdWrap-->
	
	<!-- 메인 하단상품 1_2  -->
	<div class="main_section01 cboth">
		<ul>
			<div class="section01_ban01"> <!-- section01_ban01 -->
            	<li class="">
            		<div class="bg01_back">
            			<img src="/GNG/theme/pshp/img_MODA/p1.jpg">
            				<div class="ban_cross"><img src="/GNG/theme/pshp/img_MODA/ban_cross.png"></div>
            		</div>
            	</li>
            	<li class="txt01">
	            	<div class="txt01_01 cboth">summer in Busan-T</div>
	               	<div class="txt01_02 cboth">COLOR 10Type / free / 9,900</div>
	               	<div class="txt01_03 cboth">여름을 담은 감성 가득,10가지의 다양한 매력!</div>
	               	<div class="txt01_04 cboth"><a href="/GNG/goods/goodsCategory?CATEGORY=TOP&SUBCATEGORY=반팔티">SHOP NOW</a></div>
            	</li>
			</div>
         	<div class="section01_ban02">
            	<li class=""><!-- bg01 -->
            		<div class="bg01_back">
            			<img src="/GNG/theme/pshp/img_MODA/p3.jpg">
            			<div class="ban_cross" style=""><img src="/GNG/theme/pshp/img_MODA/ban_cross.png"></div>
            		</div>
            	</li>
				<li class="txt02">
	               	<div class="txt02_01 cboth">summer Banding-skirt</div>
	               	<div class="txt02_02 cboth">2color / 3size / 9,900</div>
	               	<div class="txt02_03 cboth">말도안되는 가성비 , 올여름을 책임질 데일리 쁘띠 스커트♥</div>
	               	<div class="txt02_04 cboth"><a href="/GNG/goods/goodsCategory?CATEGORY=PANTS&SUBCATEGORY=반바지">SHOP NOW</a></div>
				</li>
			</div>
		</ul>
	</div><!-- //main_section01 -->
   
	<div class="cboth main_section02">
		<div class="fleft">
			<div class="sliderkit contentslider-look" style="display: block;">
				<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-prev"><a href="#"></a></div>
            	<div class="sliderkit-btn sliderkit-go-btn sliderkit-go-next"><a href="#"></a></div>
            	<div class="sliderkit-panels">
               <!-- 메인하단 기획전 롤링배너 1_5 -->
                <div class="sliderkit-panels-wrapper" style="position: relative; left: -620px;">
                	<div class="sliderkit-panel" style="display: none; left: 0px;">
                		<a href="#"><img src="/GNG/theme/pshp/img_MODA/180704_top_collection_01.jpg"></a>
                	</div>
                	<div class="sliderkit-panel" style="display: none; left: 0px;">
                		<a href="#"><img src="/GNG/theme/pshp/img_MODA/180604_top_collection_02.jpg"></a>
                	</div>
                	<div class="sliderkit-panel" style="display: none; left: 0px;">
                		<a href="#"><img src="/GNG/theme/pshp/img_MODA/180604_top_collection_01.jpg"></a>
                	</div>
                	<div class="sliderkit-panel sliderkit-panel-old" style="display: block; left: 0px;">
                		<a href="#"><img src="/GNG/theme/pshp/img_MODA/180604_top_collection_03.jpg"></a>
                	</div>
                	<div class="sliderkit-panel sliderkit-panel-active" style="display: block; left: 620px;">
                		<a href="#"><img src="/GNG/theme/pshp/img_MODA/p4.png"></a>
                	</div>
                </div><!--아보키온니 여름상품-->
			</div>
		</div>
	</div>
	<div class="fright">
		<div class="ban_right01">
			<img src="/GNG/theme/pshp/img_MODA/p5.jpg">
			<figcaption>
				<div>
					<!-- 메인하단 가로 배너 텍스트 -->
					<h3>LUCKY & LUCKY</h3>
	               	<h3>여름을 맞이한 우리 GNG의 특별한 이벤트! 행운이 여러분을 기다립니다.</h3>
				</div>
            </figcaption>
            <!-- 메인하단 가로 배너 링크 -->
			<a href="/GNG/goods/goodsCategory?CATEGORY=PANTS&SUBCATEGORY=청바지"></a>
        </div><!-- //ban_right01 -->
        
        <!-- 인스타그램 출력 영역 -->
		<div class="ban_right02 cboth">
			<div class="insta_title">
				<img src="/GNG/theme/pshp/img_MODA/insta_title.gif">
				<span><a href="https://www.instagram.com/explore/tags/소녀나라/">https://www.instagram.com/explore/tags/소녀나라/</a></span><!-- 인스타그램 타이틀 링크수정 -->
            </div><!-- //insta_title -->

            <div id="instafeed">
            	<a href="https://www.instagram.com/p/BkzcrvchtpA/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i1.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/BkzcevEBsBc/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i2.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/BkUSyijhMG8/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i3.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/BkUSa0RBSbd/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i4.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/Bj6MfFpBK1b/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i5.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/Bj6MOJhhz6s/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i6.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/Bj6MFPTBYVx/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i7.jpg">
            	</a>
            	<a href="https://www.instagram.com/p/Bj6L8TihDwD/" target="_blank">
            		<img src="/GNG/theme/pshp/so/i8.jpg">
            	</a>
			</div>
		</div><!-- //ban_right02 -->
	</div>
   </div><!-- //main_section02 -->
	<!-- start-promotion//end -->

	<!-- 특별상품 리스트 -->
   <div class="cboth main_section03">
      <div class="cboth main_title">BEST PRODUCTS</div>
      <div class="cboth prd-list">
         <table summary="상품이미지, 상품 설명, 가격">
         <caption>특별상품 리스트</caption>
         <colgroup>
            <col width="25%">
            <col width="25%">
            <col width="25%">
            <col width="25%">
         </colgroup>
         
         <tbody>
         <tr class="nopadding"><td></td><td></td><td></td><td></td></tr>
         
                
        <tr>
        </tr>
	</tbody>
	</table>
	</div><!-- //prd-list -->
	</div><!-- //main_section03 -->
   
	<div class="cboth main_section06">
		<div class="cboth main_title">NEW ARRIVALS</div>
		<div class="cboth prd-list">
			<table summary="상품이미지, 상품 설명, 가격">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tbody>
					<tr class="nopadding"><td></td><td></td><td></td><td></td></tr>            
				
					<tr>
					</tr>
				</tbody>
			</table>
		</div><!-- //prd-list -->
	</div><!-- //main_section06 -->
	<!---하단 기획전배너 section07 --->
	<!-- #contentWrapper-->
	
	<!-- footer -->
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
			</div><!-- //section -->

			<div class="section1 cboth">
				<div class="ft_info01 fleft">
					<div class="ft_logo">
						<a href="/GNG/main">
							<img src="/GNG/theme/pshp/img_MODA/logo.png">
						</a>
					</div>
					<div class="ft_copy">
						COMPANY : (주)GNG / OWNER : 걸스 앤 걸스<br>
						CALL CENTER : GNG (1588-6666) / FAX : 070-1234-5678<br>
						ADDRESS : 서울특별시 종로구 미려빌딩6층 이젠아카테미<br>
						개인정보관리책임자 : 김희현(<a href="javascript:top_sendmail();">hee971003@gmail.com</a>)<br>
						사업자등록번호 : 123-45-6789 <a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank"><b>[사업자정보확인]</b></a><br>
						통신판매업 신고번호  : 2021-서울종각-0777호			
					</div>
				</div>
				<div class="ft_info02 fleft">
					<div class="area01">
						<!-- 하단 고객센터 정보 수정 -->	
						<div class="ft_title">CS CENTER</div>
						<div class="ft_num">1588-6666</div>
						<div class="ft_copy">
							MON - FRI 10:00 - 17:00<br>
							SAT.SUN.HOLIDAY OFF<br>
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
							국민123456-78-901234<br>
							농협 301-0060-0962-41<br>
							우리 1005-601-703012<br>
							신한 140-010-830632<br>
							예금주 : (주)GNG
						</div>
						<div class="cboth bt_bank">
							<div class="bt_bank_list">인터넷 뱅킹 바로가기</div>
							<div class="bt_bank_btn"><img src="/GNG/theme/pshp/img_MODA/banking_icon.gif"></div>
							<div id="banking_menu">
								<ul><!--은행 정보수정-->
									<li><a href="https://www.kbstar.com/" target="_blank">- 국민은행</a></li>
									<li><a href="https://www.ibk.co.kr/" target="_blank">- 기업은행</a></li>
									<li><a href="https://www.shinhan.com/" target="_blank">- 신한은행</a></li>
									<li><a href="https://www.wooribank.com/" target="_blank">- 우리은행</a></li>
									<li><a href="https://www.kebhana.com/" target="_blank">- 하나은행</a></li>
									<li><a href="http://www.standardchartered.co.kr/" target="_blank">-카카오뱅크</a></li>
									<li><a href="https://banking.nonghyup.com/" target="_blank">- 농협</a></li>
									<li><a href="https://www.epostbank.go.kr/" target="_blank">- 우체국</a></li>
								</ul>
							</div>
						</div><!-- //bt_bank -->
					</div>
					<div class="ft_title02">FOLLOW US</div>
					<div class="ft_copy2">
						<div class="ft_sns">
							<!-- 하단 인스타그램 링크 수정 -->
							<a href="https://www.facebook.com/profile.php?id=100004961892959" target="_blank"><img src="/GNG/theme/pshp/img_MODA/ft_sns02.gif"></a>
							<a href="https://www.instagram.com/aboki_korea/" target="_blank"><img src="/GNG/theme/pshp/img_MODA/ft_sns01.gif"></a>
							<a href="https://pf.kakao.com/_UxbpJu" target="_blank"><img src="/GNG/theme/pshp/img_MODA/ft_sns03.gif"></a>
							<a href="http://www.arooki.net/" target="_blank"><img src="/GNG/theme/pshp/img_MODA/ft_sns04.gif"></a>
						</div><!-- //ft_sns -->
					</div><!-- //ft_copy2 -->
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
				</div><!-- //ft_info02 -->
			</div><!-- //section1 -->
			<div class="section2 cboth">
				<div class="inner">Copyright by GNG. All rights reserved.</div>
			</div><!-- //section2 -->
		</div><!-- //footer -->
	</div><!-- #ftWrap-->
</body>
</html>