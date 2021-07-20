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
	public ItemVo edit(ItemVo vo) {
		return dao.detail(vo);
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
