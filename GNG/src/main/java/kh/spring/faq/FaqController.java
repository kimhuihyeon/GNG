package kh.spring.faq;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;

@Controller
public class FaqController {

	@Resource(name = "faqService")
	private FaqService faqService;
	
	@RequestMapping(value = "/faq/faqList")
	public ModelAndView faqList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		
		//카테고리별 리스트
		List<Map<String, Object>> list1 = faqService.faqList1(commandMap.getMap());  //카테고리별 리스트 
		List<Map<String, Object>> list2 = faqService.faqList2(commandMap.getMap());
		List<Map<String, Object>> list3 = faqService.faqList3(commandMap.getMap());
		List<Map<String, Object>> list4 = faqService.faqList4(commandMap.getMap());
		List<Map<String, Object>> list5 = faqService.faqList5(commandMap.getMap());
		List<Map<String, Object>> list6 = faqService.faqList6(commandMap.getMap());
		List<Map<String, Object>> list7 = faqService.faqList7(commandMap.getMap());
		List<Map<String, Object>> list8 = faqService.faqList8(commandMap.getMap());
		List<Map<String, Object>> list9 = faqService.faqList9(commandMap.getMap());
		List<Map<String, Object>> list10 = faqService.faqList10(commandMap.getMap());
		
		
		mv.addObject("list1", list1);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("list4", list4);
		mv.addObject("list5", list5);
		mv.addObject("list6", list6);
		mv.addObject("list7", list7);
		mv.addObject("list8", list8);
		mv.addObject("list9", list9);
		mv.addObject("list10", list10);
		
		mv.setViewName("faqList");
		
		return mv;
	}

}
