package kh.spring.myPage;

import java.util.List;
import java.util.Map;

public interface MyPageService {
	
	int selectOtoCount(String mem_num) throws Exception;
	// 개인 정보 수정
	int selectBuyCount(String mem_num) throws Exception;
	
	int selectExCount(String mem_num) throws Exception;
	
	int selectReCount(String mem_num) throws Exception;
	
	String selectTotalMoney(String mem_num) throws Exception;
	
	int checkTotalMoney(String mem_num) throws Exception;
	
	void updateMyinfo(Map<String, Object> map) throws Exception;
	// 비밀번호 변경
	void changeMypassword(Map<String, Object> map) throws Exception;
	// 내정보 불러오기
	void cancel_order(Map<String, Object> map) throws Exception;
	
	void confirm_order(Map<String, Object> map )throws Exception;
	
	void updateReturn(Map<String, Object> map) throws Exception;
	
	void updateExchange(Map<String, Object> map) throws Exception;
	
	void insertCancelList(Map<String, Object> map) throws Exception;
	
	Map<String, Object> myinfoDetail(String id) throws Exception;
	
	List<Map<String, Object>> selectOtoList(String mem_num) throws Exception;
	
	List<Map<String, Object>>selectOtoComplete(String mem_num) throws Exception;
	
	List<Map<String, Object>>selectReviewList(String mem_num) throws Exception;
	
	List<Map<String, Object>>selectOrderList(String mem_num) throws Exception;
	
	List<Map<String, Object>>selectReturnList(String mem_num) throws Exception;
	
	List<Map<String, Object>>selectExchangeList(String mem_num) throws Exception;
	
	void insertOneToOne(Map<String, Object> map) throws Exception;
	
	void updateRepState(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> qnalistById(String id) throws Exception;
	
	List<Map<String, Object>> qnalistById2(String id) throws Exception;
	
	// 전체 적립금 금액 계산
	public Map<String,Object> sumPoint(Map<String, Object> map) throws Exception;
	
	//나의 적립금 내역 불러오기
	public List<Map<String, Object>> myPoint(Map<String, Object> map) throws Exception;
	
	int qnaNewAlarm(Map<String, Object> map) throws Exception;
	
	void nocancle_order(Map<String, Object> map) throws Exception;
	
	void noconfirm_order(Map<String, Object> map )throws Exception;
	/*List<Map<String, Object>>selectNoOrderList(String mem_num) throws Exception;*/
    public void mDeleteMember(Map<String, Object> map) throws Exception;
    
    String selectMyPageTotal(Map<String, Object> map) throws Exception;

}
