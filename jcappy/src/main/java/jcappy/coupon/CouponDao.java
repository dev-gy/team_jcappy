package jcappy.coupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class CouponDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CouponVo> selectAll(CouponVo vo) {
		return sqlSession.selectList("coupon.selectAll", vo);
	}
	
	public int count(CouponVo vo) {
		return sqlSession.selectOne("coupon.count", vo);
	}

	public CouponVo detail(CouponVo vo) {
		return sqlSession.selectOne("coupon.detail", vo);
	}

	public int update(CouponVo vo) {
		return sqlSession.update("coupon.update", vo);
	}
	
	public int use(CouponVo vo) {
		return sqlSession.update("coupon.use", vo);
	}

	public int delete(CouponVo vo) {
		return sqlSession.delete("coupon.delete", vo);
	}
	
	public CouponVo findMno(String memail) {
		return sqlSession.selectOne("coupon.findMno", memail);
	}

	public int insert(CouponVo vo) {
		return sqlSession.insert("coupon.insert", vo);
	}

	public int countMemail(CouponVo vo) {
		return sqlSession.selectOne("coupon.countMemail", vo);
	}

	public int deleteGroup(CouponVo vo) {
		return sqlSession.delete("coupon.deleteGroup", vo);
	}
}
