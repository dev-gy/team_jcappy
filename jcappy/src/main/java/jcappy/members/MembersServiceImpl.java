package jcappy.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembersServiceImpl implements MembersService{
	
	@Autowired
	MembersDao dao;

	@Override
	public MembersVo login(MembersVo vo) {
		return dao.login(vo);
	}

	@Override
	public int insert(MembersVo vo) {
		return dao.insert(vo);
	}
	@Override
	public int isDuplicateEmail(String email) {
		return dao.isDuplicateEmail(email);
	}

}
