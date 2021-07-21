package jcappy.notice;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import jcappy.members.MembersVo;

@Repository
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<NoticeVo> selectAll(NoticeVo vo) {
		return sqlSession.selectList("notice.selectAll", vo);
	}
	
	public int count(NoticeVo vo) {
		return sqlSession.selectOne("notice.count", vo);
	}
	
	public NoticeVo detail(NoticeVo vo) {
		return sqlSession.selectOne("notice.detail", vo);
	}
	
	public void updateReadcount(NoticeVo vo) {
		sqlSession.update("notice.updateReadcount", vo);
	}
	
	public int insert(NoticeVo vo) {
		return sqlSession.insert("notice.insert", vo);
	}
	
	public int update(NoticeVo vo) {
		return sqlSession.update("notice.update", vo);
	}
	
	public int delFilename(NoticeVo vo) {
		return sqlSession.update("notice.delFilename", vo);
	}
	
	public int delete(NoticeVo vo) {
		return sqlSession.delete("notice.delete", vo);
	}

	public MembersVo temporarySession(MembersVo fmv) {
		return sqlSession.selectOne("notice.temporarySession");
	}
}
