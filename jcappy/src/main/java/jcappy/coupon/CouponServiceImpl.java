package jcappy.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService {
	
	@Autowired
	CouponDao dao;
	
	@Override
	public List<CouponVo> selectAll(CouponVo vo) {
		int totCount = dao.count(vo); // 총갯수
		// 총페이지수
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		// 시작페이지
		int startPage = (vo.getReqPage()-1)/vo.getPageRange()
						*vo.getPageRange()+1;
		// 마지막페이지
		int endPage = startPage+vo.getPageRange()-1;
		if (endPage > totPage) endPage = totPage;
		
		//커맨드객체에 세팅
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return dao.selectAll(vo);
	}

	@Override
	public CouponVo detail(CouponVo vo) {
		return dao.detail(vo);
	}

	@Override
	public int update(CouponVo vo) {
		return dao.update(vo);
	}
	
	@Override
	public int use(CouponVo vo) {
		return dao.use(vo);
	}

	@Override
	public int delete(CouponVo vo) {
		return dao.delete(vo);
	}

	@Override
	public CouponVo findMno(String memail) {
		return dao.findMno(memail);
	}

	@Override
	public int insert(CouponVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int countMemail(CouponVo vo) {
		return dao.countMemail(vo);
	}

	@Override
	public int deleteGroup(CouponVo vo) {
		return dao.deleteGroup(vo);
	}

}
