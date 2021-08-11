package jcappy.review;

import java.util.List;

public interface ReviewService {
	List<ReviewVo> selectAllByPno(ReviewVo vo);
	int insert(ReviewVo vo);
	int countByOno(ReviewVo vo);
}
