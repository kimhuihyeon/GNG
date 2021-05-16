package kh.spring.adminMember;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO {
	
	// 회원 전체목록 불러오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminMember.selectMemberList", map);
	}
	
	// 회원 상세정보
	@SuppressWarnings("unchecked")
	public Map<String, Object> memberDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminMember.selectMemberDetail", map);
	}
	
	// 회원 정보 수정
	public void modifyMember(Map<String, Object> map) throws Exception {
		update("adminMember.updateMember", map);
	}
	
	// 회원강제 탈퇴
	public void deleteMember(Map<String, Object> map) throws Exception {
		delete("adminMember.deleteMember", map);
	}
	
	// 회원 아이디로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberId(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminMember.searchMemberId", map);
	}
	
	// 회원 이름으로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberName(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminMember.searchMemberName", map);
	}
	
	// 회원 전화번호로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberPhone(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminMember.searchMemberPhone", map);
	}
	
	// 회원 이메일로 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> searchMemberEmail(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminMember.searchMemberEmail", map);
	}
	
	// 회원 포인트 수정
	public void updatePoint(Map<String, Object> map) throws Exception {
		update("adminMember.updatePoint", map);
	}
}