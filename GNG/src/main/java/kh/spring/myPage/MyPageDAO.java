package kh.spring.myPage;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

//moda
@Repository("mypageDAO")
public class MyPageDAO extends AbstractDAO {

	 int selectOtoCount(String mem_num) throws Exception{
		 return (int)selectOne("mypage.selectOtoCount", mem_num);
	 }
	 
	 int selectBuyCount(String mem_num) throws Exception{
		 return (int)selectOne("mypage.selectBuyCount", mem_num);
	 }
	 int selectExCount(String mem_num) throws Exception{
		 return (int)selectOne("mypage.selectExCount", mem_num);
	 }
	 int selectReCount(String mem_num) throws Exception{
		 return (int)selectOne("mypage.selectReCount", mem_num);
	 }
	 String selectTotalMoney(String mem_num) throws Exception{
		 return (String)selectOne("mypage.selectTotalMoney", mem_num);
	 }
	 
	 int checkTotalMoney(String mem_num) throws Exception{
		 return (int)selectOne("mypage.checkTotalMoney", mem_num);
	 }
	//개인 정보 수정
	 void updateMyinfo(Map<String, Object> map) throws Exception{
		 update("mypage.updateMyinfo", map);
		 }
	 
	 void changeMypassword(Map<String, Object> map) throws Exception{
		 update("mypage.changePassword", map);
	 }
	 
	 void cancle_order(Map<String, Object> map) throws Exception{
		 update("mypage.cancelOrder", map);
	 }
	 
	 void confirm_order(Map<String, Object> map) throws Exception{
		 update("mypage.confirmOrder", map);
	 }
	 void updateReturn(Map<String, Object> map) throws Exception{
		 update("mypage.updateReturn", map);
	 }
	 void updateExchange(Map<String, Object> map) throws Exception{
		 update("mypage.updateExchange", map);
	 }
	 
	 void insertCancelList(Map<String, Object> map) throws Exception{
		 insert("mypage.insertCancelList", map);
	 }
	 //마이페이지 정보 불러오기
	 @SuppressWarnings("unchecked")
	 Map<String, Object> myinfoDetail(String id) throws Exception{
		 return (Map<String, Object>)selectOne("mypage.myinfoDetail", id);
	 }
	 
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> myreviewList(Map<String, Object> map) throws Exception{
		return (List<Map<String,Object>>)selectList("mypage.myreviewList", map);
	 }
	 
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectReturnList(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectReturnList", mem_num);
	 }
	 
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectExchangeList(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectExchangeList", mem_num);
	 }
	 
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectOtoList(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectOtoList", mem_num);
	 }
	  
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectOtoComplete(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectOtoComplete", mem_num);
	 }
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectReviewList(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectReviewList", mem_num);
	 }
	 
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectOrderlist(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectOrderList", mem_num);
	 }
	
	 	// qna 새글 알람
	@SuppressWarnings(value = "unchecked")
	public int qnaNewAlarm(Map<String, Object> map) throws Exception {
		return (int) selectOne("mypage.qnaNewAlarm", map);
	}
	
	public void insertOneToOne(Map<String, Object> map) throws Exception {
		insert("mypage.insertOneToOne", map);
	}
	
	public void updateRepState(Map<String, Object> map) throws Exception {
		update("mypage.updateRepState", map);
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnalistById(String MEMBER_NUMBER) throws Exception {
		return (List<Map<String, Object>>) selectList("mypage.qnalistByNumber", MEMBER_NUMBER);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnalistById2(String MEMBER_NUMBER) throws Exception {
		return (List<Map<String, Object>>) selectList("mypage.qnalistByNumber2", MEMBER_NUMBER);
	}
	
	//전체 적립금 금액 계산
	@SuppressWarnings("unchecked")
	public Map<String, Object> sumPoint(Map<String,Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.sumPoint",map);
	}
	
	//나의 적립금 내역 불러오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> myPoint(Map<String, Object> map) throws Exception{
		return selectList("mypage.myPoint", map);
	}

	//비회원 주문내역수정
    void nocancle_order(Map<String, Object> map) throws Exception{
		 update("mypage.nocancelOrder", map);
	 }
	 /*@SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectNoOrderlist(String mem_num) throws Exception{
		 return (List<Map<String, Object>>)selectList("mypage.selectNoOrderList", mem_num);
	 }*/
	 void noconfirm_order(Map<String, Object> map) throws Exception{
		 update("mypage.noConfirmOrder", map);
	 }
     public void mDeleteMember(Map<String, Object> map) throws Exception {
         delete("mypage.mDeleteMember", map);
      }

	 
	 String selectMyPageTotal(Map<String, Object> map) throws Exception{
		 return (String)selectOne("mypage.selectMyPageTotal", map);
	 }
     
}