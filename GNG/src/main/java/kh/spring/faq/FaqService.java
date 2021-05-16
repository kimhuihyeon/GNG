package kh.spring.faq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface FaqService {

	// FAQ 리스트(Admin Page)
	List<Map<String, Object>> faqList(Map<String, Object> map) throws Exception;

	// FAQ 등록
	void faqWrite(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// FAQ 상세보기
	Map<String, Object> faqDetail(Map<String, Object> map) throws Exception;

	// FAQ 수정
	void faqModify(Map<String, Object> map, HttpServletRequest request) throws Exception;

	// FAQ 삭제
	void faqDelete(Map<String, Object> map) throws Exception;

	// 글 제목 검색
	List<Map<String, Object>> searchTitleList(Map<String, Object> map, String isSearch) throws Exception;

	// 글 내용 검색
	List<Map<String, Object>> searchContentList(Map<String, Object> map, String isSearch) throws Exception;

	// FAQ 카테고리별 목록 불러오기
	List<Map<String, Object>> faqList1(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList2(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList3(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList4(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList5(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList6(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList7(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList8(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList9(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> faqList10(Map<String, Object> map) throws Exception;
}
