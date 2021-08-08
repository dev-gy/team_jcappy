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

	public List<OrderinfoVo> selectAll(int mno) {
		return sqlSession.selectList("orderinfo.selectAll", mno);
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
}
