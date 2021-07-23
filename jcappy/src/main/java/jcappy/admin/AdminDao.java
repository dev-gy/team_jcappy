package jcappy.admin;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<AdminVo> selectAll(AdminVo vo) {
		return sqlSession.selectList("admin.selectAll", vo);
	}
	
	public int count(AdminVo vo) {
		return sqlSession.selectOne("admin.count", vo);
	}

	public int insert (AdminVo vo) {
		return sqlSession.insert("admin.insert", vo);
	}
	
	public int isDuplicateId (String id) {
		return sqlSession.selectOne("admin.isDuplicateId", id);
	}
	
	public int groupDelete(AdminVo vo) {
		return sqlSession.delete("admin.groupDelete", vo);
	}
	
	public AdminVo detail(AdminVo vo) {
		return sqlSession.selectOne("admin.detail", vo);
	}

	public int delete (int ano) {
		return sqlSession.delete("admin.delete", ano);
	}

	public int update (AdminVo vo) {
		return sqlSession.delete("admin.update", vo);
	}
}
