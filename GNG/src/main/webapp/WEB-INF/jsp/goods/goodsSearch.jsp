<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

  <script>

   function ajaxList(num){
		var searchKeyWord = '${searchKeyWord}';
		var page = 'on';
		var url = window.location.pathname;
		console.log("에이작리스트탐");
	    console.log(num);
	    console.log(searchKeyWord);
	    console.log(url);
	    console.log(page);
	     
	   if(num != null){
	      var currentPage = num;
	      console.log('currentPage :' +currentPage);   
	   }else{
	      var currentPage = 1;
	      console.log('currentPagezz :' +currentPage);
	   }

		 $.ajax({
	            url: url,
	            type : "post",
	            data: {"currentPage":currentPage, "isSearch":searchKeyWord, "page":page, "searchColor":searchKeyWord, "searchSize":searchKeyWord},
	            success:function(data){
	               $("#changeList").html(data);
	               //console.log("date?"+data);
	               //개쩐다
	            }
	         });  
	   }      
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/GNG/theme/aboki/common.css">
<link rel="stylesheet" href="/GNG/theme/aboki/footer.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/header.1.css">
<link rel="stylesheet" href="/GNG/theme/aboki/main.css">
<link rel="stylesheet" href="/GNG/theme/aboki/nanumgothic.css">
<link rel="stylesheet" href="/GNG/theme/aboki/okdgg_layer.css">
<link rel="stylesheet" href="/GNG/theme/aboki/scroll.css">
<link rel="stylesheet" href="/GNG/theme/aboki/shopbrand.387.css">
<link rel="stylesheet" href="/GNG/theme/aboki/pagingcss.css">

</head>
<body>
<br>
<br>
<section id="changeList">
<section class="hashFilter section eshop container">
  <div class="section-body">	
   <div class="page-title section">
        <div class="myimg">
           <img src="/GNG/theme/searchCategory.gif" width="100%"  style="padding: 15px 5px;"/>
        </div>
    </div>
  </div>
</section>
					
  <div class="cboth main_section03">
      <div class="cboth main_title">'${searchKeyWord}검색' PRODUCT LIST</div>
   <br>
	
	
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
         
         <c:forEach items="${goodsSearchList}" var="goodsList" begin="0" varStatus="status" end="${fn:length(goodsSearchList)}">
       
            <td>
            <div class="tb-center">
            <div class="box">
            <div class="thumb salebox">
                        <a href="/GNG/goodsDetail?GOODS_NUMBER=${goodsList.GOODS_NUMBER}"><img class="MS_prod_img_s" src="/GNG/file/goodsFile/${goodsList.GOODS_THUMBNAIL}" alt=""></a>
                        <input type="hidden" name="custom_price" value="${goodsList.GOODS_PRICE}">
                        <input type="hidden" name="product_price" value="${goodsList.GOODS_DISPRICE}">
                        <!-- 조건태그시작 -->
                        <c:if test="${goodsList.GOODS_DISPRICE != goodsList.GOODS_PRICE}">
                        <span class="sale_text" style="display: block;">
                        -<fmt:formatNumber value="${(goodsList.GOODS_PRICE - goodsList.GOODS_DISPRICE)*100 / goodsList.GOODS_PRICE}" type="number" />%
                        </span>
                        </c:if>
                        <%-- <c:if test="${goodsRank.GOODS_NEWDATE == 1}"> --%> 
							<span class="sale_text" style="display: block; border:0px;" >
                       		<img src="/GNG/file/NEWtag.jpg"/>
                       		</span>
					<%-- 	</c:if>
						<c:if test="${goodsRank.AMOUNT<20}"> --%> 
                      	<span class="sale_text" style="display: block; border:0px;">
                       	<img src="/GNG/file/HurryUp.png"/>
                       	</span>
                       	<%-- </c:if> --%>
                     </div>
                     <ul class="info">
                        <li class="dsc"> <a href="/GNG/goodsDetail?GOODS_NUMBER=${goodsList.GOODS_NUMBER}">${goodsList.GOODS_NAME}</a></li>
                        <li class="subname">${goodsList.GOODS_SHORTDESC}<br>(${goodsList.COLORCOUNT}color)
                        </li>
                     <c:if test="${goodsList.GOODS_DISPRICE eq goodsList.GOODS_PRICE}">
                     <li class="price"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원</li>
                     </c:if>   
                     <c:if test="${goodsList.GOODS_DISPRICE ne goodsList.GOODS_PRICE }">
                     <li class="consumer"><fmt:formatNumber value="${goodsList.GOODS_PRICE}" type="number"/>원</li><li class="price"><fmt:formatNumber value="${goodsList.GOODS_DISPRICE}" type="number"/>원</li>
                     </c:if>
                     <li><c:forEach items="${goodsList.COLORKIND}" var="color">
                        <img src="/GNG/theme/pshp/img/filter-color-${color}.png" width="10px" height="10px">
                        </c:forEach></li>
                     <li class="icon"><span class="MK-product-icons"></span></li>
                     </ul>
                  </div>
                  </div>
                  
               </td>
         <c:if test="${status.index == 3}">
      		<tr>
         </c:if>
         <c:if test="${status.index > 4 && (status.index+1) % 4 == 0}">
      			<tr>
         </c:if>
            </c:forEach>               
            <tr>
            </tr>
      </tbody>
         
      </table>
       <center>
           <input type="hidden" id="currentPage" value="${currentPage}"/>
               ${pagingHtml}
           
        </center>
      </div><!-- //prd-list -->
   </div><!-- //main_section03 -->
</section>

</body>
</html>