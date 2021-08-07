package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminOrderinfoServiceImpl implements AdminOrderinfoService {

	@Autowired
	OrderinfoDao dao;

	@Override
	public List<Map<String, String>> admin_selectList(OrderinfoVo vo) {
		
		int totalCount = dao.count(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) {totalPage++;}
		
		vo.setTotCount(totalCount);
		vo.setTotPage(totalPage);

		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totalPage) {endPage = totalPage;}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return dao.admin_selectList(vo);
	}

	@Override
	public int pay_check(OrderinfoVo vo) {
		return dao.pay_check(vo);
	}
	
	@Override
	public int delivery_check(OrderinfoVo vo) {
		return dao.delivery_check(vo);
	}

	@Override
	public OrderinfoVo detail(OrderinfoVo vo) {
		return dao.detail(vo);
	}

	@Override
	public Map<String, String> admin_pre_del(OrderinfoVo vo) {
		return dao.admin_pre_del(vo);
	}
}
