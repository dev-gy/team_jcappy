package jcappy.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminDao dao;
	
	@Override
	public int insert(AdminVo vo) {
		return dao.insert(vo);
	}

	@Override
	public int isDuplicateId(String id) {
		return dao.isDuplicateId(id);
	}

}
