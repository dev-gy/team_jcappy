package jcappy.members;

public interface MembersService {

	MembersVo login(MembersVo vo);
	int insert(MembersVo vo);
	int isDuplicateEmail(String email);
	MembersVo findEmail(MembersVo vo);
	MembersVo findPwd(MembersVo vo);
	int delete(MembersVo vo);
	int update(MembersVo vo);
	MembersVo edit(MembersVo vo);
	MembersVo detail(MembersVo vo);
}
