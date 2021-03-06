package kh.spring.notify;

import java.util.List;
import java.util.Map;

public interface NotifyService {

	// 공지사항 목록
	public List<Map<String, Object>> notifyList(Map<String, Object> map) throws Exception;
	
	// 공지사항 상세보기
	public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception;
	
	// 제목으로 공지사항 검색
	public List<Map<String, Object>> notifyTitleSearch(Map<String, Object> map) throws Exception;
		
	// 내용으로 공지사항 검색
	public List<Map<String, Object>> notifyContentSearch(Map<String, Object> map) throws Exception;
}
