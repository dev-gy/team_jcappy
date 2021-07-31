package jcappy.orderinfo;

import java.util.List;

public interface OrderinfoService {
	List<OrderinfoVo> selectAll();
	int insert(OrderinfoVo vo);
	OrderinfoVo selectLastOne();
	int delete(OrderinfoVo vo);
}
