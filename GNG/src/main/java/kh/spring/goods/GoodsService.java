package kh.spring.goods;

import java.util.List;
import java.util.Map;

public interface GoodsService {

	// 카테고리별 (대분류) 상품 정렬
	public List<Map<String, Object>> goodsCategory(Map<String, Object> map) throws Exception;
	
	//ajax 동적쿼리(카테고리 대분류별)
	public List<Map<String, Object>> sortGoodsCategory(Map<String, Object> map) throws Exception;
	
	//dao 동작x 칼라종류 뽑아주는 메서드
	public List<Map<String, Object>> colorToLower(List<Map<String, Object>> goodsList) throws Exception;

    //소분류케타고리	
	public List<Map<String, Object>> goodsSubCategory(Map<String, Object> map) throws Exception;
	   
    public List<Map<String, Object>> BestgoodsSubCategory(Map<String, Object> map) throws Exception;
	
	
	
	//*상세보기시작*//
	//조회수증가
	public int goodsCountUp(Map<String, Object> map) throws Exception;
	//상품정보가져오기
	public List<Map<String, Object>> selectOneGoods(Map<String, Object> map) throws Exception;
	//상품이미지가져오기
	public List<Map<String, Object>> selectImage(Map<String, Object> map) throws Exception;
	//구매확인(샀으면 리뷰작성가능)
	public int checkBuy(Map<String, Object> map) throws Exception;
	//코디상품
	public List<Map<String, Object>> selectRelatedGoods(Map<String, Object> map) throws Exception;
	//qna가져오기
	public List<Map<String, Object>> selectQNA(Map<String, Object> map) throws Exception;
	//리뷰가져오기
	public List<Map<String, Object>> selectReview(Map<String, Object> map) throws Exception;
	//리뷰평점내기
	public int reviewScore(Map<String, Object> map) throws Exception;
	//*상세보기끝//

	//서치
	public List<Map<String, Object>> goodsSearchList(Map<String, Object> map) throws Exception;

	//칼라서치
	public List<Map<String, Object>> goodsColorSearchList(Map<String, Object> map) throws Exception;
	
	//사이즈
    public List<Map<String, Object>> goodsSizeSearchList(Map<String, Object> map) throws Exception;
	
    
	public List<Map<String,Object>> selectCategoryCount(String category1) throws Exception;
	
}
