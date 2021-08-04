package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

public interface AdminOrderinfoService {
	
	List<Map<String, String>> admin_selectList(OrderinfoVo vo);
	int pay_check(OrderinfoVo vo);
	int delivery_check(OrderinfoVo vo);
}
