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
	public int join(MembersVo vo) {
		return dao.join(vo);
	}

}
