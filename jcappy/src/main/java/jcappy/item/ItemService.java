package jcappy.item;

import java.util.List;

public interface ItemService {

	List<ItemVo> selectAll(ItemVo vo);
	int insert(ItemVo vo);
	int update(ItemVo vo);
	ItemVo detail(ItemVo vo);
	ItemVo edit(ItemVo vo);
	int delete(ItemVo vo);
}
