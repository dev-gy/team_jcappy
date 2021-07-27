package jcappy.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	ProductDao dao;

	@Override
	public List<ProductVo> selectAll(ProductVo vo) {
		int totCount = dao.count(vo);

		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0)
			totPage++;

		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totPage)
			endPage = totPage;

		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		if ("".equals(vo.getOrderby()) || vo.getOrderby() == null) {
			vo.setOrderby("pno");
		}
		return dao.selectAll(vo);
	}

	@Override
	public ProductVo detail(ProductVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int insert(ProductVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int update(ProductVo vo) {
		return dao.update(vo);
	}

	@Override
	public int delete(ProductVo vo) {
		return dao.delete(vo);
	}

	@Override
	public int updateCount(ProductVo vo) {
		return dao.updateCount(vo);
	}

	@Override
	public int deleteImg(ProductVo vo) {
		return dao.deleteImg(vo);
	}

}
