package jcappy.members;

import java.util.List;

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
	
	public int isDuplicatePhone(String phone) {
		return sqlSession.selectOne("members.isDuplicatePhone", phone);
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
	
	public int update(MembersVo vo) {
		return sqlSession.update("members.update", vo);
	}
	
	public List<MembersVo> selectAll(MembersVo vo) {
		return sqlSession.selectList("members.selectAll", vo);
	}
	
	public int count(MembersVo vo) {
		return sqlSession.selectOne("members.count", vo);
	}

	public int groupDelete(MembersVo vo) {
		return sqlSession.delete("members.groupDelete", vo);
	}
	
	public MembersVo detail(MembersVo vo) {
		return sqlSession.selectOne("members.detail", vo);
	}
	
	public int delete(int mno) {
		return sqlSession.delete("members.delete", mno);
	}
	
	public int adminUpdateMembers(MembersVo vo) {
		return sqlSession.update("members.adminUpdateMembers", vo);
	}
}
