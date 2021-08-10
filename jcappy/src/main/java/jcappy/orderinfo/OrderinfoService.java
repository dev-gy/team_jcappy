package jcappy.orderinfo;

import java.util.List;

public interface OrderinfoService {
	List<OrderinfoVo> selectAll(int mno);
	int insert(OrderinfoVo vo);
	OrderinfoVo selectLastOne(int mno);
	int delete(OrderinfoVo vo);
	OrderinfoVo detail(OrderinfoVo vo);
	int cancelUpdate(OrderinfoVo vo);
}
