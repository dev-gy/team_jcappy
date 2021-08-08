package jcappy.orderinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderinfoServiceImpl implements OrderinfoService {
	
	@Autowired
	OrderinfoDao orderinfoDao;
	
	@Override
	public List<OrderinfoVo> selectAll(int mno) {
		return orderinfoDao.selectAll(mno);
	}
	
	@Override
	public int insert(OrderinfoVo vo) {
		return orderinfoDao.insert(vo);
	}
	@Override
	public OrderinfoVo selectLastOne(int mno) {
		return orderinfoDao.selectLastOne(mno);
	}
	
	@Override
	public int delete(OrderinfoVo vo) {
		return orderinfoDao.delete(vo);
	}
}
