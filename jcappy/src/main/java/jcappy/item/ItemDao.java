package jcappy.item;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ItemVo> selectAll(ItemVo vo) {
		return sqlSession.selectList("item.selectAll", vo);
	}
}
