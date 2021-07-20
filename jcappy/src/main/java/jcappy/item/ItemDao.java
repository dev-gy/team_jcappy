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
	
	public int count(ItemVo vo) {
		return sqlSession.selectOne("item.count", vo);
	}
	
	public int insert(ItemVo vo) {
		return sqlSession.insert("item.insert", vo);
	}
	
	public int update(ItemVo vo) {
		return sqlSession.update("item.update", vo);
	}
	
	public ItemVo detail(ItemVo vo) {
		return sqlSession.selectOne("item.detail", vo);
	}
	
	public int delete(ItemVo vo) {
		return sqlSession.delete("item.delete", vo);
	}
}
