package jcappy.members;

import java.util.List;
import java.util.Map;

public interface AdminMembersService {

	List<MembersVo> selectAll(MembersVo vo);
	int groupDelete(MembersVo vo);
	MembersVo detail(MembersVo vo);
	int delete(int mno);
	int adminUpdateMembers(MembersVo vo);
	List<Map<String, String>> boardList(MembersVo vo);
	List<Map<String, String>> orderList(MembersVo vo);
	MembersVo find_members(MembersVo vo);
}
