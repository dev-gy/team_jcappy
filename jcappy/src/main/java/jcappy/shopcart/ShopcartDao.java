package jcappy.shopcart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jcappy.members.MembersVo;

@Repository
public class ShopcartDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insert(ShopcartVo vo) {
		return sqlSession.insert("shopcart.insert", vo);
	}
	
	public List<ShopcartVo> selectAll(ShopcartVo vo) { 
		return sqlSession.selectList("shopcart.selectAll", vo);
	}
	
	public int update(ShopcartVo vo) {
		return sqlSession.update("shopcart.countUpdate", vo);
	}
	
	public int delete(ShopcartVo vo) {
		return sqlSession.delete("shopcart.delete", vo);
	}
}
