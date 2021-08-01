package jcappy.sales;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<SalesVo> selectAll(SalesVo vo) {
		return sqlSession.selectList("sales.selectAll", vo);
	}

	public int count(SalesVo vo) {
		return sqlSession.selectOne("sales.count", vo);
	}
	
}
