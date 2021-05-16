package kh.spring.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{
	
	//로그인 정보 불러오기
	@SuppressWarnings("unchecked")
	public Map<String,Object> selectId(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("member.loginGo", map);
	}
}
