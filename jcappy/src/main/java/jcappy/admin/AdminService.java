package jcappy.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface AdminService {
	
	List<AdminVo> selectAll(AdminVo vo);
	int insert(AdminVo vo);
	int isDuplicateId(String id);
	int groupDelete(AdminVo vo);
	AdminVo detail(AdminVo vo);
	int delete(int ano);
	int update(AdminVo vo, HttpSession session);
	AdminVo login(AdminVo vo);
}
