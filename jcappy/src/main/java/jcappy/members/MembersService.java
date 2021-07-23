package jcappy.members;

public interface MembersService {

	MembersVo login(MembersVo vo);
	int insert(MembersVo vo);
	int isDuplicateEmail(String email);
}
