package jcappy.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	
	@Override
	public List<AdminVo> selectAll(AdminVo vo) {
		int totalCount = dao.count(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) {totalPage++;}
		
		vo.setTotCount(totalCount);
		vo.setTotPage(totalPage);

		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totalPage) {endPage = totalPage;}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		List<AdminVo> list = dao.selectAll(vo);
		
		for (int i = 0; i < list.size(); i++) {
			AdminVo av = list.get(i);
			av.setAuthList(av.getAuth().split(":"));
		}
		
		return list;
	}

	@Override
	public int insert(AdminVo vo) {
		vo.setAuth(String.join(":", vo.getAuths()));
		return dao.insert(vo);
	}

	@Override
	public int isDuplicateId(String id) {
		return dao.isDuplicateId(id);
	}

	@Override
	public int groupDelete(AdminVo vo) {
		return dao.groupDelete(vo);
	}

	@Override
	public AdminVo detail(AdminVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int delete(int ano) {
		return dao.delete(ano);
	}

	@Override
	public int update(AdminVo vo, HttpSession session) {
		
		vo.setAuth(String.join(":", vo.getAuths()));
		
		AdminVo adminInfo = (AdminVo)session.getAttribute("adminInfo");
		
		if (adminInfo != null) { // 관리자 계정 수정 시, 로그인한 계정이 있는지 체크 (인터셉터때문에 안해도되긴 함)
		
			if (adminInfo.getAno() == vo.getAno()) { // 만약 로그인한 계정과 수정한 계정의 ano 값이 같다면,
				
				adminInfo.setAno(vo.getAno());
				dao.update(vo);
				session.setAttribute("adminInfo", dao.detail(adminInfo));
				// 수정한 정보가 로그인한 session에 바로 적용되도록해서, 수정 후 바로 메뉴에 대한 접근권한이 반영되도록 함.
				
				return 1;
			}
		}
		return dao.update(vo);
	}

	@Override
	public AdminVo login(AdminVo vo) {
		return dao.login(vo);
	}
}
