package jcappy.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<ProductVo> selectAll(ProductVo vo) {
		return sqlSession.selectList("product.selectAll", vo);
	}

	public int count(ProductVo vo) {
		return sqlSession.selectOne("product.count", vo);
	}

	public int insert(ProductVo vo) {
		return sqlSession.insert("product.insert", vo);
	}

	public int update(ProductVo vo) {
		return sqlSession.update("product.update", vo);
	}

	public ProductVo detail(ProductVo vo) {
		return sqlSession.selectOne("product.detail", vo);
	}

	public int delete(ProductVo vo) {
		return sqlSession.delete("product.delete", vo);
	}
}
