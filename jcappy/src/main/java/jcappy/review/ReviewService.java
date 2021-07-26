package jcappy.review;

import java.util.List;

public interface ReviewService {
	List<ReviewVo> selectAll(ReviewVo vo);
}
