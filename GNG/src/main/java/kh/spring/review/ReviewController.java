package kh.spring.review;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;

@Controller
public class ReviewController {

	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	//리뷰 폼으로 이동
	@RequestMapping(value="/review/reviewForm")
	public ModelAndView reviewForm(){
		ModelAndView mv=new ModelAndView("goods/review/modal_reviewForm");
		return mv;
	}
	
	//리뷰 등록
	@RequestMapping(value="/reviewWrite")
	public ModelAndView reviewWrite(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		
		ModelAndView mv=new ModelAndView("redirect:goodsDetail?GOODS_NUMBER="+commandMap.get("GOODS_NUMBER"));
		commandMap.getMap().put("MEMBER_NUMBER", session.getAttribute("MEMBER_NUMBER").toString());
		System.out.println("파람" + commandMap.getMap());
		reviewService.reviewWrite(commandMap.getMap(),request);
		reviewService.reviewPoint(commandMap.getMap());
		return mv;
	}
	
}
