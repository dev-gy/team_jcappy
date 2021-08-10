package jcappy.orderinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcappy.coupon.CouponDao;
import jcappy.coupon.CouponVo;
import jcappy.orderlist.OrderlistDao;
import jcappy.orderlist.OrderlistVo;

@Service
public class OrderinfoServiceImpl implements OrderinfoService {
	
	@Autowired
	OrderinfoDao orderinfoDao;
	
	@Override
	public List<OrderinfoVo> selectAll(OrderinfoVo vo) {
		// 페이징 관련 값 세팅
		vo.setStype("mno");
		vo.setSval(Integer.toString(vo.getMno()));
		int totCount = orderinfoDao.userCount(vo); // 총갯수
		// 총페이지수
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		// 시작페이지
		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totPage) {
			endPage = totPage;
		}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return orderinfoDao.selectAll(vo);
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

	@Override
	public OrderinfoVo detail(OrderinfoVo vo) {
		return orderinfoDao.detail(vo);
	}
	
	@Override
	public int cancelUpdate(OrderinfoVo vo) {
		return orderinfoDao.cancelUpdate(vo);
	}
}
