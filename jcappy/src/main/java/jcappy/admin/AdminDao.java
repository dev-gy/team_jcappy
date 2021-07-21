package jcappy.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public int insert (AdminVo vo) {
		return sqlSession.insert("admin.insert", vo);
	}
}
