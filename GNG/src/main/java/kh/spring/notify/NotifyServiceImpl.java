package kh.spring.notify;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("notifyService")
public class NotifyServiceImpl implements NotifyService {

	@Resource(name = "notifyDAO")
	private NotifyDAO notifyDAO;
	
	// 공지사항 목록
	@Override
	public List<Map<String, Object>> notifyList(Map<String, Object> map) throws Exception {
		return notifyDAO.notifyList(map);
	}
		
	// 공지사항 상세보기
	@Override
	public Map<String, Object> notifyDetail(Map<String, Object> map) throws Exception {
		notifyDAO.updateHitCnt(map);
		Map<String, Object> notifyDetail = notifyDAO.notifyDetail(map);
		return notifyDetail;
	}
	
	// 제목으로 공지사항 검색
	@Override
	public List<Map<String, Object>> notifyTitleSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) notifyDAO.notifyTitleSearch(map);
	}
		
	// 내용으로 공지사항 검색
	@Override
	public List<Map<String, Object>> notifyContentSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) notifyDAO.notifyContentSearch(map);
	}
}
