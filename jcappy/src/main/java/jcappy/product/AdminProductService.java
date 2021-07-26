package jcappy.product;

import java.util.List;

public interface AdminProductService {

	List<ProductVo> selectAll(ProductVo vo);

	int insert(ProductVo vo);

	int update(ProductVo vo);
	
	int updateImg(ProductVo vo);

	ProductVo detail(ProductVo vo);

	int delete(ProductVo vo);
}
