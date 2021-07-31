package jcappy.orderinfo;

import java.util.List;

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
}
