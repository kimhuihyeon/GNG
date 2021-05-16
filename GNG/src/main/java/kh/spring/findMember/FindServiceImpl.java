package kh.spring.findMember;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("findService")
public class FindServiceImpl implements FindService{
	
	@Resource(name="findDAO")
	private FindDAO findDAO;
	

	@Override  //아이디찾기
	public String findId(Map<String, Object> map) throws Exception {
		return findDAO.findId(map);
	}
	

	@Override //아이디에 맞는 이메일불러오기
	public String findEmail(Map<String, Object> map) throws Exception {
		return findDAO.findEmail(map);
	}


	@Override //임의의 숫자로 비밀번호바꾸기
	public void changePw(Map<String, Object> map) throws Exception {
		findDAO.changePw(map);
	}

}
