package jcappy.coupon;

import java.util.List;

public interface CouponService {

	List<CouponVo> selectAll(CouponVo vo);
	int use(CouponVo vo);
	CouponVo detail(CouponVo vo);
}
