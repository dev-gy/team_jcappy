package jcappy.shopcart;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class shopcartDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insert(shopcartVo vo) {
		return sqlSession.insert("shopcart.insert", vo);
	}
}