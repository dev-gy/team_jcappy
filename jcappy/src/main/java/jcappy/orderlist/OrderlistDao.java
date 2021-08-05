package jcappy.orderlist;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderlistDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<OrderlistVo> selectAll(OrderlistVo vo) {
		return sqlSession.selectList("orderlist.selectAll", vo);
	}
	
	public int insert(OrderlistVo vo) {
		return sqlSession.insert("orderlist.insert", vo);
	}
}
