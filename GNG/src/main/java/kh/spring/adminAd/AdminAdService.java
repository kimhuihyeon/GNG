package kh.spring.adminAd;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminAdService {
	
	// 관리자 페이지 광고리스트
	public List<Map<String, Object>> adList(Map<String, Object> map) throws Exception;
	
	// 광고 상세보기
	public Map<String, Object> adDetail(Map<String, Object> map) throws Exception;
	
	// 관리자 광고 등록
	public void adWrite(Map<String, Object> map) throws Exception;
	
	// 관리자 광고 수정
	public void adModify(Map<String, Object> map) throws Exception;
	
	// 관리자 광고 삭제
	public void adDelete(Map<String, Object>map) throws Exception;
	
	// 관리자 광고 이름으로 검색
	public List<Map<String, Object>> searchAdList(Map<String, Object> map) throws Exception;
}
