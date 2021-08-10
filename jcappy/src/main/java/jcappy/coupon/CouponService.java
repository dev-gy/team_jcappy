package jcappy.coupon;

import java.util.List;

public interface CouponService {

	List<CouponVo> userSelectAll(CouponVo vo);
	int use(CouponVo vo);
	CouponVo detail(CouponVo vo);
}
