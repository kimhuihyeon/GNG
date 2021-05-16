package kh.spring.faq;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.moda.GoodsImageUtils;

@Service("faqService")
public class FaqServiceImpl implements FaqService {

	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;

	@Resource(name = "faqDAO")
	private FaqDAO faqDAO;

	// 전체 리스트(Admin Page)
	@Override
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception {
		return faqDAO.faqList(map);
	}

	// 상세보기
	@Override
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		faqDAO.updateHitCnt(map);
		Map<String, Object> faqDetail = faqDAO.faqDetail(map);
		return faqDetail;
	}
	
	// 글쓰기
	@Override
	public void faqWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		faqDAO.faqWrite(map, request);
		
		List<Map<String, Object>> faqImage = goodsImageUtils.faqImage(map, request);
		
		if(faqImage.size() > 0) {
			for(int i = 0; i < faqImage.size(); i ++) {
				faqDAO.faqImage(faqImage.get(i));
			}
		}
	}

	// 수정하기
	@Override
	public void faqModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		faqDAO.faqModify(map);
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		if(multipartHttpServletRequest.getFile("FAQ_IMAGE1").getSize() > 0) {
			map = goodsImageUtils.faqModifyImage(map, request);
			faqDAO.faqImage(map);
		}
		
	}

	// 삭제하기
	@Override
	public void faqDelete(Map<String, Object> map) throws Exception {
		Map<String, Object> image = new HashMap<String, Object>();
		image = faqDAO.faqDetail(map);
		goodsImageUtils.faqImageDelete(image);
		
		faqDAO.faqDelete(map);
	}

	// 글 제목 검색
	@Override
	public List<Map<String, Object>> searchTitleList(Map<String, Object> map, String isSearch) {
		return faqDAO.searchTitleList(map, isSearch);
	}

	// 글 내용 검색
	@Override
	public List<Map<String, Object>> searchContentList(Map<String, Object> map, String isSearch) {
		return faqDAO.searchContentList(map, isSearch);
	}

	// 카테고리 리스트
	@Override
	public List<Map<String, Object>> faqList1(Map<String, Object> map) throws Exception {
		return faqDAO.faqList1(map);
	}

	@Override
	public List<Map<String, Object>> faqList2(Map<String, Object> map) throws Exception {
		return faqDAO.faqList2(map);
	}

	@Override
	public List<Map<String, Object>> faqList3(Map<String, Object> map) throws Exception {
		return faqDAO.faqList3(map);
	}

	@Override
	public List<Map<String, Object>> faqList4(Map<String, Object> map) throws Exception {
		return faqDAO.faqList4(map);
	}

	@Override
	public List<Map<String, Object>> faqList5(Map<String, Object> map) throws Exception {
		return faqDAO.faqList5(map);
	}

	@Override
	public List<Map<String, Object>> faqList6(Map<String, Object> map) throws Exception {
		return faqDAO.faqList6(map);
	}

	@Override
	public List<Map<String, Object>> faqList7(Map<String, Object> map) throws Exception {
		return faqDAO.faqList7(map);
	}

	@Override
	public List<Map<String, Object>> faqList8(Map<String, Object> map) throws Exception {
		return faqDAO.faqList8(map);
	}

	@Override
	public List<Map<String, Object>> faqList9(Map<String, Object> map) throws Exception {
		return faqDAO.faqList9(map);
	}

	@Override
	public List<Map<String, Object>> faqList10(Map<String, Object> map) throws Exception {
		return faqDAO.faqList10(map);
	}
}
