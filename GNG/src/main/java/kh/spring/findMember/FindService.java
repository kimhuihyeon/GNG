package kh.spring.findMember;

import java.util.Map;

public interface FindService {
	// 아이디 찾기 폼으로 이동

	// 입력한 정보가 맞으면 아이디 불러옴(아이디 4자공개 + 나머지는 *로 처리)

	// 비밀번호 찾기 폼으로 이동

	// 이메일로 임시 비밀번호 전송
	
	// DB에서 이름과 이메일에 해당되는 아이디 가져오기
	String findId(Map<String, Object> map) throws Exception;

	// DB에서 아이디에 맞는 이메일가져오기
	String findEmail(Map<String, Object> map) throws Exception;
	
	// DB에서 임의의 숫자로 비밀번호 바꾸기
	void changePw(Map<String, Object> map) throws Exception;
}
