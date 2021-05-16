package kh.spring.notify;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

@Repository("notifyDAO")
public class NotifyDAO extends AbstractDAO {
	
	// 공지사항 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notifyList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notify.notifyList", map); 
	}
	
	// 공지사항 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("notify.notifyDetail", map);
	}
	
	// 조회수 증가
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("notify.notifyUpdateHitCnt", map);
	}
	
	// 제목으로 공지사항 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notifyTitleSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notify.notifySearchTitleList", map);
	}
		
	// 내용으로 공지사항 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> notifyContentSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("notify.notifySearchContentList", map);
	}
}
