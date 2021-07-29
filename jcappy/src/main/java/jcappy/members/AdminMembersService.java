package jcappy.members;

import java.util.List;

public interface AdminMembersService {

	List<MembersVo> selectAll(MembersVo vo);
	int groupDelete(MembersVo vo);
	MembersVo detail(MembersVo vo);
	int delete(int mno);
	int adminUpdateMembers(MembersVo vo);
}
