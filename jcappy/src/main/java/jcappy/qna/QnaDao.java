package jcappy.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jcappy.members.MembersVo;


@Repository
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<QnaVo> selectAll(QnaVo vo) {
		return sqlSession.selectList("qna.selectAll", vo);
	}
	public List<QnaVo> selectAllUser(QnaVo vo) {
		return sqlSession.selectList("qna.selectAllUser", vo);
	}
	
	public int count(QnaVo vo) {
		return sqlSession.selectOne("qna.count", vo);
	}
	
	public QnaVo detail(QnaVo vo) {
		return sqlSession.selectOne("qna.detail", vo);
	}
		
	public void gno(int no) {
		sqlSession.update("qna.gno", no);
	}
	
	public int insertReply(QnaVo vo) {
		return sqlSession.insert("qna.insertReply", vo);
	}
	
	public int onoUpdate(QnaVo vo) {
		return sqlSession.update("qna.onoUpdate", vo);
	}
	
	public int update(QnaVo vo) {
		return sqlSession.update("qna.update", vo);
	}
	
	public int delFilename(QnaVo vo) {
		return sqlSession.update("qna.delFilename", vo);
	}
	
	public int delete(QnaVo vo) {
		return sqlSession.delete("qna.delete", vo);
	}
	
	public QnaVo findZeroQ_ono(QnaVo vo) {
		return sqlSession.selectOne("qna.findZeroQ_ono", vo);
	}

	public int gnoAllDelete(int gnum) {
		return sqlSession.delete("qna.gnoAllDelete", gnum);
	}
	
	public int insert(QnaVo vo) {
		return sqlSession.insert("qna.insert", vo);
	}
	
	public int haveRe(QnaVo vo) {
		return sqlSession.selectOne("qna.haveRe", vo);
	}
	
	public int countUser(QnaVo vo) {
		return sqlSession.selectOne("qna.countUser", vo);
	}
	
	public QnaVo detailRe(QnaVo vo) {
		return sqlSession.selectOne("qna.detailRe", vo);
	}
}
