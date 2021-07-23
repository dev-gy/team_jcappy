package jcappy.qna;

import java.util.List;

import jcappy.members.MembersVo;


public interface QnaService {
	List<QnaVo> selectAll(QnaVo vo);
	QnaVo detail(QnaVo vo);
	int update(QnaVo vo);
	int delete(QnaVo vo);
	MembersVo temporarySession(MembersVo fmv);
	int insertReply(QnaVo vo);
	QnaVo edit(QnaVo vo);
	
}
