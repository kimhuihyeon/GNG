package kh.spring.adminAd;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

@Repository("adminAdDAO")
public class AdminAdDAO extends AbstractDAO {
		
	// 관리자 페이지 광고리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("ad.adList", map); 
	}
		
	// 광고 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> adDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("ad.selectAdDetail", map);
	}
		
	// 관리자 광고 등록
	public void adWrite(Map<String, Object> map) throws Exception {
		insert("ad.adWrite", map);
	}
		
	// 관리자 광고 수정
	public void adModify(Map<String, Object> map) throws Exception {
		update("ad.adModify", map);
	}
	
	// 관리자 광고 삭제
	public void adDelete(Map<String, Object>map) throws Exception {
		delete("ad.adDelete", map);
	}
		
	// 관리자 광고 이름으로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchAdList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("ad.searchAdList", map);
	}
}
