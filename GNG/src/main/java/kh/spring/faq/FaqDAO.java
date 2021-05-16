package kh.spring.faq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

@Repository("faqDAO")
public class FaqDAO extends AbstractDAO {

	//전체 리스트(Admin Page)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList", map);
	}
	
	//FAQ 등록
	public void faqWrite(Map<String, Object> map, HttpServletRequest request) throws Exception {
		insert("faq.faqWrite", map);
	}
	
	//FAQ 조회수
	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("faq.updateHitCnt", map);
	}
	
	//FAQ 상세보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> faqDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("faq.faqDetail", map);
	}
	
	//FAQ 수정
	public void faqModify(Map<String, Object> map) throws Exception {
		update("faq.faqModify", map);
	}
	
	//FAQ 삭제
	public void faqDelete(Map<String, Object> map) throws Exception {
		delete("faq.faqDelete", map);
	}
	
	//글 제목 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchTitleList(Map<String, Object> map, String isSearch) {
		return (List<Map<String, Object>>) searchTitleList("faq.searchTitleList", map, isSearch);
	}
	
	//글 내용 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchContentList(Map<String, Object> map, String isSearch) {
		return (List<Map<String, Object>>) searchContentList("faq.searchContentList", map, isSearch);
	}
	
	//FAQ 이미지 등록
	public void faqImage(Map<String, Object> map) throws Exception {
		update("faq.faqImage1", map);
	}
	
	//카테고리 리스트
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList1(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList1", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList2(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList2", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList3(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList3", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList4(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList4", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList5(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList5", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList6(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList6", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList7(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList7", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList8(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList8", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList9(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList9", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> faqList10(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("faq.faqList10", map);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
