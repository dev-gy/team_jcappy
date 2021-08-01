package jcappy.shopcart;

import java.util.List;


public interface ShopcartService {
	int insert(ShopcartVo vo);
	List<ShopcartVo> selectAll(ShopcartVo vo);
	int update(ShopcartVo vo);
	int delete(ShopcartVo vo);
}	
