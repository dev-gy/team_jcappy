package jcappy.admin;

import java.util.List;

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
		
		return dao.selectAll(vo);
	}

	@Override
	public int insert(AdminVo vo) {
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
	public int update(AdminVo vo) {
		return dao.update(vo);
	}
}
