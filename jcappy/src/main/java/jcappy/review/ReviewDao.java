package jcappy.review;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jcappy.members.MembersVo;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<ReviewVo> selectAllByPno(ReviewVo vo) {
		return sqlSession.selectList("review.selectAllByPno", vo);
	}
	public List<ReviewVo> selectAll(ReviewVo vo) {
		return sqlSession.selectList("review.selectAll", vo);
	}
	
	public int countByOnoPno(ReviewVo vo) {
		return sqlSession.selectOne("review.countByOnoPno", vo);
	}
	
	public int count(ReviewVo vo) {
		return sqlSession.selectOne("review.count", vo);
	}
	
	public ReviewVo detail(ReviewVo vo) {
		return sqlSession.selectOne("review.detail", vo);
	}
	
	public void updateReadcount(ReviewVo vo) {
		sqlSession.update("review.updateReadcount", vo);
	}
	
	public int insert(ReviewVo vo) {
		return sqlSession.insert("review.insert", vo);
	}
	
	public int update(ReviewVo vo) {
		return sqlSession.update("review.update", vo);
	}
	
	public int delFilename(ReviewVo vo) {
		return sqlSession.update("review.delFilename", vo);
	}
	
	public int delete(ReviewVo vo) {
		return sqlSession.delete("review.delete", vo);
	}

	public MembersVo temporarySession(MembersVo fmv) {
		return sqlSession.selectOne("review.temporarySession", fmv);
	}
}
