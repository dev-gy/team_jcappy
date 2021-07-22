package jcappy.admin;

public interface AdminService {
	
	public int insert(AdminVo vo);
	public int isDuplicateId(String id);
}
