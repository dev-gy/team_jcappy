package jcappy.members;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MembersDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MembersVo login(MembersVo vo) {
		return sqlSession.selectOne("members.login", vo);
	}
	
	public int insert(MembersVo vo) {
		return sqlSession.insert("members.insert", vo);
	}
	
	public int isDuplicateEmail(String email) {
		return sqlSession.selectOne("members.isDuplicateEmail", email);
	}
	
	public MembersVo findEmail(MembersVo vo) {
		return sqlSession.selectOne("members.findEmail", vo);
	}
	
	public MembersVo findPwd(MembersVo vo) {
		return sqlSession.selectOne("members.findPwd", vo);
	}
	
	public int updateTempPwd(MembersVo vo) {
		return sqlSession.update("members.updateTempPwd", vo);
	}
	
	public int delete(MembersVo vo) {
		return sqlSession.delete("members.delete", vo);
	}
}
