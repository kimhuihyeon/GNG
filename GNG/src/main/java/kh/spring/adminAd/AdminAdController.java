package kh.spring.adminAd;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kh.spring.moda.CommandMap;

@Controller
public class AdminAdController {

	@Resource(name = "adminAdService")
	private AdminAdService adminAdService;
	
	private int totalCount;
	private Integer posting;
    
	private String filePath = "C:\\Users\\hee97\\Desktop\\SpringApp\\GNG\\src\\main\\webapp\\file\\adFile\\";

//	private String filePath = "C:\\java\\maven-app\\MODA\\src\\main\\webapp\\file\\adFile\\";
	
	// 광고 불러오기
	@RequestMapping(value = "/ad/adList")
	public ModelAndView adList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> adList = adminAdService.adList(commandMap.getMap());
		totalCount = adList.size();
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("adList", adList);
		mv.setViewName("adList");
		
		return mv;
	}
	
	// 광고 등록 폼
	@RequestMapping(value = "/ad/adInsertForm")
	public ModelAndView adInsertForm() throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adInsertForm");
		return mv;
	}
	
	// 광고 등록
	@RequestMapping(value = "/ad/adInsert")
	public ModelAndView adInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		posting = Integer.parseInt(request.getParameter("posting"));
		
		String AD_NUMBER = commandMap.getMap().get("AD_NUMBER").toString();
		System.out.println("AD_NUMBER = " + AD_NUMBER);
		
		MultipartFile AD_IMAGE = multipartHttpServletRequest.getFile("AD_IMAGE");
		
		String fileName = AD_IMAGE.getOriginalFilename();
		String IMAGEExtension = fileName.substring(fileName.lastIndexOf("."));
		String fileName2 = "AD_" + System.currentTimeMillis() + IMAGEExtension;
		
		commandMap.put("AD_IMAGE", fileName2);
		
		adminAdService.adWrite(commandMap.getMap());
		
		File file = new File(filePath + fileName2);
		
		if (file.exists() == false) {
			file.mkdirs();
		}
		AD_IMAGE.transferTo(file);
		
		mv.setViewName("redirect:/ad/adList");
		return mv;
	}
	
	// 광고 상세보기
	@RequestMapping(value = "/ad/adDetail")
	public ModelAndView adDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> ad = adminAdService.adDetail(commandMap.getMap());
		
		mv.addObject("filePath", filePath);
		mv.addObject("ad", ad);
		mv.setViewName("adInsertForm");
		
		return mv;
	}
	
	// 광고 수정
	@RequestMapping(value = "/ad/adModify")
	public ModelAndView adModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		posting = Integer.parseInt(request.getParameter("posting"));
		
		if (multipartHttpServletRequest.getFile("AD_IMAGE1").isEmpty()) {
			commandMap.put("AD_IMAGE", request.getParameter("AD_IMAGE2"));
			adminAdService.adModify(commandMap.getMap());
		} else {
			MultipartFile AD_IMAGE = multipartHttpServletRequest.getFile("AD_IMAGE1");
			commandMap.put("AD_IMAGE", AD_IMAGE.getOriginalFilename());
			adminAdService.adModify(commandMap.getMap());
			
			String fileName = AD_IMAGE.getOriginalFilename();
			File file = new File(filePath + fileName);
			
			String image = request.getParameter("AD_IMAGE2");
			File imageFile = new File(filePath + image);
			
			if (imageFile.isFile()) {
				imageFile.delete();
			}
			
			if (file.exists() == false) {
				file.mkdirs();
			}
			
			AD_IMAGE.transferTo(file);
		}
		
		mv.setViewName("redirect:/ad/adList");
		return mv;
	}
	
	// 광고 삭제
	@RequestMapping(value = "/ad/adDelete")
	public ModelAndView adDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		posting = Integer.parseInt(request.getParameter("posting"));
		
		String image = request.getParameter("image");
		File imageFile = new File(filePath + image);
		
		if (imageFile.isFile()) {
			imageFile.delete();
		}
		
		adminAdService.adDelete(commandMap.getMap());
		mv.setViewName("redirect:/ad/adList");
		return mv;
	}
}