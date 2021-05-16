package kh.spring.adminAd;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.spring.moda.GoodsImageUtils;

@Service("adminAdService")
public class AdminAdServiceImpl implements AdminAdService {

	@Resource(name = "adminAdDAO")
	private AdminAdDAO adminAdDAO;
	
	@Resource(name = "goodsImageUtils")
	private GoodsImageUtils goodsImageUtils;
		
	// 관리자 페이지 광고리스트
	@Override
	public List<Map<String, Object>> adList(Map<String, Object> map) throws Exception {
		return adminAdDAO.adList(map);
	}
		
	// 광고 상세보기
	@Override
	public Map<String, Object> adDetail(Map<String, Object> map) throws Exception {
		return adminAdDAO.adDetail(map);
	}
		
	// 관리자 광고 등록
	@Override
	public void adWrite(Map<String, Object> map) throws Exception {
		adminAdDAO.adWrite(map);
	}
		
	// 관리자 광고 수정
	@Override
	public void adModify(Map<String, Object> map) throws Exception {
		adminAdDAO.adModify(map);	
	}
		
	// 관리자 광고 삭제
	@Override
	public void adDelete(Map<String, Object>map) throws Exception {
		adminAdDAO.adDelete(map);
	}
		
	// 관리자 광고 이름으로 검색
	@Override
	public List<Map<String, Object>> searchAdList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) adminAdDAO.searchAdList(map);
	}
}
