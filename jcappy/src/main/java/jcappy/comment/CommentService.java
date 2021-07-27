package jcappy.comment;

import java.util.List;

import jcappy.review.ReviewVo;

public interface CommentService {
	List<CommentVo> selectAll(CommentVo vo);
	int insert(CommentVo vo);
	int delete(CommentVo vo);
	void allDelete(CommentVo vo);
	int ccount(CommentVo vo);
}
