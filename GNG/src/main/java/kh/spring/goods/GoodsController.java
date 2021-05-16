package kh.spring.goods;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;
import kh.spring.moda.NewTagService;
import kh.spring.paging.GoodsPaging;

@Controller
public class GoodsController {

   @Resource(name = "goodsService")
   private GoodsService goodsService;

   @Resource(name = "newTagService")
   private NewTagService newTagService;

   // new태그 날짜조정
   // public static final int DATE_DATE=10;

   public static final int pagingSet = 5;
   private int currentPage = 1;
   private int totalCount;
   private int blockCount = 16;
   private int blockPage = 10;
   private String pagingHtml;
   private GoodsPaging page;
   //페이징 숫자
   
   List<Map<String,Object>> todayGoods= new ArrayList<Map<String,Object>>(); //오늘본 상품
   // 페이지이동 및 검색
   @RequestMapping(value = "/goods/goodsCategory")
   public ModelAndView goodsCategory(HttpServletResponse response, HttpServletRequest request, CommandMap Map)
         throws Exception {

      ModelAndView mv = new ModelAndView();
      mv.setViewName("goodsCategory");
      System.out.println(Map.getMap());
      String isCategory = (String) Map.getMap().get("CATEGORY");
      System.out.println("카테고리 는 " + isCategory);

      // 해당 카테고리 인기상품 4개
      List<Map<String, Object>> hotCategoryList4 = goodsService.goodsCategory(Map.getMap());
      // 칼라아이콘출력서비스
      hotCategoryList4 = goodsService.colorToLower(hotCategoryList4);
      // 신상태그생성서비스
      hotCategoryList4 = newTagService.newTageServie(hotCategoryList4, 10);

      // ---------------상단부 끝 하단부 ajaxList 시작 ---------------------//
      // javascript: ajaxList() 발동 시기 1)sort검색 2)color검색 3)가격대검색 //셋 다 동시에 가능

      // 가격대
      if ((String[]) Map.getMap().get("priceRange") != null) {
         String[] priceRange = (String[]) Map.getMap().get("priceRange");
         // view단에서 보기좋게 하기위해 10,000 이런식으로 표기 때문에 서버단에서 db에 들어가기전에 , 제거
         Map.getMap().put("minimumPrice", priceRange[0].replaceAll(",", ""));
         Map.getMap().put("maximumPrice", priceRange[1].replaceAll(",", ""));

         // System.out.println("minimumPrice : " + Map.getMap().get("minimumPrice"));
         // System.out.println("maximumPrice : " + Map.getMap().get("maximumPrice"));
         mv.setViewName("goods/goodsSort");

         // 대분류 클릭만하고 들어갔을때 AJAX시작하기전 때문에 priceRange 값 없고 같은 쿼리 돌리기위해 기본값 설정
      } else { // 때문에 이 엘스문은 goodsCategory로 리턴(ajax적용전)
         Map.getMap().put("minimumPrice", 1);
         Map.getMap().put("maximumPrice", 1000000);
      }

      // 정렬
      String sort = (String) Map.getMap().get("sort");
      if (sort != null) {
         System.out.println("솔트값은? " + sort);
         // List<Map<String,Object>> goodsList1=goodsService.goodsRank("OUTER");
         // System.out.println("사이즈 : " + goodsList.size());
         // mv.addObject("goodsList",goodsList1);
         mv.addObject("sort", sort);
         mv.setViewName("goods/goodsSort");
      } else {
         sort = "1"; // 기본 신상품에 오게
         mv.addObject("sort", sort);
      }

      Map.getMap().put("sort", sort);

      System.out.println("품절체그" + Map.getMap().get("soldOut"));
      System.out.println("세일체크" + Map.getMap().get("sale"));

      List<String> goodsCategory = new ArrayList<>();
      List<Map<String,Object>> goodsCategoryCount = new ArrayList<Map<String,Object>>();
      List<Integer> countList = new ArrayList<>();
      BigDecimal temp;
      if (isCategory.equals("OUTER")) {
         goodsCategory.add("가디건");
         goodsCategory.add("자켓");
         goodsCategory.add("점퍼/패딩");
         goodsCategory.add("코트");
         goodsCategory.add("블레이져");

         //CATEGORY1에 맞는 소분류 카테고리별 COUNT 뽑는 쿼리
         goodsCategoryCount = goodsService.selectCategoryCount("OUTER");
         
         //DB에서 나오는 순서가 가디건/자켓/점퍼/코트.. 순이 아니기때문에 2중포문에서 값맞추기
         for(int i=0; i<goodsCategory.size(); i++) {

        	 for(int z=0; z<goodsCategoryCount.size(); z++) {
        	   if(goodsCategoryCount.get(z).get("GOODS_CATEGORY2").equals(goodsCategory.get(i))) {
        		  temp = (BigDecimal)goodsCategoryCount.get(z).get("CATEGORYCOUNT");
        		  countList.add(temp.intValue());
        	   }
        	 }
        	
         }
         //System.out.println("뭘까요"+countList);
         
      } else if (isCategory.equals("TOP")) {
         goodsCategory.add("긴팔티");
         goodsCategory.add("반팔티");
         goodsCategory.add("맨투맨");
         goodsCategory.add("니트");
         goodsCategory.add("후드티");
         goodsCategory.add("셔츠");
         goodsCategoryCount = goodsService.selectCategoryCount("TOP");
         for(int i=0; i<goodsCategory.size(); i++) {
        	 for(int z=0; z<goodsCategoryCount.size(); z++) {
        	   if(goodsCategoryCount.get(z).get("GOODS_CATEGORY2").equals(goodsCategory.get(i))) {
        		  temp = (BigDecimal)goodsCategoryCount.get(z).get("CATEGORYCOUNT");
        		  countList.add(temp.intValue());
        	   }
        	 }
        	
         }
        

      } else if (isCategory.equals("PANTS")) {
         goodsCategory.add("면바지");
         goodsCategory.add("반바지");
         goodsCategory.add("슬랙스");
         goodsCategory.add("카고바지");
         goodsCategory.add("청바지");
         goodsCategoryCount = goodsService.selectCategoryCount("PANTS");
         for(int i=0; i<goodsCategory.size(); i++) {
        	 for(int z=0; z<goodsCategoryCount.size(); z++) {
        	   if(goodsCategoryCount.get(z).get("GOODS_CATEGORY2").equals(goodsCategory.get(i))) {
        		  temp = (BigDecimal)goodsCategoryCount.get(z).get("CATEGORYCOUNT");
        		  countList.add(temp.intValue());
        	   }
        	 }
        	
         }
        
      } else if (isCategory.equals("SHOES")) {
         goodsCategory.add("스니커즈");
         goodsCategory.add("구두");
         goodsCategory.add("워커");
         goodsCategory.add("로퍼");
         goodsCategoryCount = goodsService.selectCategoryCount("SHOES");
         for(int i=0; i<goodsCategory.size(); i++) {
        	 for(int z=0; z<goodsCategoryCount.size(); z++) {
        	   if(goodsCategoryCount.get(z).get("GOODS_CATEGORY2").equals(goodsCategory.get(i))) {
        		  temp = (BigDecimal)goodsCategoryCount.get(z).get("CATEGORYCOUNT");
        		  countList.add(temp.intValue());
        	   }
        	 }
        	
         }
        
      } else if (isCategory.equals("ACC")) {
         goodsCategory.add("가방");
         goodsCategory.add("벨트");
         goodsCategory.add("모자");
         goodsCategory.add("반지/목걸이");
         goodsCategory.add("양말");
         goodsCategory.add("ETC");
         goodsCategoryCount = goodsService.selectCategoryCount("ACC");
         for(int i=0; i<goodsCategory.size(); i++) {
        	 for(int z=0; z<goodsCategoryCount.size(); z++) {
        	   if(goodsCategoryCount.get(z).get("GOODS_CATEGORY2").equals(goodsCategory.get(i))) {
        		  temp = (BigDecimal)goodsCategoryCount.get(z).get("CATEGORYCOUNT");
        		  countList.add(temp.intValue());
        	   }
        	 }
        	
         }
     

      }

      System.out.println("소분류 카테고리 :" + Map.getMap().get("SUBCATEGORY"));

      // 칼라체크
      // ajax로 칼라1개선택후 2개선택했을때 컬러체크 널로 만들어줘야 오류안생김
      Map.getMap().put("colorCheck", null);
      try { // 컬러를 하나만 체크하면 String값으로 받기때문에 try catch
         String[] color = (String[]) Map.getMap().get("myColor");

         if (color != null) {
            for (int i = 0; i < color.length; i++) {
               System.out.println("다중컬러 선택" + color[i]);
            }
            Map.getMap().put("colorCheck", "ON2");
            Map.getMap().put("color", color);
         }
      } catch (Exception e) {
         String color = (String) Map.getMap().get("myColor");

         if (color != null) {
            System.out.println("원컬러 선택" + color);
            Map.getMap().put("colorCheck", "ON1");
            Map.getMap().put("color", color);
         }

      }

      List<Map<String, Object>> categoryList = goodsService.sortGoodsCategory(Map.getMap());
      // 신상태그서비스
      categoryList = newTagService.newTageServie(categoryList, 10);
      // 칼라출력서비스
      categoryList = goodsService.colorToLower(categoryList);
      // 소분류 카테고리 리스트
      
      //페이징
      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
            || request.getParameter("currentPage").equals("0")) {
         currentPage = 1;
      } else {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
         System.out.println("CurrentPage :" + currentPage);
      }
      System.out.println("CurrentPage :" + currentPage);

      totalCount = categoryList.size();

      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage, sort);
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      categoryList = categoryList.subList(page.getStartCount(), lastCount);

      mv.addObject("categoryList", categoryList);
      mv.addObject("totalCount", totalCount);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("currentPage", currentPage);
      mv.addObject("hotCategoryList4", hotCategoryList4);
      mv.addObject("isCategory", isCategory);
      mv.addObject("goodsCategory", goodsCategory);
      mv.addObject("countList", countList);
      
      // 소분류
      if (Map.getMap().get("SUBCATEGORY") != null) {
         if (!((String) Map.getMap().get("SUBCATEGORY")).equals("")) {
            String subCategory = (String) Map.getMap().get("SUBCATEGORY");
            System.out.println("소분류 들어옴");
            List<Map<String, Object>> goodsSubCategory = goodsService.goodsSubCategory(Map.getMap());
            List<Map<String, Object>> BestgoodsSubCategory = goodsService.BestgoodsSubCategory(Map.getMap());
            System.out.println("소분류 BEST4:" + Map.getMap().get("SUBCATEGORY") + "=" + BestgoodsSubCategory);
            System.out.println("소분류 sort:" + Map.getMap().get("SUBCATEGORY") + "=" + goodsSubCategory);

            goodsSubCategory = newTagService.newTageServie(goodsSubCategory, 10);
            goodsSubCategory = goodsService.colorToLower(goodsSubCategory);

            BestgoodsSubCategory = newTagService.newTageServie(BestgoodsSubCategory, 10);
            BestgoodsSubCategory = goodsService.colorToLower(BestgoodsSubCategory);

            //소분류 페이징
            if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
                  || request.getParameter("currentPage").equals("0")) {
               currentPage = 1;
            } else {
               currentPage = Integer.parseInt(request.getParameter("currentPage"));
               System.out.println("CurrentPage :" + currentPage);
            }
            System.out.println("CurrentPage :" + currentPage);

            totalCount = goodsSubCategory.size();

            page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage, sort);
            pagingHtml = page.getPagingHtml().toString();

            lastCount = totalCount;

            if (page.getEndCount() < totalCount)
               lastCount = page.getEndCount() + 1;

            goodsSubCategory = goodsSubCategory.subList(page.getStartCount(), lastCount);

            mv.addObject("categoryList", goodsSubCategory);
            mv.addObject("isCategory", isCategory);
            mv.addObject("goodsCategory", goodsCategory);
            mv.addObject("hotCategoryList4", BestgoodsSubCategory);
            mv.addObject("subCategory", subCategory);
            mv.addObject("totalCount", totalCount);
            mv.addObject("pagingHtml", pagingHtml);
            mv.addObject("currentPage", currentPage);

            mv.setViewName("goodsCategory");

            if (Map.getMap().get("searchCheck") != null) {
               
               
               mv.setViewName("goods/goodsSort");

            }
         }
      }


      return mv;
   }

   @RequestMapping(value = "/goodsDetail")
   public ModelAndView goodsDetail(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request,
         HttpSession session) throws Exception {

      ModelAndView mv = new ModelAndView("goodsDetail");
      int checkBuy;

      // 조회수 올리기
      goodsService.goodsCountUp(commandMap.getMap());
      // 상품정보 가져오기
      List<Map<String, Object>> goodsDetail = goodsService.selectOneGoods(commandMap.getMap());

      if (session.getAttribute("MEMBER_NUMBER") != null) {
         String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
         commandMap.put("MEMBER_NUMBER", mem_num);
         try { // 샀으면 1이상의 값(굿즈번호)
            checkBuy = goodsService.checkBuy(commandMap.getMap());
            System.out.println("뭔데"+checkBuy);
            mv.addObject("checkBuy", checkBuy);
            
         } catch (Exception e) { // db에서 null반환하면 int에담기때문에 에러뜸
            // 안샀으면 0
            checkBuy = 0;
            mv.addObject("checkBuy", checkBuy);
            System.out.println("뭔데2"+checkBuy);
         }
         System.out.println("??"+checkBuy);
         
      }

      // 기본정보를 보여줄 객체는 goodsBasic , 상품종류 쪾에는 goodsDetail 사용
      Map<String, Object> goodsBasic = goodsDetail.get(0); // goodsDetail은 20번이여도 goodsKind가 여러개면 여러줄

      // 비회원주문을 위한 굿즈넘버세션값저장
      session.setAttribute("GOODS_NUMBER", goodsBasic.get("GOODS_NUMBER"));

      mv.addObject("goodsDetail", goodsDetail);
      mv.addObject("GOODS_NUMBER", goodsDetail.get(0).get("GOODS_NUMBER"));
      mv.addObject("goodsBasic", goodsBasic);

      List<Map<String, Object>> goodsImage = goodsService.selectImage(commandMap.getMap());
      mv.addObject("goodsImage", goodsImage);

      // 코디상품 정보 가져오기
      List<Map<String, Object>> relatedGoods = goodsService.selectRelatedGoods(goodsBasic);

      //코디상품제목짜르기
/*      for (int i = 0; i < relatedGoods.size(); i++) {
         String name = (String) relatedGoods.get(i).get("GOODS_NAME");
         if (name.length() > 9) {
            name = name.substring(0, 8) + "..";
            relatedGoods.get(i).remove("GOODS_NAME");
            relatedGoods.get(i).put("GOODS_NAME", name);
            System.out.println(name);
         }
      }*/

      mv.addObject("relatedGoods", relatedGoods);
      // System.out.println("!!!!코디상품!!!!!!!" +
      // relatedGoods.get(0).get("GOODS_NUMBER"));
      // 리뷰 평점 가져오기
      mv.addObject("avgGrade", goodsService.reviewScore(commandMap.getMap()));

      // 상품qna 가져오기
      List<Map<String, Object>> goodsQna = goodsService.selectQNA(commandMap.getMap());

      System.out.println("goodsQna.size() =" + goodsQna.size());
      mv.addObject("goodsQna", goodsQna);

      int qnaEndPagingNum = pagingSet; // 5
      int qnaStartPagingNum = 0;
      int qnaNowPage = 1;

      String pagingQnaOnOff = (String) commandMap.getMap().get("pagingQnaOnOff");
      System.out.println("pagingQnaOnOff: " + (String) commandMap.getMap().get("pagingQnaOnOff"));
      if (pagingQnaOnOff != null) {
         String i = (String) commandMap.getMap().get("i");
         // System.out.println("i값 :" + i);
         qnaEndPagingNum = Integer.parseInt((String) commandMap.getMap().get("qnaEndPagingNum"));
         // System.out.println("qnaEndPagingNum :" + qnaEndPagingNum);
         qnaStartPagingNum = Integer.parseInt((String) commandMap.getMap().get("qnaStartPagingNum"));
         // System.out.println("qnaStartPagingNum :" + qnaStartPagingNum);
         qnaNowPage = Integer.parseInt((String) commandMap.getMap().get("qnaNowPage"));
         // System.out.println("qnaNowPage : " + qnaNowPage);
         if (i.equals("1"))// prev 클릭
         {
            if (qnaEndPagingNum == pagingSet) {
               System.out.println("첫페이지");
            } else {
               qnaStartPagingNum = qnaStartPagingNum - pagingSet;
               qnaEndPagingNum = qnaEndPagingNum - pagingSet;
               qnaNowPage = qnaNowPage - 1;
               System.out.println("전페이지이동");
            }
         } else if (i.equals("2")) // next 클릭
         {
            if (qnaEndPagingNum < goodsQna.size()) {
               qnaStartPagingNum = qnaStartPagingNum + pagingSet;
               qnaEndPagingNum = qnaEndPagingNum + pagingSet;
               qnaNowPage = qnaNowPage + 1;
               System.out.println("다음페이지이동");
            } else {
               System.out.println("마지막페이지");
            }

         }
         System.out.println("qnaEndPagingNum 연산결과  :" + qnaEndPagingNum);
         mv.setViewName("goods/qna/goodsDetail_Qna");
      }

      int totalPage = (int) Math.ceil((double) goodsQna.size() / pagingSet);
      System.out.println("총 페이지 갯수 :" + totalPage);
      mv.addObject("qnaEndPagingNum", qnaEndPagingNum);
      mv.addObject("qnaStartPagingNum", qnaStartPagingNum);
      mv.addObject("qnaNowPage", qnaNowPage);
      mv.addObject("qnaSize", goodsQna.size());
      mv.addObject("qnaTotalPage", totalPage);

      // 상품 Review 가져오기
      List<Map<String, Object>> goodsReview = goodsService.selectReview(commandMap.getMap());

      mv.addObject("goodsReview", goodsReview);

      int reviewEndPagingNum = pagingSet;
      int reviewStartPagingNum = 0;
      int reviewNowPage = 1;

      String pagingReviewOnOff = (String) commandMap.getMap().get("pagingReviewOnOff");
      if (pagingReviewOnOff != null) {
         String i = (String) commandMap.getMap().get("i");
         reviewEndPagingNum = Integer.parseInt((String) commandMap.getMap().get("reviewEndPagingNum"));
         // String
         // qnaStartPagingNumCheck=((String)commandMap.getMap().get("qnaStartPagingNum"));
         // if(qnaStartPagingNumCheck!=null)
         // {
         reviewStartPagingNum = Integer.parseInt((String) commandMap.getMap().get("reviewStartPagingNum"));
         // }
         // System.out.println("페이징 넘1 :" + qnaStartPagingNum);
         // System.out.println("페이징 넘 :" + qnaEndPagingNum);
         reviewNowPage = Integer.parseInt((String) commandMap.getMap().get("reviewNowPage"));
         if (i.equals("1"))// prev 클릭
         {
            if (reviewEndPagingNum == pagingSet) {
               System.out.println("첫페이지");
            } else {
               reviewStartPagingNum = reviewStartPagingNum - pagingSet;
               reviewEndPagingNum = reviewEndPagingNum - pagingSet;
               reviewNowPage = reviewNowPage - 1;
               System.out.println("리뷰전페이지이동");
            }
         } else if (i.equals("2")) // next 클릭
         {
            if (reviewEndPagingNum < goodsReview.size()) {
               reviewStartPagingNum = reviewStartPagingNum + pagingSet;
               reviewEndPagingNum = reviewEndPagingNum + pagingSet;
               reviewNowPage = reviewNowPage + 1;
               System.out.println("리뷰다음페이지이동");
            } else {
               System.out.println("마지막페이지");
            }

         }
         System.out.println("페이징 넘연산결과 " + reviewEndPagingNum);
         mv.setViewName("goods/review/goodsDetail_Review");
      }
      mv.addObject("reviewEndPagingNum", reviewEndPagingNum);
      mv.addObject("reviewStartPagingNum", reviewStartPagingNum);
      mv.addObject("reviewNowPage", reviewNowPage);
      mv.addObject("reviewSize", goodsReview.size());
      mv.addObject("reviewTotalPage", (int) Math.ceil((double) goodsReview.size() / pagingSet));

    //오늘본 상품
      //굿즈넘버,굿즈가격,썸네일,굿즈이름
      //GOODS_NUMBER   GOODS_NAME   GOODS_PRICE   GOODS_DISPRICE   GOODS_THUMBNAIL
      
      Map<String,Object> gg = new HashMap<>();   //담을 통
      
      gg.put("G_NUMBER",goodsBasic.get("GOODS_NUMBER"));
      gg.put("G_NAME",goodsBasic.get("GOODS_NAME"));
      gg.put("G_THUMBNAIL",goodsBasic.get("GOODS_THUMBNAIL"));
      gg.put("G_PRICE",goodsBasic.get("GOODS_DISPRICE"));
     
      /*if(goodsBasic.get("GOODS_DISPRICE").equals(goodsBasic.get("GOODS_PRICE"))) {
          gg.put("G_PRICE",goodsBasic.get("GOODS_DISPRICE"));
       }else {
          gg.put("G_PRICE",goodsBasic.get("GOODS_DISPRICE"));
       }*/
      if(todayGoods.size()==0) {
         todayGoods.add(gg);
      }else {   //뭔가 존재할때
         for(int i=0; i<todayGoods.size(); i++) {
            
               if(todayGoods.get(i).get("G_NUMBER").equals(gg.get("G_NUMBER"))) {
                  break;
                  
               }else if(i==todayGoods.size()-1){
                  todayGoods.add(gg);
                  break;
               }
            
         }
      }
      
      /*for(int i=0; i<todayGoods.size(); i++) {
         for(int j=0; j<todayGoods.size()&&i!=j; j++) {
            if(todayGoods.get(i).equals(todayGoods.get(j))){
               todayGoods.remove(j);
            }
         }
      }*/
     
      
      if(todayGoods.size()>5) {  
         todayGoods.remove(0);
      }
      
      session.setAttribute("todayGoods", todayGoods);
      
      //출력확인용
      for(int i=0; i<((List<Map<String,Object>>)session.getAttribute("todayGoods")).size(); i++) {
      System.out.println("오늘본상품 "+(i+1)+"번"+((List<Map<String,Object>>)session.getAttribute("todayGoods")).get(i));  
      }
      
      return mv;
   }
   
   @RequestMapping(value = "/Search")
   public ModelAndView goodsSearch(HttpServletResponse response, HttpServletRequest request, CommandMap Map)
         throws Exception {
	      ModelAndView mv = new ModelAndView(); 
	  
	      if(Map.getMap().get("page") != null) {
		   String temp = (String)Map.getMap().get("page");
		   if(temp.equals("on")) {
			   mv.setViewName("goods/goodsSearch");		
	        }
	        
	      }else {
	        	mv.setViewName("goodsSearch");
	      }
      
      System.out.println("Search Map :" +Map.getMap());
      String searchKeyWord = (String) Map.getMap().get("isSearch");
      List<Map<String, Object>> goodsSearchList = goodsService.goodsSearchList(Map.getMap());
      System.out.println("goodsSearchList :" +goodsSearchList);
      goodsSearchList = newTagService.newTageServie(goodsSearchList, 10);
      goodsSearchList = goodsService.colorToLower(goodsSearchList);
      
      //페이징
      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
            || request.getParameter("currentPage").equals("0")) {
         currentPage = 1;
      } else {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
         System.out.println("CurrentPage :" + currentPage);
      }
      System.out.println("CurrentPage :" + currentPage);

      totalCount = goodsSearchList.size();

      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage);
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      goodsSearchList = goodsSearchList.subList(page.getStartCount(), lastCount);
	  

      
      /*System.out.println("모냐?"+goodsSearchList);*/
      mv.addObject("goodsSearchList" , goodsSearchList);
      mv.addObject("searchKeyWord" , searchKeyWord);
      mv.addObject("totalCount", totalCount);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("currentPage", currentPage);
      
      return mv;
      
   }
   
   
   @RequestMapping(value = "/goods/goodsColorSearch")
   public ModelAndView goodsColorSearchList(HttpServletResponse response, HttpServletRequest request, CommandMap Map)
         throws Exception {
      
	   ModelAndView mv = new ModelAndView(); 
		  
	      if(Map.getMap().get("page") != null) {
		   String temp = (String)Map.getMap().get("page");
		   if(temp.equals("on")) {
			   mv.setViewName("goods/goodsSearch");		
	        }
	        
	      }else {
	        	mv.setViewName("goodsSearch");
	      }
     
      System.out.println("서치칼러 :" +Map.getMap());
      //String searchKeyWord = (String) Map.getMap().get("isSearch");
      String searchKeyWord = (String) Map.getMap().get("searchColor");
      List<Map<String, Object>> goodsSearchList = goodsService.goodsColorSearchList(Map.getMap());
      System.out.println("goodsSearchList :" +goodsSearchList);
      goodsSearchList = newTagService.newTageServie(goodsSearchList, 10);
      goodsSearchList = goodsService.colorToLower(goodsSearchList);

      //페이징
      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
            || request.getParameter("currentPage").equals("0")) {
         currentPage = 1;
      } else {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
         System.out.println("CurrentPage :" + currentPage);
      }
      System.out.println("CurrentPage :" + currentPage);

      totalCount = goodsSearchList.size();

      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage);
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      goodsSearchList = goodsSearchList.subList(page.getStartCount(), lastCount);
	  

      

      mv.addObject("goodsSearchList" , goodsSearchList);
      mv.addObject("searchKeyWord" , searchKeyWord);
      mv.addObject("totalCount", totalCount);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("currentPage", currentPage);
      
      
      return mv;
      
      
   }
   
   
   
   @RequestMapping(value = "/goods/goodsSizeSearch")
   public ModelAndView goodsSizeSearchList(HttpServletResponse response, HttpServletRequest request, CommandMap Map)
         throws Exception {
      
	   ModelAndView mv = new ModelAndView(); 
		  
	      if(Map.getMap().get("page") != null) {
		   String temp = (String)Map.getMap().get("page");
		   if(temp.equals("on")) {
			   mv.setViewName("goods/goodsSearch");		
	        }
	        
	      }else {
	        	mv.setViewName("goodsSearch");
	      }
     
      System.out.println("서치사이즈 :" +Map.getMap());
      //String searchKeyWord = (String) Map.getMap().get("isSearch");
      String searchKeyWord = (String) Map.getMap().get("searchSize");
      List<Map<String, Object>> goodsSearchList = goodsService.goodsSizeSearchList(Map.getMap());
      System.out.println("goodsSearchList :" +goodsSearchList);
      goodsSearchList = newTagService.newTageServie(goodsSearchList, 10);
      goodsSearchList = goodsService.colorToLower(goodsSearchList);

      //페이징
      if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
            || request.getParameter("currentPage").equals("0")) {
         currentPage = 1;
      } else {
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
         System.out.println("CurrentPage :" + currentPage);
      }
      System.out.println("CurrentPage :" + currentPage);

      totalCount = goodsSearchList.size();

      page = new GoodsPaging(currentPage, totalCount, blockCount, blockPage);
      pagingHtml = page.getPagingHtml().toString();

      int lastCount = totalCount;

      if (page.getEndCount() < totalCount)
         lastCount = page.getEndCount() + 1;

      goodsSearchList = goodsSearchList.subList(page.getStartCount(), lastCount);
	  

      

      mv.addObject("goodsSearchList" , goodsSearchList);
      mv.addObject("searchKeyWord" , searchKeyWord);
      mv.addObject("totalCount", totalCount);
      mv.addObject("pagingHtml", pagingHtml);
      mv.addObject("currentPage", currentPage);
      
      
      return mv;
      
      
   }
   @RequestMapping(value = "/todayGoods")
   public ModelAndView todayGoods(HttpServletResponse response, HttpServletRequest request, CommandMap Map)
         throws Exception {
            ModelAndView mv = new ModelAndView("todayGoods");
            return mv;   
   } 
   
   @RequestMapping(value = "/todayGoodsDelete")
   public ModelAndView todayGoodsDelete(HttpServletResponse response, HttpServletRequest request, CommandMap Map, HttpSession session)
            throws Exception {
               ModelAndView mv = new ModelAndView("todayGoods");
               System.out.println("CommandMap : " +Map.getMap());
              /*List<String> todayGoodsDelete = new ArrayList<>();*/
               List<Map<String, Object>> todayGoodsList = (List<Map<String,Object>>) session.getAttribute("todayGoods");
               String[] todayGoodsNumber = request.getParameterValues("brchks[]");
/*               System.out.println("todayGoodsList :" +todayGoodsList);
               System.out.println("todayGoodsList사이즈 :" +todayGoodsList.size());
               System.out.println("길이 :" +todayGoodsNumber.length);
               System.out.println("0번가능? :" +todayGoodsNumber[0]);*/

            Iterator<Map<String,Object>> iter = todayGoodsList.iterator();
            //i=선택된 갯수  j=갯수에 맞는 굿즈넘버(삭제기준번호)
            int j;
            //이터레이터.next()는 요소를 꺼내오며 바로 소모시킨다 때문에 해당코드는 while문을 다돌면 iterator는 비어있다
            //for문안에서 계속 돌리기위해 for문안에서 이터레이터를 재생성해준다
             for(int i = 0; i < todayGoodsNumber.length; i++) {  
                iter = todayGoodsList.iterator();
                j= Integer.parseInt(todayGoodsNumber[i]);
                //System.out.println("j? "+j);
                while (iter.hasNext()) {
                  Map<String,Object> a = iter.next();
                    if (((BigDecimal)a.get("G_NUMBER")).intValue() == j) {
                    	
                    	iter.remove();
                        
                     }
                  
                  }
             }
               
               
               
               System.out.println("todayGoodsList 삭제 후:" +todayGoodsList);
               
               
               return mv;   
      }
}