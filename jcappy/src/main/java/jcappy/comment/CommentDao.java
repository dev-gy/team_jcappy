package jcappy.comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CommentVo> selectAll(CommentVo vo) {
		return sqlSession.selectList("comment.selectAll", vo);
	}
	
	public int count(CommentVo vo) {
		return sqlSession.selectOne("comment.count", vo);
	}
	
	public int insert(CommentVo vo) {
		return sqlSession.insert("comment.insert", vo);
	}
	
	public int delete(CommentVo vo) {
		return sqlSession.delete("comment.delete", vo);
	}
}
