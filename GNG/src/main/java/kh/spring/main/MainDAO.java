package kh.spring.main;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kh.spring.moda.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {

		//핫아이템 12개
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> HotList() throws Exception{
	      return selectList("goods.mainHotItem");
	   }
	   //신상아이템 12개
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> NewList() throws Exception{
	      return selectList("goods.mainNewItem");
	   }
	   
	   //세일기간 자동수정 // 메인접속시
	   public int updateSaleDate() throws Exception{
		  return (int)update("goods.goodsSaleDate");	   
	   }
	   
	   
	   //광고이미지 뽑아오기
	   @SuppressWarnings("unchecked")
	   public List<Map<String, Object>> mainAdImage() throws Exception{
		   return selectList("ad.mainAdImage");
	   }
	   
}