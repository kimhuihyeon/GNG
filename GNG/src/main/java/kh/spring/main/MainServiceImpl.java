package kh.spring.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("mainService")
public class MainServiceImpl implements MainService{
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;
	
	@Override
	public List<Map<String, Object>> HotList() throws Exception {
		
		return mainDAO.HotList();
	}

	@Override
	public List<Map<String, Object>> NewList() throws Exception {

		return mainDAO.NewList();
	}

	@Override
	public int updateSaleDate() throws Exception {
		
		return mainDAO.updateSaleDate();
	}

	@Override
	public List<Map<String, Object>> mainAdImage() throws Exception {
		
		return mainDAO.mainAdImage();
	}
	
}