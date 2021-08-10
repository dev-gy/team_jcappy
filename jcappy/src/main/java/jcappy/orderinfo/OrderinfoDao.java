package jcappy.orderinfo;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderinfoDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<OrderinfoVo> selectAll(OrderinfoVo vo) {
		return sqlSession.selectList("orderinfo.selectAll", vo);
	}

	public int insert(OrderinfoVo vo) {
		return sqlSession.insert("orderinfo.insert", vo);
	}

	public OrderinfoVo selectLastOne(int mno) {
		return sqlSession.selectOne("orderinfo.selectLastOne", mno);
	}

	public int delete(OrderinfoVo vo) {
		return sqlSession.delete("orderinfo.delete", vo);
	}
	
	public int userCount(OrderinfoVo vo) {
		return sqlSession.selectOne("orderinfo.userCount", vo);
	}
	
	public int cancelUpdate(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.cancelUpdate", vo);
	}

	public List<Map<String, String>> admin_selectList(OrderinfoVo vo) {
		return sqlSession.selectList("orderinfo.admin_selectList", vo);
	}

	public int count(OrderinfoVo vo) {
		return sqlSession.selectOne("orderinfo.count", vo);
	}

	public int pay_check(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.pay_check", vo);
	}

	public int delivery_check(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.delivery_check", vo);
	}

	public OrderinfoVo detail(OrderinfoVo vo) {
		return sqlSession.selectOne("orderinfo.detail", vo);
	}

	public Map<String, String> admin_pre_del(OrderinfoVo vo) {
		return sqlSession.selectOne("orderinfo.admin_pre_del", vo);
	}

	public int detail_pay_check(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.detail_pay_check", vo);
	}

	public int detail_delivery_check(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.detail_delivery_check", vo);
	}

	public int admin_order_update(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.admin_order_update", vo);
	}

	public int request_cancel(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.request_cancel", vo);
	}

	public int accept_cancel(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.accept_cancel", vo);
	}

	public int reject_cancel(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.reject_cancel", vo);
	}

	public int remake_coupon(OrderinfoVo vo) {
		return sqlSession.update("orderinfo.remake_coupon", vo);
	}
}
