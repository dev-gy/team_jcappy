package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface AdminOrderinfoService {
	
	List<Map<String, String>> admin_selectList(OrderinfoVo vo);
	int pay_check(OrderinfoVo vo);
	int delivery_check(OrderinfoVo vo);
	OrderinfoVo detail(OrderinfoVo vo);
	Map<String, String> admin_pre_del(OrderinfoVo vo);
	int detail_pay_check(OrderinfoVo vo);
	int detail_delivery_check(OrderinfoVo vo);
	int admin_order_update(OrderinfoVo vo);
	int request_cancel(OrderinfoVo vo);
	int accept_cancel(OrderinfoVo vo);
	int reject_cancel(OrderinfoVo vo);
	int remake_coupon(OrderinfoVo vo);
	int insert(OrderinfoVo vo, HttpServletRequest req);
}
