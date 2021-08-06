package jcappy.notice;

import java.util.List;


public interface NoticeService {
	List<NoticeVo> selectAll(NoticeVo vo);
	NoticeVo detail(NoticeVo vo);
}
