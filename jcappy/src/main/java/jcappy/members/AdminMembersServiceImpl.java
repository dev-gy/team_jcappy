package jcappy.members;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcappy.admin.AdminVo;

@Service
public class AdminMembersServiceImpl implements AdminMembersService{
	
	@Autowired
	MembersDao dao;

	@Override
	public List<MembersVo> selectAll(MembersVo vo) {
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
	public int groupDelete(MembersVo vo) {
		return dao.groupDelete(vo);
	}

	@Override
	public MembersVo detail(MembersVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int delete(int mno) {
		return dao.delete(mno);
	}

	@Override
	public int adminUpdateMembers(MembersVo vo) {
		return dao.adminUpdateMembers(vo);
	}

	@Override
	public List<Map<String, String>> boardList(MembersVo vo) {
		
		vo.setPageRow(5);
		vo.setPageRange(5);
		
		int totalCount = dao.boardCount(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) {totalPage++;}
		
		vo.setTotCount(totalCount);
		vo.setTotPage(totalPage);

		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totalPage) {endPage = totalPage;}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return dao.boardList(vo);
	}

	@Override
	public List<Map<String, String>> orderList(MembersVo vo) {

		vo.setPageRow(5);
		vo.setPageRange(5);
		
		int totalCount = dao.orderCount(vo);
		int totalPage = totalCount / vo.getPageRow();
		if (totalCount % vo.getPageRow() > 0) {totalPage++;}
		
		vo.setTotCount(totalCount);
		vo.setTotPage(totalPage);

		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totalPage) {endPage = totalPage;}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		
		return dao.orderList(vo);
	}
}
