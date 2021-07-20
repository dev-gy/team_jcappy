package jcappy.item;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	ItemDao dao;
	
	@Override
	public List<ItemVo> selectAll(ItemVo vo) {
		int totCount = dao.count(vo);

		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;

		int startPage = (vo.getReqPage()-1)/vo.getPageRange()
						*vo.getPageRange()+1;
		int endPage = startPage+vo.getPageRange()-1;
		if (endPage > totPage) endPage = totPage;
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return dao.selectAll(vo);
	}

	@Override
	public ItemVo detail(ItemVo vo) {
		return dao.detail(vo);
	}
	
	@Override
	public int insert(ItemVo vo) {
		return dao.insert(vo);
	}
	
	@Override
	public int update(ItemVo vo) {
		return dao.update(vo);
	}
	
	@Override
	public int delete(ItemVo vo) {
		return dao.delete(vo);
	}
}
