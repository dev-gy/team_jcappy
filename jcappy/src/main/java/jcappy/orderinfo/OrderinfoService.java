package jcappy.orderinfo;

import java.util.List;

public interface OrderinfoService {
	List<OrderinfoVo> selectAll(OrderinfoVo vo);
	int insert(OrderinfoVo vo);
	OrderinfoVo detailIncludingPrice(OrderinfoVo vo);
	OrderinfoVo selectLastOne(int mno);
	int delete(OrderinfoVo vo);
	OrderinfoVo detail(OrderinfoVo vo);
	int orderCancelupdate(OrderinfoVo vo);
}
