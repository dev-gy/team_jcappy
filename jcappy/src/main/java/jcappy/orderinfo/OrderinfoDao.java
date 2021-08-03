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

	public List<OrderinfoVo> selectAll() {
		return sqlSession.selectList("orderinfo.selectAll");
	}

	public int insert(OrderinfoVo vo) {
		return sqlSession.insert("orderinfo.insert", vo);
	}

	public OrderinfoVo selectLastOne() {
		return sqlSession.selectOne("orderinfo.selectLastOne");
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
}
