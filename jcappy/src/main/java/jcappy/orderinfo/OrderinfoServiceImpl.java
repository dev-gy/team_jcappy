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
	@Autowired
	CouponDao couponDao;
	@Autowired
	OrderlistDao orderlistDao;
	
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

	@Override
	public OrderinfoVo detail(OrderinfoVo vo) {
		OrderinfoVo oiVo = orderinfoDao.detail(vo);
		OrderlistVo olVo = new OrderlistVo();
		olVo.setOno(vo.getOno());
		List<OrderlistVo> olList = orderlistDao.selectAll(olVo);
		
		// 주문목록의 최종결제금액 구해서 추가
		int resultPrice = 0;
		
		int couponPrice = 0;	// 해상 주문당시의 쿠폰 데이터 구해오기
		if (oiVo.getCno() != 0) {
			CouponVo cVo = new CouponVo();
			cVo.setCno(oiVo.getCno());
			couponPrice = couponDao.detail(cVo).getCprice();
		}
		
		int sum = 0;
		for (int i = 0; i < olList.size(); i++) {	// 상품목록의 통합가격을 모두 더한 후 쿠폰값을 빼서 최종 결제금액 구하기
			sum += olList.get(i).getTotal_price();
		}
		resultPrice = sum - couponPrice;
		
		oiVo.setResult_price(resultPrice);
		return oiVo;
	}
}
