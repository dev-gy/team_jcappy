package jcappy.product;

import java.util.List;

public interface ProductService {
	List<ProductVo> selectAll(ProductVo vo);
	ProductVo detail(ProductVo vo);
}
