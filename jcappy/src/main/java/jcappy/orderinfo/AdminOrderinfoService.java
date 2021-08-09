package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

public interface AdminOrderinfoService {
	
	List<Map<String, String>> admin_selectList(OrderinfoVo vo);
	int pay_check(OrderinfoVo vo);
	int delivery_check(OrderinfoVo vo);
	OrderinfoVo detail(OrderinfoVo vo);
	Map<String, String> admin_pre_del(OrderinfoVo vo);
	public int detail_pay_check(OrderinfoVo vo);
	public int detail_delivery_check(OrderinfoVo vo);
	public int admin_order_update(OrderinfoVo vo);
	public int request_cancel(OrderinfoVo vo);
	public int accept_cancel(OrderinfoVo vo);
	public int reject_cancel(OrderinfoVo vo);
	public int remake_coupon(OrderinfoVo vo);
}
