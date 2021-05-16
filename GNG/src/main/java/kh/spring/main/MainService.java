package kh.spring.main;

import java.util.List;
import java.util.Map;

public interface MainService {

	public List<Map<String, Object>> HotList() throws Exception;
	
	public List<Map<String, Object>> NewList() throws Exception;

	public int updateSaleDate() throws Exception;
	
	public List<Map<String, Object>> mainAdImage() throws Exception;
}
