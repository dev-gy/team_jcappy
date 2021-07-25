package jcappy.review;

import java.util.List;

import jcappy.members.MembersVo;


public interface ReviewService {
	List<ReviewVo> selectAll(ReviewVo vo);
	ReviewVo detail(ReviewVo vo);
	int insert(ReviewVo vo);
	ReviewVo edit(ReviewVo vo);
	int update(ReviewVo vo);
	int delete(ReviewVo vo);
	MembersVo temporarySession(MembersVo fmv);
}
