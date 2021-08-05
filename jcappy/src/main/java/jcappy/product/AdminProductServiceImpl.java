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
		
		vo.setOrderby("pregdate");
		
		return dao.selectAll(vo);
	}

	@Override
	public ProductVo detail(ProductVo vo) {
		ProductVo pv = dao.detail(vo);
		String img1 = pv.getPimg1_real();
		if (img1 != null) {
			if (!img1.startsWith("https://")) {
				img1 = "/jcappy/upload/" + img1;
				pv.setPimg1_real(img1);
			}
		}
		String img2 = pv.getPimg2_real();
		if (img2 != null) {
			if (!img2.startsWith("https://")) {
				img2 = "/jcappy/upload/" + img2;
				pv.setPimg2_real(img2);
			}
		}
		String img3 = pv.getPimg3_real();
		if (img3 != null) {
			if (!img3.startsWith("https://")) {
				img3 = "/jcappy/upload/" + img3;
				pv.setPimg3_real(img3);
			}
		}

		return pv;
	}

	@Override
	public int insert(ProductVo vo) {
		if(vo.getPcompany().equals("기타")) {
			vo.setPcompany(vo.getPcomp());
		}
		return dao.insert(vo);
	}

	@Override
	public int update(ProductVo vo) {
		if(vo.getPcompany().equals("기타")) {
			vo.setPcompany(vo.getPcomp());
		}
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
