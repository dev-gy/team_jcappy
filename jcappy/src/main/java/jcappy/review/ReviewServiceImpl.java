package jcappy.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDao reviewDao;
	public List<ReviewVo> selectAll(ReviewVo vo) {
		return reviewDao.selectAll(vo);
	}
}
