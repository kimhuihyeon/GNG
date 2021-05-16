<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width" />
<!-- facebook -->
<meta property="og:url" content="" />
<meta property="og:title" content="PANCOAT" />
<meta property="og:description" content="" />
<meta property="og:image" content="" />
<meta property="og:type" content="website" />
<meta property="og:site_name" content="PANCOAT" />
<meta property="og:locale" content="ko_KR" />
<!-- facebook -->
<title>GNG</title>
<!--<link rel="shortcut icon" type="image⁄x-icon" href="/GNG/theme/pshp/img_MODA/top_logo.png">-->
<link rel="shortcut icon" type="image⁄x-icon" href="/GNG/theme/pshp/img_MODA/logo.png">

<link rel="stylesheet" href="/GNG/theme/pshp/css/vendor/jquery-ui.css">
<link rel="stylesheet" href="/GNG/theme/pshp/css/vendor/bootstrap.css">

<link rel="stylesheet" href="/GNG/theme/pshp/css/fonts.css">
<link rel="shortcut icon" href="/favicon.ico">
<script src="/GNG/theme/pshp/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
<script src="/GNG/theme/pshp/js/vendor/selector.min.js"></script>
<script src="/GNG/theme/pshp/js/vendor/webfont.min.js"></script>
<script src="/GNG/dist/jquery/jquery-1.11.0.min.js"></script>
<script src="/GNG/dist/jquery/jquery-ui.js"></script>
<script src="/GNG/dist/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="/GNG/dist/jquery/plugin/jquery.cookie.js"></script>
<script src="/GNG/dist/js/taxonomy.js"></script>


<script>
	$(function() {
		taxonomy('tid[]', "");
		$("select[name='tid[]']").live( "change",
			function() {
					location.href = "/store/category?no="
					+ $(this).val();
				});

		$("#on_click").click(function() {
			$("#on_div").toggle();
		});

		$("#off_click").click(function() {
			$("#off_div").toggle();
		});

		$("#on_div, #off_div").mouseleave(function() {
			$(this).hide();
		});
	});
	
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

<!-- font-awesome(icon) -->
<link href="/GNG/dist/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- owl -->
<link rel="stylesheet" href="/GNG/dist/owl/owl.carousel.css">
<link rel="stylesheet" href="/GNG/dist/owl/owl.theme.default.min.css">
<script src="/GNG/dist/owl/owl.carousel.min.js"></script>
<script src="/GNG/dist/owl/owl.js"></script>

<link rel="stylesheet" href="/GNG/theme/pshp/css/main.min.css">
<link rel="stylesheet" href="/GNG/theme/pshp/css/ui.css">
<style>
.main-owl {
	margin-bottom: 10px;
}

@media ( max-width :1023px) {
	.main-owl {
		margin-top: 0px;
	}
}
</style>
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
				<a href="#hdWrap" class="scroll">
					<img src="/GNG/theme/pshp/img_MODA/r_quick07_off.gif">
				</a>
			</div>
		</div><!-- //sm_right_bn -->
	</div><!-- //fixed_quick -->
	
	<div id="hdWrap">
		<div class="top_space"></div>
		<div id="comment_top">
			<div id="header">
	   			<div class="top_logo"><a href="/GNG/main"><img src="/GNG/theme/pshp/img_MODA/logo.png"></a></div>
	   			<div class="section1">
					<ul id="left_menu" style="background-color: f0758b; color:f0758b;">
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
	      			<div class="top_login_area" style="background-color: f0758b">
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
			                <li><a href="/GNG/mypage#orderlist">MYPAGE</a></li>
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
		                  		<a href="javascript:search_submit();">
			                  		<input type="image" class="search_btn" src="/GNG/theme/pshp/img_MODA/icon_search.png" alt="검색">
			                  	</a>
		                  		<input name="isSearch" onkeydown="CheckKey_search();" value="" class="MS_search_word">
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
					                    <a href="/GNG/goods/goodsSizeSearch?searchSize=XL">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon14.png" class="menuoff">
						                    <img src="/GNG/theme/pshp/img_MODA/color_icon14_on.png" class="menuon">
					                    </a>
				                    </li>
				                    <li>
					                    <a href="/GNG/goods/goodsSizeSearch?searchSize=XXL">
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
</body>
</html>
