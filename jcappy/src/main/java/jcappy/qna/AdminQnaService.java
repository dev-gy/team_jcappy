package jcappy.qna;

import java.util.List;

import jcappy.members.MembersVo;


public interface AdminQnaService {
	List<QnaVo> selectAll(QnaVo vo);
	QnaVo detail(QnaVo vo);
	int update(QnaVo vo);
	int delete(QnaVo vo);
	int insertReply(QnaVo vo);
	QnaVo edit(QnaVo vo);
	QnaVo findZeroQ_ono(QnaVo vo);
	int gnoAllDelete(int gnum);
}
