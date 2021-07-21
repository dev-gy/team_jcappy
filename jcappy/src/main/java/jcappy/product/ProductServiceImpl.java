package jcappy.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;
	
	public List<ProductVo> selectAll(ProductVo vo) {
		return null;
	}
}
