package kh.spring.notify;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;
import kh.spring.paging.Paging;

@Controller
public class NotifyController {

	int totalCount;
	private int searchNum;
	private String isSearch;
	
	private int currentPage;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private Paging page;
	
	
	@Resource(name = "notifyService")
	private NotifyService notifyService;
	
	@RequestMapping(value = "/notify/notifyList")
	public ModelAndView notifyList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> notifyList = notifyService.notifyList(commandMap.getMap());
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		isSearch = request.getParameter("isSearch");
		
		if (isSearch != null) {
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			if (searchNum == 0) {
				notifyList = notifyService.notifyTitleSearch(commandMap.getMap());
			} else if (searchNum == 1) {
				notifyList = notifyService.notifyContentSearch(commandMap.getMap());
			}
			
			totalCount = notifyList.size();
			page = new Paging(currentPage, totalCount, blockCount, blockPage, "notifyList", searchNum, isSearch);
			pagingHtml = page.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;
			
			notifyList = notifyList.subList(page.getStartCount(), lastCount);
			
			mv.addObject("isSearch", isSearch);
			mv.addObject("searchNum", searchNum);
			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("notifyList", notifyList);
			mv.setViewName("notifyList");
			
			return mv;
		} else {
			totalCount = notifyList.size();

			page = new Paging(currentPage, totalCount, blockCount, blockPage, "notifyList");
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			notifyList = notifyList.subList(page.getStartCount(), lastCount);

			mv.addObject("totalCount", totalCount);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("currentPage", currentPage);
			mv.addObject("notifyList", notifyList);
			mv.setViewName("notifyList");

			return mv;
		}
	}
	
	@RequestMapping(value = "/notify/notifyDetail")
	public ModelAndView notifyDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> notifyDetail = notifyService.notifyDetail(commandMap.getMap());
		
		mv.addObject("notifyDetail", notifyDetail);
		mv.setViewName("notifyDetail");
		
		return mv;
	}
}