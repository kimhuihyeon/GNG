package kh.spring.main;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.goods.GoodsService;
import kh.spring.moda.CommandMap;
import kh.spring.moda.NewTagService;


@Controller
public class MainController {
	

	@Resource(name = "mainService")
	private MainService mainService;
	
	@Resource(name = "newTagService")
	private NewTagService newTagService;
	
	@Resource(name = "goodsService")
	private GoodsService goodsService;

	

	//메인
	@RequestMapping(value = "/main")
	public ModelAndView mainList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		int sale = mainService.updateSaleDate();
		System.out.println("세일수정된 물품 수 : " + sale);
		
		//인기/신상순 12개 꺼냄
		List<Map<String,Object>> hotList = mainService.HotList();
		List<Map<String,Object>> newList = mainService.NewList();
		 
		//광고이미지리스트
		List<Map<String,Object>> adList = mainService.mainAdImage();

	/*	for(int i=0; i<adList.size(); i++) {
			System.out.println("광고 : " + adList.get(i).get("AD_IMAGE"));
			
		}*/
		
		//뉴태그 서비스사용 (신상이라면 GOODS_NEWDATE 가지고나옴)
		hotList = newTagService.newTageServie(hotList, 10);
		newList = newTagService.newTageServie(newList, 10);
		
		//상품 보유 칼라 출력을 위해 색상 소문자로 변경(이미지매핑위해),(,)로 split하여 스트링배열로 다시담음(COLORKIND)
		hotList = goodsService.colorToLower(hotList);
		newList = goodsService.colorToLower(newList);
		
		
		
		mv.addObject("hotList" , hotList);
		mv.addObject("newList" , newList);
		mv.addObject("adList", adList);
		

		mv.setViewName("main");
		return mv;
	}
	
	// footer에서 문의메일
	@RequestMapping(value = "/footerFunction/email")
	public ModelAndView emailForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/footerFunction/email");
		return mv;
	}

	// footer 이용안내
	@RequestMapping(value = "/footerFunction/info")
	public ModelAndView guide() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("info");
		return mv;
	}
	
	// info 내에서 약관보기
	@RequestMapping(value = "/footerFunction/privercy")
	public ModelAndView privercy() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/footerFunction/privercy");
		return mv;
	}
	
	// 쇼핑몰 이용약관
	@RequestMapping(value = "/footerFunction/ToS")
	public ModelAndView Tos() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/footerFunction/ToS");
		return mv;
	}
}
