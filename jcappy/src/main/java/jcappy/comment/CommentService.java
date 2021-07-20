package jcappy.comment;

import java.util.List;

public interface CommentService {
	List<CommentVo> selectAll(CommentVo vo);
	int insert(CommentVo vo);
	int delete(CommentVo vo);
}
