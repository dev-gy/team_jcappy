package jcappy.admin;

import java.util.List;
import java.util.Map;

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

	/*============================
	 관리자 로그인 시, 메인페이지
	 ===========================*/
	List<Map<String, String>> boardList();
	List<Map<String, String>> productList();
	List<Map<String, String>> orderList();
	List<Map<String, String>> salesList();

}
