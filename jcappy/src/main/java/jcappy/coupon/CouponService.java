package jcappy.coupon;

import java.util.List;

public interface CouponService {

	List<CouponVo> selectAll(CouponVo vo);
	CouponVo detail(CouponVo vo);
	int update(CouponVo vo);
	int delete(CouponVo vo);
	CouponVo findMno(String memail);
	int insert(CouponVo vo);
	int countMemail(CouponVo vo);
	int deleteGroup(CouponVo vo);

}