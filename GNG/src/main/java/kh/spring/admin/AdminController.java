package kh.spring.admin;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.faq.FaqService;
import kh.spring.moda.CommandMap;
import kh.spring.paging.Paging;
import kh.spring.review.ReviewService;

@Controller
public class AdminController {

	// 검색, 페이징
	private int searchNum;
	private String isSearch;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	private String filePath = "C:\\Users\\hee97\\Desktop\\SpringApp\\GNG\\src\\main\\webapp\\file\\faqFile\\";

	@Resource(name = "reviewService")
	private ReviewService reviewService;

	@Resource(name = "faqService")
	private FaqService faqService;

	@RequestMapping(value = "/admin/adminPage")
	public String list() {
		return "adminForm";
	}

	// FAQ 전체 리스트
	@RequestMapping(value = "/admin/faqAdmin")
	public ModelAndView faqList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> list = faqService.faqList(commandMap.getMap());

		
		Map<String, Object> isSearchMap = new HashMap<String, Object>();
		
		isSearch = request.getParameter("isSearch");
		

		if (isSearch != null) {
		
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			isSearchMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 글제목
				list = faqService.searchTitleList(isSearchMap, isSearch);
			} else if (searchNum == 1) { // 글내용
				list = faqService.searchContentList(isSearchMap, isSearch);
			}
			
			totalCount = list.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqAdmin", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("list", list);
			mv.setViewName("faqAdminList");

			return mv;

		} else {
			totalCount = list.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "faqAdmin");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("list", list);
			mv.setViewName("faqAdminList");

			return mv;
		}
	}

	// FAQ 등록 폼
	@RequestMapping(value = "/admin/faqAdminForm")
	public ModelAndView faqWriteForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("faqAdminForm");
		return mv;
	}

	// FAQ 등록
	@RequestMapping(value = "/admin/faqWrite")
	public ModelAndView faqWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqAdmin");

		faqService.faqWrite(commandMap.getMap(), request);

		return mv;
	}

	// FAQ 수정 폼 이동
	@RequestMapping(value = "/admin/faqAdminModifyForm")
	public ModelAndView faqModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		Map<String, Object> faqDetail = faqService.faqDetail(commandMap.getMap());
		mv.addObject("faqDetail", faqDetail);
		mv.setViewName("faqAdminModify");

		return mv;
	}

	// FAQ 수정
	@RequestMapping(value = "/admin/faqAdminModify")
	public ModelAndView faqModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqAdmin");

		faqService.faqModify(commandMap.getMap(), request);

		mv.addObject("FAQ_NUMBER", commandMap.get("FAQ_NUMBER"));

		return mv;
	}

	// FAQ 삭제
	@RequestMapping(value = "/admin/faqAdminDelete")
	public ModelAndView faqDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/faqAdmin");

		Map<String, Object> deleteFaq = faqService.faqDetail(commandMap.getMap());

		if (deleteFaq.get("FAQ_IMAGE1") != null) {
			File removeFile = new File(filePath + deleteFaq.get("FAQ_IMAGE1"));
			removeFile.delete();
		}

		faqService.faqDelete(commandMap.getMap());

		return mv;
	}

	// 리뷰 관리자 리스트
	@RequestMapping(value = "/admin/reviewAdmin")
	public ModelAndView reviewList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> list = reviewService.reviewList(commandMap.getMap());

		
		Map<String, Object> isSearchMap = new HashMap<String, Object>();
		
		isSearch = request.getParameter("isSearch");

		if (isSearch != null) {
		
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			isSearchMap.put("isSearch", isSearch);

			if (searchNum == 0) { // 회원ID
				list = reviewService.searchReviewList0(isSearchMap);
			} else if (searchNum == 1) { // 상품이름
				list = reviewService.searchReviewList1(isSearchMap);
			} else if (searchNum == 2) { // 상품번호
				list = reviewService.searchReviewList2(isSearchMap);
			}

			totalCount = list.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "reviewAdmin", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("list", list);
			mv.setViewName("reviewAdmin");

			return mv;

		} else {
			totalCount = list.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "reviewAdmin");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);

			mv.addObject("list", list);
			mv.setViewName("reviewAdmin");

			return mv;
		}
	}

	// 리뷰 삭제
	@RequestMapping(value = "/admin/reviewAdminDelete")
	public ModelAndView reviewDelete(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView();

		reviewService.reviewDelete(commandMap.getMap());
		mv.setViewName("redirect:/admin/reviewAdmin");

		return mv;
	}
	
	 

}
