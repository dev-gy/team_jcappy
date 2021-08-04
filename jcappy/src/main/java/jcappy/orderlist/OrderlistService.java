package jcappy.orderlist;

import java.util.List;

public interface OrderlistService {
	List<OrderlistVo> selectAll(OrderlistVo vo);
	int insert(OrderlistVo vo);
}
