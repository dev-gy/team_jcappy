package jcappy.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;
	
	public List<ProductVo> selectAll(ProductVo vo) {
		// 기본은 인기 많은순, 1페이지당 15개 상품씩, 필터 조건은 상품타입
		if (null == vo.getOrderby() || "".equals(vo.getOrderby()) || "popular".equals(vo.getOrderby())) { 
			vo.setOrderby("popular");
			vo.setDirect("DESC");
		} else if ("price_desc".equals(vo.getOrderby())) {
			vo.setOrderby("pprice");
			vo.setDirect("DESC");
		} else if ("price_asc".equals(vo.getOrderby())) {
			vo.setOrderby("pprice");
			vo.setDirect("ASC");
		}
		vo.setPageRow(15);
				
		int totCount = productDao.count(vo); // 총갯수
		// 총페이지수
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		// 시작페이지
		int startPage = (vo.getReqPage() - 1) / vo.getPageRange() * vo.getPageRange() + 1;
		int endPage = startPage + vo.getPageRange() - 1;
		if (endPage > totPage) {
			endPage = totPage;
		}
		
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return productDao.selectAll(vo);
	}
}
