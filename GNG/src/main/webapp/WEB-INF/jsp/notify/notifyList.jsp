<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
   content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width" />
<!-- facebook -->
<meta property="og:url" content="" />
<meta property="og:title" content="PANCOAT" />
<meta property="og:description" content="" />
<meta property="og:image" content="" />
<meta property="og:type" content="website" />
<meta property="og:site_name" content="PANCOAT" />
<meta property="og:locale" content="ko_KR" />
<!-- facebook -->
<title>GNG 공지사항</title>

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
.rankGender-wrap .tab-navs li {
   padding: 0;
   border-top: 1px solid gray;
   border-right: 1px solid gray;
   border-bottom: 2px solid #000;
}

.rankGender-wrap .tab-navs li:first-child {
   border-left: 1px solid gray;
}

.rankGender-wrap .tab-nav2 {
   float: left;
   /*width:10%;*/
   text-align: center;
}

.rankGender-wrap .tab-nav2 a {
   color: #ddd6cd;
   text-decoration: none;
}

.rankGender-wrap .tab-nav2 a, .rankAge-wrap .tab-nav2 a {
   display: block;
   font-weight: bold;
   color: #242424;
   line-height: 2.4615384615;
   font-size: 12px;
   padding: 0 10px;
   margin: 0;
   border: none;
   border-radius: 0;
   background: transparent;
   color: #808080;
}

.rankGender-wrap .tab-nav2.active a, .rankAge-wrap .tab-nav2.active a {
   background-color: #191919;
   color: #fff;
}

.rankGender-wrap .list-dropdown li .brief .title {
   display: block;
   font-weight: bold;
   font-size: 12px;
   margin-top: -2px;
   margin-left: 15px;
   line-height: 3em;
}

.tab-content .answer img {
   width: 100%;
}

.rankGender-wrap .list-dropdown li {
   overflow: inherit;
}

/**** 20160406 ****/
.detail {
   background: #fff !important;
   border-top: 1px dashed #ccc;
}

.tab-content2>div {
   display: none;
}

.tab-content2>div.active {
   display: block;
}

.section-body {
   background: #fff;
   margin-bottom: 10px;
}

.search-box {
   text-align: center;
   margin: 25px 0 50px;
}

.search-box input[type=text] {
   border: 3px solid #252c4f;
   height: 35px;
   width: 35%;
   box-sizing: border-box;
   padding: 5px;
   outline: none;
   vertical-align: middle;
}

.search-box input[type=text]:focus {
   border-color: #808080;
}

.search-box input[type=submit] {
   height: 35px;
   background: #252c4f;
   color: #fff;
   border: 0;
   padding: 0 15px;
   box-sizing: border-box;
   vertical-align: middle;
}

.tab-content-search {
   margin-bottom: 30px;
}

.tab-content-search ul {
   border-top: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
}

.tab-content-search ul li .brief {
   padding: 10px 20px;
}

.tab-content-search ul li .brief .title {
   font-weight: bold;
}

.list-dropdown li .detail .answer {
   border: 0;
   padding: 0 0 0 15px;
   line-height: 22px;
   margin: 0;
}

.list-dropdown li .detail .answer p .icon {
   top: 8px;
}

table {
   display: table;
   border-collapse: separate;
   border-spacing: 2px;
   border-color: grey;
}
</style>
</head>
<body>
   <div class="viewport">
      <div class="container">
         <div id="page" class="page">
            <!--<div align="left"><div style="width:;text-align:left;">-->
            <section class="page-category">
            <div class="selectboxWrap">
               <div class="selectbox">
                  <div class="selectbox-data">
                     <strong class="text">공지사항 </strong> 
                     <span class="icon icon-dropdown-white"></span>
                  </div>
                  <select name="category[]" id="cate02">
                     <option value="">공지사항</option>
                  </select>
               </div>
            </div>
            </section>
            <section class="page-title section">
            <h2>
               <strong>notice</strong>
            </h2>
            </section>
            <div class="my-account row">
               <section class="col-xs-24 account-navWrap"> 
               <nav class="account-nav">
               <ul>
                  <li class="col-xs-8 col-sm-8 selected">
                     <a href="/GNG/notify/notifyList">공지사항</a>
                  </li>
                  <li class="col-xs-8 col-sm-8 ">
                     <a href="/GNG/faq/faqList">FAQ</a>
                  </li>
                  <li class="col-xs-12 col-sm-8">
                  <button type="button" onclick="location.href='/GNG/login/findForm'" target="modal" data-size="md" data-label="아이디/비밀번호 찾기">
                     <a>
                     아이디/비밀번호 찾기</a></button>
                  </li>
               </ul>
               </nav> 
               </section>
            </div>
            <div class="recode">
               총 게시글 수 : <b>${totalCount}</b>
            </div>
            <table class="table table-list">
               <tbody>
                  <tr>
                     <th width="30" class="hidden-sm hidden-xs" style="text-align: center;"><b>번호</b></th>
                     <th width="300" class="hidden-sm hidden-xs" style="text-align: center;"><b>제목</b></th>
                     <th width="60" class="hidden-sm hidden-xs" style="text-align: center;"><b>작성자</b></th>
                     <th width="80" class="hidden-sm hidden-xs" style="text-align: center;"><b>등록일</b></th>
                     <th width="60" class="hidden-sm hidden-xs" style="text-align: center;"><b>조회수</b></th>
                  </tr>
                  <c:forEach items="${notifyList}" var="notifyList">
                     <c:url var="viewURL" value="notifyDetail">
                        <c:param name="NOTIFY_NUMBER" value="${notifyList.NOTIFY_NUMBER}" />
                        <c:param name="currentPage" value="${currentPage}" />
                     </c:url>
                     <tr>
                        <td style="text-align: center;">${notifyList.NOTIFY_NUMBER }</td>
                        <td style="text-align: left;"><a href="${viewURL}">${notifyList.NOTIFY_TITLE }</a>
                        </td>
                        <td style="text-align: center;">관리자</td>
                        <td style="text-align: center;">
                           <fmt:formatDate value="${notifyList.NOTIFY_REGDATE}" pattern="yyyy.MM.dd" />
                        </td>
                        <td style="text-align: center;">${notifyList.NOTIFY_HITCNT}</td>
                     </tr>
                  </c:forEach>
               </tbody>
            </table>
            <div class="row"></div>
            <div class="page-navigator-horizon"></div>
            <div style="text-align: center;">
               <div class="paging">${pagingHtml}</div>
               <div id="dataTables-example_filter" class="dataTables_filter">
                  <form action="">
                     <select class="slcte" name="searchNum" id="searchNum">
                        <option value="0">제목</option>
                        <option value="1">내용</option>
                     </select> 
                     <input class="txte" type="text" name="isSearch" id="isSearch" />
                     <span class="btn btnC_03 btnP_04 mr10"> 
                        <input type="submit" value="검색" style="font-size: 11px; padding-bottom: 20; vertical-align: middle;" />
                     </span>
                  </form>
               </div>
               <form class="form-inline notice-searchForm"></form>
               <script>
                  $('.searchOption').val($('.searchOptionVal').val());
                  var onWrite = function() {
                     location.href = 'noticeForm';
                  };

                  var onList = function() {
                     location.href = 'notifyList';
                  };
               </script>
            </div>
         </div>
<script src="/GNG/dist/bootstrap/js/bootstrap.min.js"></script>
<script src="/GNG/dist/jquery/plugin/jquery.placeholder.js"></script>
<script src="/GNG/dist/js/common.js"></script>
<script src="/GNG/dist/js/event.js"></script>
<script src="/GNG/theme/pshp/js/event.js"></script>
<script src="/GNG/theme/pshp/js/plugins.min.js"></script>
<script src="/GNG/theme/pshp/js/main.min.js"></script>
<script src="/GNG/theme/pshp/js/vendor/fastclick.min.js"></script>
</body>
</html>