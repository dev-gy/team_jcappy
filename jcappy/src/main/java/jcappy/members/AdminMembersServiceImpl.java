package jcappy.members;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminMembersServiceImpl implements AdminMembersService{
	
	@Autowired
	MembersDao dao;

}
