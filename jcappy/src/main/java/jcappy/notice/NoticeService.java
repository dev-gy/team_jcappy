package jcappy.notice;

import java.util.List;

import jcappy.members.MembersVo;


public interface NoticeService {
	List<NoticeVo> selectAll(NoticeVo vo);
	NoticeVo detail(NoticeVo vo);
	int insert(NoticeVo vo);
	NoticeVo edit(NoticeVo vo);
	int update(NoticeVo vo);
	int delete(NoticeVo vo);
	MembersVo temporarySession(MembersVo fmv);
}
