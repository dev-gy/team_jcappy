package jcappy.product;

import java.util.List;

public interface ProductService {
	List<ProductVo> selectAll(String filePath, ProductVo vo);
	ProductVo detail(String filePath, ProductVo vo);
}
