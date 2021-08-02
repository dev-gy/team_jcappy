package jcappy.sales;

import java.util.List;

public interface SalesService {

	List<SalesVo> selectAll(SalesVo vo);
	SalesVo daySelect(SalesVo vo);

}
