package jcappy.qna;

import java.util.List;

public interface QnaService {
	List<QnaVo> selectAll(QnaVo vo);
	int insert(QnaVo vo);
	int delete(QnaVo vo);
	QnaVo detail(QnaVo vo);
	List<QnaVo> detailRe(QnaVo vo);
	int update(QnaVo vo);
	QnaVo edit(QnaVo vo);
	int haveRe(QnaVo vo);
	List<QnaVo> selectAllUser(QnaVo vo);
}
