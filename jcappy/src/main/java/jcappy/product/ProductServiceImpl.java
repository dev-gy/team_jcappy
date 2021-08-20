package jcappy.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;
	
	@Override
	public List<ProductVo> selectAll(String filePath, ProductVo vo) {
		// 페이징 관련 값 세팅
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
		
		List<ProductVo> list = productDao.selectAll(vo);
		
		for(int i = 0; i < list.size(); i++) {
			
			checkAndUpdateImgPath(filePath, list.get(i));
		}
		return list;
	}
	
	@Override
	public ProductVo detail(String filePath, ProductVo vo) {
		
		ProductVo retVo = productDao.detail(vo);
		checkAndUpdateImgPath(filePath, retVo);
		
		return retVo;
	}
	
	private void checkAndUpdateImgPath(String filePath, ProductVo vo) {
		String img = vo.getPimg1_org();
		if (img != null) {
			if (!img.startsWith("https")) {
				vo.setPimg1_org(filePath + "/" + img);
			}
		}
		img = vo.getPimg2_org();
		if (img != null) {
			if (!img.startsWith("https")) {
				vo.setPimg2_org(filePath + "/" + img);
			}
		}
		img = vo.getPimg3_org();
		if (img != null) {
			if (!img.startsWith("https")) {
				vo.setPimg3_org(filePath + "/" + img);
			}
		}
		img = vo.getPimg1_real();
		if (img != null) {
			if (!img.startsWith("https")) {
				vo.setPimg1_real(filePath + "/" + img);
			}
		}
		img = vo.getPimg2_real();
		if (img != null) {
			if (!img.startsWith("https")) {
				vo.setPimg2_real(filePath + "/" + img);
			}
		}
		img = vo.getPimg3_real();
		if (img != null) {
			if (!img.startsWith("https")) {
				vo.setPimg3_real(filePath + "/" + img);
			}
		}
	}
}
