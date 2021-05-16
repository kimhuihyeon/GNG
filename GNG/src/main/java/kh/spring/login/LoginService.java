package kh.spring.login;

import java.util.Map;

public interface LoginService {
	
	// 로그인 하기
	Map<String, Object> loginGo(Map<String, Object> map) throws Exception;
}
