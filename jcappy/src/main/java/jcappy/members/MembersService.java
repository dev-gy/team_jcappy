package jcappy.members;

public interface MembersService {

	MembersVo login(MembersVo vo);
	int insert(MembersVo vo);
	int isDuplicateEmail(String email);
	int isDuplicatePhone(String phone);
	MembersVo findEmail(MembersVo vo);
	MembersVo findPwd(MembersVo vo);
	int delete(MembersVo vo);
	int update(MembersVo vo);
	MembersVo detail(MembersVo vo);
	
}
