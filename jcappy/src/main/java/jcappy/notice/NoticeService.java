package jcappy.notice;

import java.util.List;


public interface NoticeService {
	List<NoticeVo> selectAll(NoticeVo vo);
	NoticeVo detail(NoticeVo vo);
	int insert(NoticeVo vo);
	NoticeVo edit(NoticeVo vo);
	int update(NoticeVo vo);
	int delete(NoticeVo vo);
}
