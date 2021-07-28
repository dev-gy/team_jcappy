package jcappy.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jcappy.review.ReviewVo;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDao dao;
	
	@Override
	public List<CommentVo> selectAll(CommentVo vo) {
		int totCount = dao.count(vo); // 총갯수
		// 총페이지수
		int totPage = totCount / vo.getPageRow();
		if (totCount % vo.getPageRow() > 0) totPage++;
		// 시작페이지
		int startPage = (vo.getReqPage()-1)/vo.getPageRange()
						*vo.getPageRange()+1;
		// 끝페이지
		int endPage = startPage+vo.getPageRange()-1;
		if (endPage > totPage) endPage = totPage;
		//커맨드객체 세팅
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotCount(totCount);
		vo.setTotPage(totPage);
		return dao.selectAll(vo);
	}

	@Override
	public int insert(CommentVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int delete(CommentVo vo) {
		return dao.delete(vo);
	}

	@Override
	public void allDelete(CommentVo vo) {
		dao.allDelete(vo);
		
	}

	@Override
	public int ccount(CommentVo vo) {
		return dao.count(vo);
	}

}
