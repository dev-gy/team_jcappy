package jcappy.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	
	@Override
	public List<ReviewVo> selectAllByPno(ReviewVo vo) {
		vo.setOrderby("rno");
		vo.setDirect("desc");
		return reviewDao.selectAllByPno(vo);
	}
	
	@Override
	public int insert(ReviewVo vo) {
		return reviewDao.insert(vo);
	}
	
	@Override
	public int countByOno(ReviewVo vo) {
		return reviewDao.countByOnoPno(vo);
	}
	
}
