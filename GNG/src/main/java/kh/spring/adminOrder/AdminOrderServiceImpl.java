package kh.spring.adminOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService {

	@Resource(name = "adminOrderDAO")
	private AdminOrderDAO adminOrderDAO;

	// 전체 주문리스트
	public List<Map<String, Object>> allOrderList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allOrderList(map);
	}

	// 결제 상태 변경
	public void updateGoodsPayState(Map<String, Object> map) throws Exception {
		adminOrderDAO.updateGoodsPayState(map);
	}

	// 상품 구매확정/주문취소/교환,반품상태 변경
	public void updateGoodsState(Map<String, Object> map) throws Exception {
		adminOrderDAO.updateGoodsState(map);
	}

	// 배송상태변경
	public void updateDeliveryState(Map<String, Object> map) throws Exception {
		adminOrderDAO.updateDeliveryState(map);
	}

	// 주문삭제
	public void orderDelete(Map<String, Object> map) throws Exception {
		adminOrderDAO.orderDelete(map);
	}

	// 주문내역 수정폼(상세보기)
	public List<Map<String, Object>> orderDetail(Map<String, Object> map) throws Exception {
		return adminOrderDAO.orderDetail(map);
	}

	// 검색
	public List<Map<String, Object>> adminOrderSearch0(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearch0(map);
	}

	public List<Map<String, Object>> adminOrderSearch1(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearch1(map);
	}

	public List<Map<String, Object>> adminOrderSearch2(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearch2(map);
	}

	public List<Map<String, Object>> adminOrderSearch3(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearch3(map);
	}

	public List<Map<String, Object>> adminOrderSearch4(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearch4(map);
	}

	public List<Map<String, Object>> adminOrderSearch5(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adminOrderSearch5(map);
	}

	// 해당 주문에 대한 캔슬있나 확인
	public Map<String, Object> confirmCancel(Map<String, Object> map) throws Exception {
		return adminOrderDAO.confirmCancel(map);
	}

	// 주문취소 목록
	public List<Map<String, Object>> allCancelList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allCancelList(map);
	}

	// 주문반품/교환목록
	public List<Map<String, Object>> allExchangeList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allExchangeList(map);
	}

	// 주문취소 검색
	public List<Map<String, Object>> allCancelSearch1(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allCancelSearch1(map);
	}

	public List<Map<String, Object>> allCancelSearch2(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allCancelSearch2(map);
	}

	public List<Map<String, Object>> allCancelSearch3(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allCancelSearch3(map);
	}

	public List<Map<String, Object>> allCancelSearch4(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allCancelSearch4(map);
	}

	// 교환/반품 검색
	public List<Map<String, Object>> allExchangeSearch1(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allExchangeSearch1(map);
	}

	public List<Map<String, Object>> allExchangeSearch2(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allExchangeSearch2(map);
	}

	public List<Map<String, Object>> allExchangeSearch3(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allExchangeSearch3(map);
	}

	public List<Map<String, Object>> allExchangeSearch4(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allExchangeSearch4(map);
	}

	public List<Map<String, Object>> allExchangeSearch5(Map<String, Object> map) throws Exception {
		return adminOrderDAO.allExchangeSearch5(map);
	}
}
