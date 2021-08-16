package jcappy.coupon;

import java.util.List;

public interface CouponService {

	List<CouponVo> selectAllByMno(CouponVo vo);
	int use(CouponVo vo);
	CouponVo detail(CouponVo vo);
}
