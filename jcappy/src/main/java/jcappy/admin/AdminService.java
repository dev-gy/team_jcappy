package jcappy.admin;

import java.util.List;

public interface AdminService {
	
	List<AdminVo> selectAll(AdminVo vo);
	int insert(AdminVo vo);
	int isDuplicateId(String id);
}
