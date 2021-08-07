package jcappy.orderlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderlistServiceImpl implements OrderlistService {
	
	@Autowired
	OrderlistDao orderinfoDao;
	
	@Override
	public List<OrderlistVo> selectAll(OrderlistVo vo) {
		return orderinfoDao.selectAll(vo);
	}
	@Override
	public int insert(OrderlistVo vo) {
		return orderinfoDao.insert(vo);
	}
}
