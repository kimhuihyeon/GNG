package kh.spring.myPage;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.adminQna.AdminQnaService;
import kh.spring.moda.CommandMap;
import kh.spring.order.OrderService;
import kh.spring.paging.myPaging;
import kh.spring.review.ReviewService;

@Controller
public class MyPageController {
	
	@Resource(name="mypageService")
	private MyPageService mypageService;
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	@Resource(name="adminQnaService")
	private AdminQnaService adminQnaService;
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 10;
	private String pagingHtml;
	private myPaging page;
	//페이징 숫자
	 
	


	@SuppressWarnings("null")
	@RequestMapping(value="/mypage")
	public ModelAndView mypageFormLoginAop(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		commandMap.getMap().put("MEMBER_NUMBER", mem_num);
		
		int newAlarm = mypageService.qnaNewAlarm(commandMap.getMap());
		//select COUNT(*)from qna where QNA_CATEGORY= '상품문의' and member_number = #{MEMBER_NUMBER} and (QNA_REPSTATE = '답변완료' or QNA_REPSTATE = '답변대기')
		
		int selectOtoCount = mypageService.selectOtoCount(mem_num);
		//SELECT COUNT(*) FROM QNA WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND NOT QNA_CATEGORY = '상품문의'
		
		int selectBuycount = mypageService.selectBuyCount(mem_num);
		//SELECT COUNT(*) FROM ORDERLIST WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND GOODS_STATE = '주문진행중'
		
		int selectExCount = mypageService.selectExCount(mem_num);
		//SELECT COUNT(*) FROM ORDERLIST WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND GOODS_STATE = '교환신청'
		
		int selectReCount = mypageService.selectReCount(mem_num);
		//SELECT COUNT(*) FROM ORDERLIST WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND GOODS_STATE = '반품신청'
		
		int selectToCount=mypageService.checkTotalMoney(mem_num);
		//select count(*) from orderlist where member_number = #{member_number} and goods_state in ('구매확정', '교환신청', '반품신청')
		
		if(selectToCount>0){
		String selectTotalMoney = mypageService.selectTotalMoney(mem_num);
		//select sum(GOODS_TOTAL) as totalPrice from orderlist where member_number = #{MEMBER_NUMBER} and goods_state in ('구매확정', '교환신청', '반품신청')
		
		System.out.println(selectTotalMoney);
			mv.addObject("totalMoney", selectTotalMoney);
		}
		else{
			mv.addObject("totalMoney","0");
		}
		mv.setViewName("mypage");
		Map<String, Object> sumPoint = mypageService.sumPoint(commandMap.getMap());
		//SELECT SUM(POINT_POINT) AS SUM FROM POINT WHERE MEMBER_NUMBER = ${MEMBER_NUMBER}
		
		mv.addObject("sumPoint", sumPoint.get("SUM"));
		mv.addObject("newAlarm", newAlarm);
		mv.addObject("selectOtoCount", selectOtoCount);
		mv.addObject("buyCount", selectBuycount);
		mv.addObject("ExCount", selectExCount);
		mv.addObject("ReCount", selectReCount);
		return mv;
	}
	
	@RequestMapping(value="/orderlist")
	@ResponseBody
	public ModelAndView orderlist(HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("orderlist");
		CommandMap map = new CommandMap();
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		List<Map<String, Object>> list = mypageService.selectOrderList(mem_num);
		map.getMap().put("MEMBER_NUMBER",mem_num);
		String TOTAL;
		for(int i=0;i<list.size();i++){
		   	map.getMap().put("ORDER_CODE",list.get(i).get("ORDER_CODE"));
			 TOTAL = mypageService.selectMyPageTotal(map.getMap());
			 list.get(i).put("ORDER_TOTAL_PRICE",TOTAL);
			
		}
		/*select A.GOODS_TOTAL, A.ORDER_NUMBER, A.GOODS_NUMBER, C.GOODS_NAME, A.ORDER_DATE, 
		A.GOODS_STATE, A.ORDER_CODE, A.DELIVERY_STATE, A.GOODS_PAY_STATE, C.GOODS_THUMBNAIL 
		from orderlist A, GOODS C 
		WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND NOT A.GOODS_STATE IN 
   		('반품신청', '반품완료', '교환신청', '교환완료') AND A.GOODS_NUMBER = C.GOODS_NUMBER 
    	GROUP BY A.GOODS_TOTAL,  A.ORDER_NUMBER, C.GOODS_THUMBNAIL , A.GOODS_NUMBER, 
    	C.GOODS_NAME, A.ORDER_DATE, A.GOODS_STATE, A.ORDER_CODE, A.DELIVERY_STATE, 
    	A.GOODS_PAY_STATE ORDER BY A.ORDER_DATE DESC*/
		//System.out.println("목록:"+list.toString());
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);
		
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		
		return mv;
	}
	@RequestMapping(value="/orderlist/payUpdate")
	@ResponseBody
	public ModelAndView orderlist_pay_update(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("orderlist");
		String flag = URLDecoder.decode(commandMap.get("flag").toString(), "utf-8");
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		System.out.println(flag);
		if(flag.equals("구매취소")){
			mypageService.cancel_order(commandMap.getMap());
			/*UPDATE ORDERLIST SET GOODS_STATE = '주문취소' ,GOODS_PAY_STATE = '결제취소', 
			DELIVERY_STATE = '배송취소' WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND ORDER_CODE = #{ORDER_CODE}*/
		}else if(flag.equals("구매확정")) {
			mypageService.confirm_order(commandMap.getMap());
			/*UPDATE ORDERLIST SET GOODS_STATE = '구매확정' WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND 
					ORDER_CODE = #{ORDER_CODE}*/
			System.out.println("뭐뭐오냐"+commandMap.getMap());
			
			
			if(mem_num != null) { //구매확정 포인트증정
			commandMap.getMap().put("POINT_CONTENT", "상품구매확정");
			String temp = (String)commandMap.getMap().get("TOTALPRICE");
			int total = Integer.parseInt(temp);
			int POINT_POINT = (total/10);
			
			commandMap.getMap().put("POINT_POINT", POINT_POINT);
			orderService.insertPoint(commandMap.getMap());
			}

		}
		List<Map<String, Object>> list = mypageService.selectOrderList(mem_num);
		commandMap.getMap().put("MEMBER_NUMBER",mem_num);
		String TOTAL;
		for(int i=0;i<list.size();i++){
			commandMap.getMap().put("ORDER_CODE",list.get(i).get("ORDER_CODE"));
			 TOTAL = mypageService.selectMyPageTotal(commandMap.getMap());
			 list.get(i).put("ORDER_TOTAL_PRICE",TOTAL);
			
		}
		//위와 같이 한번더 띄워줌
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);
		
		System.out.println(pagingHtml);
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		return mv;
	}
	
	@RequestMapping(value="/noorderlist/payUpdate")
	@ResponseBody
	public ModelAndView noorderlist_pay_update(CommandMap commandMap, HttpServletRequest request) throws Exception{
			//받는 세션값이 없음, commandMap에 로그인 이메일 및 전화번호만 있음  
		ModelAndView mv = new ModelAndView("order/noMemberOrderList");
		String flag = URLDecoder.decode(commandMap.get("flag").toString(), "utf-8");
		/*String order_number = commandMap.get("ORDER_NUMBER").toString();
		System.out.println(order_number);*/
		System.out.println(flag);
		System.out.println("오더코드 뭐가 나올까"+commandMap.getMap().get("ORDER_CODE"));
		if(flag.equals("구매취소")){
			mypageService.nocancle_order(commandMap.getMap()); 
			/*UPDATE ORDERLIST SET GOODS_STATE = '주문취소' ,GOODS_PAY_STATE = '결제취소', 
			DELIVERY_STATE = '배송취소' WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND ORDER_CODE = #{ORDER_CODE}*/
			
			//UPDATE ORDERLIST SET ORDER_STATE = '주문취소' ,ORDER_PAY_STATE = '결제취소', ORDER_DELIVERY_STATE = '배송취소' WHERE ORDER_CODE = #{ORDER_CODE}
		}else if(flag.equals("구매확정")) {
			mypageService.noconfirm_order(commandMap.getMap());
			/*UPDATE ORDERLIST SET GOODS_STATE = '구매확정' WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND 
					ORDER_CODE = #{ORDER_CODE}*/
		}
		List<Map<String, Object>> list = orderService.selectOrderList2(commandMap.getMap());
		//위와 같이 한번더 띄워줌
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		

		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);
		
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		
		System.out.println("목록:"+list.toString());
		
		return mv;
	}
	
	
	
	@RequestMapping(value="/oneToOne")
	@ResponseBody
	public ModelAndView oneToOneForm(HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/qna/oneToOneQna");
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		List<Map<String, Object>> list = mypageService.selectOtoList(mem_num);
		/*SELECT * FROM QNA WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND NOT QNA_CATEGORY='상품문의' 
		order by qna_number desc*/

		List<Map<String, Object>> list2 = mypageService.selectOtoComplete(mem_num);
		/*SELECT * FROM QNA WHERE MEMBER_NUMBER = #{MEMBER_NUMBER} AND QNA_REPSTATE='문의종료' 
		AND NOT QNA_CATEGORY='상품문의' order by qna_number desc*/
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);	//상품 문의중인것들
		mv.addObject("list2", list2);	//문의가 종료된것들
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		
		
		return mv;
	}
	
	@RequestMapping(value="/oneToOne/form")
	public ModelAndView oneToOneForm(CommandMap map){
		ModelAndView mv = new ModelAndView("modal_oneToOneWriteForm");
		return mv;
	}
	
	@RequestMapping(value="/oneToOne/write", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView oneToOneWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{	
		ModelAndView mv = new ModelAndView();
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		if(multipartHttpServletRequest.getFile("QNA_IMAGE1") != null){
		String now = new SimpleDateFormat("yyyyMMddHmsS").format(new Date());
		MultipartFile QNA_IMAGE1 = multipartHttpServletRequest.getFile("QNA_IMAGE1");
		String filePath = "C:\\java\\maven-app\\MODA\\src\\main\\webapp\\file\\qnaFile\\";
		
		File file2 = new File(filePath);
        if (file2.exists() == false) {
           file2.mkdirs(); // 폴더가 존재하지 않으면 폴더 생성
        }
		String fileName = "qna_"+commandMap.get("MEMBER_NUMBER").toString()+"_"+now;
		String IMAGEExtension = QNA_IMAGE1.getOriginalFilename().substring(QNA_IMAGE1.getOriginalFilename().lastIndexOf("."));
		File file1 = new File(filePath+fileName+IMAGEExtension);
		QNA_IMAGE1.transferTo(file1);
		commandMap.put("QNA_IMAGE1", fileName+IMAGEExtension);
		}else{
			commandMap.put("QNA_IMAGE1", "이미지없음");
		}
		//System.out.println(commandMap.getMap().get("QNA_IMAGE1"));
		//System.out.println(commandMap.getMap().get("MEMBER_NUMBER"));
		
		/*String m = commandMap.getMap().toString();
		System.out.println("map="+m);*/
		mypageService.insertOneToOne(commandMap.getMap());
		/*INSERT INTO QNA (QNA_NUMBER, QNA_CATEGORY, MEMBER_NUMBER, QNA_CONTENT, QNA_IMAGE1, 
		QNA_REGDATE, QNA_TITLE) VALUES (QNA_NUMBER_SEQ.NEXTVAL, #{QNA_CATEGORY}, #{MEMBER_NUMBER}, 
		#{QNA_CONTENT}, #{QNA_IMAGE1}, SYSDATE, #{QNA_TITLE})*/

		mv.setViewName("redirect:/mypage#oneToOne");
		return mv;
	}
	
	
	@RequestMapping(value="/oneToOneDelete")
	@ResponseBody
	public ModelAndView deleteOneToOne(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();

		adminQnaService.adminQnaDelete(commandMap.getMap());
		
		
		mv.setViewName("redirect:/mypage#oneToOne");

		return mv;
	}
	
	@RequestMapping(value="/qna/updateRepState")
	@ResponseBody
	public ModelAndView updateRepState(CommandMap commandMap, HttpSession session) throws Exception{
		String QNA_NUMBER = commandMap.get("QNA_NUMBER").toString();
		System.out.println("QNA번호="+QNA_NUMBER);
		mypageService.updateRepState(commandMap.getMap());
		String m_num = session.getAttribute("MEMBER_NUMBER").toString();
		List<Map<String, Object>> qnalist = mypageService.qnalistById(m_num);
		List<Map<String, Object>> qnalist2 = mypageService.qnalistById2(m_num);
		System.out.println("목록2"+qnalist2.toString());
		ModelAndView mv = new ModelAndView("qnalist");
		mv.addObject("qnalist", qnalist);
		mv.addObject("qnalist2", qnalist2);
		return mv;
	}

	@RequestMapping(value="/qnaDelete")
	@ResponseBody
	public ModelAndView deleteQna(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();

		adminQnaService.adminQnaDelete(commandMap.getMap());
		
		if(commandMap.getMap().get("DETAIL")!=null) {
			String temp = (String)commandMap.getMap().get("DETAIL");
			if(temp.equals("1")){
				String GOODS_NUMBER = (String)commandMap.getMap().get("GOODS_NUMBER");
				mv.setViewName("redirect:/goodsDetail?GOODS_NUMBER="+GOODS_NUMBER);
			}
		}else {
		mv.setViewName("redirect:/mypage#qna");
		}


		return mv;
	}
	

	
	@RequestMapping(value="/exchangelist")
	@ResponseBody
	public ModelAndView exchangelist(HttpSession session,HttpServletRequest request) throws Exception{
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		List<Map<String, Object>> list = mypageService.selectExchangeList(mem_num);	
		CommandMap map = new CommandMap(); 
		map.getMap().put("MEMBER_NUMBER",mem_num);
		String TOTAL;
		for(int i=0;i<list.size();i++){
			map.getMap().put("ORDER_CODE",list.get(i).get("ORDER_CODE"));
			 TOTAL = mypageService.selectMyPageTotal(map.getMap());
			 list.get(i).put("ORDER_TOTAL_PRICE",TOTAL);
			
		}
		
		ModelAndView mv = new ModelAndView("exchangelist");
		mv.addObject("list", list);
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);
		
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		
		return mv;
	}
	
	@RequestMapping(value="/exchangelist/form")
	@ResponseBody
	public ModelAndView exchangelistForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("modal_exchangeForm");
		String orderCode = commandMap.get("ORDER_CODE").toString();
		mv.addObject("ORDER_CODE", orderCode);
		System.out.println(orderCode);
		return mv;
	}
	
	@RequestMapping(value="/exchangelist/write", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView exchangelistWrite(CommandMap commandmap) throws Exception{
		System.out.println(commandmap.getMap().toString());
		ModelAndView mv = new ModelAndView();
		mypageService.updateExchange(commandmap.getMap());
		mypageService.insertCancelList(commandmap.getMap());
		mv.setViewName("redirect:/mypage#exchangelist");
		return mv;
	}
	
	@RequestMapping(value="/returnlist")
	@ResponseBody
	public ModelAndView returnlist(HttpSession session,HttpServletRequest request) throws Exception{
		
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		List<Map<String, Object>> list = mypageService.selectReturnList(mem_num);
		CommandMap map = new CommandMap(); 
		map.getMap().put("MEMBER_NUMBER",mem_num);
		String TOTAL;
		for(int i=0;i<list.size();i++){
			map.getMap().put("ORDER_CODE",list.get(i).get("ORDER_CODE"));
			 TOTAL = mypageService.selectMyPageTotal(map.getMap());
			 list.get(i).put("ORDER_TOTAL_PRICE",TOTAL);
			
		}
		
		ModelAndView mv = new ModelAndView("returnlist");
		Map<String, Object> sumMap = new HashMap<String, Object>();
		
		sumMap.put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER"));
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);
		
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		
		return mv;
	}
	
	@RequestMapping(value="/returnlist/form")
	@ResponseBody
	public ModelAndView returnlistForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("modal_returnForm");
		String orderCode = commandMap.get("ORDER_CODE").toString();
		mv.addObject("ORDER_CODE", orderCode);
		System.out.println(orderCode);
		return mv;
	}
	
	@RequestMapping(value="/returnlist/write", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView returnlistWrite(CommandMap commandmap) throws Exception{
		System.out.println(commandmap.getMap().toString());
		ModelAndView mv = new ModelAndView();
		mypageService.updateReturn(commandmap.getMap());
		mypageService.insertCancelList(commandmap.getMap());
		System.out.println(commandmap.getMap());
		mv.setViewName("redirect:/mypage#returnlist");
		return mv;
	}
	
	
	@RequestMapping(value="/review")
	@ResponseBody
	public ModelAndView review(HttpSession session, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("reviewlist");
		String mem_num = session.getAttribute("MEMBER_NUMBER").toString();
		List<Map<String, Object>> list = mypageService.selectReviewList(mem_num);
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = list.size();
		
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);
		
		mv.addObject("list", list);
		
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		return mv;
	}
	
	//마이페이지 리뷰 삭제
	@RequestMapping(value = "/reviewDelete")
	@ResponseBody
	public ModelAndView deleteReview(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();

		reviewService.reviewDelete(commandMap.getMap());
		
		if(commandMap.getMap().get("DETAIL")!=null) {
			String temp = (String)commandMap.getMap().get("DETAIL");
			if(temp.equals("1")){
				String GOODS_NUMBER = (String)commandMap.getMap().get("GOODS_NUMBER");
				mv.setViewName("redirect:/goodsDetail?GOODS_NUMBER="+GOODS_NUMBER);
			}
		}else {
		mv.setViewName("redirect:/mypage#review");
		}

		return mv;
	}


	@RequestMapping(value="/qna")
	@ResponseBody
	public ModelAndView qnalist(HttpSession session, CommandMap commandMap ,HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("qnalist");
		String m_num = session.getAttribute("MEMBER_NUMBER").toString();
		commandMap.put("MEMBER_NUMBER", m_num);
		
		List<Map<String, Object>> qnalist = mypageService.qnalistById(m_num);
		List<Map<String, Object>> qnalist2 = mypageService.qnalistById2(m_num);
		System.out.println("목록222"+qnalist2.toString());
		
	
		System.out.println("멤버넘버 ="+m_num);
		System.out.println("qnalist.size() ="+qnalist.size());	//답변대기 개수
		System.out.println("qnalist.size() ="+qnalist2.size());	//답변완료 개수
		
	
		

		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			System.out.println("ㅋㅋ"+currentPage);
		}
		System.out.println("ㅋㅋ2"+currentPage);
		
		totalCount = qnalist.size();
		
		String url = request.getParameter("url");
		System.out.println("zㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ"+url);
		
		page = new myPaging(currentPage, totalCount, blockCount, blockPage, url);
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		qnalist = qnalist.subList(page.getStartCount(), lastCount);
		
		mv.addObject("qnalist", qnalist);
		mv.addObject("qnalist2", qnalist2);
		
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("currentPage", currentPage);	
		
		
	
		return mv;	
	}
	
		
	
	
	@RequestMapping(value="/myinfo")
	@ResponseBody
	public ModelAndView myinfo(HttpSession session) throws Exception{
		String id = session.getAttribute("MEMBER_ID").toString();
		Map<String, Object> myinfo = mypageService.myinfoDetail(id);
		//SELECT * FROM MEMBER WHERE MEMBER_ID=#{MEMBER_ID}
		
		ModelAndView mv = new ModelAndView("myinfo");
		//이메일 폼 변경
		String email = myinfo.get("MEMBER_EMAIL").toString();
		System.out.println("이메일="+email);
		String[] m_email = email.split("@");
		myinfo.put("MEMBER_EMAIL1", m_email[0].toString());
		myinfo.put("MEMBER_EMAIL2", m_email[1].toString());
		//날짜 폼 변경
		if(myinfo.get("MEMBER_JUMIN") !=null){
		String a[] = new String[3];
		String date = myinfo.get("MEMBER_JUMIN").toString(); 
		date = "19" + date;
		a[0]=date.substring(0,4);
		a[1]=date.substring(4,6);
		a[2]=date.substring(6,8);
		date = a[0] + "-" + a[1] + "-" + a[2];
		myinfo.put("MEMBER_JUMIN", date);
		}
		mv.addObject("myinfo", myinfo);
		return mv;
	}
	
	@RequestMapping(value="/myinfo", method=RequestMethod.POST)
	public ModelAndView updateMyinfo(CommandMap commandMap, HttpSession session) throws Exception{
		String password = commandMap.get("MEMBER_PASSWORD").toString();
		
		System.out.println(commandMap.getMap().toString());
		String email1 = commandMap.get("MEMBER_EMAIL1").toString();
		String email2 = commandMap.get("MEMBER_EMAIL2").toString();
		commandMap.getMap().put("MEMBER_EMAIL", email1+"@"+email2);
		if(password.equals("") || password.equals(null)){
		mypageService.updateMyinfo(commandMap.getMap());
		/*UPDATE MEMBER SET MEMBER_PHONE=#{MEMBER_PHONE}, MEMBER_ZIPCODE=#{MEMBER_ZIPCODE}, 
		MEMBER_ADDRESS1=#{MEMBER_ADDRESS1}, MEMBER_ADDRESS2=#{MEMBER_ADDRESS2}, 
		MEMBER_EMAIL=#{MEMBER_EMAIL} WHERE MEMBER_ID=#{MEMBER_ID}*/
		
		}else{
		mypageService.changeMypassword(commandMap.getMap());
		mypageService.updateMyinfo(commandMap.getMap());
		//UPDATE MEMBER SET MEMBER_PASSWORD = #{MEMBER_PASSWORD} WHERE MEMBER_ID=#{MEMBER_ID}
		}
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:mypage#myinfo");
		return mv;
	}
	
	@RequestMapping(value="/member/myPoint")
	public ModelAndView myPoint(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("myPoint");
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER"));
		List<Map<String, Object>> myPoint = mypageService.myPoint(commandMap.getMap());
		Map<String, Object> sumPoint = mypageService.sumPoint(commandMap.getMap());
		
			Map<String, Object> firstLine = myPoint.get(0);
			System.out.println("잔여적립 : "+myPoint.get(0));
			
			
			mv.addObject("firstLine", firstLine);
			mv.addObject("sumPoint", sumPoint.get("SUM"));
			mv.addObject("myPoint", myPoint);
			return mv;
		}
	
	//회원탈퇴
	@RequestMapping(value = "/member/deleteMember")
	@ResponseBody
	public int mDeleteMember(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		Map<String, Object> member = new HashMap<String, Object>();
		int check = 0;
		
		member = mypageService.myinfoDetail((String)session.getAttribute("MEMBER_ID"));
		if(member.get("MEMBER_PASSWORD").equals(commandMap.get("pw"))) {
			mypageService.mDeleteMember(commandMap.getMap());
			session.invalidate();
			check = 0;
			return check;
						
		}else {
			check = 1;
			return check;
		}
				 
				
	}
	
	@RequestMapping(value="/memberDelete/form")
	public ModelAndView deleteForm(CommandMap map){
		ModelAndView mv = new ModelAndView("modal_memberDelete");
		
		return mv;
		}



}
