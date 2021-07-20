package jcappy.item;

import java.util.List;

public interface ItemService {

	List<ItemVo> selectAll(ItemVo vo);
	ItemVo detail(ItemVo vo);
}
